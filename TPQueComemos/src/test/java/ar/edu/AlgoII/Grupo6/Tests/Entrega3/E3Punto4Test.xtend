package ar.edu.AlgoII.Grupo6.Tests.Entrega3

import ar.edu.AlgoII.Grupo6.BusquedasTops
import ar.edu.AlgoII.Grupo6.BusquedasXHora
import ar.edu.AlgoII.Grupo6.IBusquedaStrategy
import ar.edu.AlgoII.Grupo6.RepositorioRecetasExternas
import ar.edu.AlgoII.Grupo6.Tests.SharedTestComponents
import ar.edu.AlgoII.Grupo6.Usuario
import java.util.ArrayList
import org.junit.Assert
import org.junit.Before
import org.junit.Test
import queComemos.entrega3.repositorio.BusquedaRecetas
import ar.edu.AlgoII.Grupo6.BusquedasTopsXSexo

class E3Punto3Test {

	RepositorioRecetasExternas repo
	BusquedaRecetas busqueda
	BusquedasXHora busquedasXHora
	BusquedasTops busquedasTop
	BusquedasTopsXSexo busquedasTopXSexo		
	Usuario hombre
	Usuario mujer
	ArrayList<IBusquedaStrategy> postProc
	 
	@Before
	def void init() {
		repo = new RepositorioRecetasExternas()
		busqueda = new BusquedaRecetas()
		busquedasXHora = new BusquedasXHora()
		busquedasTop = new BusquedasTops()
		busquedasTopXSexo = new BusquedasTopsXSexo()
		postProc = new ArrayList<IBusquedaStrategy>()
		hombre = SharedTestComponents.getUsuarioSinPrecondicionHombre
		mujer = SharedTestComponents.getUsuarioSinPrecondicionMujer
	}

	@Test
	def void ConsultaRecetasPorHora() {
		postProc.add(busquedasXHora)
		busqueda.nombre = "ricota"
		repo.consultarRecetas(hombre, busqueda, postProc)
		
		Assert.assertEquals(1, busquedasXHora.registro.get(10))
	}

//	@Test
//	def void ConsultaRecetasTop() {
//		postProc.add(busquedasXHora)
//		postProc.add(busquedasTop)
//		busqueda.nombre = "ricota"
//		var recetas = repo.consultarRecetas(hombre,busqueda, postProc)
//	
//		recetas.forEach[		
//			Assert.assertEquals(1, busquedasTop.registroPorReceta(it.nombre))
//		]
//	}

//	@Test
//	def void ConsultaRecetasTopXSexo() {
//		postProc.add(busquedasXHora)
//		postProc.add(busquedasTop)
//		postProc.add(busquedasTopXSexo)
//		busqueda.nombre = "ricota"
//		var recetas = repo.consultarRecetas(hombre,busqueda, postProc)
//	 	recetas = repo.consultarRecetas(mujer,busqueda, postProc)
//	 	recetas = repo.consultarRecetas(hombre,busqueda, postProc)
//	 	
//		recetas.forEach[		
//			Assert.assertEquals(2, busquedasTopXSexo.registro.get("M").registroPorReceta(it.nombre))
//			Assert.assertEquals(1, busquedasTopXSexo.registro.get("F").registroPorReceta(it.nombre))
//		]
//	}




}
