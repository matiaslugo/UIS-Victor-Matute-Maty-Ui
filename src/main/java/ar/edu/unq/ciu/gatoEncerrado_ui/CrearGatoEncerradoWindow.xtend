package ar.edu.unq.ciu.gatoEncerrado_ui

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.NumericField
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.List
import ar.edu.unq.ciu.dominio_gatoEncerrado1.Laberinto
import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.layout.HorizontalLayout
import ar.edu.unq.ciu.dominio_gatoEncerrado1.Habitacion
import ar.edu.unq.ciu.dominio_gatoEncerrado1.CrearLaberintoAppModel

class CrearGatoEncerradoWindow extends SimpleWindow<CrearLaberintoAppModel> {
	
		new(WindowOwner owner, CrearLaberintoAppModel sistema){
		super(owner, sistema)
		title = "Aca hay gato encerrado"
		taskDescription = "Hola USUARIO administra tus laberintos" 
	}

	override protected createFormPanel(Panel mainPanel){
	}
	override addActions(Panel actionsPanel) {
	}
	
	def crearColumnaLaberintos(Panel principal) {
		val Panel laberintosPanel = new Panel(principal)
		new Label(laberintosPanel).text = "Laberintos"
		new List<Laberinto>(laberintosPanel)=>[
			(items <=> "sistema.listaLaberintos").adapter = new PropertyAdapter(Laberinto, "nombreLaberinto")
			height = 400
			width = 400
			value <=> "nuevoLaberinto"
		]
		
		new Button(laberintosPanel) =>[
			caption = "AgregarLaberinto"
			onClick [ | new LaberintoWindow(this, this.modelObject).open ]
		] 
		
		new Button(laberintosPanel) =>[
			caption = "QuitarLaberinto"
			onClick [ |  this.modelObject.eliminarLaberinto]
		]
	}
	
	def crearColumnaHabitaciones(Panel principal) {
		val Panel habitacionesPanel = new Panel(principal)
		new Label(habitacionesPanel).value <=> "nuevoLaberinto.nombreLaberinto"

		new List<Habitacion>(habitacionesPanel)=>[
			(items <=> "nuevoLaberinto.listaHabitaciones").adapter = new PropertyAdapter(Habitacion, "nombreHabitacion")
			height = 400
			width = 400
			value <=> "nuevaHabitacion"
		]
		
		new Button(habitacionesPanel) =>[
			caption = "AgregarHabitacion"
			onClick [ | new HabitacionWindow(this, this.modelObject.nuevoLaberinto).open ]
		]
		
//		new Button(habitacionesPanel) =>[
//			caption = "QuitarHabitacion"
//			onClick [ |  this.modelObject.eliminarHabitacionActual(modelObject.laberintoActual)			
//				
//			]
//		] 
	}
	
	def crearColumnaAccionesHabitacion(Panel principal) {
		val Panel accionesPanel = new Panel(principal)
		new Label (accionesPanel).text = "Acciones"
	}
	
	override createMainTemplate(Panel mainPanel) {
		this.title = "Aca hay gato encerrado..."
		mainPanel.layout = new ColumnLayout(3)
		
		this.crearColumnaLaberintos(mainPanel)
		this.crearColumnaHabitaciones(mainPanel)
		this.crearColumnaAccionesHabitacion(mainPanel)
	}
	
	
	
	
}