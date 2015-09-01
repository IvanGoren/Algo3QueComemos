package ar.edu.AlgoII.Grupo6

import ar.edu.AlgoII.Grupo6.Tests.SharedTestComponents
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class RepositorioRecetas implements IFiltro {
	List<Receta> recetas
	Buscador buscador
	Receta recetaSeleccionada
	List<IBusquedaObservador> buscadores
	
	new() {
		recetas = new ArrayList<Receta>
		recetas.add(getRecetaPrueba())
		recetas.add(SharedTestComponents.getBifeConPure)
		buscador = new Buscador

	}

	def Iterable<Receta> getRecetasVisiblesPor(Usuario unUsuario) {
		return recetas.filter[it.puedeVerme(unUsuario)]
	}

	def Iterable<Receta> consultarRecetas(Usuario unUsuario) {
		return this.getRecetasVisiblesPor(unUsuario)
	}

	def List<Receta> buscarPorNombreReceta(String nombreReceta){
		recetas.filter[r| r.nombre.contains(nombreReceta)].toList
	}

	def List<Receta> filtrarConFiltrosUsuario(Usuario unUsuario) {
		buscador.agregarFiltros(unUsuario)
		this.consultarRecetasConFiltros(unUsuario, unUsuario.filtros)
	}

	def List<Receta> consultarRecetasConFiltros(Usuario unUsuario, List<IFiltroStrategy> filtros) {
		val List<Receta> seed = this.getRecetasVisiblesPor(unUsuario).toList
		val res = buscador.filtrar(unUsuario, seed)
		return res
	}

	override filtrar(Usuario unUsuario) {
		this.getRecetasVisiblesPor(unUsuario)
	}

	def Receta getRecetaPrueba() {
		val unaReceta = new Receta()

		unaReceta.acceso = new RecetaAccesoPublico
		var Ingrediente azucar = new Ingrediente()
		azucar.nombre = "Azucar"
		azucar.tipoDeAlimento = new Alimento("AZUCAR")
		azucar.cantidadEnGr = 350
		var Ingrediente leche = new Ingrediente()
		leche.nombre = "Leche"
		leche.tipoDeAlimento = new Alimento("LECHE")
		leche.cantidadEnGr = 1000
		var Ingrediente chispasChoco = new Ingrediente()
		chispasChoco.nombre = "Chispas de chocolate"
		chispasChoco.tipoDeAlimento = new Alimento("AZUCAR")
		chispasChoco.cantidadEnGr = 50

		unaReceta.nombre = "Dulce de Leche con Chocolate"
		unaReceta.temporada = "Todos los dias"
		unaReceta.dificultad = "Media"
		unaReceta.ingredientes.add(azucar)
		unaReceta.ingredientes.add(leche)
		unaReceta.condimentos.add(chispasChoco)
		unaReceta.calorias = 190
		
		unaReceta.pasos.add("paso1")
		unaReceta.pasos.add("paso2")
		unaReceta.pasos.add("paso3")
		unaReceta
	}

}
