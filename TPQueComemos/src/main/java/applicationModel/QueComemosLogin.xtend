package applicationModel

import ar.edu.AlgoII.Grupo6.RepoUsuarios
import ar.edu.AlgoII.Grupo6.Usuario
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class QueComemosLogin {
	String usuario = ""
	String clave = ""
	RepoUsuarios repoUsuarios
	
	new() {

	}
	
	def Usuario checkLogin(){
		repoUsuarios.chequearUsuario(usuario,clave)
	}
	
	
}