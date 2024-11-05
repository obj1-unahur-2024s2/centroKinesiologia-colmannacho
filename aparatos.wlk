class Aparato {
  const property color = "blanco"
  method puedeSerUsado(unaPersona) = true
  method usarPor(unaPersona)
  method necesitaMantenimiento() = false
  method hacerMantenimiento() {}
}
class Magneto inherits Aparato{
  var imantacion = 800
  override method usarPor(unaPersona) {
    unaPersona.disminuirDolor(unaPersona.nivelDolor() * 0.1)
    imantacion = 0.max(imantacion - 1)
  }
  override method necesitaMantenimiento() = imantacion < 100
  override method hacerMantenimiento(){
    imantacion = 800.min(imantacion + 500)
  }
}
class Bicicleta inherits Aparato{
  var cantidadDesajusteTornillo = 0
  var cantidadPierdeAceite = 0
  override method puedeSerUsado(unaPersona) = unaPersona.edad() > 8
  override method usarPor(unaPersona) {
    if(unaPersona.nivelDolor() > 30){
        cantidadDesajusteTornillo = cantidadDesajusteTornillo + 1
    }
    if(unaPersona.edad().between(30,50)){
        cantidadPierdeAceite = cantidadPierdeAceite + 1
    }
    unaPersona.disminuirDolor(4)
    unaPersona.aumentarFortaleza(3)
  }
  override method necesitaMantenimiento(){
    return cantidadDesajusteTornillo >= 10 || cantidadPierdeAceite >= 5
  }
  override method hacerMantenimiento() {
    cantidadDesajusteTornillo = 0
    cantidadPierdeAceite = 0
  }
}
class Minitramp inherits Aparato{
  override method puedeSerUsado(unaPersona) = unaPersona.nivelDolor() < 20
  override method usarPor(unaPersona) {
    unaPersona.aumentarFortaleza(unaPersona.edad() * 0.1)
  }
}