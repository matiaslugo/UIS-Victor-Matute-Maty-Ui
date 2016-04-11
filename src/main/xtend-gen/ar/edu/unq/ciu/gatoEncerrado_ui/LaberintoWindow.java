package ar.edu.unq.ciu.gatoEncerrado_ui;

import ar.edu.unq.ciu.dominio_gatoEncerrado1.CrearLaberintoAppModel;
import ar.edu.unq.ciu.dominio_gatoEncerrado1.GatoEncerradoModel;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.uqbar.arena.bindings.ObservableValue;
import org.uqbar.arena.layout.VerticalLayout;
import org.uqbar.arena.widgets.Button;
import org.uqbar.arena.widgets.Control;
import org.uqbar.arena.widgets.Label;
import org.uqbar.arena.widgets.Panel;
import org.uqbar.arena.widgets.TextBox;
import org.uqbar.arena.windows.Dialog;
import org.uqbar.arena.windows.WindowOwner;
import org.uqbar.arena.xtend.ArenaXtendExtensions;
import org.uqbar.lacar.ui.model.Action;
import org.uqbar.lacar.ui.model.ControlBuilder;

@SuppressWarnings("all")
public class LaberintoWindow extends Dialog<CrearLaberintoAppModel> {
  public LaberintoWindow(final WindowOwner owner, final GatoEncerradoModel model) {
    super(owner, new CrearLaberintoAppModel(model));
  }
  
  protected void createFormPanel(final Panel mainPanel) {
    this.setTitle("Agregar Nuevo Laberinto");
    VerticalLayout _verticalLayout = new VerticalLayout();
    mainPanel.setLayout(_verticalLayout);
    Label _label = new Label(mainPanel);
    _label.setText("Nombre:");
    TextBox _textBox = new TextBox(mainPanel);
    final Procedure1<TextBox> _function = new Procedure1<TextBox>() {
      public void apply(final TextBox it) {
        ObservableValue<Control, ControlBuilder> _value = it.<ControlBuilder>value();
        ArenaXtendExtensions.operator_spaceship(_value, "nombreLaberinto");
        it.setWidth(200);
      }
    };
    ObjectExtensions.<TextBox>operator_doubleArrow(_textBox, _function);
    Button _button = new Button(mainPanel);
    final Procedure1<Button> _function_1 = new Procedure1<Button>() {
      public void apply(final Button it) {
        it.setCaption("Aceptar");
        final Action _function = new Action() {
          public void execute() {
            CrearLaberintoAppModel _modelObject = LaberintoWindow.this.getModelObject();
            _modelObject.agregarLaberintoNuevo();
            LaberintoWindow.this.close();
          }
        };
        it.onClick(_function);
      }
    };
    ObjectExtensions.<Button>operator_doubleArrow(_button, _function_1);
  }
}
