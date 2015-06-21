package ar.edu.AlgoII.Grupo6.Tests.Entrega4

import ar.edu.AlgoII.Grupo6.Usuario
import ar.edu.AlgoII.Grupo6.Diabetico
import ar.edu.AlgoII.Grupo6.Celiaco
import ar.edu.AlgoII.Grupo6.RutinaEjercicio
import org.junit.Assert
import org.junit.Before
import org.junit.Test
import ar.edu.AlgoII.Grupo6.BuilderUsuario

class E4Punto1Test {
	
	Usuario unUsuarioConIMCExacto
	Usuario unUsuarioDiabeticoConRutinaSaludable
	Usuario unUsuarioDiabeticoSinRutinaSaludable
	Usuario unUsuarioConBuenIMC
	BuilderUsuario usuarioBuilder
	
	@Before
	def void init() {
		//unUsuarioConIMCExacto = new Usuario(80,2)
		usuarioBuilder = new BuilderUsuario
		usuarioBuilder.setAltura(80)
		usuarioBuilder.setPeso(2)
		unUsuarioConIMCExacto = usuarioBuilder.build() 
		
		//unUsuarioConBuenIMC = new Usuario(83,1.82)
		usuarioBuilder = new BuilderUsuario
		usuarioBuilder.setAltura(83)
		usuarioBuilder.setPeso(1.82)
		unUsuarioConBuenIMC = usuarioBuilder.build()
		
		//unUsuarioDiabeticoConRutinaSaludable = new Usuario(83, 1.5)
		//unUsuarioDiabeticoConRutinaSaludable.condicionesPreexistentes.add(new Diabetico())
		//unUsuarioDiabeticoConRutinaSaludable.rutinaDeEjercicio=RutinaEjercicio.ACTIVA
		usuarioBuilder = new BuilderUsuario
		usuarioBuilder.setAltura(83)
		usuarioBuilder.setPeso(1.5)
		usuarioBuilder.newCondicionesPreexistentes(new Diabetico())
		usuarioBuilder.setRutinaDeEjercicio(RutinaEjercicio.ACTIVA)
		unUsuarioDiabeticoConRutinaSaludable = usuarioBuilder.build()		
		
		//unUsuarioDiabeticoSinRutinaSaludable = new Usuario(83, 1.5)		
		//unUsuarioDiabeticoSinRutinaSaludable.condicionesPreexistentes.add(new Diabetico())
		//unUsuarioDiabeticoSinRutinaSaludable.condicionesPreexistentes.add(new Celiaco())
		//unUsuarioDiabeticoSinRutinaSaludable.rutinaDeEjercicio=RutinaEjercicio.NADA
		usuarioBuilder = new BuilderUsuario
		usuarioBuilder.setAltura(83)
		usuarioBuilder.setPeso(1.5)
		usuarioBuilder.newCondicionesPreexistentes(new Diabetico())
		usuarioBuilder.newCondicionesPreexistentes(new Celiaco())
		usuarioBuilder.setRutinaDeEjercicio(RutinaEjercicio.NADA)
		unUsuarioDiabeticoSinRutinaSaludable = usuarioBuilder.build()
		
	}

	@Test
	def void conseguirIMC(){
		var double imc = 20
		
		Assert.assertEquals(imc,unUsuarioConIMCExacto.getIMC(), 1 )
	}

	@Test
	def void tieneIMCSaludable(){
		Assert.assertTrue(unUsuarioConBuenIMC.getEsRutinaSaludable)
	}
	
	@Test
	 def void tieneRutinaSaludable(){
	 	Assert.assertTrue(unUsuarioDiabeticoConRutinaSaludable.getEsRutinaSaludable)
	 }
	 
	 @Test
	 def void noTieneRutinaSaludable(){
	 	Assert.assertFalse(unUsuarioDiabeticoSinRutinaSaludable.getEsRutinaSaludable)
	 }
}