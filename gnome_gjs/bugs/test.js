
// leak vram test 1
// press space will recreate shader, nothing free it

const Clutter = imports.gi.Clutter;
Clutter.init(null);

this.stage = new Clutter.Stage();

this.stage.connect("destroy", Clutter.main_quit);
this.stage.connect("key-press-event", this.new_shader.bind(this));

this.stage.title = "Test Clutter shader";

this.counter = 0;
new_shader();

this.stage.show();

Clutter.main();


function new_shader(){
  this.counter += 1;
  log(this.counter);
  let shader_old = this.stage.get_effect("shader");
  if(shader_old){
    this.stage.remove_effect_by_name("shader");
    shader_old.run_dispose();
    delete shader_old;
    shader_old = null;
  }
  this.stage.clear_effects();
  let shader = new Clutter.ShaderEffect({shader_type: Clutter.ShaderType.FRAGMENT_SHADER});

  shader.set_shader_source(`
              void main()
              {
                  cogl_color_out=vec4(vec3(` + ((this.counter%10)/9+0.001) + `),1.);;
              }
  `);
  this.stage.add_effect_with_name("shader", shader);
}






