[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/37H61uZp)
# Generador de diagramas
Para generar el código del diagrama, hay que ejecutar `generar_diagrama.rb`.

```bash
ruby generar_diagrama.rb
```

Debería generarse un archivo llamado `diagrama.puml` con el código del diagrama.

El código generado respeta la sintaxis de [PlantUML](https://plantuml.com/).
Pueden encontrar más información con respecto a la sintaxis aquí: https://plantuml.com/class-diagram

Para poder generar el diagrama tienen varias opciones:
- Si están utilizando RubyMine, pueden instalar el plugin [PlantUML integration](https://plugins.jetbrains.com/plugin/7017-plantuml-integration/).
- Pueden copiar y pegar el código generado en [este servicio web](http://www.plantuml.com/plantuml/uml/XP1D2i8m48NtFSNGbONM4vHIGV4SqsIqWMHIPb9muU5DSM6AeCl7zp4_RzI4ajRWAu3PMO90OIBH79KIC0RI1GqfBIYOeW17faoDHrMeBvbQDBFZ6leU3gO5x-vpclnA3Gp3nxok948I_tcdX0OvqTiBBKJ9usq3mJqSxzGptOWroY-rb9xTiIiEgQ3SzasBiD5kzsqr4jkjjnS0).
- Si tienen Java en su computadora, pueden [descargar PlantUML](https://plantuml.com/download) y ejecutarlo localmente (e.g. ejecutando `java -jar plantuml.jar`).

## Setup

La primera vez que clonen el repositorio deberan instalar las dependencias que ya tenemos definidas en Gemfile (rspec), para esto tienen que tener instalado `ruby` y `bundler`.

Verificar que tengo Ruby:

```bash
$ ruby -v
# => ruby 3.4.9 (2026-03-11 revision 76cca827ab) +PRISM [x86_64-linux]
```

Verificar que tengo Bundler:

```bash
$ bundle -v
# => Bundler version 2.6.9
```

Ahora sí, instalamos con:

```bash
$ bundle install
```

## Ejecutar las pruebas

Desde el IDE: haciendo click derecho en la carpeta `spec` y usando la opción "Run all **specs** in ...".

Desde una terminal:
```bash
$ bundle exec rspec
```

## Ejecutar el linter

Para verificar que el código sigue las convenciones de estilo de Ruby:

```bash
$ bundle exec rubocop
```

Para corregir automáticamente lo que el linter puede resolver solo:

```bash
$ bundle exec rubocop -a
```
