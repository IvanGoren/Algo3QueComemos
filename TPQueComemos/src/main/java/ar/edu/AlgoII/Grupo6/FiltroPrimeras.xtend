package ar.edu.AlgoII.Grupo6

import ar.edu.AlgoII.Grupo6.IFiltro

class FiltroPrimeras implements IFiltro {

	IFiltro filtro
	int cuantas

	new(IFiltro filtro,int cuantas)
	{
		this.filtro = filtro
		this.cuantas = cuantas
	}
	override filtrar(Usuario unUsuario) {
		filtro.filtrar(unUsuario)
			.take(cuantas)
	}
	
	
}
