package ar.edu.AlgoII.Grupo6.Tests

import ar.edu.AlgoII.Grupo6.FiltroAptas
import ar.edu.AlgoII.Grupo6.FiltroPorSobrePeso
import ar.edu.AlgoII.Grupo6.FiltroStrategyAptas
import ar.edu.AlgoII.Grupo6.Grupo
import ar.edu.AlgoII.Grupo6.IFiltroStrategy
import ar.edu.AlgoII.Grupo6.RecetaAccesoPrivado
import ar.edu.AlgoII.Grupo6.RepositorioRecetas
import ar.edu.AlgoII.Grupo6.Usuario
import java.util.ArrayList
import java.util.List
import org.junit.Assert
import org.junit.Before
import org.junit.Test
import ar.edu.AlgoII.Grupo6.FiltroStrategyPorSobrePeso
import ar.edu.AlgoII.Grupo6.Buscador

class E2Punto5Test {

	RepositorioRecetas repo
	Usuario unUsuario
	Usuario usuarioConSobrepeso
	Usuario usuarioDiabetico
	Grupo unGrupo

List<IFiltroStrategy> filtros

	@Before
	def void init() {
		unUsuario = SharedTestComponents.getUsuarioSinPrecondicion
		unUsuario.nombre = "Micho"
		usuarioConSobrepeso = SharedTestComponents.getUsuarioConSobrepeso
		usuarioConSobrepeso.nombre = "Tito"
		usuarioDiabetico = SharedTestComponents.getUsuarioDiabetico
		usuarioDiabetico.nombre = "Negro"
		
		filtros = new ArrayList<IFiltroStrategy>() 

		unGrupo = SharedTestComponents.getGrupoSinPreCondicion()
		repo = new RepositorioRecetas()
		repo.buscador = new Buscador
	}

	@Test
	def void ConsultaTodasLasRecetas() {
		repo.recetas.add(SharedTestComponents.getDulceDeLeche)
		repo.recetas.add(SharedTestComponents.getPure)
		repo.recetas.add(SharedTestComponents.getBifeConPure(new RecetaAccesoPrivado(unUsuario)))
		Assert.assertEquals(3, repo.consultarRecetasConFiltros(unUsuario, filtros).size)
	}

	@Test
	def void ConsultaLasRecetas() {
		repo.recetas.add(SharedTestComponents.getDulceDeLeche)
		repo.recetas.add(SharedTestComponents.getPure)
		repo.recetas.add(SharedTestComponents.getBifeConPure(new RecetaAccesoPrivado(unUsuario)))
		Assert.assertEquals(2, repo.consultarRecetasConFiltros(usuarioConSobrepeso, filtros).size)
	}

	@Test
	def void ConsultaLasRecetasPertenecienteAUnGrupo() {
		repo.recetas.add(SharedTestComponents.getDulceDeLeche)
		repo.recetas.add(SharedTestComponents.getPure)
		repo.recetas.add(SharedTestComponents.getBifeConPure(new RecetaAccesoPrivado(unUsuario)))
		unGrupo.agregarUsuario(unUsuario)
		unGrupo.agregarUsuario(usuarioConSobrepeso)
		Assert.assertEquals(3, repo.consultarRecetasConFiltros(usuarioConSobrepeso, filtros).size)
	}

	@Test
	def void ConsultaRecetasConFiltroSobrepeso() {
		repo.recetas.add(SharedTestComponents.getDulceDeLeche)
		repo.recetas.add(SharedTestComponents.getPure);
		repo.recetas.add(SharedTestComponents.getBifeConPure)
//		filtros.add(new FiltroStrategyPorSobrePeso())
		repo.buscador.filtros.add(new FiltroStrategyPorSobrePeso())
		Assert.assertEquals(1, repo.consultarRecetasConFiltros(usuarioConSobrepeso, filtros).size)
		
	}

	@Test
	def void ConsultaRecetasConFiltroAptas() {
		repo.recetas.add(SharedTestComponents.getDulceDeLeche)
		repo.recetas.add(SharedTestComponents.getPure);
		repo.recetas.add(SharedTestComponents.getBifeConPure)
//		filtros.add(new FiltroStrategyAptas())
		repo.buscador.filtros.add(new FiltroStrategyAptas())
		Assert.assertEquals(3, repo.consultarRecetasConFiltros(unUsuario, filtros).size)
	}

	@Test
	def void ConsultaRecetasConFiltroAptasParaDiabetico() {
		repo.recetas.add(SharedTestComponents.getDulceDeLeche)
		repo.recetas.add(SharedTestComponents.getPure);
		repo.recetas.add(SharedTestComponents.getBifeConPure)
//		filtros.add(new FiltroStrategyAptas())
		repo.buscador.filtros.add(new FiltroStrategyAptas())
		Assert.assertEquals(2, repo.consultarRecetasConFiltros(usuarioDiabetico, filtros).size)
	}

	@Test
	def void ConsultaRecetasConFiltroAptasParaDiabeticoYConSobrepeso() {
		usuarioDiabetico.peso = 150
		repo.recetas.add(SharedTestComponents.getDulceDeLeche)
		repo.recetas.add(SharedTestComponents.getPure);
		repo.recetas.add(SharedTestComponents.getBifeConPure)
//		filtros.add(new FiltroStrategyAptas())
//		filtros.add(new FiltroStrategyPorSobrePeso())
		repo.buscador.filtros.add(new FiltroStrategyAptas())
		repo.buscador.filtros.add(new FiltroStrategyPorSobrePeso)
		Assert.assertEquals(1, repo.consultarRecetasConFiltros(usuarioDiabetico, filtros).size)
	}
	
	@Test
	def void ConsultaRecetasConFiltroAptasParaDiabeticoYConSobrepesoDiferenteOrden() {
		usuarioDiabetico.peso = 150
		repo.recetas.add(SharedTestComponents.getDulceDeLeche)
		repo.recetas.add(SharedTestComponents.getPure);
		repo.recetas.add(SharedTestComponents.getBifeConPure)
//		filtros.add(new FiltroStrategyPorSobrePeso())
//		filtros.add(new FiltroStrategyAptas())
		repo.buscador.filtros.add(new FiltroStrategyAptas())
		repo.buscador.filtros.add(new FiltroStrategyPorSobrePeso())
		Assert.assertEquals(1, repo.consultarRecetasConFiltros(usuarioDiabetico, filtros).size)
	}
	

}
