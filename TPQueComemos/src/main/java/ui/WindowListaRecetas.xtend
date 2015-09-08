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
import applicationModel.QueComemosDetalles
import org.uqbar.arena.layout.HorizontalLayout
import ar.edu.AlgoII.Grupo6.RecetaAcceso
import applicationModel.QueComemosLogin
import ar.edu.AlgoII.Grupo6.RepoUsuarios

class WindowListaRecetas extends SimpleWindow<QueComemosBuscador> {

	new(WindowOwner parent) {
		super(parent,  QueComemosBuscador.getInstance)

		this.openDialog(new WindowLogin(this, new QueComemosLogin()))
	//		this.openDialog(new WindowCopiarReceta(this, new QueComemosBuscador()))
	}

	override def createMainTemplate(Panel mainPanel) {
		title = "Que estas buscando?"

		val panel1 = new Panel(mainPanel).setLayout(new HorizontalLayout)
		new Label(panel1).text = "Logueado como:"
		new Label(panel1) => [
			bindValueToProperty("usuarioLogIn.nombre")
			foreground = Color.ORANGE
		]

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
		new Selector(leftPanel) => [
			bindValueToProperty("dificultad")
			bindItemsToProperty("dificultades")
		]

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
		new Selector(rightPanel) => [
			bindValueToProperty("temporada")
			bindItemsToProperty("temporadas")
		]

		new Label(leftPanel) => [
			text = "Aplicar filtros del perfil de usuario"
			foreground = Color.BLUE
		]

		var checkfavorita = new CheckBox(rightPanel) => [
			bindValueToProperty("aceptarFiltro")
		]

	}

	override protected addActions(Panel actionsPanel) {
		new Button(actionsPanel) => [
			caption = "Buscar"
			onClick = [|modelObject.search]
			setAsDefault
			disableOnError
		]
		
		new Button(actionsPanel) => [
			caption = "Limpiar"
			onClick = [|modelObject.clear]
		]
		
	}

	//Metodo para crear grilla de recetas//
	def createGrillaRecetas(Panel mainPanel) {
		val gridReceta = new Table(mainPanel, typeof(Receta)) => [
			width = 2000
			height = 200
			numberVisibleRows = 9
			bindItemsToProperty("resultado")
			bindValueToProperty("recetaSeleccionada")
		]

		new Column<Receta>(gridReceta) => [
			fixedSize = 150
			title = "Recetas"
			bindContentsToProperty("nombre")
			bindBackground("acceso").transformer = [ Object recibe |
				if ((recibe as RecetaAcceso).usuarioCarga.equals(modelObject.usuarioLogIn)) {
					Color.GREEN
				} else if (modelObject.usuarioLogIn.grupos.exists[u|
					u.participantes.exists [ p |
						p.nombre.toLowerCase.contains(
							(recibe as RecetaAcceso).usuarioCarga.nombre.toLowerCase
						)
					]]) {
					Color.BLUE
				} else {
					Color.LIGHT_GRAY
				}
			]
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

		val panelAcciones = new Panel(panelesHorizontales).setLayout(new HorizontalLayout).setWidth(480)

		val elementSelected = new NotNullObservable("recetaSeleccionada")
		new Button(panelAcciones) => [
			caption = "Ver"
			width = 250
			onClick = [|
				this.openDialog(
					new WindowReceta(
						this,
						new QueComemosDetalles() => [
							usuarioLogIn = modelObject.usuarioLogIn
							recetaSeleccionada = modelObject.recetaSeleccionada
							iniFavorita
						]
					))
			]
			bindEnabled(elementSelected)
		]
		
		new Button(panelAcciones) => [
			caption = "Favorita"
			width = 250
			onClick[|modelObject.agregarFavorita()]
			bindEnabled(elementSelected)
		]

		new Button(panelAcciones) => [
			caption = "Copiar"
			width = 220
			onClick[
				this.openDialog(
					new WindowCopiarReceta(
						this,
						new QueComemosDetalles() => [
							recetaSeleccionada = modelObject.recetaSeleccionada
							usuarioLogIn = modelObject.usuarioLogIn
						]
					))
			]
			bindEnabled(elementSelected)
		]
		
		val panelAcciones2 = new Panel(panelesHorizontales).setLayout(new HorizontalLayout)

		new Button(panelAcciones2) => [
			caption = "Salir"
			background = Color.BLUE
			width = 725
			onClick[
				this.close
			]
		]

	}

	def openDialog(Dialog<?> dialog) {
		dialog.onAccept[|modelObject.search]
		dialog.open
	}

}
