package ar.edu.AlgoII.Grupo6

import ar.edu.AlgoII.Grupo6.IBusquedaObservador
import ar.edu.AlgoII.Grupo6.IBusquedaStrategy
import java.util.List
import java.util.ArrayList

class Busquedas100Resultados implements IBusquedaObservador, IBusquedaStrategy {
	
	List<Usuario> registro
	
	new () {
		registro = new ArrayList ()
	}
	
	override recibirNotificacion(Usuario unUsuario, List<Receta> data) {
		procesar(unUsuario, data)
	}
	
	override ejecutarEstrategia(Usuario unUsuario, List<Receta> data) {
		procesar(unUsuario, data)
	}
	
	private def procesar(Usuario unUsuario, List<Receta> data) {
		if (data.length > 100) {
			registro.add(unUsuario)
		}		
	}
	
}