require "set"

class Graficador
  def initialize
    @procesados = Set.new
  end

  def diagrama_a_partir_de(*entidades)
    @procesados.clear
    cuerpo = entidades.map { |e| generar_cuerpo(e) }.join("\n")
    <<~PLANTUML
      @startuml
      hide empty members
      set namespaceseparator none
      #{cuerpo}
      @enduml
    PLANTUML
  end

  private

  def generar_cuerpo(entidad)
    return "" if entidad.nil? || @procesados.include?(entidad)
    @procesados << entidad

    lineas = []
    lineas << declarar(entidad)

    if entidad.is_a?(Class) && entidad.superclass
      superclase = entidad.superclass
      lineas << "\"#{superclase.name}\" <|-- \"#{entidad.name}\""
      lineas << generar_cuerpo(superclase)
    end

    modulos_propios = entidad.included_modules
    if entidad.is_a?(Class) && entidad.superclass
      modulos_propios -= entidad.superclass.included_modules
    end

    modulos_propios.each do |mod|
      lineas << "\"#{nombre_de(mod)}\" <|-.- \"#{nombre_de(entidad)}\""
      lineas << generar_cuerpo(mod)
    end

    clase_de_la_entidad = entidad.class
    lineas << "\"#{clase_de_la_entidad.name}\" <-- \"#{nombre_de(entidad)}\" : instance of"
    lineas << generar_cuerpo(clase_de_la_entidad)

    lineas.join("\n")
  end

  def declarar(entidad)
    nombre = nombre_de(entidad)
    color = "lightblue"
    estereotipo = entidad.is_a?(Class) ? "C" : "M"

    metodos = []
    if entidad.is_a?(Module)
      entidad.instance_methods(false).each do |m|
        params = entidad.instance_method(m).parameters.map { |p| p[1] }.join(", ")
        metodos << "  #{m}(#{params})"
      end
    end

    if metodos.empty?
      "class \"#{nombre}\" << (#{estereotipo}, #{color}) >>"
    else
      "class \"#{nombre}\" << (#{estereotipo}, #{color}) >> {\n#{metodos.join("\n")}\n}"
    end
  end

  def nombre_de(entidad)
    if entidad.respond_to?(:name) && entidad.name
      entidad.name
    else
      entidad.inspect
    end
  end
end
