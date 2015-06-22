package ar.edu.AlgoII.Grupo6

import java.util.ArrayList
import java.util.List

class BuilderRecetas {
	
	Receta recetaCreada
	RecetaAcceso acceso
	List<IComponente> ingredientes
	int calorias
	
	new() {
		ingredientes = new ArrayList
	}
	
	def setAcceso(RecetaAcceso newAcceso) {
		acceso = newAcceso
	}
	
	def agregarIngrediente(IComponente newIngrediente) {
		ingredientes.add(newIngrediente)
	}
	
	def setCalorias(int newCalorias) {
		calorias = newCalorias
	}
	
	def Receta build() {
		recetaCreada = new Receta()
		recetaCreada.ingredientes.addAll(ingredientes)
		recetaCreada.setAcceso(acceso)
		
		recetaCreada
	}
}