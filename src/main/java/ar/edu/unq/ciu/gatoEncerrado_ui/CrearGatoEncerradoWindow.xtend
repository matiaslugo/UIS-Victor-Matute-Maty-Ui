package ar.edu.unq.ciu.gatoEncerrado_ui

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.NumericField
import ar.edu.unq.ciu.dominio_gatoEncerrado1.GatoEncerradoModel
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.List
import ar.edu.unq.ciu.dominio_gatoEncerrado1.Laberinto
import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.widgets.Selector

class CrearGatoEncerradoWindow extends SimpleWindow<GatoEncerradoModel> {
	
		new(WindowOwner owner, GatoEncerradoModel sistema){
		super(owner, sistema)
		title = "Aca hay gato encerrado"
		taskDescription = "Hola Beca administra tus laberintos"
	}

	override protected createFormPanel(Panel mainPanel){
	}
	
	override addActions(Panel actionsPanel) {
	}
	
	override createMainTemplate(Panel mainPanel) {
		this.title = "Aca hay gato encerrado..."
		mainPanel.layout = new ColumnLayout(3)
		
		val Panel laberintosPanel = new Panel(mainPanel)
		new Label(laberintosPanel).text = "Laberintos"
		new List<Laberinto>(laberintosPanel)=>[
			
			(items <=> "listaLaberintos").adapter = new PropertyAdapter(Laberinto, "nombreLaberinto")
			height = 450
			width = 480
		]
		
		new Button(laberintosPanel) =>[
			caption = "AgregarLaberinto"
			onClick [ | new LaberintoWindow(this, this.modelObject).open ]
		] 
		
		val Panel habitacionesPanel = new Panel(mainPanel)
		new Label (habitacionesPanel).text = "Habitaciones"
		
		
		val Panel accionesPanel = new Panel(mainPanel)
		new Label (accionesPanel).text = "Acciones"
	}
	
	
	
	
}