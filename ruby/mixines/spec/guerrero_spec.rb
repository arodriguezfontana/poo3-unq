require "factory_methods"

describe "guerreros" do
  specify "cuando un guerrero ataca a otro que no tiene defensa, el daño es igual a la fuerza del atacante" do
    guerrero_atacante = un_guerrero_con(fuerza: 20)
    guerrero_atacado = un_guerrero_con(defensa: 0, vida: 100)

    guerrero_atacante.atacar_a(guerrero_atacado)

    expect(guerrero_atacado.vida).to eq(80)
  end

  specify "cuando un guerrero ataca a otro que tiene defensa, el daño se reduce de acuerdo a la defensa del atacado" do
    guerrero_atacante = un_guerrero_con(fuerza: 20)
    guerrero_atacado = un_guerrero_con(defensa: 10, vida: 100)

    guerrero_atacante.atacar_a(guerrero_atacado)

    expect(guerrero_atacado.vida).to eq(90)
  end

  specify "si la defensa del atacado es mayor a la fuerza del atacante, el ataque no causa daño" do
    guerrero_atacante = un_guerrero_con(fuerza: 20)
    guerrero_atacado = un_guerrero_con(defensa: 100, vida: 100)

    guerrero_atacante.atacar_a(guerrero_atacado)

    expect(guerrero_atacado.vida).to eq(100)
  end

  specify "el nivel mínimo de vida es cero" do
    guerrero_atacante = un_guerrero_con(fuerza: 50)
    guerrero_atacado = un_guerrero_con(defensa: 0, vida: 30)

    guerrero_atacante.atacar_a(guerrero_atacado)

    expect(guerrero_atacado.vida).to eq(0)
  end

  specify "un guerrero no puede atacarse a sí mismo" do
    guerrero = un_guerrero_con(fuerza: 20, vida: 100)

    expect do
      guerrero.atacar_a(guerrero)
    end.to raise_error("una unidad no puede atacarse a sí misma")
  end
end
