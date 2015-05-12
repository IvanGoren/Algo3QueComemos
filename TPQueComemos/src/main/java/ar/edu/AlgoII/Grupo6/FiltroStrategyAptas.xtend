package ar.edu.AlgoII.Grupo6

import java.util.List

class FiltroStrategyAptas implements IFiltroStrategy {
	
	override filtrar(List<Receta> recetas , IAceptaSugerencias unSugerible) {
//		System.out.println("FiltroStrategyAptas" );
//		System.out.println("recetas:" + recetas.size);
		recetas.filter[ unSugerible.getEsRecetaAptaParaMi(it) ].toList
	}
	
	
}