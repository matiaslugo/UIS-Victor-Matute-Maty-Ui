package ar.edu.unq.ciu.gatoEncerrado_ui

import org.uqbar.arena.Application
import ar.edu.unq.ciu.dominio_gatoEncerrado1.GatoEncerradoModel

class GatoEncerradoApplication extends Application{
	
	override createMainWindow() {
		new CrearGatoEncerradoWindow(this, new GatoEncerradoModel)
	}
	
	def static main(String[] args) {
		new GatoEncerradoApplication().start
	}
}