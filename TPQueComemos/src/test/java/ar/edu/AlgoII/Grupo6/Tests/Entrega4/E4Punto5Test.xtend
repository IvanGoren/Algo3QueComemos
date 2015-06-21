package ar.edu.AlgoII.Grupo6.Tests.Entrega4

import ar.edu.AlgoII.Grupo6.AccionMarcarComoFavoritas
import ar.edu.AlgoII.Grupo6.Regla
import ar.edu.AlgoII.Grupo6.RepositorioRecetasExternas
import ar.edu.AlgoII.Grupo6.Tests.SharedTestComponents
import ar.edu.AlgoII.Grupo6.Usuario
import org.junit.Assert
import org.junit.Before
import org.junit.Test
import queComemos.entrega3.repositorio.BusquedaRecetas
import ar.edu.AlgoII.Grupo6.CondicionGuardaFavoritas

class E4Punto5Test {

	RepositorioRecetasExternas repo
	BusquedaRecetas busqueda
	Regla regGuardaFav
	CondicionGuardaFavoritas condGuardaFav
	AccionMarcarComoFavoritas accMarcarFav
	
	Usuario hombre

	@Before
	def void init() {
		repo = new RepositorioRecetasExternas()
		busqueda = new BusquedaRecetas()

		condGuardaFav = new CondicionGuardaFavoritas()
		accMarcarFav = new AccionMarcarComoFavoritas()
		regGuardaFav = new Regla(condGuardaFav, accMarcarFav)
		repo.reglas.add(regGuardaFav)
		
		hombre = SharedTestComponents.getUsuarioSinPrecondicionHombre
	}

	@Test
	def void ConsultaRecetasMarcarFavoritas() {
		hombre.guardarSiempreFavoritas = true
		busqueda.nombre = "ricota"
		var recetas = repo.consultarRecetas(hombre, busqueda)

		Assert.assertEquals(recetas.size , hombre.recetasFavoritas.size )
	}

	@Test
	def void ConsultaRecetasNoMarcarFavoritas() {
		hombre.guardarSiempreFavoritas = false
		busqueda.nombre = "ricota"
		repo.consultarRecetas(hombre, busqueda)
		Assert.assertEquals(0 , hombre.recetasFavoritas.size )
	}

}
