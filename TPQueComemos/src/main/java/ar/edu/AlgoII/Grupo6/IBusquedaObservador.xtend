package ar.edu.AlgoII.Grupo6

import java.util.List

interface IBusquedaObservador {
	
	def void recibirNotificacion(Usuario unUsuario, List<Receta> data)

	
}