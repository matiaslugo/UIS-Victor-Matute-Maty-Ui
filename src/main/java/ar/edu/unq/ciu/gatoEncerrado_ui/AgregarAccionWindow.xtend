package ar.edu.unq.ciu.gatoEncerrado_ui

import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import ar.edu.unq.ciu.dominio_gatoEncerrado1.Habitacion
import ar.edu.unq.ciu.dominio_gatoEncerrado1.Accion
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.windows.Dialog
import ar.edu.unq.ciu.dominio_gatoEncerrado1.Laberinto

class AgregarAccionWindow extends Dialog<Accion>{
	
	Habitacion habitacion
	Laberinto laberinto
	
	new(WindowOwner owner, Habitacion hab, Laberinto lab) {
		super(owner, new Accion())
		this.habitacion = hab
		this.laberinto = lab
	}
	
	override protected createFormPanel(Panel mainPanel) {
		this.title = "Agregar accion"
		val Panel principalPanel = new Panel(mainPanel)
		principalPanel.layout = new ColumnLayout(3)
		
		new Button(principalPanel) => [
			caption = "Agregar accion de ir a otra habitacion"
			onClick [ | 
				new MoverseAHabitacion(this, this.habitacion, this.laberinto).open
				this.close
			]
		]
		
		new Button(principalPanel) => [
			caption = "Agregar accion de agarrar un elemento"
			onClick [ | 
				new AgregarUnElementoWindow(this, this.habitacion).open
				this.close
			]
		]
		
		new Button(principalPanel) => [
			caption = "Agregar accion de usar un elemento"
			onClick [ | 
				this.close
			]
		]
	}
	
	
}