package ar.edu.AlgoII.Grupo6

import java.util.HashMap
import java.util.List

class BusquedasXHoraObserver implements IBusquedaObservador {
	
	val HashMap<Integer, Integer> registro 
	
	new () {
		registro = new HashMap<Integer, Integer> ()
	}
	
	override recibirNotificacion(List<Receta> data) {
		val valor_actual = registro.get(data.size) 
		registro.put(data.size, valor_actual +1)
	}
	
}