package ar.edu.AlgoII.Grupo6

class RecetaAccesoPublico extends RecetaAcceso {
	
	new(){
		usuarioCarga = new Usuario(0,0)
		usuarioCarga.nombre = "Público"
	}

	override puedeVerme(Usuario unUsuario) {
		return true
	}
	
	override puedeModificarme(Usuario unUsuario) {
		return true
	}
}