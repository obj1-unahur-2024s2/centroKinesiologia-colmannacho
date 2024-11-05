object centro {
  const aparatos = []
  const pacientes = []
  method coloresAparatos() = aparatos.map({c => c.coloresAparatos()}).asSet()
  method pacientesMenoresDe8() = pacientes.filter({c => c.edad() < 8})
  method pacientesQueNoPuedenCumplir() = pacientes.count({c => c.puedeHacerLaRutina()}) 
  method estaEnOptimasCondiciones() = not aparatos.any({c => c.necesitaMantenimiento()})
  method aparatosQueNecesitanMantenimiento() = aparatos.filter({c => c.necesitaMantenimiento()}) 
  method estaComplicado() = self.aparatosQueNecesitanMantenimiento().size() >= aparatos.size() 
  method registrarVisitaTecnico() {
    if(not self.aparatosQueNecesitanMantenimiento().isEmpty())
        self.aparatosQueNecesitanMantenimiento().forEach({c => c.hacerMantenimiento()})
  }
}