package ui

import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.MainWindow
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.widgets.tables.Column
import ar.edu.AlgoII.Grupo6.Receta

import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.HorizontalLayout
import ar.edu.AlgoII.Grupo6.RepositorioRecetas

class WindowListaRecetas extends MainWindow<RepositorioRecetas> {
	
	new() {
		super(new RepositorioRecetas())
	}
	
	override createContents(Panel mainPanel) {
		title = "Bienvenido a ¿Que comemos hoy?"
		new Label(mainPanel).text="Estas fueron las últimas consultas"
		
		createGrillaRecetas(mainPanel)
		
		var panelesHorizontales = new Panel(mainPanel)  // mainPanel es el panel padre que contiene al nuevo panel
	    panelesHorizontales.setLayout(new HorizontalLayout)
    
    
		new Button(panelesHorizontales)=>[
		onClick = [	| 	]
			caption = "Ver"
		]
		
		new Button(panelesHorizontales)=>[
		onClick = [	| 	]
			caption = "Favorita"
		]
		
	}
	
	
	def createGrillaRecetas(Panel mainPanel) {
		val gridReceta = new Table(mainPanel,typeof (Receta))=>[
			width = 2000
			height = 200
			numberVisibleRows = new RepositorioRecetas().getListaRecetasPrueba().size + 1
			bindItemsToProperty("listaRecetasPrueba")
		]
		
		new Column<Receta>(gridReceta)=>[
			fixedSize = 150
			title = "Recetas"
			bindContentsToProperty("nombre")
		]
		
		new Column<Receta>(gridReceta)=>[
			fixedSize = 80
			title = "Calorias"
			bindContentsToProperty("calorias")
		]
		
		new Column<Receta>(gridReceta)=>[
			fixedSize = 80
			title = "Dificultad"
			bindContentsToProperty("dificultad")
		]
		
		new Column<Receta>(gridReceta)=>[
			fixedSize = 250
			title = "Temporada"
			bindContentsToProperty("temporada")
		]
		
	}
	
			
	def static main(String[] args){
		new WindowListaRecetas().startApplication
	}
	
}