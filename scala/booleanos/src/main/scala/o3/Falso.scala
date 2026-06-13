package o3

object Falso extends Booleano {
  def unary_! : Booleano = Verdadero

  def &&(otro: => Booleano): Booleano = Falso
  def ||(otro: => Booleano): Booleano = otro
  def xor(otro: => Booleano): Booleano = otro

  def ifTrue(bloque: => Unit): Booleano = this
  def ifFalse(bloque: => Unit): Booleano = { bloque; this }
}