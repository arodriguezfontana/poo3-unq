require "factory_methods"

describe "espadachines" do
  specify "incrementan su ataque según el coeficiente de su espada" do
    espadachin_atacante = un_espadachin_con(fuerza: 10, coeficiente_espada: 2)
    espadachin_atacado = un_espadachin_con(vida: 100)

    espadachin_atacante.atacar_a(espadachin_atacado)

    expect(espadachin_atacado.vida).to eq(80)
  end

  specify "cuando un espadachin ataca a otro que no tiene defensa, el daño es igual a la fuerza del atacante" do
    espadachin_atacante = un_espadachin_con(fuerza: 10)
    espadachin_atacado = un_espadachin_con(defensa: 0, vida: 100)

    espadachin_atacante.atacar_a(espadachin_atacado)

    expect(espadachin_atacado.vida).to eq(90)
  end

  specify "cuando un espadachin ataca a otro que tiene defensa, el daño se reduce de acuerdo a la defensa del atacado" do
    espadachin_atacante = un_espadachin_con(fuerza: 20)
    espadachin_atacado = un_espadachin_con(defensa: 10, vida: 100)

    espadachin_atacante.atacar_a(espadachin_atacado)

    expect(espadachin_atacado.vida).to eq(90)
  end

  specify "si la defensa del atacado es mayor a la fuerza del atacante, el ataque no causa daño" do
    espadachin_atacante = un_espadachin_con(fuerza: 20)
    espadachin_atacado = un_espadachin_con(defensa: 100, vida: 100)

    espadachin_atacante.atacar_a(espadachin_atacado)

    expect(espadachin_atacado.vida).to eq(100)
  end
end
