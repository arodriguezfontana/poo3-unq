package o3

import org.junit.Assert.{assertEquals, assertFalse, assertTrue}
import org.junit.Test

class BooleanoTest {

  @Test
  def negaciones(): Unit = {
    assertEquals(Falso, !Verdadero)
    assertEquals(Verdadero, !Falso)
  }

  @Test
  def conjunciones(): Unit = {
    assertEquals(Verdadero, Verdadero && Verdadero)
    assertEquals(Falso, Verdadero && Falso)
    assertEquals(Falso, Falso && Verdadero)
    assertEquals(Falso, Falso && Falso)
  }

  @Test
  def disyunciones(): Unit = {
    assertEquals(Verdadero, Verdadero || Verdadero)
    assertEquals(Verdadero, Verdadero || Falso)
    assertEquals(Verdadero, Falso || Verdadero)
    assertEquals(Falso, Falso || Falso)
  }

  @Test
  def disyuncionesExclusivas(): Unit = {
    assertEquals(Falso, Verdadero xor Verdadero)
    assertEquals(Verdadero, Verdadero xor Falso)
    assertEquals(Verdadero, Falso xor Verdadero)
    assertEquals(Falso, Falso xor Falso)
  }

  @Test
  def ifTrueEjecutaElBloqueSoloSiEsVerdadero(): Unit = {
    var seEjecutoVerdadero = false
    var seEjecutoFalso = false

    Verdadero ifTrue {
      seEjecutoVerdadero = true
    }

    Falso ifTrue {
      seEjecutoFalso = true
    }

    assertTrue(seEjecutoVerdadero)
    assertFalse(seEjecutoFalso)
  }

  @Test
  def ifFalseEjecutaElBloqueSoloSiEsFalso(): Unit = {
    var seEjecutoVerdadero = false
    var seEjecutoFalso = false

    Verdadero ifFalse {
      seEjecutoVerdadero = true
    }

    Falso ifFalse {
      seEjecutoFalso = true
    }

    assertFalse(seEjecutoVerdadero)
    assertTrue(seEjecutoFalso)
  }

  @Test(expected = classOf[RuntimeException])
  def ejemploDeLaConsignaLanzaExcepcionConBloque(): Unit = {
    val saldoInsuficiente: Booleano = Verdadero

    saldoInsuficiente ifTrue {
      throw new RuntimeException("el saldo es insuficiente")
    }
  }

  @Test
  def encadenamientoConBloquesCuandoEsVerdadero(): Unit = {
    var seEjecutoThen = false
    var seEjecutoElse = false

    Verdadero ifTrue {
      seEjecutoThen = true
    } ifFalse {
      seEjecutoElse = true
    }

    assertTrue(seEjecutoThen)
    assertFalse(seEjecutoElse)
  }

  @Test
  def encadenamientoConBloquesCuandoEsFalso(): Unit = {
    var seEjecutoThen = false
    var seEjecutoElse = false

    Falso ifTrue {
      seEjecutoThen = true
    } ifFalse {
      seEjecutoElse = true
    }

    assertFalse(seEjecutoThen)
    assertTrue(seEjecutoElse)
  }

  @Test
  def conjuncionNoEvaluaLaDerechaSiLaIzquierdaEsFalso(): Unit = {
    val resultado = Falso && {
      throw new RuntimeException("No se ejecuta")
    }
    assertEquals(Falso, resultado)
  }

  @Test
  def disyuncionNoEvaluaLaDerechaSiLaIzquierdaEsVerdadero(): Unit = {
    val resultado = Verdadero || {
      throw new RuntimeException("No se ejecuta")
    }
    assertEquals(Verdadero, resultado)
  }

  @Test(expected = classOf[RuntimeException])
  def conjuncionSiEvaluaLaDerechaSiLaIzquierdaEsVerdadero(): Unit = {
    Verdadero && {
      throw new RuntimeException("Falla")
    }
  }

  @Test(expected = classOf[RuntimeException])
  def disyuncionSiEvaluaLaDerechaSiLaIzquierdaEsFalso(): Unit = {
    Falso || {
      throw new RuntimeException("Falla")
    }
  }
}