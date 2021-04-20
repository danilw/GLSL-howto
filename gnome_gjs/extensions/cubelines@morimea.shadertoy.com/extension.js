
// Created by Danil (2021+) https://twitter.com/AruGL
// License Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License.

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
    this.use_alpha=this.settings.get_boolean("use-alpha");
    this.use_shadow=this.settings.get_boolean("use-shadow");
    this.cam_far=this.settings.get_double("cam-far");
    this.cam_static=this.settings.get_double("cam-static");
    this.cam_shape=this.settings.get_double("cam-shape");
    this.cam_rot=this.settings.get_double("cam-rot");
    this.fps_30=this.settings.get_boolean("fps-30");
    this.custom_scale=this.settings.get_double("custom-scale");
    this.custom_posx=this.settings.get_double("custom-posx");
    this.custom_posy=this.settings.get_double("custom-posy");
    this.update_interval=this.settings.get_double("update-interval");
    this.day_color1=this.settings.get_string("day-color1");
    this.day_color2=this.settings.get_string("day-color2");
    this.night_color1=this.settings.get_string("night-color1");
    this.night_color2=this.settings.get_string("night-color2");
    this.day_color1_rgba=new Gdk.RGBA();this.day_color1_rgba.parse(this.day_color1);
    this.day_color2_rgba=new Gdk.RGBA();this.day_color2_rgba.parse(this.day_color2);
    this.night_color1_rgba=new Gdk.RGBA();this.night_color1_rgba.parse(this.night_color1);
    this.night_color2_rgba=new Gdk.RGBA();this.night_color2_rgba.parse(this.night_color2);
  }
  
  update_use_alpha(){this.use_alpha=this.settings.get_boolean("use-alpha");}
  update_use_shadow(){this.use_shadow=this.settings.get_boolean("use-shadow");}
  update_cam_far(){this.cam_far=this.settings.get_double("cam-far");}
  update_cam_static(){this.cam_static=this.settings.get_double("cam-static");}
  update_cam_shape(){this.cam_shape=this.settings.get_double("cam-shape");}
  update_cam_rot(){this.cam_rot=this.settings.get_double("cam-rot");}
  update_fps_30(){this.fps_30=this.settings.get_boolean("fps-30");this.fps_delay=Math.floor((1/(this.fps_30?30:60))*1000);}
  update_interval_func(){this.update_interval=this.settings.get_double("update-interval");}
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
  update_color1(){this.day_color1=this.settings.get_string("day-color1");this.day_color1_rgba=new Gdk.RGBA();this.day_color1_rgba.parse(this.day_color1);}
  update_color2(){this.day_color2=this.settings.get_string("day-color2");this.day_color2_rgba=new Gdk.RGBA();this.day_color2_rgba.parse(this.day_color2);}
  update_color3(){this.night_color1=this.settings.get_string("night-color1");this.night_color1_rgba=new Gdk.RGBA();this.night_color1_rgba.parse(this.night_color1);}
  update_color4(){this.night_color2=this.settings.get_string("night-color2");this.night_color2_rgba=new Gdk.RGBA();this.night_color2_rgba.parse(this.night_color2);}

  
  bind_settings() {
    this.settingChangedSignals = [];
    this.addSettingChangedSignal('use-alpha', this.update_use_alpha.bind(this));
    this.addSettingChangedSignal('use-shadow', this.update_use_shadow.bind(this));
    this.addSettingChangedSignal('cam-far', this.update_cam_far.bind(this));
    this.addSettingChangedSignal('cam-static', this.update_cam_static.bind(this));
    this.addSettingChangedSignal('cam-shape', this.update_cam_shape.bind(this));
    this.addSettingChangedSignal('cam-rot', this.update_cam_rot.bind(this));
    this.addSettingChangedSignal('fps-30', this.update_fps_30.bind(this));
    this.addSettingChangedSignal('custom-scale', this.update_custom_scale.bind(this));
    this.addSettingChangedSignal('custom-posx', this.update_custom_posx.bind(this));
    this.addSettingChangedSignal('custom-posy', this.update_custom_posy.bind(this));
    this.addSettingChangedSignal('update-interval', this.update_interval_func.bind(this));
    this.addSettingChangedSignal('day-color1', this.update_color1.bind(this));
    this.addSettingChangedSignal('day-color2', this.update_color2.bind(this));
    this.addSettingChangedSignal('night-color1', this.update_color3.bind(this));
    this.addSettingChangedSignal('night-color2', this.update_color4.bind(this));
  }
  
  init_shader_text() {
    this.shader_source = `
              uniform float width; //because no examples how to set vec2/vec3 as uniform in gjs
              uniform float height;
              uniform float r1;
              uniform float g1;
              uniform float b1;
              uniform float r2;
              uniform float g2;
              uniform float b2;
              uniform float cam_far;
              uniform float cam_static;
              uniform float cam_shape;
              uniform float custom_posx_shift;
              uniform float custom_posy_shift;
              uniform float update_interval;
              #define color_blue vec3(r1,g1,b1)
              #define color_red vec3(r2,g2,b2)
              #define iResolution vec2(width, height)
              #define iMouse vec4(0.)
              uniform int iFrame;
              uniform float iTime;
              uniform bool use_shadow;
              uniform bool use_alpha;

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
    this.settings = ExtensionUtils.getSettings('org.gnome.shell.extensions.cubelines');
    this.load_settings();
    this.bind_settings();
    this.init_shader_text();
    
    this.iResolution_monitor=[monitor.width,monitor.height];
    this.fps_delay=Math.floor((1/(this.fps_30?30:60))*1000);
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
      // DO NOT reload shader, shadere is "framebuffer" and It allocates again every new call
      // idk how to "free" it, delete unmap destroy or null does not free VRAM
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

  floatMix(a, b, d){let ta = a*d;let tb = b*(1-d);return parseInt(ta+tb);}
  vec3Mix(rgbA, rgbB, d){
    let r = this.floatMix(rgbA[0],rgbB[0],d);let g = this.floatMix(rgbA[1],rgbB[1],d);let b = this.floatMix(rgbA[2],rgbB[2],d);
    return "rgb("+r+","+g+","+b+")";
  }
  smoothstep(a,b,d) {
    if (d < a) return 0;if (d >= b) return 1;if (a == b) return -1;let p = (d - a) / (b - a);
    return (p * p * (3 - 2 * p));
  }

  update_uniforms() {
    this.shader.set_uniform_value("iTime", this.make_float(this.iTime));
    this.shader.set_uniform_value("width", this.make_float(this.stage.width));
    this.shader.set_uniform_value("height", this.make_float(this.stage.height));
    this.shader.set_uniform_value("cam_far", this.make_float(this.cam_far));
    this.shader.set_uniform_value("cam_static", this.make_float(this.cam_static));
    this.shader.set_uniform_value("cam_shape", this.make_float(this.cam_shape));
    this.shader.set_uniform_value("custom_posx_shift", this.make_float(this.custom_posx_shift));
    this.shader.set_uniform_value("custom_posy_shift", this.make_float(this.custom_posy_shift));
    
    this.shader.set_uniform_value("iFrame", this.iFrame);
    this.shader.set_uniform_value("use_alpha", this.use_alpha?1:0);
    this.shader.set_uniform_value("use_shadow", this.use_shadow?1:0);
    let time = new Date ();
    let hours = time.getHours ();
    let minutes = time.getMinutes ();
    let seconds = time.getSeconds ();
    let msec = time.getMilliseconds();
    let val = (hours*60*60*1000 + minutes*60*1000 + seconds*1000 + msec)/((this.update_interval)*60*60*1000);
    val=val-Math.floor(val);
    let d = this.smoothstep(0., 0.5, val)*(1 - this.smoothstep(0.5, 1, val));
    let res_col1 = new Gdk.RGBA();
    res_col1.parse(this.vec3Mix([this.day_color1_rgba.red*255,this.day_color1_rgba.green*255,this.day_color1_rgba.blue*255],
                  [this.night_color1_rgba.red*255,this.night_color1_rgba.green*255,this.night_color1_rgba.blue*255],d));
    let res_col2 = new Gdk.RGBA();
    res_col2.parse(this.vec3Mix([this.day_color2_rgba.red*255,this.day_color2_rgba.green*255,this.day_color2_rgba.blue*255],
                  [this.night_color2_rgba.red*255,this.night_color2_rgba.green*255,this.night_color2_rgba.blue*255],d));
    this.shader.set_uniform_value("r1", this.make_float(res_col1.red));
    this.shader.set_uniform_value("g1", this.make_float(res_col1.green));
    this.shader.set_uniform_value("b1", this.make_float(res_col1.blue));
    this.shader.set_uniform_value("r2", this.make_float(res_col2.red));
    this.shader.set_uniform_value("g2", this.make_float(res_col2.green));
    this.shader.set_uniform_value("b2", this.make_float(res_col2.blue));
  }

  _newFrame() {
    let local_delta=this._timeline.get_delta();
    if(this.fps_30){
      local_delta=this.fps_delay;
      this._timeline.pause();
      this.loop = GLib.timeout_add(GLib.PRIORITY_DEFAULT, this.fps_delay, () => {GLib.source_remove(this.loop);this.loop = null;if(this.stage.visible)this._timeline.start();});
    }
    this.update_uniforms();
    this.iFrame += 1.0;
    this.iTime+=((this.fps_delay)/1000)*this.cam_rot;
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

