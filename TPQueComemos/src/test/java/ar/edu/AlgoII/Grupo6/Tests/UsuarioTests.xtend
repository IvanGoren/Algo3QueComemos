package ar.edu.AlgoII.Grupo6.Tests

import ar.edu.AlgoII.Grupo6.BusinessException
import ar.edu.AlgoII.Grupo6.Usuario
import ar.edu.AlgoII.Grupo6.UsuarioDiabetico
import org.junit.Assert
import org.junit.Before
import org.junit.Test

class UsuarioTest {

	Usuario unUsuario
	Usuario unDiabetico

	@Before
	def void init() {
		unUsuario = new Usuario(83, 1.88)
		unDiabetico = new Usuario(83, 1.88)

		unDiabetico.condicionesPreexistentes.add(new UsuarioDiabetico())
	}

	@Test
	def void obtieneIMC() {
		Assert.assertEquals(unUsuario.getIMC(), 23.48, 0.01)
	}

	@Test(expected=typeof(BusinessException))
	def void usaurioConNombreCorto() {
		unUsuario.nombre = "Jua"
		unUsuario.validar()
	}

}
