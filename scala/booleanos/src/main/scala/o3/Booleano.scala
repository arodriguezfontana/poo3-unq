package o3

trait Booleano {
  def unary_! : Booleano

  def &&(otro: => Booleano): Booleano
  def ||(otro: => Booleano): Booleano
  def xor(otro: => Booleano): Booleano

  def ifTrue(bloque: => Unit): Booleano
  def ifFalse(bloque: => Unit): Booleano
}

