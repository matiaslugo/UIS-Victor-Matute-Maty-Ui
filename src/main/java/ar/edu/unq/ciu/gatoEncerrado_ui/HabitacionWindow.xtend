package ar.edu.unq.ciu.gatoEncerrado_ui

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.windows.Dialog
import ar.edu.unq.ciu.dominio_gatoEncerrado1.GatoEncerradoModel
import org.uqbar.arena.widgets.Panel
import ar.edu.unq.ciu.dominio_gatoEncerrado1.CrearLaberintoAppModel
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.*
import ar.edu.unq.ciu.dominio_gatoEncerrado1.Laberinto
import ar.edu.unq.ciu.dominio_gatoEncerrado1.Habitacion

class HabitacionWindow extends Dialog<Habitacion> {

	Laberinto laberinto

	new(WindowOwner owner, Laberinto lab) {
		super(owner, new Habitacion())
		this.laberinto = lab
	}

	override protected createFormPanel(Panel mainPanel) {
		title = "Agregar Nueva habitacion"
		mainPanel.layout = new VerticalLayout

		new Label(mainPanel).text = "Nombre:"
		new TextBox(mainPanel) => [
			value <=> "nombreHabitacion"
			width = 200
		]
		
		new Button(mainPanel) => [
			caption = "Aceptar"
			onClick [|
				this.laberinto.agregarHabitacion(this.modelObject)
				this.close
			]
		]
	}

}
