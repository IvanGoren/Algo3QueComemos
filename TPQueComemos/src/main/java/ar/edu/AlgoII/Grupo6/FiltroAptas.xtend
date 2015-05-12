package ar.edu.AlgoII.Grupo6

import ar.edu.AlgoII.Grupo6.IFiltro

class FiltroAptas implements IFiltro {
	
	Iterable<Receta> recetasDecorable
	IAceptaSugerencias unSugerible
	
	new (Iterable<Receta> recetas, IAceptaSugerencias elSugerible)
	{
		recetasDecorable = recetas
		unSugerible = elSugerible
	}
	
	override filtrar() {
		recetasDecorable.filter[ unSugerible.getEsRecetaAptaParaMi(it) ]
	}
	
	
}