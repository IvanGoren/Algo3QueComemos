package ar.edu.AlgoII.Grupo6

import java.util.List

class Buscador{
	List<IFiltroStrategy> filtros   
	
	def filtrar(Usuario unUsuario,List<Receta> seed) {
	  	filtros.fold (seed, [acum, f |	f.filtrar( acum, unUsuario).toList])
	}
	
}