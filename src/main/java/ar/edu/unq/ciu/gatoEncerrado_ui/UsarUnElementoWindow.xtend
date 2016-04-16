package ar.edu.unq.ciu.gatoEncerrado_ui

import ar.edu.unq.ciu.dominio_gatoEncerrado1.Habitacion
import org.uqbar.arena.windows.WindowOwner
import ar.edu.unq.ciu.dominio_gatoEncerrado1.Laberinto
import ar.edu.unq.ciu.dominio_gatoEncerrado1.AccionDeUsarItem
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.bindings.PropertyAdapter
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import ar.edu.unq.ciu.dominio_gatoEncerrado1.Item
import ar.edu.unq.ciu.dominio_gatoEncerrado1.AccionDeMoverseModel
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.HorizontalLayout

class UsarUnElementoWindow extends Dialog<AccionDeMoverseModel> {
	
	var Laberinto laberinto
	
	new(WindowOwner owner,Laberinto lab, Habitacion hab) {
		super(owner, new AccionDeMoverseModel(hab,lab))
		laberinto = lab
		
	}
	
	override protected createFormPanel(Panel mainPanel) {
		this.title = "Agregar accion de usar un elemento"
		val Panel principalPanel = new Panel(mainPanel)
		
		new Label(principalPanel).text = "Seleccione el elemento que puede ser usado"
		new Selector(principalPanel) => [
			allowNull(false)
			(items <=> "laberinto.listaItems").adapter = new PropertyAdapter(Item, "nombreItem")
			value <=> "itemSeleccionado"
		]
		
		new Label(principalPanel).text = "Cree la accion a realizar"
		new Button(principalPanel) =>[
			caption = "Agregar accion"
			width = 210
			onClick [ | new AgregarAccionWindow(this, this.modelObject.habitacion, this.modelObject.laberinto).open ]
		]
		
		new Label(principalPanel).text = this.modelObject.habitacion.ultimaAccionAgregada()
		
		val Panel segundoPanel = new Panel(principalPanel)
		segundoPanel.layout = new HorizontalLayout
		
		new Button(segundoPanel) => [
			caption = "Cancelar"
			onClick [ |
				this.close
			]
		]
		
		new Button(segundoPanel) => [
			caption = "Agregar"
			onClick [ |
				this.close
			]
		]
		
	}
	
}