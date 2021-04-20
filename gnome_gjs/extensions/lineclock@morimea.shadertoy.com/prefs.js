const GObject = imports.gi.GObject;
const Gtk = imports.gi.Gtk;
const Me = imports.misc.extensionUtils.getCurrentExtension();
const ExtensionUtils = imports.misc.extensionUtils;
const Gio = imports.gi.Gio;
const Gdk = imports.gi.Gdk;

function init () {}

function buildPrefsWidget () {
  let widget = new MyPrefsWidget();
  widget.show_all();
  return widget;
}

const MyPrefsWidget = GObject.registerClass(
class MyPrefsWidget extends Gtk.ScrolledWindow {

  _init (params) {
    super._init(params);
    
    this.set_min_content_width(700);
    this.set_min_content_height(640);
    this.settings = ExtensionUtils.getSettings('org.gnome.shell.extensions.lineclock');
    this.schema = this.settings.settings_schema;
    let builder = new Gtk.Builder();
    builder.add_from_file(Me.path + '/setting.ui');

    let SignalHandler = {

      reset_all_clicked_cb (obj) {
        this.schema.list_keys().forEach(key => this.settings.reset(key));
        this.load_color_button('lines-color','lines-color');
      },
      
    };
    
    builder.connect_signals_full((builder, object, signal, handler) => {
      object.connect(signal, SignalHandler[handler].bind(this,object));
    });
    
    let main_widget=builder.get_object('main_box');
    
    this.add(main_widget);
    this.bind_b('fps-switch','fps-switch');
    
    this.bind_d('custom-scale','custom-scale');
    this.bind_d('custom-posx','custom-posx');
    this.bind_d('custom-posy','custom-posy');
    this.bind_d('alpha-val','alpha-val');
    
    this.bind_color('lines-color','lines-color');
    
  }
  
  bind_b(name_setting, name_widget) {
    this.settings.bind(
        name_setting,
        this.find_child(this, name_widget),
        'active',
        Gio.SettingsBindFlags.DEFAULT
    );
  }
  
  bind_d(name_setting, name_widget) {
    this.settings.bind(
        name_setting,
        this.find_child(this, name_widget).get_adjustment(),
        'value',
        Gio.SettingsBindFlags.DEFAULT
    );
  }
  
  bind_color(name_setting, name_widget) {
    let widget = this.find_child(this, name_widget);
    this.load_color_button(name_setting, name_widget);
    widget.connect("color-set", this.onColorChosen.bind(this,name_setting,widget));
  }
  
  load_color_button(name_setting, name_widget) {
    let widget = this.find_child(this, name_widget);
    let color = new Gdk.RGBA();
    color.parse(this.settings.get_string(name_setting));
    widget.set_rgba(color);
  }
  
  onColorChosen(name_setting,colorButton) {
    let color_str = colorButton.rgba.to_string();
    this.settings.set_string(name_setting,color_str);
  }
  
  find_child(parent, name) {
          if (parent.get_name()==name) { 
                  return parent;
          }

          if (parent instanceof Gtk.Bin) {
                  return this.find_child(parent.get_child(), name);
          }

          if (parent instanceof Gtk.Container) {
                  let children = parent.get_children();
                  for(let element of children) {
                    let widget = this.find_child(element, name);
                    if (widget != null) {
                            return widget;
                    }
                  }
          }

          return null;
  }
  
});

