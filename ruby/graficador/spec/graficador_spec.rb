require "graficador"

describe "generador de diagramas de clase" do
  # Hacemos esto porque queremos que las constantes que definimos en los tests
  # (por ejemplo, ClaseAGraficar) estén definidas sólo en el contexto del test
  # en el cual fueron definidas, y que no vivan más allá de eso.
  around do |test|
    constantes_ya_definidas = Object.constants

    test.run

    constantes_definidas_por_el_test = Object.constants - constantes_ya_definidas
    constantes_definidas_por_el_test.each do |nombre_constante|
      Object.send(:remove_const, nombre_constante)
    end
  end

  specify "incluye la clase inicial a graficar en el diagrama" do
    ClaseAGraficar = Class.new(Object)

    declaraciones_diagrama = lineas_diagrama_de(ClaseAGraficar)

    expect(declaraciones_diagrama).
      to include(declaracion_clase("ClaseAGraficar"))
  end

  specify "incluye la superclase de la clase inicial en el diagrama" do
    ClaseAGraficar = Class.new(Object)

    declaraciones_diagrama = lineas_diagrama_de(ClaseAGraficar)

    expect(declaraciones_diagrama).
      to include(
           declaracion_clase("Object"),
           relacion_herencia("Object", "ClaseAGraficar")
      )
  end

  def declaracion_clase(nombre_clase)
    "class \"#{nombre_clase}\" << (C, lightblue) >>"
  end

  def relacion_herencia(nombre_superclase, nombre_subclase)
    "\"#{nombre_superclase}\" <|-- \"#{nombre_subclase}\""
  end

  def lineas_diagrama_de(una_clase)
    graficador = Graficador.new
    diagrama_en_plantuml = graficador.diagrama_a_partir_de(una_clase)
    diagrama_en_plantuml
      .delete_prefix("@startuml\n")
      .delete_suffix("@enduml\n")
      .lines
      .map { |linea| linea.strip }
  end
end
