module Defensor
  attr_reader :vida
  attr_reader :defensa

  def initialize(defensa:, vida:)
    @defensa = defensa
    @vida = vida
  end

  def recibir_daño(cantidad_de_daño)
    daño_final = (cantidad_de_daño - @defensa).clamp(0, @vida)
    @vida -= daño_final
  end
end
