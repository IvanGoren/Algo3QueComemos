package ar.edu.AlgoII.Grupo6.Tests

import ar.edu.AlgoII.Grupo6.Alimento
import ar.edu.AlgoII.Grupo6.Diabetico
import ar.edu.AlgoII.Grupo6.Grupo
import ar.edu.AlgoII.Grupo6.Ingrediente
import ar.edu.AlgoII.Grupo6.Receta
import ar.edu.AlgoII.Grupo6.RecetaAcceso
import ar.edu.AlgoII.Grupo6.RecetaAccesoPublico
import ar.edu.AlgoII.Grupo6.Usuario
import ar.edu.AlgoII.Grupo6.BuilderRecetas
import ar.edu.AlgoII.Grupo6.BuilderUsuario

class SharedTestComponents {
	static def Usuario getUsuarioSinPrecondicion() {
		//val unUsuario = new Usuario(83, 1.88)
		//return unUsuario;
		val usuarioBuilder = new BuilderUsuario
		usuarioBuilder.setAltura(83)
		usuarioBuilder.setPeso(1.88)
		usuarioBuilder.build() 
	}

	static def Usuario getUsuarioDiabetico() {
		//val unUsuario = new Usuario(83, 1.88)
		//unUsuario.condicionesPreexistentes.add(new Diabetico())
		//return unUsuario;
		val usuarioBuilder = new BuilderUsuario
		usuarioBuilder.setAltura(83)
		usuarioBuilder.setPeso(1.88)
		usuarioBuilder.newCondicionesPreexistentes(new Diabetico())
		usuarioBuilder.build() 
	}

	static def Usuario getUsuarioConSobrepeso() {
		//val unUsuario = new Usuario(120, 1.88)
		//return unUsuario;
		val usuarioBuilder = new BuilderUsuario
		usuarioBuilder.setAltura(120)
		usuarioBuilder.setPeso(1.88)
		usuarioBuilder.build()
	}
	static def Usuario getUsuarioSinPrecondicionHombre() {
		//val unUsuario = new Usuario(83, 1.88)
		//unUsuario.sexo = "M"
		//return unUsuario;
		val usuarioBuilder = new BuilderUsuario
		usuarioBuilder.setAltura(83)
		usuarioBuilder.setPeso(1.88)
		usuarioBuilder.setSexo("M")
		usuarioBuilder.build()
	}
	static def Usuario getUsuarioSinPrecondicionMujer() {
		//val unUsuario = new Usuario(83, 1.88)
		//unUsuario.sexo = "F"
		//return unUsuario;
		val usuarioBuilder = new BuilderUsuario
		usuarioBuilder.setAltura(83)
		usuarioBuilder.setPeso(1.88)
		usuarioBuilder.setSexo("F")
		usuarioBuilder.build()
	}
	
	static def Receta getDulceDeLeche() {
		return getDulceDeLeche(new RecetaAccesoPublico())
	}

	static def Receta getDulceDeLeche(RecetaAcceso acceso) {
		//val unaReceta = new Receta()
		val recetaBuilder = new BuilderRecetas()
		
		//unaReceta.acceso = acceso
		recetaBuilder.setAcceso(acceso)
		var Ingrediente azucar = new Ingrediente()
		azucar.nombre = "Azucar"
		azucar.tipoDeAlimento = Alimento.AZUCAR
		azucar.cantidadEnGr = 350

		var Ingrediente leche = new Ingrediente()
		leche.nombre = "Leche"
		leche.tipoDeAlimento = new Alimento("LECHE")
		leche.cantidadEnGr = 1000

		//unaReceta.ingredientes.add(azucar)
		recetaBuilder.agregarIngrediente(azucar)
		//unaReceta.ingredientes.add(leche)
		recetaBuilder.agregarIngrediente(leche)
		//unaReceta.calorias = 1500
		recetaBuilder.setCalorias(1500)
		//return unaReceta;
		recetaBuilder.build()
	}

	static def Receta getPure() {
		return getPure(new RecetaAccesoPublico())
	}

	static def Receta getPure(RecetaAcceso acceso) {
		//val unaReceta = new Receta()
		val recetaBuilder = new BuilderRecetas()
		//unaReceta.acceso = acceso
		recetaBuilder.setAcceso(acceso)
		val papa = new Ingrediente()
		papa.nombre = "Papa"
		papa.tipoDeAlimento = new Alimento("PAPA")
		papa.cantidadEnGr = 500

		val leche = new Ingrediente()
		leche.nombre = "Leche"
		leche.tipoDeAlimento = new Alimento("LECHE")
		leche.cantidadEnGr = 500

		//unaReceta.ingredientes.add(papa)
		recetaBuilder.agregarIngrediente(papa)
		//unaReceta.ingredientes.add(leche)
		recetaBuilder.agregarIngrediente(leche)
		//unaReceta.calorias = 100
		recetaBuilder.setCalorias(100)
		//return unaReceta;
		recetaBuilder.build()
	}

	static def Receta getBifeConPure() {
		return getBifeConPure(new RecetaAccesoPublico())

	}

	static def Receta getBifeConPure(RecetaAcceso acceso) {
		//val unaReceta = new Receta()
		val recetaBuilder = new BuilderRecetas()
		//unaReceta.acceso = acceso
		recetaBuilder.setAcceso(acceso)
		val bife = new Ingrediente()
		bife.nombre = "bife"
		bife.tipoDeAlimento = Alimento.getCARNE()
		bife.cantidadEnGr = 200

		//unaReceta.ingredientes.add(bife)
		recetaBuilder.agregarIngrediente(bife)
		//unaReceta.ingredientes.add(getPure())
		recetaBuilder.agregarIngrediente(getPure())
		//unaReceta.calorias = 1000
		recetaBuilder.setCalorias(1000)
		//return unaReceta;
		recetaBuilder.build()
	}

	static def Grupo getGrupoSinPreCondicion() {
		val unGrupo = new Grupo()

		unGrupo.nombre = "Te para tres"
		unGrupo.agregarUsuario(SharedTestComponents.getUsuarioSinPrecondicion())
		unGrupo.agregarUsuario(SharedTestComponents.getUsuarioSinPrecondicion())
		unGrupo.agregarUsuario(SharedTestComponents.getUsuarioSinPrecondicion())

		return unGrupo;
	}

}
