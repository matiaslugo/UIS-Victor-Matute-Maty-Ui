package ar.edu.unq.ciu.gatoEncerrado_ui

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import ar.edu.unq.ciu.dominio_gatoEncerrado1.Habitacion
import ar.edu.unq.ciu.dominio_gatoEncerrado1.Laberinto
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Selector
import ar.edu.unq.ciu.dominio_gatoEncerrado1.AccionDeMoverseModel
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.bindings.PropertyAdapter

class MoverseAHabitacion extends Dialog<AccionDeMoverseModel> {
	
	new(WindowOwner owner, Habitacion hab, Laberinto lab) {
		super(owner, new AccionDeMoverseModel(hab, lab))
	}
	
	override protected createFormPanel(Panel mainPanel) {
		this.title = "Agregar accion de ir a otra habitacion"
		
		new Label(mainPanel).text = "Selecciona una habitacion a la cual ir"
		new Selector(mainPanel) => [
			allowNull(false)
			(items <=> "laberinto.listaHabitaciones").adapter = new PropertyAdapter(Habitacion, "nombreHabitacion")
			value <=> "habitacionAMoverse"
		]
		
		new Button(mainPanel) => [
			caption = "Agregar"
			onClick [|
				this.modelObject.agregarAccionDeMoverse
				this.close
			]
		]
	}
	
}