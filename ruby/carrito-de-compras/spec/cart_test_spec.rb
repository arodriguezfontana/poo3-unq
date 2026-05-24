# frozen_string_literal: true

require "rspec"
require "cart"
require "product"

describe "carrito" do
  specify "al agregar un producto a un carrito vacio, tiene un producto" do
    carrito = Cart.new
    agua = Product.new

    carrito.agregar_producto(agua)

    expect(carrito.cantidad).to eq(1)
  end
end

describe "carrito" do
  specify "al agregar un agua a un carrito vacio, tiene un producto que es un agua" do
    carrito = Cart.new
    agua = Product.new

    carrito.agregar_producto(agua)

    expect(carrito.cantidad).to eq(1)
    expect(carrito.cantidad_de(agua)).to eq(1)
  end
end

describe "carrito" do
  specify "al agregar 2 aguas y 1 soda a un carrito vacio, tiene 3 productos que 2 son aguas y una es soda" do
    carrito = Cart.new
    agua = Product.new
    soda = Product.new

    carrito.agregar_producto(agua)
    carrito.agregar_producto(agua)
    carrito.agregar_producto(soda)

    expect(carrito.cantidad).to eq(3)
    expect(carrito.cantidad_de(agua)).to eq(2)
    expect(carrito.cantidad_de(soda)).to eq(1)
  end
end

describe "carrito" do
  specify "al agregar 20 aguas a un carrito vacio, tiene 20 productos que son aguas" do
    carrito = Cart.new
    agua = Product.new

    carrito.establecer_cantidad_de_producto(agua, 20)

    expect(carrito.cantidad).to eq(20)
    expect(carrito.cantidad_de(agua)).to eq(20)
  end
end

describe "carrito" do
  specify "puedo consultar los productos del carrito" do
    carrito = Cart.new
    agua = Product.new
    soda = Product.new

    carrito.agregar_producto(agua)
    carrito.agregar_producto(agua)
    carrito.agregar_producto(soda)

    expect(carrito.productos_agregados).to eq([agua, soda])
  end
end

describe "carrito" do
  specify "al elimienar un agua a un carrito con 3 aguas, tiene 2 aguas" do
    carrito = Cart.new
    agua = Product.new

    carrito.agregar_producto(agua)
    carrito.agregar_producto(agua)
    carrito.agregar_producto(agua)
    carrito.eliminar_producto(agua)

    expect(carrito.cantidad).to eq(2)
    expect(carrito.cantidad_de(agua)).to eq(2)
  end

  specify "no permite cantidades negativas" do
    carrito = Cart.new
    agua = Product.new

    carrito.agregar_producto(agua)
    carrito.eliminar_producto(agua)
    carrito.eliminar_producto(agua)

    expect(carrito.cantidad).to eq(0)
    expect(carrito.cantidad_de(agua)).to eq(0)
  end

  specify "si establezco cantidad en 0 elimina el producto" do
    carrito = Cart.new
    agua = Product.new

    carrito.agregar_producto(agua)
    carrito.establecer_cantidad_de_producto(agua, 0)

    expect(carrito.cantidad).to eq(0)
    expect(carrito.productos_agregados).not_to include(agua)
  end

  specify "no permite establecer cantidades negativas" do
    carrito = Cart.new
    agua = Product.new

    expect {
      carrito.establecer_cantidad_de_producto(agua, -3)
    }.to raise_error(ArgumentError)

    expect(carrito.cantidad).to eq(0)
    expect(carrito.productos_agregados).to be_empty
  end
end
