package src.test.java.ar.edu.AlgoII.Grupo6.Tests

import org.junit.Before
import org.junit.Test
import src.test.java.ar.edu.AlgoII.Grupo6.Usuario
import src.test.java.ar.edu.AlgoII.Grupo6.Receta
import org.junit.Assert
import src.test.java.ar.edu.AlgoII.Grupo6.Ingrediente
import src.test.java.ar.edu.AlgoII.Grupo6.Alimento
import src.test.java.ar.edu.AlgoII.Grupo6.Diabetico
import src.test.java.ar.edu.AlgoII.Grupo6.RecetaAccesoPublico

class Punto3Test {
		
	Usuario unUsuarioHipertenso
	Usuario unUsuarioDiabetico
	Usuario unUsuarioVegano
	Receta unaRecetaDeUnUsuario
	Receta unaRecetaNoRecomendable
	
	Ingrediente sal
	Ingrediente azucar
	Ingrediente chivito
	
	@Before
	def void init() {
		unUsuarioHipertenso = new Usuario(83, 1.88)
		//unUsuarioHipertenso.condicionesPreexistentes.add(new Hipertenso)
		
		unUsuarioDiabetico = new Usuario(83, 1.88)
		unUsuarioDiabetico.condicionesPreexistentes.add(new Diabetico)
		
		unUsuarioVegano = new Usuario(83, 1.88)
		//unUsuarioVegano.condicionesPreexistentes.add(new Vegano)
		
		unaRecetaNoRecomendable = new Receta()
		unaRecetaNoRecomendable.acceso = new RecetaAccesoPublico()
		
		sal = new Ingrediente()
		sal.nombre = "Sal"
		sal.tipoDeAlimento = new Alimento("SAL")
		sal.cantidadEnGr = 100
		
		azucar = new Ingrediente()
		azucar.nombre = "Azucar"
		azucar.tipoDeAlimento = new Alimento("AZUCAR")
		azucar.cantidadEnGr = 101
		
		chivito = new Ingrediente()
		chivito.nombre = "Chivito"
		chivito.tipoDeAlimento = new Alimento("CHIVITO")
		chivito.cantidadEnGr = 1000
		
		unaRecetaNoRecomendable.ingredientes.add(sal)
		unaRecetaNoRecomendable.ingredientes.add(azucar)
		unaRecetaNoRecomendable.ingredientes.add(chivito)
	}

	@Test
	def void usuarioAgregandoReceta() {
		unaRecetaDeUnUsuario = new Receta()
	}

	@Test
	def void verRecetaNoRecomendableHipertenso() {
		Assert.assertFalse(unUsuarioHipertenso.condicionesPreexistentes.forall[t | t.getEsRecetaApta(unaRecetaNoRecomendable)])
	}
	
	@Test
	def void verRecetaNoRecomendableDiabetico() {
		Assert.assertFalse(unUsuarioDiabetico.condicionesPreexistentes.forall[t | t.getEsRecetaApta(unaRecetaNoRecomendable)])
	}
	
	@Test
	def void verRecetaNoRecomendableVegano() {
		Assert.assertFalse(unUsuarioVegano.condicionesPreexistentes.forall[t | t.getEsRecetaApta(unaRecetaNoRecomendable)])
	}
	
}