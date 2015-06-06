package ar.edu.AlgoII.Grupo6.Tests.Entrega3

import ar.edu.AlgoII.Grupo6.RepositorioRecetasExternas
import ar.edu.AlgoII.Grupo6.Usuario
import org.junit.Assert
import org.junit.Before
import org.junit.Test
import queComemos.entrega3.repositorio.BusquedaRecetas
import ar.edu.AlgoII.Grupo6.Tests.SharedTestComponents
import ar.edu.AlgoII.Grupo6.BusquedasTops
import ar.edu.AlgoII.Grupo6.BusquedasXHora

class E3Punto3Test {

	RepositorioRecetasExternas repo
	BusquedaRecetas busqueda
	BusquedasXHora busquedasXHora
	BusquedasTops busquedasTop	
	Usuario hombre
	Usuario mujer
	 
	@Before
	def void init() {
		repo = new RepositorioRecetasExternas()
		busqueda = new BusquedaRecetas()
		busquedasXHora = new BusquedasXHora()
		busquedasTop = new BusquedasTops()
		hombre = SharedTestComponents.getUsuarioSinPrecondicionHombre
		mujer = SharedTestComponents.getUsuarioSinPrecondicionMujer
	}

	@Test
	def void ConsultaRecetasPorHora() {
		repo.observadores.add(busquedasXHora)
		busqueda.nombre = "ricota"
		repo.consultarRecetas(hombre, busqueda)
		
		Assert.assertEquals(1, busquedasXHora.registro.get(10))
	}

	@Test
	def void ConsultaRecetasObserverTop() {
		repo.observadores.add(busquedasXHora)
		repo.observadores.add(busquedasTop)
		busqueda.nombre = "ricota"
		var recetas = repo.consultarRecetas(hombre,busqueda)
	
		recetas.forEach[		
			Assert.assertEquals(1, busquedasTop.registroPorReceta(it.nombre))
		]
	}




}
