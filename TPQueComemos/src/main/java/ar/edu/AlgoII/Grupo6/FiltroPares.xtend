package ar.edu.AlgoII.Grupo6

import ar.edu.AlgoII.Grupo6.IFiltro

class FiltroPares implements IFiltro {
	
	Iterable<Receta> recetasDecorable

	
	new (Iterable<Receta> recetas)
	{
		recetasDecorable = recetas
	}
	
	override filtrar() {
		//TODO : ver como tomar los pares
		recetasDecorable
	}
	
	
}