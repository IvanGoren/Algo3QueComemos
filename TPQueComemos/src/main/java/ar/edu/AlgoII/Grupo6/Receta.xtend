package ar.edu.AlgoII.Grupo6

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors

class Receta implements IComponente {
	String nombre
	List<IComponente> ingredientes
	List<String> pasos
	int calorias
	String dificultad
	String temporada
	RecetaAcceso acceso

	new () {
		ingredientes = new ArrayList<IComponente>()	
		pasos = new ArrayList<String>()
	} 	
	
	override verSiTiene(Alimento unAlimento, double unaCantidad) {
		val tiene = ingredientes.exists[it.verSiTiene(unAlimento, unaCantidad) ]
//		System.out.println("receta tiene? " + tiene);
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
	
}