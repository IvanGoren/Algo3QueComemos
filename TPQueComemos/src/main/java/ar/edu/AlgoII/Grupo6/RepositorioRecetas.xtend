package ar.edu.AlgoII.Grupo6

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class RepositorioRecetas {
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
	
}