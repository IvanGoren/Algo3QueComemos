package applicationModel

import ar.edu.AlgoII.Grupo6.Receta
import ar.edu.AlgoII.Grupo6.RepoUsuarios
import ar.edu.AlgoII.Grupo6.RepositorioRecetas

import ar.edu.AlgoII.Grupo6.Usuario
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class QueComemosBuscador {
	RepositorioRecetas repositorio
	Receta recetaSeleccionada
	Usuario usuarioLogIn
	Integer calMin
	Integer calMax
	String nombre
	String ingrediente
	String dificultad
	String temporada
	List<Receta> resultado
	boolean aceptarFiltro
	String labelResultado
	RepoUsuarios repoUsuarios
	String usuario = ""
	String clave = ""

	new() {
		resultado = new ArrayList<Receta>
		repoUsuarios = RepoUsuarios.getInstance
		repositorio = RepositorioRecetas.getInstance
	}

	def init() {

		//		if (usuarioLogIn == null) {
		//			usuarioLogIn = SharedTestComponents.getUsuarioConSobrepeso
		//			usuarioLogIn.setAltura(120)
		//			usuarioLogIn.setPeso(1.88)
		//			usuarioLogIn.filtros.add(new FiltroStrategyPorSobrePeso)
		//			usuarioLogIn.nombre = "usuario sin registrar"
		//		}
		this.getRecetasIniciales(usuarioLogIn)
	}

	def void checkLogin() {
		usuarioLogIn = repoUsuarios.chequearUsuario(usuario, clave)
	}

	def getDificultades() {
		var aux = newArrayList
		aux.add("Baja")
		aux.add("Media")
		aux.add("Alta")
		aux
	}

	def getTemporadas() {
		var aux = newArrayList
		aux.add("Otoño")
		aux.add("Invierno")
		aux.add("Primavera")
		aux.add("Verano")
		aux.add("Todos los dias")
		aux
	}

	def void agregarFavorita() {
		usuarioLogIn.agregarAFavoritas(recetaSeleccionada)
	}

	def void search() {
		if (aceptarFiltro) {
			resultado = repositorio.filtrarConFiltrosUsuario(usuarioLogIn)
		} else {
			resultado = repositorio.getRecetasVisiblesPor(usuarioLogIn).toList
			resultado = repositorio.buscarPorNombreReceta(nombre, resultado)
			resultado = repositorio.buscarPorCalorias(calMin, calMax, resultado)
			resultado = repositorio.buscarPorDificultad(dificultad, resultado)
			resultado = repositorio.buscarPorTemporada(temporada, resultado)
			resultado = repositorio.buscarPorIngrediente(ingrediente, resultado)
			labelResultado = "Estos son los resultados de tu busqueda"
		}
	}

	def void getRecetasIniciales(Usuario unUsuario) {
		if (unUsuario.recetasFavoritas.size > 0) {
			resultado.addAll(unUsuario.recetasFavoritas)
			labelResultado = "Estas son tus recetas favoritas"
		} else if (usuarioLogIn.ultimasRecetasConsultadas.size > 0) {
			labelResultado = "Estas son tus ultimas consultas"
			resultado.addAll(unUsuario.ultimasRecetasConsultadas)
		} else {
			labelResultado = "Estas son las recetas TOPs"
		}
	}

	def void clear() {
		resultado = new ArrayList<Receta>
		nombre = null
		calMin = null
		calMax = null
		dificultad = null
		temporada = null
		ingrediente = null
		this.getRecetasIniciales(usuarioLogIn)
	}

	def recetaRevisada() {
		usuarioLogIn.ultimaConsulta(recetaSeleccionada)
	}

}
