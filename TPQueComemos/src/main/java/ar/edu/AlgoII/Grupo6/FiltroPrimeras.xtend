package ar.edu.AlgoII.Grupo6

import ar.edu.AlgoII.Grupo6.IFiltro

class FiltroPrimeras implements IFiltro {
	
	Iterable<Receta> recetasDecorable
	int cuantas
	
	new (Iterable<Receta> recetas, int cuantas)
	{
		recetasDecorable = recetas
		this.cuantas = cuantas
	}
	
	override filtrar() {
		recetasDecorable.take(cuantas)
	}
	
	
}