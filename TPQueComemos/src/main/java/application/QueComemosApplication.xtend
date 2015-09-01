package application

import org.uqbar.arena.Application
import ui.WindowListaRecetas

class QueComemosApplication extends Application {

	static def void main(String[] args) {
		new QueComemosApplication().start()
	}

	override protected createMainWindow() {
		return new WindowListaRecetas(this)
	}

}
