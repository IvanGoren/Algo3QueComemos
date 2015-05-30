package ar.edu.AlgoII.Grupo6.Tests.Entrega2

import ar.edu.AlgoII.Grupo6.Tests.SharedTestComponents
import ar.edu.AlgoII.Grupo6.Usuario
import org.junit.Assert
import org.junit.Before
import org.junit.Test

class E2Punto3Test {

	Usuario unUsuario

	@Before
	def void init() {
		unUsuario = SharedTestComponents.getUsuarioSinPrecondicion
		unUsuario.nombre = "Cacho"
	}

	@Test
	def void ConsultaTodasLasRecetas() {
		unUsuario.agregarAFavoritas(SharedTestComponents.getBifeConPure)
		Assert.assertEquals(1, unUsuario.recetasFavoritas.size)
	}
}
