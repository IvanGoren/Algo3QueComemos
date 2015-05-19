package ar.edu.AlgoII.Grupo6

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class RepositorioRecetas implements IFiltro{
	List<Receta> recetas
	
	new () {
		recetas = new ArrayList<Receta> ()
	}
	
	def Iterable<Receta> getRecetasVisiblesPor(Usuario unUsuario){
		return recetas.filter[it.puedeVerme(unUsuario)]
	}
	
	def Iterable<Receta> consultarRecetas(Usuario unUsuario){
		return this.getRecetasVisiblesPor(unUsuario)
	}
	
	def List<Receta> consultarRecetasConFiltros(Usuario unUsuario, List<IFiltroStrategy> filtros){
		val List<Receta> seed = this.getRecetasVisiblesPor(unUsuario).toList 
	  	filtros.fold (seed, [acum, f |
	  		f.filtrar( acum, unUsuario).toList
	  	])
	  	
	  	
	}
	
	override filtrar(Usuario unUsuario) {
		this.getRecetasVisiblesPor(unUsuario)
	}
	
}