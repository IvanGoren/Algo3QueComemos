package ar.edu.AlgoII.Grupo6.Tests

import ar.edu.AlgoII.Grupo6.Grupo
import ar.edu.AlgoII.Grupo6.RecetaAccesoPrivado
import ar.edu.AlgoII.Grupo6.RepositorioRecetas
import ar.edu.AlgoII.Grupo6.Usuario
import org.junit.Assert
import org.junit.Before
import org.junit.Test
import ar.edu.AlgoII.Grupo6.FiltroPorSobrePeso

class E2Punto4Test {
	
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
	def void ConsultaTodasLasRecetas() {
		repo.recetas.add(SharedTestComponents.getDulceDeLeche);
		repo.recetas.add(SharedTestComponents.getPure);
		repo.recetas.add(SharedTestComponents.getBifeConPure(new RecetaAccesoPrivado(unUsuario)));
		Assert.assertEquals(3, repo.consultarRecetas(unUsuario).size)
	}
	
	@Test
	def void ConsultaLasRecetas() {
		repo.recetas.add(SharedTestComponents.getDulceDeLeche);
		repo.recetas.add(SharedTestComponents.getPure);
		repo.recetas.add(SharedTestComponents.getBifeConPure(new RecetaAccesoPrivado(unUsuario)));
		Assert.assertEquals(2, repo.consultarRecetas(usuarioConSobrepeso).size)
	}
	
	@Test
	def void ConsultaLasRecetasPertenecienteAUnGrupo() {
		repo.recetas.add(SharedTestComponents.getDulceDeLeche);
		repo.recetas.add(SharedTestComponents.getPure);
		repo.recetas.add(SharedTestComponents.getBifeConPure(new RecetaAccesoPrivado(unUsuario)));
		unGrupo.agregarUsuario(unUsuario)
		unGrupo.agregarUsuario(usuarioConSobrepeso)
		Assert.assertEquals(3, repo.consultarRecetas(usuarioConSobrepeso).size)
	}
	
	@Test
	def void ConsultaRecetasConFiltroSobrepeso() {
		repo.recetas.add(SharedTestComponents.getDulceDeLeche);
		repo.recetas.add(SharedTestComponents.getPure);
		repo.recetas.add(SharedTestComponents.getBifeConPure);
		val filtradoSobrePeso = new FiltroPorSobrePeso( repo.consultarRecetas(usuarioConSobrepeso), usuarioConSobrepeso)
		Assert.assertEquals(1,  filtradoSobrePeso.filtrar().size)
	}
	
}