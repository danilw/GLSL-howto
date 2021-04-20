
// leak vram test 2
// press space will recreate shader and stage, nothing free it

const Clutter = imports.gi.Clutter;
Clutter.init(null);
new_stage();
Clutter.main();

function new_shader(){
  this.counter += 1;
  log(this.counter);
  let shader_old = this.stage.get_effect("shader");
  if(shader_old){
    this.stage.remove_effect_by_name("shader");
    shader_old.run_dispose(); //do literally nothiing
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

function new_stage(){
  this.stage = new Clutter.Stage();
  
  this.stage.connect("key-press-event", this.delete_stage.bind(this));

  this.stage.title = "Test Clutter shader";

  this.counter = 0;
  new_shader();

  this.stage.show();
}

function delete_stage(){
  this.stage.hide();
  
  //this.stage.run_dispose(); 
  // run_dispose result this emssage: 
  // Object Clutter.Stage (0x557dca6f48f0), has been already deallocated — impossible to access it. 
  // This might be caused by the object having been destroyed from C code using something such as destroy(), dispose(), or remove() vfuncs.
  
  this.stage.destroy();
  delete this.stage;
  this.stage = null;
  new_stage();
}


