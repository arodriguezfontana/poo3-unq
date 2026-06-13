package o3

object Verdadero extends Booleano {
  def unary_! : Booleano = Falso

  def &&(otro: => Booleano): Booleano = otro
  def ||(otro: => Booleano): Booleano = Verdadero
  def xor(otro: => Booleano): Booleano = !otro

  def ifTrue(bloque: => Unit): Booleano = { bloque; this }
  def ifFalse(bloque: => Unit): Booleano = this
}