# ⚠️ No modificar este archivo como parte del ejercicio

module ParallelUniverseMetamodel
  refine(Kernel) do
    undef method
  end

  refine(Module) do
    undef ancestors

    def instance_method(selector)
      metodo = super

      if metodo.owner.is_a?(Refinement)
        raise "✋😅 El método #{selector} no es accesible por razones de implementación del ejercicio."
      end

      unless metodo.owner == self
        raise NameError.new(
          "undefined method `#{selector}' for #{self.is_a?(Class) ? "class" : "module"} `#{self}'",
          selector,
          receiver: self
        )
      end

      metodo
    end
  end
end
