package ar.edu.AlgoII.Grupo6

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Ingrediente implements IComponente{
	
	String Nombre
	Alimento TipoDeAlimento
	double CantidadEnGr 
	
	override verSiTiene(Alimento unAlimento, double unaCantidad) {
		return (unAlimento == tipoDeAlimento && unaCantidad == CantidadEnGr)
	}
	
}