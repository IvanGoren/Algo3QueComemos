package ar.edu.AlgoII.Grupo6.Tests

import ar.edu.AlgoII.Grupo6.BusinessException
import ar.edu.AlgoII.Grupo6.Receta
import ar.edu.AlgoII.Grupo6.Usuario
import org.junit.Assert
import org.junit.Before
import org.junit.Test

class Punto4Test {
	
	Usuario unUsuario
	
	Receta unaReceta

	@Before
	def void init() {
		unUsuario = new Usuario(83, 1.88)
	}

	@Test
	def void verRecetaPropia() {
		throw new UnsupportedOperationException()
	}

	@Test
	def void verRecetaPublica() {
		throw new UnsupportedOperationException()
	}
	
	@Test(expected=typeof(BusinessException))
	def void verRecetaAjena() {
		//Assert.assertEquals(unUsuario.getIMC(), 23.48, 0.01)
		throw new UnsupportedOperationException()
	}

@Test
	def void modificarRecetaPropia() {
		throw new UnsupportedOperationException()
	}

	@Test
	def void modificarRecetaPublica() {
		throw new UnsupportedOperationException()
	}
	
	@Test(expected=typeof(BusinessException))
	def void modificarRecetaAjena() {
		throw new UnsupportedOperationException()
	}


}