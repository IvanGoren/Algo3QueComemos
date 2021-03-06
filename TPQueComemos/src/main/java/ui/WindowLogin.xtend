package ui

import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.Button
import applicationModel.QueComemosLogin
import applicationModel.QueComemosBuscador

class WindowLogin extends TransactionalDialog<QueComemosBuscador> {

	new(WindowOwner owner, QueComemosBuscador model) {
		super(owner, model)
		title = "Iniciar aplicacion"
	}

	override protected createFormPanel(Panel mainPanel) {
		this.createContents(mainPanel)
	}

	override createContents(Panel mainPanel) {

		val panel1 = new Panel(mainPanel).setLayout(new HorizontalLayout)
		new Label(panel1).text = "Usuario"
		new TextBox(panel1).bindValueToProperty("usuario")

		val panel2 = new Panel(mainPanel).setLayout(new HorizontalLayout)

		new Label(panel2).text = "Clave"
		new TextBox(panel2).bindValueToProperty("clave")

		val panel3 = new Panel(mainPanel).setLayout(new HorizontalLayout)
		new Button(panel3) => [
			caption = "Aceptar"
			setAsDefault
			onClick[
			this.accept
			]
//			this.accept]
//			.setAsDefault
//			.disableOnError
			
			]
		new Button(panel3) => [
			caption = "Cancelar"
			onClick[
				System.exit(0)
			]
		
		]
	}
	override executeTask(){	
				modelObject.checkLogin
				modelObject.init
}
}
