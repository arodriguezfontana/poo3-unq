require_relative "lib/graficador"
require_relative "lib/ejemplo/espadachin"
require_relative "lib/ejemplo/muralla"
require_relative "lib/ejemplo/fantasma"

File.new("diagrama.puml", "w").write(
  Graficador.new.diagrama_a_partir_de(Espadachin)
)
