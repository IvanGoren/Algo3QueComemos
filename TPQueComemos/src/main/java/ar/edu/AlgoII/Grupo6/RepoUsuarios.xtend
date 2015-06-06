package ar.edu.AlgoII.Grupo6

import java.util.ArrayList
import java.util.List

class RepoUsuarios {

	List<Usuario> usuariosAprobados
	List<Usuario> usuariosPendientes

	new() {
		usuariosAprobados = new ArrayList<Usuario>()
		usuariosPendientes = new ArrayList<Usuario>()
	}

	def void add(Usuario unUsuario) {
		usuariosPendientes.add(unUsuario)
	}

	def void remove(Usuario unUsuario) {
		if (unUsuario.nombre != "") {
			usuariosAprobados.remove(usuariosAprobados.findFirst[it.nombre == unUsuario.nombre])
			usuariosPendientes.remove(usuariosPendientes.findFirst[it.nombre == unUsuario.nombre])
		}
	}

	def void update(Usuario unUsuario) {
		var usu = usuariosAprobados.findFirst[it.nombre == unUsuario.nombre]
		if (usu == null) {
			usu = usuariosPendientes.findFirst[it.nombre == unUsuario.nombre]
		}
		if (usu != null) {
			usu.modificar(unUsuario)
		}
	}

	def Usuario get(Usuario unUsuario) {
		usuariosAprobados.findFirst[it.nombre == unUsuario.nombre]
	}

	def List<Usuario> list(Usuario usuarioEjemplo) {
		usuariosAprobados.filter[  coincidenCondiciones(it, usuarioEjemplo.condicionesPreexistentes) ].toList
	}
	
	def boolean coincidenCondiciones(Usuario usuario, List<CondicionPreexistente> preexistentes) {
		preexistentes.isEmpty() //|| usuario.condicionesPreexistentes.forall[ it.]  .stream().anyMatch(condicion -> preexistentes.contains(condicion));
	}
	
//
//	def List<Usuario> listPendinds(Usuario unUsuario) {
//		usuariosPendientes.filter[coincidenCondiciones(it, usuarioEjemplo.condicionesPreexistentes)].toList
//	}
//
//	private boolean coincidenCondiciones(Usuario unUsuario, List<condicionesPreexistentes> condiciones) {
//		return condiciones.isEmpty() || unUsuario.condicionesPreexistentes.stream().anyMatch(condicion -> condiciones.contains(condicion));
//	}

	def void approve(Usuario unUsuario) {
		var usu = usuariosPendientes.findFirst[it.nombre == unUsuario.nombre]
		if (usu != null) {
			usuariosAprobados.add(unUsuario)
			usuariosPendientes.remove(usu)
		}
	}

	def void deny(Usuario unUsuario) {
		var usu = usuariosPendientes.findFirst[it.nombre == unUsuario.nombre]
		if (usu != null) {
			usuariosPendientes.remove(usu)
		}
	}

}
