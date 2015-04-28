package ar.edu.AlgoII.Grupo6

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors

class Receta {
	String nombre
	List<Ingredientes> ingredientes
	List<Ingredientes> condimentos
	List<String> pasos
	int calorias
	String dificultad
	String temporada
	Receta recetaBase
	Usuario usuarioCarga
	}