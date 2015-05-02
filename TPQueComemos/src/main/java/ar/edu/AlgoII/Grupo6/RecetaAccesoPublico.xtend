package ar.edu.AlgoII.Grupo6

class RecetaAccesoPublico extends RecetaAcceso {

	override puedeVerme(Usuario unUsuario) {
		return true
	}
	
	override puedeModificarme(Usuario unUsuario) {
		return true
	}
}