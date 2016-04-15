package ar.edu.unq.ciu.gatoEncerrado_ui

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.List
import ar.edu.unq.ciu.dominio_gatoEncerrado1.Laberinto
import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.layout.HorizontalLayout
import ar.edu.unq.ciu.dominio_gatoEncerrado1.Habitacion
import ar.edu.unq.ciu.dominio_gatoEncerrado1.CrearLaberintoAppModel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.CheckBox
import ar.edu.unq.ciu.dominio_gatoEncerrado1.Accion
import java.awt.Color

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
			height = 470
			width = 400
			value <=> "nuevoLaberinto"
		]
		
		val Panel horizontalPanel = new Panel(laberintosPanel)
		horizontalPanel.layout = new HorizontalLayout
		
		new Button(horizontalPanel) =>[
			caption = "Agregar laberinto"
			width = 210
			onClick [ | new LaberintoWindow(this, this.modelObject).open ]
		] 
		
		new Button(horizontalPanel) =>[
			caption = "Quitar laberinto"
			width = 210
			onClick [ |  this.modelObject.eliminarLaberinto ]
		]
	}
	
	def crearColumnaHabitaciones(Panel principal) {
		val Panel habitacionesPanel = new Panel(principal)
		
		val Panel horizontalPanel1 = new Panel(habitacionesPanel)
		horizontalPanel1.layout = new HorizontalLayout
		new Label(horizontalPanel1).text = "Habitaciones de: "
		new Label(horizontalPanel1).value <=> "nuevoLaberinto.nombreLaberinto"
		
		new Label(habitacionesPanel).text = "Nombre Laberinto"
		new TextBox(habitacionesPanel).value <=> "nuevoLaberinto.nombreLaberinto"

		new List<Habitacion>(habitacionesPanel)=>[
			(items <=> "nuevoLaberinto.listaHabitaciones").adapter = new PropertyAdapter(Habitacion, "nombreHabitacion")
			height = 400
			width = 400
			value <=> "nuevaHabitacion"
		]
		
		val Panel horizontalPanel2 = new Panel(habitacionesPanel)
		horizontalPanel2.layout = new HorizontalLayout
		
		new Button(horizontalPanel2) =>[
			caption = "Agregar habitacion"
			width = 210
			onClick [ | new HabitacionWindow(this, this.modelObject.nuevoLaberinto).open ]
		]
		
		new Button(horizontalPanel2) =>[
			caption = "Quitar habitacion"
			width = 210
			onClick [ |  this.modelObject.eliminarHabitacion ]
		]
	}
	
	def crearColumnaAccionesHabitacion(Panel principal) {
		val Panel accionesPanel = new Panel(principal)
		
		val Panel horizontalPanel1 = new Panel(accionesPanel)
		horizontalPanel1.layout = new HorizontalLayout
		new Label(horizontalPanel1) => [
			height = 50
			text = "Habitacion seleccionada: "
		]
		new Label(horizontalPanel1).value <=> "nuevaHabitacion.nombreHabitacion"
		
		new Label(accionesPanel).text = "Nombre habitacion"
		new TextBox(accionesPanel) =>  [
			value <=> "nuevaHabitacion.nombreHabitacion"
		]
		
		val Panel horizontalPanel2 = new Panel(accionesPanel)
		horizontalPanel2.layout = new HorizontalLayout
		new CheckBox(horizontalPanel2).value <=> "nuevaHabitacion.esInicial"
		new Label(horizontalPanel2).text = "Es inicial?"
		
		val Panel horizontalPanel3 = new Panel(accionesPanel)
		horizontalPanel3.layout = new HorizontalLayout
		new CheckBox(horizontalPanel3).value <=> "nuevaHabitacion.esFinal"
		new Label(horizontalPanel3) => [
			height = 50
			text = "Es final?"
		]
		
		new Label(accionesPanel).text = "Acciones"
		
		new List<Accion>(accionesPanel)=>[
			(items <=> "nuevaHabitacion.listaAcciones").adapter = new PropertyAdapter(Accion, "accion")
			height = 250
			width = 400
			value <=> "nuevaAccion"
		]
		
		val Panel horizontalPanel4 = new Panel(accionesPanel)
		horizontalPanel4.layout = new HorizontalLayout
		
		new Button(horizontalPanel4) =>[
			caption = "Agregar accion"
			width = 210
			onClick [ | new AgregarAccionWindow(this, this.modelObject.nuevaHabitacion, this.modelObject.nuevoLaberinto).open ]
		]
		
		new Button(horizontalPanel4) =>[
			caption = "Quitar accion"
			width = 210
			onClick [ | this.modelObject.eliminarAccion ]
		]
		
	}
	
	override createMainTemplate(Panel mainPanel) {
		this.title = "Aca hay gato encerrado..."
		
		val Panel primerPanel = new Panel(mainPanel)
		new Label(primerPanel) => [
			text = "Aca hay gato encerrado..."
			fontSize = 30
			width = 1300
			background = Color.ORANGE
		]
		
		val Panel segundoPanel = new Panel(mainPanel)
		segundoPanel.layout = new ColumnLayout(3)
		
		this.crearColumnaLaberintos(segundoPanel)
		this.crearColumnaHabitaciones(segundoPanel)
		this.crearColumnaAccionesHabitacion(segundoPanel)
	}
	
	
	
	
}