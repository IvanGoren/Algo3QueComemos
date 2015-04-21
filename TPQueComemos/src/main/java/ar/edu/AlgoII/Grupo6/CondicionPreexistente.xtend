package ar.edu.AlgoII.Grupo6

import ar.edu.AlgoII.Grupo6.Usuario

abstract class CondicionPreexistente {
	
	def void validarObligatorios (Usuario elUsuario)
	def void validarSexo (Usuario elUsuario)
	def void validarPreferencias (Usuario elUsuario)
	
	def boolean getEsRutinaSaludable(Usuario elUsuario)
	
	def boolean getEsRecetaApta(Receta laReceta)
	
}