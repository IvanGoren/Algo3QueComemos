package ui

import ar.edu.AlgoII.Grupo6.CondicionPreexistente
import ar.edu.AlgoII.Grupo6.Ingrediente
import ar.edu.AlgoII.Grupo6.Receta
import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.CheckBox
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.WindowOwner
import applicationModel.QueComemosDetalles
import java.util.ArrayList
import java.util.List
import java.awt.Color
import org.uqbar.arena.widgets.Button

class WindowReceta extends TransactionalDialog<QueComemosDetalles> {

	new(WindowOwner owner, QueComemosDetalles model) {
		super(owner, model)
		title = "Detalles de la receta"
	}
	
	
	override protected createFormPanel(Panel mainPanel) {
		 
		this.createContents(mainPanel)
	}
	
	
	override createContents(Panel mainPanel) {
		
		val headPanel = new Panel(mainPanel)
		new Label(headPanel).bindValueToProperty("recetaSeleccionada.nombre")
		
		val subHeadPanel = new Panel(headPanel)
		subHeadPanel.layout= new HorizontalLayout
		new Label(subHeadPanel).text = "calorias:"
		new Label(subHeadPanel).bindValueToProperty("recetaSeleccionada.calorias")
		
		
		val subHeadPanel2 = new Panel(headPanel)
		subHeadPanel2.layout= new HorizontalLayout
		new Label(subHeadPanel2).text = "creado por:"
		new Label(subHeadPanel2).bindValueToProperty("recetaSeleccionada.acceso.usuarioCarga.nombre")
		
		
		
		val bodyPanel = new Panel(mainPanel)
		bodyPanel.layout = new ColumnLayout(2)
		
		new Label(bodyPanel).text = "Dificultad:"
		new Label(bodyPanel).bindValueToProperty("recetaSeleccionada.dificultad")
		new Label(bodyPanel).text = "Temporada:"
		new Label(bodyPanel).bindValueToProperty("recetaSeleccionada.temporada")
		
		
		
		val bodytablesPanel1 = new Panel(bodyPanel)
		new Label(bodytablesPanel1 ).text = "Ingredientes"
		
		var tablaIngredientes = new Table(bodytablesPanel1, typeof(Ingrediente))
		tablaIngredientes.height = 200
		tablaIngredientes.width = 500
		tablaIngredientes.numberVisibleRows = 5
		
		tablaIngredientes.bindItemsToProperty("recetaSeleccionada.ingredientes")
		new Column<Ingrediente>(tablaIngredientes).setTitle("Ingrediente").setFixedSize(150).
			bindContentsToProperty("nombre")
		new Column<Ingrediente>(tablaIngredientes).setTitle("Cantidad en gramos").setFixedSize(150).
			bindContentsToProperty("cantidadEnGr")
		
		
		val rightBodyPanel = new Panel(bodyPanel)
		new Label(rightBodyPanel ).text = "Condimentos"
		var tablaCondimentos = new Table(rightBodyPanel, typeof(Ingrediente))
		tablaCondimentos.height = 200
		tablaCondimentos.width = 500
		tablaCondimentos.numberVisibleRows = 5
		
		tablaCondimentos.bindItemsToProperty("recetaSeleccionada.condimentos")
		new Column<Ingrediente>(tablaCondimentos).setTitle("Condimento").setFixedSize(150).
			bindContentsToProperty("nombre")
		new Column<Ingrediente>(tablaCondimentos).setTitle("Cantidad en gramos").setFixedSize(150).
			bindContentsToProperty("cantidadEnGr")

		new Label(mainPanel ).text = "Condiciones permitidas"
		var tablaCondiciones = new Table(mainPanel, typeof(CondicionPreexistente))
		tablaCondiciones.height = 200
		tablaCondiciones.width = 300
		tablaCondiciones.numberVisibleRows = 5
		tablaCondiciones.bindItemsToProperty("recetaSeleccionada.condicionesQueCumple")
		new Column<CondicionPreexistente>(tablaCondiciones).setTitle("Condiciones Aptas").setFixedSize(150).
			bindContentsToProperty("condicion")	
		
		
		
		val panelCheck1 = new Panel(mainPanel).setLayout(new HorizontalLayout)
		new Label(panelCheck1).text = "Favorita"
		new CheckBox(panelCheck1)=>[
			bindValueToProperty("favorita")
			]
		
		val footPanel = new Panel(mainPanel)
		new Label(footPanel).text = "Pasos de la preparacion:"
		new Label(footPanel)=>[
			bindValueToProperty("recetaSeleccionada.pasosToString")
			background = Color.WHITE
			height = 150
			width = 1000
		]
		
		new Button(mainPanel)=>[
			caption = "Volver"
			onClick[
				this.cancel
			]
			]
		
	}
	
	
}