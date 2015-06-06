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
class RepositorioRecetas implements IFiltro {
	List<Receta> recetas
	Buscador buscador

    List<IBusquedaObservador> observadores

	new() {
		recetas = new ArrayList<Receta>()
	}

	def Iterable<Receta> getRecetasVisiblesPor(Usuario unUsuario) {
		return recetas.filter[it.puedeVerme(unUsuario)]
	}

	def Iterable<Receta> consultarRecetas(Usuario unUsuario) {
		return this.getRecetasVisiblesPor(unUsuario)
	}

	def List<Receta> consultarRecetasConFiltros(Usuario unUsuario, List<IFiltroStrategy> filtros) {
		val List<Receta> seed = this.getRecetasVisiblesPor(unUsuario).toList

		//	  	filtros.fold (seed, [acum, f |
		//	  		f.filtrar( acum, unUsuario).toList
		val res = buscador.filtrar(unUsuario, seed)
		observadores.forEach[  it.recibirNotificacion(res) ]
		return res
	}

	override filtrar(Usuario unUsuario) {
		this.getRecetasVisiblesPor(unUsuario)
	}

	def List<queComemos.entrega3.dominio.Receta> getRecetasExternas(BusquedaRecetas busquedaRecetas) {
		val RepoRecetas repoExt = new RepoRecetas()
		val resp = repoExt.getRecetas(busquedaRecetas)
		val Type listType = new TypeToken<List<queComemos.entrega3.dominio.Receta>>() {
		}.getType();
		new Gson().fromJson(resp, listType)
	}
	
	

} 
