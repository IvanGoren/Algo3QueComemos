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
import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.bindings.NotNullObservable
import org.uqbar.arena.widgets.TextBox
import applicationModel.QueComemosBuscador
import org.uqbar.arena.widgets.Button
import applicationModel.QueComemosDetalles

class WindowCopiarReceta extends TransactionalDialog<QueComemosDetalles> {
//	new() {
//		super(new Receta)
//	}

	new(WindowOwner owner, QueComemosDetalles model) {
		super(owner, model)
		title = "Copiando Receta"
	}
	
	
	override protected createFormPanel(Panel mainPanel) {
		this.createContents(mainPanel)
	}
	
	
	override createContents(Panel mainPanel) {
		val panel1 = new Panel(mainPanel).setLayout(new HorizontalLayout)
		new Label(panel1).text = "Receta:"
		new Label(panel1).bindValueToProperty( "recetaSeleccionada.nombre")
		
		val panel2 = new Panel(mainPanel).setLayout(new HorizontalLayout)
		new Label(panel2).text = "Nombre de copia"
		new TextBox(panel2).bindValueToProperty("nuevoNombre")
		
		new Button(mainPanel)=>[
			caption = "Copiar"
			setAsDefault
			onClick[
				modelObject.copiarReceta
				this.accept
			]
			]		
	}
		
}
