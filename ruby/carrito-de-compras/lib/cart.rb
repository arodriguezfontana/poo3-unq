# frozen_string_literal: true

class Cart
  attr_accessor :productos
  attr_accessor :cantidad

  def initialize
    @productos = Hash.new(0)
    @cantidad = 0
  end

  def agregar_producto(product)
    @productos[product] += 1
    @cantidad += 1
  end

  def establecer_cantidad_de_producto(product, amount)
    raise ArgumentError, "La cantidad no puede ser negativa" if amount < 0

    actual = @productos[product]
    diferencia = amount - actual

    @cantidad += diferencia

    if amount <= 0
      @productos.delete(product)
    else
      @productos[product] = amount
    end
  end

  def eliminar_producto(product)
    return if @productos[product] <= 0

    @productos[product] -= 1
    @cantidad -= 1

    if @productos[product] == 0
      @productos.delete(product)
    end
  end

  def cantidad_de(product)
    @productos[product]
  end

  def productos_agregados
    @productos.keys
  end
end
