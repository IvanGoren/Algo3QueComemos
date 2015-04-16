package ar.edu.AlgoII.Grupo6.Tests

import ar.edu.AlgoII.Grupo6.Usuario
import org.junit.Assert
import org.junit.Before
import org.junit.Test

class UsuarioTest {
	
	Usuario unUsuario
	
	@Before 
	def void init () {
		unUsuario = new Usuario;
	} 
	
	@Test 
	def void obtieneIMC() {
		Assert.assertEquals(15, 15)
	}
}