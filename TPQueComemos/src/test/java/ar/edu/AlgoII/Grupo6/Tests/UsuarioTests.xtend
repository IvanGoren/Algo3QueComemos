package ar.edu.AlgoII.Grupo6.Tests

import ar.edu.AlgoII.Grupo6.Usuario
import org.junit.Assert
import org.junit.Before
import org.junit.Test

class UsuarioTest {
	
	Usuario unUsuario
	
	@Before 
	def void init () {
		unUsuario = new Usuario( 83, 1.88);
	} 
	
	@Test 
	def void obtieneIMC() {
		Assert.assertEquals(unUsuario.IMC, 23.48, 0.01)
	}
}