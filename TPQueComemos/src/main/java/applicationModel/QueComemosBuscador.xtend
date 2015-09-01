package applicationModel

import ar.edu.AlgoII.Grupo6.FiltroStrategyPorSobrePeso
import ar.edu.AlgoII.Grupo6.Receta
import ar.edu.AlgoII.Grupo6.RepositorioRecetas
import ar.edu.AlgoII.Grupo6.Tests.SharedTestComponents
import ar.edu.AlgoII.Grupo6.Usuario
import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import java.util.List

@Accessors
@Observable
class QueComemosBuscador {
	RepositorioRecetas repositorio
	Receta recetaSeleccionada
	Usuario usuarioLogIn
	Integer calMin
	Integer calMax
	String nombre
	String ingrediente
	String dificultad
	String temporada
	List<Receta> resultado
	boolean aceptarFiltro

	new() {
		resultado = new ArrayList<Receta>
		usuarioLogIn = SharedTestComponents.getUsuarioConSobrepeso
		usuarioLogIn.filtros.add(new FiltroStrategyPorSobrePeso)
		repositorio = new RepositorioRecetas
	}
	
	def void agregarFavorita(){
		usuarioLogIn.agregarAFavoritas(recetaSeleccionada)
	}

	def void search() {
		if (aceptarFiltro.equals(true)) {
			resultado = repositorio.filtrarConFiltrosUsuario(usuarioLogIn)
		} else {
			resultado = repositorio.buscarPorNombreReceta(nombre)

		//			.buscarPorIngrediente(ingrediente, resultado)
		//			.buscarPorCalorias(minCal,maxCal, resultado)
		//			.buscarPorDificultar(dificultad, resultado)
		//			.buscarPorTemporada(temporada, resultado)
		}
	}

}
