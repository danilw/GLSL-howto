
// Created by Danil (2021+) https://twitter.com/AruGL
// CC0 license or use as you wish

// WARNING Gnome Shell can not free VRAM there no method to do it and it not "autoclean"
// this why this plugin allocate everything on init, and just show/hide on enabling/disabling
// and its reason why this extension can not be upload to official Gnome extensions website


const Main = imports.ui.main;
const St = imports.gi.St;
const Clutter = imports.gi.Clutter;
const GLib = imports.gi.GLib;
const Gio = imports.gi.Gio;
const Me = imports.misc.extensionUtils.getCurrentExtension();
const ExtensionUtils = imports.misc.extensionUtils;
const Shell = imports.gi.Shell;
const Gdk = imports.gi.Gdk;

class shader_cube_lines {

  getShaderSource() {
      if (!this.shader_src) {
          this.shader_src = Shell.get_file_contents_utf8_sync(
              Me.dir.get_child('shader.glsl').get_path()
          );
      }
      return this.shader_src;
  }

  load_settings() {
    this.fps_switch=this.settings.get_boolean("fps-switch");
    this.custom_scale=this.settings.get_double("custom-scale");
    this.custom_posx=this.settings.get_double("custom-posx");
    this.custom_posy=this.settings.get_double("custom-posy");
    this.alpha_val=this.settings.get_double("alpha-val");
    this.lines_color=this.settings.get_string("lines-color");
    this.lines_color_rgba=new Gdk.RGBA();this.lines_color_rgba.parse(this.lines_color);
  }
  
  update_fps_switch(){this.fps_switch=this.settings.get_boolean("fps-switch");this.fps_delay=Math.floor((1/(this.fps_switch?1:10))*1000);}
  update_alpha_val(){this.alpha_val=this.settings.get_double("alpha-val");}
  update_custom_posx(){this.custom_posx=this.settings.get_double("custom-posx");
      this.custom_posx_shift=(this.iResolution_monitor[0]-this.stage.width)*0.5+this.iResolution_monitor[0]*(this.custom_posx-0.5);
      this.stage.set_position(this.custom_posx_shift, (this.iResolution_monitor[1]-this.stage.height)-this.custom_posy_shift);}
  update_custom_posy(){this.custom_posy=this.settings.get_double("custom-posy");
      this.custom_posy_shift=(this.iResolution_monitor[1]-this.stage.height)*0.5+this.iResolution_monitor[1]*(this.custom_posy-0.5);
      this.stage.set_position(this.custom_posx_shift, (this.iResolution_monitor[1]-this.stage.height)-this.custom_posy_shift);}
  update_custom_scale(){this.custom_scale=this.settings.get_double("custom-scale");this.stage.width=this.iResolution_monitor[0]*this.custom_scale;this.stage.height=this.iResolution_monitor[1]*this.custom_scale;
      this.custom_posx_shift=(this.iResolution_monitor[0]-this.stage.width)*0.5+this.iResolution_monitor[0]*(this.custom_posx-0.5);
      this.custom_posy_shift=(this.iResolution_monitor[1]-this.stage.height)*0.5+this.iResolution_monitor[1]*(this.custom_posy-0.5);
      this.stage.set_position(this.custom_posx_shift, (this.iResolution_monitor[1]-this.stage.height)-this.custom_posy_shift);}
  update_lines_color(){this.lines_color=this.settings.get_string("lines-color");this.lines_color_rgba=new Gdk.RGBA();this.lines_color_rgba.parse(this.lines_color);}
  
  bind_settings() {
    this.settingChangedSignals = [];
    this.addSettingChangedSignal('fps-switch', this.update_fps_switch.bind(this));
    this.addSettingChangedSignal('alpha-val', this.update_alpha_val.bind(this));
    this.addSettingChangedSignal('custom-scale', this.update_custom_scale.bind(this));
    this.addSettingChangedSignal('custom-posx', this.update_custom_posx.bind(this));
    this.addSettingChangedSignal('custom-posy', this.update_custom_posy.bind(this));
    this.addSettingChangedSignal('lines-color', this.update_lines_color.bind(this));
  }
  
  init_shader_text() {
    this.shader_source = `
              uniform float width; //because no examples how to set vec2/vec3 as uniform in gjs
              uniform float height;
              uniform float r1;
              uniform float g1;
              uniform float b1;
              uniform float custom_posx_shift;
              uniform float custom_posy_shift;
              #define color_lines vec3(r1,g1,b1)
              #define iResolution vec2(width, height)
              #define iMouse vec4(0.)
              uniform int iFrame;
              uniform float iTime;
              uniform int year;
              uniform int month;
              uniform int day;
              uniform float time_sec;
              uniform float alpha_val;
              #define iDate vec4(float(year),float(month),float(day),time_sec)

              ` + this.getShaderSource() + `

              void main()
              {
                  vec4 fragColor;
                  mainImage(fragColor, gl_FragCoord.xy);
                  cogl_color_out=fragColor;
              }
  `;
  }
  
  constructor() {
    let monitor = Main.layoutManager.primaryMonitor;
    this.settings = ExtensionUtils.getSettings('org.gnome.shell.extensions.lineclock');
    this.load_settings();
    this.bind_settings();
    this.init_shader_text();
    
    this.iResolution_monitor=[monitor.width,monitor.height];
    this.fps_delay=Math.floor((1/(this.fps_switch?1:10))*1000);
    this.iFrame=0;
    this.iTime=0;
    
    this.stage = new St.Bin({
      style: 'background-color: gold',
      reactive : false,
      can_focus : false,
      track_hover : false,
      width: this.iResolution_monitor[0]*this.custom_scale,
      height: this.iResolution_monitor[1]*this.custom_scale,
    });
    this.stage.set_background_color(new Clutter.Color({
      red : 0,
      blue : 0,
      green : 0,
      alpha : 0
    }));
    
    this.custom_posx_shift=(this.iResolution_monitor[0]-this.stage.width)*0.5+this.iResolution_monitor[0]*(this.custom_posx-0.5);
    this.custom_posy_shift=(this.iResolution_monitor[1]-this.stage.height)*0.5+this.iResolution_monitor[1]*(this.custom_posy-0.5);
    this.stage.set_position(this.custom_posx_shift, (this.iResolution_monitor[1]-this.stage.height)-this.custom_posy_shift);
  }
  
  init_stage() {
    
    this.init1 = true;
    
    if(!this.shader){
      // DO NOT reload shader, shaders is "framebuffer" and It allocates again every new call
      // idk how to "free" it, delete unmap destroy or null does not free VRAM in gjs
      this.shader = new Clutter.ShaderEffect({shader_type: Clutter.ShaderType.FRAGMENT_SHADER});
      this.shader.set_shader_source(this.shader_source);
    }
    this.update_uniforms();
    
    this.stage.clear_effects();
    this.stage.add_effect_with_name("shader", this.shader);
    if(!this._timeline){
      this._timeline = new Clutter.Timeline({ duration: 1, repeat_count: -1,});
      this._timeline.connect('new-frame', this._newFrame.bind(this));
    }
    this._timeline.set_actor(this.stage);
  }

  addSettingChangedSignal(key, callback) {
    this.settingChangedSignals.push(this.settings.connect('changed::' + key, callback));
  }

  deleteSettngSignals() {
    for (let signal of this.settingChangedSignals){
        this.settings.disconnect(signal);
    };
  }

  update_uniforms() {
    this.shader.set_uniform_value("iTime", this.make_float(this.iTime));
    this.shader.set_uniform_value("width", this.make_float(this.stage.width));
    this.shader.set_uniform_value("height", this.make_float(this.stage.height));
    this.shader.set_uniform_value("custom_posx_shift", this.make_float(this.custom_posx_shift));
    this.shader.set_uniform_value("custom_posy_shift", this.make_float(this.custom_posy_shift));
    
    this.shader.set_uniform_value("iFrame", this.iFrame);
    this.shader.set_uniform_value("alpha_val", this.make_float(this.alpha_val));
    
    let time = new Date ();
    let hours = time.getHours ();
    let minutes = time.getMinutes ();
    let seconds = time.getSeconds ();
    let msec = time.getMilliseconds();
    let time_sec = (hours*60*60 + minutes*60+ seconds + msec/1000);
    
    this.shader.set_uniform_value("year", time.getYear());
    this.shader.set_uniform_value("month", time.getMonth());
    this.shader.set_uniform_value("day", time.getDay());
    this.shader.set_uniform_value("time_sec", this.make_float(time_sec));
    
    this.shader.set_uniform_value("r1", this.make_float(this.lines_color_rgba.red));
    this.shader.set_uniform_value("g1", this.make_float(this.lines_color_rgba.green));
    this.shader.set_uniform_value("b1", this.make_float(this.lines_color_rgba.blue));
  }

  _newFrame() {
    // dont use _timeline.pause/start to use delta from effect(to have max FPS), I dont need it I use custom 1 or 10 FPS here
    //let local_delta=this._timeline.get_delta();
    
    this._timeline.pause();
    this.loop = GLib.timeout_add(GLib.PRIORITY_DEFAULT, this.fps_delay, () => {GLib.source_remove(this.loop);this.loop = null;if(this.stage.visible)this._timeline.start();});
    this.update_uniforms();
    this.iFrame += 1.0;
    this.iTime+=(this.fps_delay)/1000;
    return true;
  }

  // https://stackoverflow.com/questions/62254719/how-to-use-clutter-shadereffect-set-uniform-value-properly
  make_float(val) {
    return Number.isInteger(val) ? val+0.0000001 : val;
  }

  enable () {
    if(!this.init1){
      this.init_stage();
      this.monitors = Main.layoutManager.monitors;
      for (let i = 0; i < this.monitors.length; i++) {
        let monitor = this.monitors[i];
        Main.layoutManager._backgroundGroup.insert_child_above(this.stage, Main.layoutManager._bgManagers[i].backgroundActor);
      }
    }
    this.stage.show();
    this._timeline.start();
  }

  disable () {
    if(this.loop){
      GLib.source_remove(this.loop);
      this.loop = null;
    }
    //this.deleteSettngSignals();
    this._timeline.stop();
    this.stage.hide();
  }
}

function init() {
    
    return new shader_cube_lines();
}

