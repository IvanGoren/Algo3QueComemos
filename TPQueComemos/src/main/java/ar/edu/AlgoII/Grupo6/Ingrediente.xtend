package ar.edu.AlgoII.Grupo6

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Ingrediente implements IComponente{
	
	String nombre
	Alimento tipoDeAlimento
	double cantidadEnGr 
	
	override verSiTiene(Alimento unAlimento, double unaCantidad) {
//		System.out.println("Alimento: " + unAlimento.nombre + " - "+ tipoDeAlimento.nombre);
//		System.out.println("unaCantidad: " + unaCantidad + " - "+ cantidadEnGr);
		val tiene = (unAlimento.nombre.equalsIgnoreCase(tipoDeAlimento.nombre ) && cantidadEnGr >= unaCantidad)
//		System.out.println("ing tiene? " + tiene);
		return tiene
	}
	
}