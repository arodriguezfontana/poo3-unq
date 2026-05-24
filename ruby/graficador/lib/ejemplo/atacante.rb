module Atacante
  def atacar_a(defensor)
    raise "una unidad no puede atacarse a sí misma" if self == defensor

    defensor.recibir_daño(ataque)
  end

  def ataque
    raise NotImplementedError, "subclass responsibility"
  end
end
