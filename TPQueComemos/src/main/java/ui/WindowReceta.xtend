package ui

import ar.edu.AlgoII.Grupo6.CondicionPreexistente
import ar.edu.AlgoII.Grupo6.Ingrediente
import ar.edu.AlgoII.Grupo6.Receta
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.CheckBox
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.MainWindow

class WindowReceta extends MainWindow<Receta> {
	new() {
		super(new Receta)
	}
	
	override createContents(Panel mainPanel) {
		this.title = "Receta"
		
		val headPanel = new Panel(mainPanel)
		new Label(headPanel).bindValueToProperty("nombre")
		
		val subHeadPanel = new Panel(headPanel)
		subHeadPanel.layout= new HorizontalLayout
		new Label(subHeadPanel).bindValueToProperty("calorias")
		new Label(subHeadPanel).text = "calorias"
		
		val bodyPanel = new Panel(mainPanel)
		bodyPanel.layout = new ColumnLayout(2)
		
		val leftBodyPanel = new Panel(bodyPanel)
		var tablaIngredientes = new Table(leftBodyPanel, typeof(Ingrediente))
		tablaIngredientes.height = 200
		tablaIngredientes.width = 500
		tablaIngredientes.bindItemsToProperty("ingredientes")
		new Column<Ingrediente>(tablaIngredientes).setTitle("Ingrediente").setFixedSize(150).
			bindContentsToProperty("nombre")
		new Column<Ingrediente>(tablaIngredientes).setTitle("Cantidad en gramos").setFixedSize(150).
			bindContentsToProperty("cantidadEnGr")
		
		
		val rightBodyPanel = new Panel(bodyPanel)
		var tablaCondimentos = new Table(rightBodyPanel, typeof(Ingrediente))
		tablaCondimentos.height = 200
		tablaCondimentos.width = 300
		tablaCondimentos.bindItemsToProperty("condimentos")
		new Column<Ingrediente>(tablaCondimentos).setTitle("Condimento").setFixedSize(150).
			bindContentsToProperty("nombre")
		new Column<Ingrediente>(tablaCondimentos).setTitle("Cantidad en gramos").setFixedSize(150).
			bindContentsToProperty("cantidadEnGr")

		var tablaCondiciones = new Table(rightBodyPanel, typeof(CondicionPreexistente))
		tablaCondiciones.height = 200
		tablaCondiciones.width = 300
		tablaCondiciones.bindItemsToProperty("condicionesQueCumple")
		new Column<CondicionPreexistente>(tablaCondiciones).setTitle("Condiciones Aptas").setFixedSize(150).
			bindContentsToProperty("condicion")	
		
		
		val footPanel = new Panel(mainPanel)
		footPanel.layout = new HorizontalLayout
		var checkfavorita = new CheckBox(footPanel)
		new Label(footPanel).text = "Marcar Favorita"
	}
	

	def static main(String[] args) {
		new WindowReceta().startApplication
	}

	
}