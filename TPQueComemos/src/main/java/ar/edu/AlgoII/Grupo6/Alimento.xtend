package ar.edu.AlgoII.Grupo6

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Alimento {
	static Alimento CARNE;
	static def Alimento getCARNE (){
		if (CARNE == null) 
			CARNE = new Alimento ("CARNE")
		return CARNE;
	} 
	static Alimento FRUTA;
	static def Alimento getFRUTA (){
		if (FRUTA == null) 
			FRUTA = new Alimento ("FRUTA")
		return FRUTA;
	} 
	static Alimento AZUCAR;
	static def Alimento getAZUCAR (){
		if (AZUCAR == null) 
			AZUCAR = new Alimento ("AZUCAR")
		return AZUCAR;
	} 
	static Alimento HARINA;
	static def Alimento getHARINA (){
		if (HARINA == null) 
			HARINA = new Alimento ("HARINA")
		return HARINA;
	} 	

	String Nombre
	
	new (String unNombre)
	{
		Nombre = unNombre
	}
	
}