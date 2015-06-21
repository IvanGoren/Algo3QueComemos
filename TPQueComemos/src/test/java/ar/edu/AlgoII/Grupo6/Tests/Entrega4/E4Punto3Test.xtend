package ar.edu.AlgoII.Grupo6.Tests.Entrega4

import ar.edu.AlgoII.Grupo6.AccionMandarMail
import ar.edu.AlgoII.Grupo6.CondiccionEsElUsuario
import ar.edu.AlgoII.Grupo6.Mensaje
import ar.edu.AlgoII.Grupo6.Regla
import ar.edu.AlgoII.Grupo6.RepositorioRecetasExternas
import ar.edu.AlgoII.Grupo6.Tests.SharedTestComponents
import ar.edu.AlgoII.Grupo6.Usuario
import org.junit.Before
import org.junit.Test
import queComemos.entrega3.repositorio.BusquedaRecetas

class E4Punto3Test {
	RepositorioRecetasExternas repo
	BusquedaRecetas busqueda
	Regla regSiEsUsuarioMandaMail
	CondiccionEsElUsuario condEsElUsuario
	AccionMandarMail accMandaMail
	Mensaje mailMens
	
	Usuario hombre

	@Before
	def void init() {
		repo = new RepositorioRecetasExternas()
		busqueda = new BusquedaRecetas()

		hombre = SharedTestComponents.getUsuarioSinPrecondicionHombre

		condEsElUsuario = new CondiccionEsElUsuario(hombre)
		
		mailMens = new Mensaje()
		mailMens.de = "Sistema"
		mailMens.para = "Admin"
		mailMens.asunto = "Consulta realizada por un usuario auditado"
		mailMens.texto = "El usaurio {0} ha realizado una consulta con los siguientes datos: {1}"
		accMandaMail = new AccionMandarMail(mailMens)
		regSiEsUsuarioMandaMail = new Regla(condEsElUsuario, accMandaMail)
		repo.reglas.add(regSiEsUsuarioMandaMail)
		
	}

	@Test
	def void ConsultaRecetasPorUsuarioAuditado() {
		hombre.guardarSiempreFavoritas = true
		busqueda.nombre = "ricota"
		repo.consultarRecetas(hombre, busqueda)

		//Assert.assertEquals(recetas.size , hombre.recetasFavoritas.size )
	}

	@Test
	def void ConsultaRecetasPorUsuarioNoAuditado() {
		hombre.guardarSiempreFavoritas = false
		busqueda.nombre = "ricota"
		repo.consultarRecetas(hombre, busqueda)
		//Assert.assertEquals(0 , hombre.recetasFavoritas.size )
	}
	
}