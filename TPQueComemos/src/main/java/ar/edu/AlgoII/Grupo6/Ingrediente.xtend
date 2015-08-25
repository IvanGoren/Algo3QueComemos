package ar.edu.AlgoII.Grupo6

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class Ingrediente implements IComponente{
	
	String nombre
	Alimento tipoDeAlimento
	double cantidadEnGr 
	
	override verSiTiene(Alimento unAlimento, double unaCantidad) {
		val tiene = (unAlimento.nombre.equalsIgnoreCase(tipoDeAlimento.nombre ) && cantidadEnGr >= unaCantidad)
		return tiene
	}
	
}