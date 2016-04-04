package ar.edu.unq.ciu.gatoEncerrado_ui

import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.widgets.Panel
import ar.edu.unq.ciu.dominio_gatoEncerrado1.SistemaGestionLaberinto
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.NumericField

class CrearGatoEncerradoWindow extends SimpleWindow<SistemaGestionLaberinto> {
	
		new(WindowOwner owner, SistemaGestionLaberinto sistema){
		super(owner, sistema)
		title = "Aca hay gato encerrado"
		taskDescription = "Hola Beca administra tus laberintos"
	}
	
	override protected createFormPanel(Panel mainPanel){
		
		val editorPanel = new Panel(mainPanel)
		editorPanel.layout = new ColumnLayout(2)
		
		new Label(editorPanel).text = "Laberintos ()"

	}
	
	
	override addActions(Panel actionsPanel) {
		
			new Button(actionsPanel) => [
			caption = "Jugar"
			setAsDefault]
	
	}
	
	
}