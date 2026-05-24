require_relative "./defensor"
require_relative "./atacante"

class Guerrero
  include Atacante
  include Defensor

  def initialize(fuerza:, **args)
    super(**args)
    @fuerza = fuerza
  end

  def ataque
    @fuerza
  end
end
