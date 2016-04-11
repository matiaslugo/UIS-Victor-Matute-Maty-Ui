package ar.edu.unq.ciu.gatoEncerrado_ui

import ar.edu.unq.ciu.dominio_gatoEncerrado1.Laberinto
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Button
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import ar.edu.unq.ciu.dominio_gatoEncerrado1.CrearLaberintoAppModel
import ar.edu.unq.ciu.dominio_gatoEncerrado1.GatoEncerradoModel

class LaberintoWindow extends Dialog<CrearLaberintoAppModel> {
	
	new(WindowOwner owner, GatoEncerradoModel model) {
		super(owner, new CrearLaberintoAppModel(model))
	}
	
	override protected createFormPanel(Panel mainPanel) {
		 
		title = "Agregar Nuevo Laberinto"
		mainPanel.layout = new VerticalLayout 
		
		new Label(mainPanel).text = "Nombre:"
		new TextBox(mainPanel) => [
			value <=> "nombreLaberinto"
			width = 200
		]
		new Button(mainPanel)=>[
			caption = "Aceptar"
			onClick [ |
				this.modelObject.agregarLaberintoNuevo
				this.close
			]
		]
	}
	
}