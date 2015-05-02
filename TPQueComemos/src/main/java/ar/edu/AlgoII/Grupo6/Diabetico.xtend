package ar.edu.AlgoII.Grupo6

import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.AlgoII.Grupo6.Usuario

@Accessors
class Diabetico extends CondicionPreexistente {
	
	
	override validarSexo(Usuario usuario) {
		if (usuario.sexo != "") {
			throw new BusinessException("Debe ingresar el sexo para los usuarios diabeticos")
		}
	}
	
	override validarPreferencias(Usuario usuario) {
		if ( usuario.preferencias.length() > 0){
			throw new BusinessException("Debe ingresar el preferencias para los usuarios diabeticos")
		}
		
	}
	
	override validarObligatorios(Usuario usuario) {
		
	}
	
	override boolean getEsRutinaSaludable(Usuario elUsuario){
		return (elUsuario.peso < 70)
	}
	
	override  getEsRecetaApta(Receta laReceta)
	{
		//recorrer ingredietes y ver si hay azucar
		//si hay chequear si son mas de 100g
		
		return !laReceta.verSiTiene(Alimento.AZUCAR, 100)
		
	}
	
}