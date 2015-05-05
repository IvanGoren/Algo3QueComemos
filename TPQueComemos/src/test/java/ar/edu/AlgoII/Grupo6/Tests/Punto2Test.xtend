package ar.edu.AlgoII.Grupo6.Tests

import ar.edu.AlgoII.Grupo6.Usuario
import org.junit.Before
import org.junit.Test

package src.test.java.ar.edu.AlgoII.Grupo6.Tests
import src.test.java.ar.edu.AlgoII.Grupo6.Usuario
import org.junit.Assert

class Punto2Test {
	
	Usuario unUsuarioDiabeticoConRutinaSaludable
	Usuario unUsuarioDiabeticoSinRutinaSaludable
	
	@Before
	def void init() {
		unUsuarioDiabeticoConRutinaSaludable = new Usuario(83, 1.88)
		unUsuarioDiabeticoSinRutinaSaludable = new Usuario(83, 1.88)
		
		unUsuarioDiabeticoConRutinaSaludable.condicionesPreexistentes.add(new Diabetico())
		unUsuarioDiabeticoSinRutinaSaludable.condicionesPreexistentes.add(new Diabetico())
		unUsuarioDiabeticoSinRutinaSaludable.condicionesPreexistentes.add(new Celiaco())
		unUsuarioDiabeticoConRutinaSaludable.rutinaDeEjercicio="ACTIVA"
		unUsuarioDiabeticoSinRutinaSaludable.rutinaDeEjercicio="NADA"
		
	}
	
	@Test
	 def void tieneRutinaSaludable(){
	 	Assert.assertTrue(unUsuarioDiabeticoConRutinaSaludable.getEsRutinaSaludable)
	 }
	 
	 	@Test
	 def void noTieneRutinaSaludable(){
	 	Assert.assertFalce(unUsuarioDiabeticoSinRutinaSaludable.getEsRutinaSaludable)
	 }
}