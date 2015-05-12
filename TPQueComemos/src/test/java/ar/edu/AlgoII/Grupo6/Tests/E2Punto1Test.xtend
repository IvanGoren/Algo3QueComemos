package ar.edu.AlgoII.Grupo6.Tests

import ar.edu.AlgoII.Grupo6.Alimento
import ar.edu.AlgoII.Grupo6.Diabetico
import ar.edu.AlgoII.Grupo6.Grupo
import ar.edu.AlgoII.Grupo6.Ingrediente
import ar.edu.AlgoII.Grupo6.Receta
import ar.edu.AlgoII.Grupo6.RecetaAccesoPublico
import ar.edu.AlgoII.Grupo6.Usuario
import org.junit.Assert
import org.junit.Before
import org.junit.Test
import ar.edu.AlgoII.Grupo6.RecetaAccesoPrivado

class E2Punto1Test {

	Grupo unGrupo
	Usuario unUsuario
	Usuario otroUsuario
	Usuario usuarioDiabetico
	Receta unaReceta
	Receta unaRecetaPrivada

	@Before
	def void init() {

		unUsuario = SharedTestComponents.getUsuarioSinPrecondicion()
		otroUsuario = SharedTestComponents.getUsuarioSinPrecondicion()
		usuarioDiabetico = SharedTestComponents.getUsuarioDiabetico()

		unGrupo = new Grupo()
		unGrupo.nombre = "Te para tres"
		unGrupo.agregarUsuario(unUsuario)
		unGrupo.agregarUsuario(otroUsuario)

		unaReceta = SharedTestComponents.getDulceDeLeche()
		unaReceta.acceso = new RecetaAccesoPublico()		
		unaRecetaPrivada = SharedTestComponents.getPure()
		unaRecetaPrivada.acceso = new RecetaAccesoPrivado(otroUsuario)
		
	}

	@Test
	def void sugerenciaDeRecetaAUsuario() {
		Assert.assertTrue(unUsuario.getEsSugeridaParaMi(unaReceta))
	}

	@Test
	def void sugerenciaDeRecetaAUsuarioDiabetico() {
		Assert.assertFalse(usuarioDiabetico.getEsSugeridaParaMi(unaReceta))
	}

	@Test
	def void sugerenciaDeRecetaAUsuarioDeOtroUsuario() {
		Assert.assertTrue(unUsuario.getEsSugeridaParaMi(unaRecetaPrivada))
	}

	@Test
	def void sugerenciaDeRecetaAUsuarioNoGustaLeche() {
		otroUsuario.comidasQueNoGustan.add("LECHE")
		Assert.assertFalse(otroUsuario.getEsSugeridaParaMi(unaReceta))
	}

	@Test
	def void sugerenciaDeRecetaAGrupoSinGustos() {
		Assert.assertFalse(unGrupo.getEsSugeridaParaMi(unaReceta))
	}

	@Test
	def void sugerenciaDeRecetaAGrupoGustaLeche() {
		unGrupo.comidasQueGustan.add("LECHE")
		Assert.assertTrue(unGrupo.getEsSugeridaParaMi(unaReceta))
	}

	@Test
	def void sugerenciaDeRecetaAGrupoConDiabetico() {
		unGrupo.agregarUsuario(usuarioDiabetico)
		Assert.assertFalse(unGrupo.getEsSugeridaParaMi(unaReceta))
	}

}
