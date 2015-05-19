package ar.edu.AlgoII.Grupo6

import ar.edu.AlgoII.Grupo6.IFiltro

class FiltroPares implements IFiltro {
	
	IFiltro filtro
	
	new (IFiltro filtro)
	{
		this.filtro = filtro
	}
	
	
	override filtrar(Usuario unUsuario) {
		//TODO : ver como tomar los pares
		filtro.filtrar(unUsuario)
	}
	
	
}