package ar.edu.AlgoII.Grupo6

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Usuario {
	double peso
	double altura
	
	new (double elPeso, double laAltura)
	{
		peso = elPeso
		altura = laAltura
	}
	
	def double getIMC(){
		return peso / Math.pow(altura, 2);
	}
	
}