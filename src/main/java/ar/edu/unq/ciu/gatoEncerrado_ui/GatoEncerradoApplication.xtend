package ar.edu.unq.ciu.gatoEncerrado_ui

import org.uqbar.arena.Application
import ar.edu.unq.ciu.dominio_gatoEncerrado1.SistemaGestionLaberinto

class GatoEncerradoApplication extends Application{
	
	override createMainWindow() {
		new CrearGatoEncerradoWindow(this, new SistemaGestionLaberinto)
	}
	
	def static main(String[] args) {
		new GatoEncerradoApplication().start
	}
}