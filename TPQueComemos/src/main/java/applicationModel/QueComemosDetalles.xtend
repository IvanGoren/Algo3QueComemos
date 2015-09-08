package applicationModel

import ar.edu.AlgoII.Grupo6.RepositorioRecetas
import ar.edu.AlgoII.Grupo6.Receta
import ar.edu.AlgoII.Grupo6.Usuario
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class QueComemosDetalles {
	Receta recetaSeleccionada
	Usuario usuarioLogIn
	Boolean favorita = false
	String nuevoNombre = ""
	
	def iniFavorita(){
		favorita = usuarioLogIn.recetasFavoritas.contains(recetaSeleccionada)
	}
	
//	no funciona porque hay que tratarlo como singleton
	def setFavorita(){
		usuarioLogIn.agregarAFavoritas(recetaSeleccionada)
	}
	
	def getNuevoNombre(){
		if(nuevoNombre==""){
			nuevoNombre = recetaSeleccionada.nombre
		}
		nuevoNombre
	}
	
	def getSiempreNulo(){
		null
	}
	
	def copiarReceta(){
		recetaSeleccionada.nombre = nuevoNombre
		recetaSeleccionada.acceso.usuarioCarga = usuarioLogIn
		var Receta copia = recetaSeleccionada.getCopia()
		RepositorioRecetas.getInstance.recetas.add(copia)
	}
		
}