package ar.edu.AlgoII.Grupo6.Tests.Entrega2

import ar.edu.AlgoII.Grupo6.Grupo
import ar.edu.AlgoII.Grupo6.RecetaAccesoPrivado
import ar.edu.AlgoII.Grupo6.RepositorioRecetas
import ar.edu.AlgoII.Grupo6.Tests.SharedTestComponents
import ar.edu.AlgoII.Grupo6.Usuario
import org.junit.Assert
import org.junit.Before
import org.junit.Test

class E2Punto2Test {
	RepositorioRecetas repo
	Usuario unUsuario
	Usuario usuarioConSobrepeso
	Grupo unGrupo

	@Before
	def void init() {
		unUsuario = SharedTestComponents.getUsuarioSinPrecondicion
		unUsuario.nombre = "Micho"
		usuarioConSobrepeso = SharedTestComponents.getUsuarioConSobrepeso
		usuarioConSobrepeso.nombre = "Tito"

		unGrupo = SharedTestComponents.getGrupoSinPreCondicion()
		repo = new RepositorioRecetas()
	}

	@Test
	def void puedeVerTodasLasRecetas() {
		repo.recetas.add(SharedTestComponents.getDulceDeLeche);
		repo.recetas.add(SharedTestComponents.getPure);
		repo.recetas.add(SharedTestComponents.getBifeConPure(new RecetaAccesoPrivado(unUsuario)));
		Assert.assertEquals(3, repo.getRecetasVisiblesPor(unUsuario).size)
	}

	@Test
	def void puedeVerSoloRecetasPublicasLasRecetas() {
		repo.recetas.add(SharedTestComponents.getDulceDeLeche);
		repo.recetas.add(SharedTestComponents.getPure);
		repo.recetas.add(SharedTestComponents.getBifeConPure(new RecetaAccesoPrivado(unUsuario)));
		Assert.assertEquals(2, repo.getRecetasVisiblesPor(usuarioConSobrepeso).size)
	}

}
