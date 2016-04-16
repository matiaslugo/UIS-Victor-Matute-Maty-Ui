package ar.edu.unq.ciu.gatoEncerrado_ui

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import ar.edu.unq.ciu.dominio_gatoEncerrado1.AccionDeAgarrarUnElemento
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import ar.edu.unq.ciu.dominio_gatoEncerrado1.Habitacion
import org.uqbar.arena.widgets.Label
import ar.edu.unq.ciu.dominio_gatoEncerrado1.Item
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button

class AgregarUnElementoWindow extends Dialog<AccionDeAgarrarUnElemento>{
	
	new(WindowOwner owner, Habitacion hab) {
		super(owner, new AccionDeAgarrarUnElemento(hab))
	}
	
	override protected createFormPanel(Panel mainPanel) {
		this.title = "Agregar accion de agarrar un elemento"
		val Panel principalPanel = new Panel(mainPanel)
		
		new Label(principalPanel).text = "Escriba el elemento que aparecera en la habitacion"
		new TextBox(principalPanel) => [
			value <=> "item.nombreItem"
		]
		
		val Panel segundoPanel = new Panel(principalPanel)
		segundoPanel.layout = new HorizontalLayout
		
		new Button(segundoPanel) => [
			caption = "Agregar"
			onClick [ |
				this.modelObject.habitacion.agregarAccion(this.modelObject)
				this.close
			]
		]
		
		new Button(segundoPanel) => [
			caption = "Cancelar"
			onClick [ |
				this.close
			]
		]
	}
	
	
}