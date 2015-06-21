package ar.edu.AlgoII.Grupo6.Tests.Entrega4

import ar.edu.AlgoII.Grupo6.AccionLoguear
import ar.edu.AlgoII.Grupo6.CondicionCantidadRecetas
import ar.edu.AlgoII.Grupo6.Regla
import ar.edu.AlgoII.Grupo6.RepositorioRecetasExternas
import ar.edu.AlgoII.Grupo6.Tests.SharedTestComponents
import ar.edu.AlgoII.Grupo6.Usuario
import org.junit.Before
import org.junit.Test
import queComemos.entrega3.repositorio.BusquedaRecetas

class E4Punto4Test {

	RepositorioRecetasExternas repo
	BusquedaRecetas busqueda
	
	Regla regSiMasDe100RecetasLogear
	CondicionCantidadRecetas condCantRec
	AccionLoguear accLogear
		
	String mensaje	
	Usuario hombre
	 
	@Before
	def void init() {
		repo = new RepositorioRecetasExternas()
		busqueda = new BusquedaRecetas()
		
		mensaje = "El usuario {0} ha consultado {1} registros" 
		condCantRec = new CondicionCantidadRecetas(100)
		accLogear = new AccionLoguear(mensaje)
		regSiMasDe100RecetasLogear = new Regla(condCantRec, accLogear)
		repo.reglas.add(regSiMasDe100RecetasLogear)
		
		
		hombre = SharedTestComponents.getUsuarioSinPrecondicionHombre
	}

	@Test
	def void ConsultaRecetasMasDe100() {
		busqueda.nombre = "ricota"
		repo.consultarRecetas(hombre, busqueda)
		//Ver como escribio el log 
		//Assert.assertEquals(1, busquedasXHora.registro.get(10))
	}

	@Test
	def void ConsultaRecetasMenosDe100() {
		busqueda.nombre = "ricota"
		repo.consultarRecetas(hombre, busqueda)
		//Ver como escribio el log 
		//Assert.assertEquals(1, busquedasXHora.registro.get(10))
	}



}
