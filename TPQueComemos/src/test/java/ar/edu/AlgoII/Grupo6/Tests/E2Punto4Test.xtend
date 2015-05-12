package ar.edu.AlgoII.Grupo6.Tests

import ar.edu.AlgoII.Grupo6.FiltroAptas
import ar.edu.AlgoII.Grupo6.FiltroPorSobrePeso
import ar.edu.AlgoII.Grupo6.Grupo
import ar.edu.AlgoII.Grupo6.RecetaAccesoPrivado
import ar.edu.AlgoII.Grupo6.RepositorioRecetas
import ar.edu.AlgoII.Grupo6.Usuario
import org.junit.Assert
import org.junit.Before
import org.junit.Test

class E2Punto4Test {

	RepositorioRecetas repo
	Usuario unUsuario
	Usuario usuarioConSobrepeso
	Usuario usuarioDiabetico
	Grupo unGrupo

	@Before
	def void init() {
		unUsuario = SharedTestComponents.getUsuarioSinPrecondicion
		unUsuario.nombre = "Micho"
		usuarioConSobrepeso = SharedTestComponents.getUsuarioConSobrepeso
		usuarioConSobrepeso.nombre = "Tito"
		usuarioDiabetico = SharedTestComponents.getUsuarioDiabetico
		usuarioDiabetico.nombre = "Negro"

		unGrupo = SharedTestComponents.getGrupoSinPreCondicion()
		repo = new RepositorioRecetas()
	}

	@Test
	def void ConsultaTodasLasRecetas() {
		repo.recetas.add(SharedTestComponents.getDulceDeLeche)
		repo.recetas.add(SharedTestComponents.getPure)
		repo.recetas.add(SharedTestComponents.getBifeConPure(new RecetaAccesoPrivado(unUsuario)))
		Assert.assertEquals(3, repo.consultarRecetas(unUsuario).size)
	}

	@Test
	def void ConsultaLasRecetas() {
		repo.recetas.add(SharedTestComponents.getDulceDeLeche)
		repo.recetas.add(SharedTestComponents.getPure)
		repo.recetas.add(SharedTestComponents.getBifeConPure(new RecetaAccesoPrivado(unUsuario)))
		Assert.assertEquals(2, repo.consultarRecetas(usuarioConSobrepeso).size)
	}

	@Test
	def void ConsultaLasRecetasPertenecienteAUnGrupo() {
		repo.recetas.add(SharedTestComponents.getDulceDeLeche)
		repo.recetas.add(SharedTestComponents.getPure)
		repo.recetas.add(SharedTestComponents.getBifeConPure(new RecetaAccesoPrivado(unUsuario)))
		unGrupo.agregarUsuario(unUsuario)
		unGrupo.agregarUsuario(usuarioConSobrepeso)
		Assert.assertEquals(3, repo.consultarRecetas(usuarioConSobrepeso).size)
	}

	@Test
	def void ConsultaRecetasConFiltroSobrepeso() {
		repo.recetas.add(SharedTestComponents.getDulceDeLeche)
		repo.recetas.add(SharedTestComponents.getPure);
		repo.recetas.add(SharedTestComponents.getBifeConPure)
		val filtradoSobrePeso = new FiltroPorSobrePeso(repo.consultarRecetas(usuarioConSobrepeso), usuarioConSobrepeso)
		Assert.assertEquals(1, filtradoSobrePeso.filtrar().size)
	}

	@Test
	def void ConsultaRecetasConFiltroAptas() {
		repo.recetas.add(SharedTestComponents.getDulceDeLeche)
		repo.recetas.add(SharedTestComponents.getPure);
		repo.recetas.add(SharedTestComponents.getBifeConPure)
		val filtradoSobrePeso = new FiltroAptas(repo.consultarRecetas(unUsuario), unUsuario)
		Assert.assertEquals(3, filtradoSobrePeso.filtrar().size)
	}

	@Test
	def void ConsultaRecetasConFiltroAptasParaDiabetico() {
		repo.recetas.add(SharedTestComponents.getDulceDeLeche)
		repo.recetas.add(SharedTestComponents.getPure);
		repo.recetas.add(SharedTestComponents.getBifeConPure)
		val filtradoAptas = new FiltroAptas(repo.consultarRecetas(usuarioDiabetico), usuarioDiabetico)
		Assert.assertEquals(2, filtradoAptas.filtrar().size)
	}

	@Test
	def void ConsultaRecetasConFiltroAptasParaDiabeticoYConSobrepeso() {
		usuarioDiabetico.peso = 150
		repo.recetas.add(SharedTestComponents.getDulceDeLeche)
		repo.recetas.add(SharedTestComponents.getPure);
		repo.recetas.add(SharedTestComponents.getBifeConPure)
		val filtradoSobrePeso = new FiltroPorSobrePeso(
			(new FiltroAptas(repo.consultarRecetas(usuarioDiabetico), usuarioDiabetico)).filtrar(), usuarioDiabetico)
		Assert.assertEquals(1, filtradoSobrePeso.filtrar().size)
	}

}
