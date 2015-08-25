

import org.uqbar.arena.widgets.Panel
import ar.edu.AlgoII.Grupo6.Receta
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.windows.MainWindow

class Tp1Ventana extends MainWindow<Receta> {
	
	new() {
		super(new Receta())
	}
	
	override createContents(Panel mainPanel) {
			
		new Label(mainPanel).text = "Zona de votacion"
	new Selector(mainPanel)=>[
//		bindItemsToProperty("zonas").adapter = 
//		new PropertyAdapter(typeof(Zona), "descripcionLoca")
//		bindValueToProperty("zonaVotacion")
	]
	
	new Label(mainPanel).text = "Candidato a elegir"
	new Selector(mainPanel)=>[
//		bindItems(
//			new ObservableProperty(this.modelObject,"zonaVotacion.candidatos")
//			)
//		bindValueToProperty("candidatoElegido")
	]
	
	new Button(mainPanel)=>[
//		onClick = [	| modelObject.sumarVoto	]
			caption = "Sumar voto"
	]
	
	}
	
	
	
	def static main(String[] args){
		new Tp1Ventana().startApplication
	}
	
}