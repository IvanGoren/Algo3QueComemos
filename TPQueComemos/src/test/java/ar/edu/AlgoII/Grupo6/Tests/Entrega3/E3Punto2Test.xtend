package ar.edu.AlgoII.Grupo6.Tests.Entrega3

import ar.edu.AlgoII.Grupo6.RepositorioRecetasExternas
import ar.edu.AlgoII.Grupo6.Tests.SharedTestComponents
import ar.edu.AlgoII.Grupo6.Usuario
import org.junit.Assert
import org.junit.Before
import org.junit.Test
import queComemos.entrega3.repositorio.BusquedaRecetas

class E3Punto2Test {

	RepositorioRecetasExternas repo
	BusquedaRecetas busqueda
	Usuario hombre

	@Before
	def void init() {
		repo = new RepositorioRecetasExternas()
		busqueda = new BusquedaRecetas()
		hombre = SharedTestComponents.getUsuarioSinPrecondicionHombre
	}

	@Test
	def void ConsultaRecetasPorNombre() {
		busqueda.nombre = "ricota"
		Assert.assertEquals(1, repo.consultarRecetas(hombre, busqueda).size)
	}

}
