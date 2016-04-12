package ar.edu.unq.ciu.gatoEncerrado_ui

import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Button
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import ar.edu.unq.ciu.dominio_gatoEncerrado1.Laberinto
import ar.edu.unq.ciu.dominio_gatoEncerrado1.CrearLaberintoAppModel

class LaberintoWindow extends Dialog<Laberinto> {
	
	CrearLaberintoAppModel appModel
	
	new(WindowOwner owner, CrearLaberintoAppModel model) {
		super(owner, new Laberinto())
		this.appModel = model
	}
	
	override protected createFormPanel(Panel mainPanel){
		 
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
				this.appModel.agregarLaberintoNuevo(this.modelObject)
				this.close
			]
		]
	}
	
	
}