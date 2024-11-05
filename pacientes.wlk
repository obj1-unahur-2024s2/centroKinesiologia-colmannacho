import aparatos.*

class Paciente{
  const property edad
  var nivelFortaleza
  var nivelDolor
  const rutina = []
  method asignarRutina(unaRutina) {
    rutina.addAll(unaRutina)
  }
  method nivelFortaleza() = nivelFortaleza
  method aumentarFortaleza(cantidad) {
    nivelFortaleza = nivelFortaleza + cantidad
  }
  method nivelDolor() = nivelDolor
  method disminuirDolor(cantidad) {
    nivelDolor = 0.max(nivelDolor - cantidad)
  }
  method puedeUsar(aparato) = aparato.puedeSerUsado(self)
  method usar(aparato) {
    aparato.usarPor(self)
  }
  method puedeHacerLaRutina() = rutina.all({c => c.puedeSerUsado(self)})
  
  method hacerRutina() {
    rutina.forEach({c => self.usar(c)})
  }
}
class Resistente inherits Paciente {
  override method hacerRutina() {
    super()
    self.aumentarFortaleza(rutina.size())
  }
}
class Caprichoso inherits Paciente {
  override method puedeHacerLaRutina() = super() and rutina.any({c => c.color() == "rojo"}) 
  override method hacerRutina() {
    super()
    super()
  }
}
class RapidaRecuperacion inherits Paciente {
  const cantidadConfigurable = valorDecremento.cantidadConfigurable()
  override method hacerRutina() {
    super()
    self.disminuirDolor(cantidadConfigurable)
  }
}
object valorDecremento {
  var property cantidadConfigurable = 3
}