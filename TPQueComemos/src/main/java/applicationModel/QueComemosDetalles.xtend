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
	
	
	def iniFavorita(){
		favorita = usuarioLogIn.recetasFavoritas.contains(recetaSeleccionada)
	}
	
//	no funciona porque hay que tratarlo como singleton
	def setFavorita(){
		usuarioLogIn.agregarAFavoritas(recetaSeleccionada)
	}
		
}