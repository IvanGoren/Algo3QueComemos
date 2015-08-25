package ar.edu.AlgoII.Grupo6

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class Receta implements IComponente {
	String nombre
	List<IComponente> ingredientes
	List<String> pasos
	int calorias
	String dificultad
	String temporada
	RecetaAcceso acceso
	List<IComponente> condimentos
	List<CondicionPreexistente> condicionesPreexistentes
	
	new () {
		ingredientes = new ArrayList<IComponente>()	
		pasos = new ArrayList<String>()
		condimentos = newArrayList
		condicionesPreexistentes = newArrayList
	} 	
	
 	override verSiTiene(Alimento unAlimento, double unaCantidad) {
		val tiene = ingredientes.exists[it.verSiTiene(unAlimento, unaCantidad) ]
		return tiene
	}
	
 	def boolean puedeVerme(Usuario unUsuario) {
		if (acceso == null) throw new IllegalArgumentException ("falta configurar el acceso")
		return acceso.puedeVerme(unUsuario)
	}
	
	def boolean puedeModificarme(Usuario unUsuario) {
		if (acceso == null) throw new IllegalArgumentException ("falta configurar el acceso")
		return acceso.puedeModificarme(unUsuario)
	}
	
	def  getCondicionesQueCumple() {
		RepositorioCondiciones.getInstance.condiciones.filter[c| c.getEsRecetaApta(this) ].toList()
	}

	def void agregarCondicionPrexistente(CondicionPreexistente unaCondicion){
		condicionesPreexistentes.add(unaCondicion)
	}
}