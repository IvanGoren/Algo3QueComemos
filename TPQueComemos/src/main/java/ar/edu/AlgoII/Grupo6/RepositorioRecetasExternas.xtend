package ar.edu.AlgoII.Grupo6

import com.google.gson.Gson
import com.google.gson.reflect.TypeToken
import java.lang.reflect.Type
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import queComemos.entrega3.repositorio.BusquedaRecetas
import queComemos.entrega3.repositorio.RepoRecetas

@Accessors
class RepositorioRecetasExternas {

	BusquedaRecetas buscador
	List<IBusquedaObservador> observadores

	new() {
		observadores = new ArrayList<IBusquedaObservador>()
	}

	def List<Receta> consultarRecetas(Usuario unUsuario, BusquedaRecetas busquedaRecetas) {
		val recetasExternas = getRecetasExternas(busquedaRecetas)
		val recetas = new ArrayList<Receta>()
		recetasExternas.forEach [ recExt |
			val rec = RecetaAdapter.fromRecetaExterna(recExt)
			recetas.add(rec);
		]
		observadores.forEach[it.recibirNotificacion(unUsuario, recetas)];
		return recetas
	}
	
	def List<Receta> consultarRecetas(Usuario unUsuario, BusquedaRecetas busquedaRecetas, List<IBusquedaStrategy> postProcesos) {
		val recetasExternas = getRecetasExternas(busquedaRecetas)
		val recetas = new ArrayList<Receta>()
		recetasExternas.forEach [ recExt |
			val rec = RecetaAdapter.fromRecetaExterna(recExt)
			recetas.add(rec);
		]
		postProcesos.forEach[it.ejecutarEstrategia(unUsuario, recetas)];
		return recetas
	}   
	
	private def List<queComemos.entrega3.dominio.Receta> getRecetasExternas(BusquedaRecetas busquedaRecetas) {
		val RepoRecetas repoExt = new RepoRecetas()
		val resp = repoExt.getRecetas(busquedaRecetas)
		val Type listType = new TypeToken<List<queComemos.entrega3.dominio.Receta>>() {
		}.getType();

		return new Gson().fromJson(resp, listType)
	}

}
