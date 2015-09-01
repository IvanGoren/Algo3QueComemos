package ui

import ar.edu.AlgoII.Grupo6.Receta
import ar.edu.AlgoII.Grupo6.RepositorioRecetas
import java.awt.Color
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.CheckBox
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

class WindowListaRecetas extends SimpleWindow<RepositorioRecetas> {

	//	new() {
	//		super(new RepositorioRecetas())
	//	}
	new(WindowOwner parent) {
		super(parent, new RepositorioRecetas())

	//		modelObject.search()
	}

	override def createMainTemplate(Panel mainPanel) {
		title = "Bienvenido a ¿Que comemos hoy?"
		super.createMainTemplate(mainPanel)

		this.createGrillaRecetas(mainPanel)
		this.creatGrillaAcciones(mainPanel)
	}

	override protected createFormPanel(Panel mainPanel) {
		val searchFormPanel = new Panel(mainPanel)
		searchFormPanel.setLayout(new ColumnLayout(2))

		val leftPanel = new Panel(searchFormPanel)
		new Label(leftPanel) => [
			text = "Nombre"
			foreground = Color.BLUE
		]

		new TextBox(leftPanel).bindValueToProperty("recetas")

		new Label(leftPanel) => [
			text = "Dificultad"
			foreground = Color.BLUE
		]
		new Selector(leftPanel)

		new Label(leftPanel) => [
			text = "Que contiene ingrediente"
			foreground = Color.BLUE
		]
		new TextBox(leftPanel).bindValueToProperty("recetas")

		val rightPanel = new Panel(searchFormPanel)

		new Label(rightPanel) => [
			text = "Calorias de"
			foreground = Color.BLUE
		]

		new TextBox(rightPanel).bindValueToProperty("recetas")

		new Label(rightPanel) => [
			text = "a"
			foreground = Color.BLUE
		]

		new TextBox(rightPanel).bindValueToProperty("recetas")

		new Label(rightPanel) => [
			text = "Temporada"
			foreground = Color.BLUE
		]
		new Selector(rightPanel)

		new Label(leftPanel) => [
			text = "Aplicar filtros del perfil de usuario"
			foreground = Color.BLUE
		]

		var checkfavorita = new CheckBox(rightPanel)

	}

	override protected addActions(Panel actionsPanel) {
		new Label(actionsPanel).text = "aca va busqueda"
	}

	//Metodo para crear grilla de recetas//
	def createGrillaRecetas(Panel mainPanel) {
		val gridReceta = new Table(mainPanel, typeof(Receta)) => [
			width = 2000
			height = 200
			numberVisibleRows = new RepositorioRecetas().recetas.size + 1
			bindItemsToProperty("recetas")
//			bindValueToProperty("recetaSeleccionada")
		]

		new Column<Receta>(gridReceta) => [
			fixedSize = 150
			title = "Recetas"
			bindContentsToProperty("nombre")
		]

		new Column<Receta>(gridReceta) => [
			fixedSize = 80
			title = "Calorias"
			bindContentsToProperty("calorias")
		]

		new Column<Receta>(gridReceta) => [
			fixedSize = 80
			title = "Dificultad"
			bindContentsToProperty("dificultad")
		]

		new Column<Receta>(gridReceta) => [
			fixedSize = 250
			title = "Temporada"
			bindContentsToProperty("temporada")
		]

	}

	//Metodo para crear Grilla de Acciones//	
	def creatGrillaAcciones(Panel panelesHorizontales) {
		new Button(panelesHorizontales) => [
			onClick = [| 	]
			caption = "Ver"
		]

		new Button(panelesHorizontales) => [
			onClick = [| 	]
			caption = "Favorita"
		]
	}

}
