require "guerrero"
require "espadachin"
require "muralla"
require "fantasma"

def un_guerrero_con(fuerza: 0, defensa: 0, vida: 100)
  Guerrero.new(fuerza: fuerza, defensa: defensa, vida: vida)
end

def un_espadachin_con(fuerza: 0, defensa: 0, vida: 100, coeficiente_espada: 1)
  Espadachin.new(fuerza: fuerza, defensa: defensa, vida: vida, coeficiente_espada: coeficiente_espada)
end

def una_muralla_con(defensa: 0, vida: 100)
  Muralla.new(defensa: defensa, vida: vida)
end

def un_fantasma
  Fantasma.new
end
