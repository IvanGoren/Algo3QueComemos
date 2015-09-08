package ar.edu.AlgoII.Grupo6

import java.util.HashMap
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class BusquedasTops implements IBusquedaObservador, IBusquedaStrategy {
	
	HashMap<Receta, Integer> registro 
	Receta receta
	new () {
		registro = new HashMap<Receta, Integer> ()
	}
	
	override recibirNotificacion(Usuario unUsuario, List<Receta> data) {
		procesar(unUsuario, data)
	}
	override ejecutarEstrategia(Usuario unUsuario, List<Receta> data) {
		procesar(unUsuario, data)
	}
	private def procesar(Usuario unUsuario, List<Receta> data) {
		data.forEach [
//			val nombre = it.nombre; 
			var valor_actual = registro.get(receta) 
			if (valor_actual == null) {
				valor_actual = 0
			}
			registro.put(receta, valor_actual +1)
		]
	}
	
	
	def int registroPorReceta(Receta receta)
	{
		var valor_actual = registro.get(receta) 
		if (valor_actual == null) {
			valor_actual = 0
		}
		return valor_actual 
	}
	
}