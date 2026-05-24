require "factory_methods"

describe "murallas" do
  specify "sufre daño cuando es atacada" do
    guerrero_atacante = un_guerrero_con(fuerza: 20)
    muralla_atacada = una_muralla_con(defensa: 0, vida: 100)

    guerrero_atacante.atacar_a(muralla_atacada)

    expect(muralla_atacada.vida).to eq(80)
  end

  specify "absorben daño según su defensa" do
    guerrero_atacante = un_guerrero_con(fuerza: 20)
    muralla_atacada = una_muralla_con(defensa: 10, vida: 100)

    guerrero_atacante.atacar_a(muralla_atacada)

    expect(muralla_atacada.vida).to eq(90)
  end

  specify "no pueden atacar" do
    muralla_atacante = una_muralla_con(vida: 100)
    guerrero_atacado = un_guerrero_con(vida: 100)

    expect do
      muralla_atacante.atacar_a(guerrero_atacado)
    end.to raise_error(NoMethodError)
  end
end
