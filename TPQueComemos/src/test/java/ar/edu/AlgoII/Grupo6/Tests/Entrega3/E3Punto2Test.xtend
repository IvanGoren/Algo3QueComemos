package ar.edu.AlgoII.Grupo6.Tests.Entrega3

import ar.edu.AlgoII.Grupo6.RepositorioRecetas
import org.junit.Assert
import org.junit.Before
import org.junit.Test
import queComemos.entrega3.repositorio.BusquedaRecetas

class E3Punto2Test {
	
		RepositorioRecetas repo
		BusquedaRecetas busqueda
		
	@Before
	def void init() {
		repo = new RepositorioRecetas()
		busqueda = new BusquedaRecetas()	
	}

	@Test
	def void ConsultaRecetasPorNombre(){
		busqueda.nombre = "ricota"
		Assert.assertEquals(1, repo.getRecetasExternas(busqueda).size)
	}
	
}