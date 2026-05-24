require "rspec"
require "ejemplo"

describe "un ejemplo" do
  it "saluda diciendo Hola!" do
    un_ejemplo = Ejemplo.new

    expect(un_ejemplo.saludar).to eq("Hola!")
  end
end
