package ar.edu.AlgoII.Grupo6

import ar.edu.AlgoII.Grupo6.IBusquedaObservador
import ar.edu.AlgoII.Grupo6.IBusquedaStrategy
import java.util.List

class BusquedasUsuarios implements IBusquedaObservador, IBusquedaStrategy {
	
	String usuarioObservado
	
	new (String unUsuario) {
		usuarioObservado = unUsuario
	}
	
	override recibirNotificacion(Usuario unUsuario, List<Receta> data) {
		procesar(unUsuario, data)
	}
	
	override ejecutarEstrategia(Usuario unUsuario, List<Receta> data) {
		procesar(unUsuario, data)
	}
	
	private def procesar(Usuario unUsuario, List<Receta> data) {
		if (unUsuario.nombre == usuarioObservado) {
			//Enviar mail
		}		
	}
	
}