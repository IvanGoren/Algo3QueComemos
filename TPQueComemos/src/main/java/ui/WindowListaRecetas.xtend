package ui

import applicationModel.QueComemosBuscador
import ar.edu.AlgoII.Grupo6.Receta
import java.awt.Color
import org.uqbar.arena.bindings.NotNullObservable
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.CheckBox
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

class WindowListaRecetas extends SimpleWindow<QueComemosBuscador> {

	new(WindowOwner parent) {
		super(parent, new QueComemosBuscador())
		
//		this.openDialog(new WindowLogin(this, new QueComemosBuscador()))
//		this.openDialog(new WindowCopiarReceta(this, new QueComemosBuscador()))
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

		new TextBox(leftPanel).bindValueToProperty("nombre")

		new Label(leftPanel) => [
			text = "Dificultad"
			foreground = Color.BLUE
		]
		new Selector(leftPanel).bindValueToProperty("dificultad")

		new Label(leftPanel) => [
			text = "Que contiene ingrediente"
			foreground = Color.BLUE
		]
		new TextBox(leftPanel).bindValueToProperty("ingrediente")

		val rightPanel = new Panel(searchFormPanel)

		new Label(rightPanel) => [
			text = "Calorias de"
			foreground = Color.BLUE
		]

		new TextBox(rightPanel).bindValueToProperty("calMin")

		new Label(rightPanel) => [
			text = "a"
			foreground = Color.BLUE
		]

		new TextBox(rightPanel).bindValueToProperty("calMax")

		new Label(rightPanel) => [
			text = "Temporada"
			foreground = Color.BLUE
		]
		new Selector(rightPanel).bindValueToProperty("temporada")

		new Label(leftPanel) => [
			text = "Aplicar filtros del perfil de usuario"
			foreground = Color.BLUE
		]

		var checkfavorita = new CheckBox(rightPanel).bindValueToProperty("aceptarFiltro")

	}

	override protected addActions(Panel actionsPanel) {
		new Button(actionsPanel) => [
			caption = "Buscar"
			onClick = [|modelObject.search]
			setAsDefault
			disableOnError
		]
	}

	//Metodo para crear grilla de recetas//
	def createGrillaRecetas(Panel mainPanel) {
		val gridReceta = new Table(mainPanel, typeof(Receta)) => [
			width = 2000
			height = 200
			numberVisibleRows = 5
			bindItemsToProperty("resultado")
			bindValueToProperty("recetaSeleccionada")
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
		val elementSelected = new NotNullObservable("recetaSeleccionada")
		new Button(panelesHorizontales) => [
			caption = "Ver"
			onClick = [|
				this.openDialog(new WindowReceta(this, modelObject.recetaSeleccionada))
			]
			bindEnabled(elementSelected)
		]

		new Button(panelesHorizontales) => [
			caption = "Favorita"
			onClick[|modelObject.agregarFavorita()]
			bindEnabled(elementSelected)
		]

	}

	def openDialog(Dialog<?> dialog) {

		//		dialog.onAccept[|modelObject.search]
		dialog.open
	}

}
