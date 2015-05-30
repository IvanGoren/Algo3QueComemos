package ar.edu.AlgoII.Grupo6

class RecetaAdapter {
	
	static def Receta fromRecetaExterna(queComemos.entrega3.dominio.Receta recetaExt)
	{
		val Receta unaReceta = new Receta()
		unaReceta.nombre = recetaExt.nombre
		unaReceta.dificultad = recetaExt.dificultadReceta.toString()
		return unaReceta
	}
}