#include <nanogui/opengl.h>
#include <nanogui/glutil.h>
#include <nanogui/screen.h>
#include <nanogui/window.h>
#include <nanogui/layout.h>
#include <nanogui/label.h>
#include <nanogui/checkbox.h>
#include <nanogui/button.h>
#include <nanogui/toolbutton.h>
#include <nanogui/popupbutton.h>
#include <nanogui/combobox.h>
#include <nanogui/progressbar.h>
#include <nanogui/entypo.h>
#include <nanogui/messagedialog.h>
#include <nanogui/textbox.h>
#include <nanogui/slider.h>
#include <nanogui/imagepanel.h>
#include <nanogui/imageview.h>
#include <nanogui/vscrollpanel.h>
#include <nanogui/colorwheel.h>
#include <nanogui/colorpicker.h>
#include <nanogui/graph.h>
#include <nanogui/tabwidget.h>
#include <iostream>
#include <string>
#include <emscripten.h>
#include <chrono>
#include <random>
#include "emscripten/html5.h"

// Includes for the GLTexture class.
#include <cstdint>
#include <memory>
#include <utility>

//#include "Box2D/Box2D.h"


#if defined(__GNUC__)
#pragma GCC diagnostic ignored "-Wmissing-field-initializers"
#endif
#if defined(_WIN32)
#pragma warning(push)
#pragma warning(disable: 4457 4456 4005 4312)
#endif

//#define STB_IMAGE_IMPLEMENTATION
#include <stb_image.h>

#if defined(_WIN32)
#pragma warning(pop)
#endif
#if defined(_WIN32)
#if defined(APIENTRY)
#undef APIENTRY
#endif
#include <windows.h>
#endif

using std::cout;
using std::cerr;
using std::endl;
using std::string;
using std::vector;
using std::pair;
using std::to_string;

class GLTexture {
public:
    using handleType = std::unique_ptr<uint8_t[], void(*)(void*) >;
    GLTexture() = default;

    GLTexture(const std::string& textureName)
    : mTextureName(textureName), mTextureId(0) {
    }

    GLTexture(const std::string& textureName, GLint textureId)
    : mTextureName(textureName), mTextureId(textureId) {
    }

    GLTexture(const GLTexture& other) = delete;

    GLTexture(GLTexture&& other) noexcept
    : mTextureName(std::move(other.mTextureName)),
    mTextureId(other.mTextureId) {
        other.mTextureId = 0;
    }
    GLTexture& operator=(const GLTexture& other) = delete;

    GLTexture& operator=(GLTexture&& other) noexcept {
        mTextureName = std::move(other.mTextureName);
        std::swap(mTextureId, other.mTextureId);
        return *this;
    }

    ~GLTexture() noexcept {
        if (mTextureId)
            glDeleteTextures(1, &mTextureId);
    }

    GLuint texture() const {
        return mTextureId;
    }

    const std::string& textureName() const {
        return mTextureName;
    }

    /**
     *  Load a file in memory and create an OpenGL texture.
     *  Returns a handle type (an std::unique_ptr) to the loaded pixels.
     */
    handleType load(const std::string& fileName, bool q, bool exf) {
        if (mTextureId) {
            glDeleteTextures(1, &mTextureId);
            mTextureId = 0;
        }
        int force_channels = 0;
        int w, h, n;
        handleType textureData(stbi_load(fileName.c_str(), &w, &h, &n, force_channels), stbi_image_free);
        if (!textureData) {
            throw std::invalid_argument("Could not load texture data from file " + fileName);
        }
        glGenTextures(1, &mTextureId);
        glBindTexture(GL_TEXTURE_2D, mTextureId);
        GLint internalFormat;
        GLint format;
        switch (n) {
            case 1: internalFormat = GL_R8;
                format = GL_RED;
                break;
            case 2: internalFormat = GL_RG8;
                format = GL_RG;
                break;
            case 3: internalFormat = GL_RGB8;
                format = GL_RGB;
                break;
            case 4: internalFormat = GL_RGBA8;
                format = GL_RGBA;
                break;
            default: internalFormat = 0;
                format = 0;
                break;
        }
        glTexImage2D(GL_TEXTURE_2D, 0, internalFormat, w, h, 0, format, GL_UNSIGNED_BYTE, textureData.get());

        if (!exf) {
            if (!q) {
                glGenerateMipmap(GL_TEXTURE_2D);
                glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
                glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR_MIPMAP_LINEAR);
                glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
                glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);
            } else {
                glGenerateMipmap(GL_TEXTURE_2D);
                glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
                glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR_MIPMAP_LINEAR);
                glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
                glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);

            }
        } else {
            glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
            glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
            glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
            glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
        }
        return textureData;
    }

private:
    std::string mTextureName;
    GLuint mTextureId;
};

Eigen::Vector2f rotate2d(float originx, float originy, float pointx, float pointy, float radian) {

    float s = std::sin(radian);
    float c = std::cos(radian);
    pointx -= originx;
    pointy -= originy;
    float xnew = pointx * c - pointy * s;
    float ynew = pointx * s + pointy * c;
    Eigen::Vector2f retval;
    retval[0] = xnew + originx;
    retval[1] = ynew + originy;
    return retval;

}

float angle2d(float cx, float cy, float ex, float ey) {
    float dy = ey - cy;
    float dx = ex - cx;
    float theta = std::atan2(dy, dx);
    return theta;
}




//------------------------

class debug_table {
public:
    static const int c_max = 100;
    nanogui::Window *dwindow;
    nanogui::Button *closeb;
    nanogui::Label *r1[c_max];
    nanogui::Label *r2[c_max];
    nanogui::Label *r3[c_max];

    debug_table(nanogui::Widget *scr) {
        using namespace nanogui;
        dwindow = new Window(scr, "Debug", true);
        dwindow->setFixedSize(Vector2i(640, 510));
        dwindow->setLayout(new BoxLayout(Orientation::Vertical, Alignment::Middle, 0, 10));
        Widget *header = new Widget(dwindow);
        header->setLayout(new BoxLayout(Orientation::Horizontal, Alignment::Middle, 0, 6));
        Label *h1 = new Label(header, "Name", "sans-bold");
        setsize1(h1);
        Label *h2 = new Label(header, "Value 1", "sans-bold");
        setsize1(h2);
        Label *h3 = new Label(header, "Value 2", "sans-bold");
        setsize1(h3);
        Label *h33 = new Label(header, "", "sans-bold");
        h33->setColor(Color(230, 130, 180, 255));
        h33->setFixedSize(Eigen::Vector2i(15, 20));
        VScrollPanel *tablescroll = new VScrollPanel(dwindow);
        tablescroll->setFixedSize(Vector2i(640, 380));
        Widget *table = new Widget(tablescroll);
        table->setLayout(new BoxLayout(Orientation::Vertical, Alignment::Middle, 0, 10));
        for (int i = 0; i < c_max - 1; i++) {
            Widget *tableline = new Widget(table);
            tableline->setLayout(new BoxLayout(Orientation::Horizontal, Alignment::Middle, 0, 6));
            std::string str = "--------";
            r1[i] = new Label(tableline, to_string(i + 1), "sans");
            setsize(r1[i]);
            r2[i] = new Label(tableline, str, "sans");
            setsize(r2[i]);
            r3[i] = new Label(tableline, str, "sans");
            setsize(r3[i]);
        }

        Widget *btns = new Widget(dwindow);
        btns->setLayout(new BoxLayout(Orientation::Horizontal, Alignment::Middle, 0, 6));
        closeb = new Button(btns, "Close");
        closeb->setCallback([&] {
            dwindow->setVisible(false);
        });
        //dwindow->center();
        dwindow->setPosition(Vector2i(0, 200));
        dwindow->setVisible(true);



    }

    void switch_visible() {
        dwindow->setVisible(!dwindow->visible());
    }

    void set_text_on_id(const std::string &value1, const std::string &value2, const std::string &value3, int i) {
        r1[i]->setCaption(value1);
        r2[i]->setCaption(value2);
        r3[i]->setCaption(value3);
    }


private:

    void setsize(nanogui::Label *val) {
        val->setFontSize(25);
        val->setColor(nanogui::Color(204, 255, 255, 255));
        val->setFixedSize(Eigen::Vector2i(580 / 3, 20));
    }

    void setsize1(nanogui::Label *val) {
        val->setColor(nanogui::Color(255, 51, 0, 255));
        val->setFixedSize(Eigen::Vector2i(580 / 3, 20));
    }

};
//------------------------

//globals to make lambda work
nanogui::CheckBox *cb;
nanogui::CheckBox *aacb;
nanogui::Button *b;
nanogui::Button *b1;
nanogui::Button *b2;
nanogui::Button *b3;
nanogui::Button *b4;
nanogui::ColorPicker *cp1;
nanogui::FloatBox<float> *ftextBox;
nanogui::Window *window1;
debug_table *debugw; //debug window
nanogui::TextBox *nametext;
nanogui::Button *nc;

bool paused = false;
bool resetx = true;
bool fxaa = true;
bool isend = false;
float pto = 0;
float ptime = 0;
bool antxtstate = true;
int indexfx[8] = {0};
Eigen::Vector2f umouse;
int plhp = 0;
const int maxhp = 23;

class Ccgm : public nanogui::Screen {
public:

    Ccgm() : nanogui::Screen(Eigen::Vector2i(1366, 768), "NanoGUI Test", /*resizable*/true, /*fullscreen*/false, /*colorBits*/8,
    /*alphaBits*/8, /*depthBits*/24, /*stencilBits*/8,
    /*nSamples*/0, /*glMajor*/3, /*glMinor*/0) {
        using namespace nanogui;
        window1 = new Window(this, "Menu");
        initall();
        settextures();
        setBackground(Vector4f(0, 0, 0, 1));

        b = new Button(this, "Menu");
        b->setBackgroundColor(Color(235, 0, 0, 155));
        b->setTextColor(Color(235, 235, 235, 255));
        b->setCallback([&] {
            window1->setVisible(!window1->visible());
            if (window1->visible()) {
                window1->center();
            } else {
            }
        });
        b->setFixedSize(Eigen::Vector2i(63, 30));
        b1 = this->add<Button>("Pause");
        b1->setBackgroundColor(Color(0, 0, 205, 155));
        b1->setTextColor(Color(235, 235, 235, 255));
        b1->setPosition(Vector2i(0, 35));
        b1->setFixedSize(Eigen::Vector2i(63, 30));
        b1->setCallback([&] {
            paused = !paused;
            if (paused)pto = glfwGetTime();
            else {
                ptime = ptime + glfwGetTime() - pto;
                        pto = 0;
            }
        });

        b2 = this->add<Button>("Reset");
        b2->setTextColor(Color(235, 235, 235, 255));
        b2->setBackgroundColor(Color(205, 100, 0, 155));
        b2->setPosition(Vector2i(65, 0));
        b2->setFixedSize(Eigen::Vector2i(63, 30));
        b2->setCallback([&] {
            if (!paused) {
                resetx = true;
            } else {
                auto dlg = new MessageDialog(b2->parent(), MessageDialog::Type::Information, "!!", "Unpause first!");
            }
        });

        b3 = new Button(this, "FullScr");
        b3->setBackgroundColor(Color(102, 102, 153, 155));
        b3->setTextColor(Color(235, 235, 235, 255));
        b3->setPosition(Vector2i(65, 35));
        b3->setCallback([&] {
            bool ifc = isfullscreen();
            if (!ifc) {
                printf("Requesting fullscreen..\n"); emscripten_run_script("fullscreen()");
            } else {
                printf("Exiting fullscreen..\n"); EMSCRIPTEN_RESULT ret = emscripten_exit_fullscreen();
            }


        });
        b3->setFixedSize(Eigen::Vector2i(63, 30));

        b4 = new Button(this, "Debug");
        b4->setBackgroundColor(Color(0, 255, 0, 155));
        b4->setTextColor(Color(235, 235, 235, 255));
        b4->setPosition(Vector2i(165, 0));
        b4->setCallback([&] {
            debugw->switch_visible();
        });
        b4->setFixedSize(Eigen::Vector2i(63, 30));

        b->setVisible(false);
        b1->setVisible(false);
        b2->setVisible(false);
        b3->setVisible(false);
        b4->setVisible(true);

        window1->setPosition(Vector2i(425, 300));
        GridLayout *layout =
                new GridLayout(Orientation::Horizontal, 2,
                Alignment::Middle, 15, 5);
        layout->setColAlignment({Alignment::Maximum, Alignment::Fill});
        layout->setSpacing(0, 10);
        window1->setLayout(layout);

        new Label(window1, "Hide Menu buttons :", "sans-bold");

        cb = new CheckBox(window1, "");
        cb->setFontSize(16);
        cb->setChecked(false);
        cb->setCallback([&](bool state) {
            if (!state) {
                b->setVisible(true);
                b1->setVisible(true);
                b2->setVisible(true);
                b3->setVisible(true);
            } else {
                b->setVisible(false);
                b1->setVisible(false);
                b2->setVisible(false);
                b3->setVisible(false);
            }
        });
        b->setVisible(!cb->checked());
        b1->setVisible(!cb->checked());
        b2->setVisible(!cb->checked());
        b3->setVisible(!cb->checked());
        new Label(window1, "FXAA (on/off) :", "sans-bold");

        aacb = new CheckBox(window1, "");
        aacb->setFontSize(16);
        aacb->setChecked(true);
        aacb->setCallback([&](bool state) {
            fxaa = state;
        });
        new Label(window1, "Control :", "sans-bold");
        new Label(window1, "Use mouse :)", "sans-bold");

        performLayout();
        window1->setVisible(false);


        //fb1.inittexture(Vector2i(1280, 720), true); //linear
        pause_fb.inittexture(Vector2i(1280, 720));
        nvfxaa_fb.inittexture(Vector2i(1280, 720));

        main_screen.initFromFiles("main_screen", "shaders/mainv.glsl", "shaders/main_screen.glsl");
        pause_sh.initFromFiles("pause_sh", "shaders/mainv.glsl", "shaders/pause.glsl");
        nvfxaa_sh.initFromFiles("mvfxaa_sh", "shaders/mainv.glsl", "shaders/nv_fxaa.glsl");


        MatrixXu indices(3, 2); /* Draw 2 triangles */
        indices.col(0) << 0, 1, 2;
        indices.col(1) << 2, 3, 0;

        MatrixXf positions(3, 4);
        positions.col(0) << -1, -1, 0;
        positions.col(1) << 1, -1, 0;
        positions.col(2) << 1, 1, 0;
        positions.col(3) << -1, 1, 0;
        Vector2f screenSize = size().cast<float>();
        /*
                fb1.bind();
                mShader.bind();
                mShader.uploadIndices(indices);
                mShader.uploadAttrib("position", positions);
                mShader.setUniform("u_resolution", screenSize);
                fb1.release();
         */
        pause_fb.bind();
        pause_sh.bind();
        pause_sh.uploadIndices(indices);
        pause_sh.uploadAttrib("position", positions);
        pause_sh.setUniform("u_resolution", screenSize);
        pause_fb.release();

        nvfxaa_fb.bind();
        nvfxaa_sh.bind();
        nvfxaa_sh.uploadIndices(indices);
        nvfxaa_sh.uploadAttrib("position", positions);
        nvfxaa_sh.setUniform("u_resolution", screenSize);
        nvfxaa_fb.release();


        main_screen.bind();
        main_screen.uploadIndices(indices);
        main_screen.uploadAttrib("position", positions);
        main_screen.setUniform("u_resolution", screenSize);
    }

    ~Ccgm() {

        //mShader.free();
    }

    virtual bool keyboardEvent(int key, int scancode, int action, int modifiers) {
        if (Screen::keyboardEvent(key, scancode, action, modifiers))
            return true;
        
        //DO NOT USE IN WASM
        /*if (key == GLFW_KEY_ESCAPE && action == GLFW_PRESS) {
            std::cout << "Exit(ESC) called" << std::endl;
            setVisible(false);
            return true;
        }*/
        if (key == GLFW_KEY_P && action == GLFW_PRESS) {

            return true;
        }

        return false;
    }

    virtual bool mouseMotionEvent(const Eigen::Vector2i &p, const Eigen::Vector2i &rel, int button, int modifiers) {
        if (Screen::mouseMotionEvent(p, rel, button, modifiers)) {
            return true;
        }
        //if ((button & (1 << GLFW_MOUSE_BUTTON_1)) != 0) {
        umouse = Eigen::Vector2f(p[0], p[1]);
        if (cb->checked()) {
            if (p[0] < 130 && p[1] < 80) {
                b->setVisible(true);
                b1->setVisible(true);
                b2->setVisible(true);
                b3->setVisible(true);
            } else {

                b->setVisible(false);
                b1->setVisible(false);
                b2->setVisible(false);
                b3->setVisible(false);
            }
        }
        //return true;
        //}
        return false;
    }
    float ffm = false;

    virtual bool mouseButtonEvent(const Eigen::Vector2i &p, int button, bool down, int modifiers) {
        if (Screen::mouseButtonEvent(p, button, down, modifiers))
            return true;
        ffm = button == GLFW_MOUSE_BUTTON_1 && down;
        if (ffm) {

        }
        return false;
    }

    virtual void draw(NVGcontext *ctx) {

        /* Draw the user interface */
        Screen::draw(ctx);
    }

    double frameRateSmoothing = 1.0;
    double numFrames = 0;
    double fps = 60;

    Eigen::Vector2f osize = Eigen::Vector2f(1280, 720);
    bool scrch = true;

    virtual void drawContents() {
        using namespace nanogui;

        std::chrono::duration<double> delta = std::chrono::duration_cast<std::chrono::duration<double>> (std::chrono::high_resolution_clock::now() - lastFpsTime);
        numFrames++;
        if (delta.count() > frameRateSmoothing) {
            fps = (int) (numFrames / delta.count());
            fps = fps < 30 ? 30 : fps;
            numFrames = 0;
            lastFpsTime = std::chrono::high_resolution_clock::now();
        }

        if (resetx)ptime = glfwGetTime();
        updateallUnioforms();
        Vector2i tsxz = size();
        if ((int) (tsxz[1]*(float) 16 / 9) != tsxz[0]) {
            tsxz[0] = (int) (tsxz[1]*(float) 16 / 9);
        }


        debugw->set_text_on_id("resized fb", to_string(tsxz[0]), to_string(tsxz[1]), 0);
        Vector2i tsxz2 = size();
        debugw->set_text_on_id("original fb", to_string(tsxz2[0]), to_string(tsxz2[1]), 1);
        bool ifc = isfullscreen();
        debugw->set_text_on_id("is fullscreen", ifc?"true":"false", "----", 2);



        Vector2f screenSize = tsxz.cast<float>();
        glDisable(GL_BLEND); //framebuffer

        /*
                //texture
                glActiveTexture(GL_TEXTURE0 + 0);
                glBindTexture(GL_TEXTURE_2D, texturesData[indexfx[0]].first.texture());
                mShader.setUniform("u_texture1", 0);

                //framebuffer
                fb1.bind();
                fbother2.bindtexture(tsxz, 0);
                mShader.setUniform("u_texture1", 0);
                fb1.release();
                fb1.blittexture();
         */



        if (paused) {
            pause_fb.bind();
        } else if (fxaa) {
            nvfxaa_fb.bind();
        }

        main_screen.bind();
        //main_screen.setUniform("u_mouse", umouse);
        float loctime = (float) glfwGetTime() - ptime;
        if (paused) {
            loctime = pto - ptime;
        }
        main_screen.setUniform("u_time", (float) loctime);
        main_screen.setUniform("u_resolution", screenSize);
        main_screen.drawIndexed(GL_TRIANGLES, 0, 2);

        if (paused) {
            pause_fb.release();
            pause_fb.blittexture();
        } else if (fxaa) {
            nvfxaa_fb.release();
            nvfxaa_fb.blittexture();
        }

        if (paused) {
            if (fxaa) {
                nvfxaa_fb.bind();
            }
            pause_sh.bind();
            pause_fb.bindtexture(tsxz, 0, true);
            pause_sh.setUniform("u_texture1", 0);
            //pause_sh.setUniform("u_mouse", umouse);
            //pause_sh.setUniform("u_time", (float) pto - ptime);
            pause_sh.setUniform("u_resolution", screenSize);
            pause_sh.drawIndexed(GL_TRIANGLES, 0, 2);
            if (fxaa) {
                nvfxaa_fb.release();
                nvfxaa_fb.blittexture();
            }
        }


        if (fxaa) {
            nvfxaa_sh.bind();
            nvfxaa_fb.bindtexture(tsxz, 0, true);
            nvfxaa_sh.setUniform("u_texture1", 0);
            //pause_sh.setUniform("u_mouse", umouse);
            //pause_sh.setUniform("u_time", (float) pto - ptime);
            nvfxaa_sh.setUniform("u_resolution", screenSize);
            nvfxaa_sh.drawIndexed(GL_TRIANGLES, 0, 2);
        }

        resetx = false;

        if (glfwGetTime() - ptime > 3900) {
            if (!paused)resetx = true;
        }

        scrch = (!(((osize - screenSize).norm() == 0)));
        osize = screenSize;
    }
private:

    nanogui::GLShader main_screen;
    nanogui::GLShader pause_sh;
    nanogui::GLShader nvfxaa_sh;

    nanogui::GLFramebuffer pause_fb;
    nanogui::GLFramebuffer nvfxaa_fb;

    //nanogui::GLFramebuffer fb1;

    std::chrono::high_resolution_clock::time_point lastFpsTime;
    void settextures();
    void initall();
    void updateallUnioforms();
    void setupdebug();
    bool isfullscreen();


    using imagesDataType = vector<pair<GLTexture, GLTexture::handleType>>;
    imagesDataType mImagesData;
    imagesDataType texturesData;
    int mCurrentImage;
};

bool Ccgm::isfullscreen() {
    EmscriptenFullscreenChangeEvent fsce;
    EMSCRIPTEN_RESULT ret = emscripten_get_fullscreen_status(&fsce);
    return fsce.isFullscreen;
}

void Ccgm::settextures() {
    using namespace nanogui;
    vector<pair<int, string>> textres = loadImageDirectory(mNVGContext, "textures");
    string resourcesFolderPath("./");
    int i = 0;
    for (auto& texturex : textres) {
        GLTexture texture(texturex.second);
        /*if (texturex.second == ("textures/txt1")) //its fixes for "random non sorted file names in readdir(loadImageDirectory use it)"
            indexfx[1] = i;

        if (texturex.second == ("textures/tx2"))
                    indexfx[1] = i;
                if (texturex.second == ("textures/tx3"))
                    indexfx[2] = i;
                if (texturex.second == ("textures/tx4"))
                    indexfx[3] = i;
                if (texturex.second == ("textures/tx5"))
                    indexfx[4] = i;
                if (texturex.second == ("textures/tx6"))
                    indexfx[5] = i;
                if (texturex.second == ("textures/tx7"))
                    indexfx[6] = i;*/
        if (texturex.second == ("textures/iqn"))
            indexfx[0] = i;
        //bool fmt = texturex.second == ("textures/tx6") || texturex.second == ("textures/tx7");
        auto data = texture.load(resourcesFolderPath + texturex.second + ".png", false, false);
        texturesData.emplace_back(std::move(texture), std::move(data));
        i++;
    }
}

void Ccgm::setupdebug() {
    debugw = new debug_table(this);
}

void Ccgm::initall() {
    setupdebug();
}

void Ccgm::updateallUnioforms() {

}

void mainloop() {

    nanogui::mainloop();
}

int main(int /* argc */, char ** /* argv */) {
    try {
        nanogui::init();
        /* scoped variables */
        {
            nanogui::ref<Ccgm> app = new Ccgm();
            app->drawAll();
            app->setVisible(true);
            emscripten_set_main_loop(mainloop, 0, 1);
        }

        nanogui::shutdown();
    } catch (const std::runtime_error &e) {
        std::string error_msg = std::string("Caught a fatal error: ") + std::string(e.what());
#if defined(_WIN32)
        MessageBoxA(nullptr, error_msg.c_str(), NULL, MB_ICONERROR | MB_OK);
#else
        std::cerr << error_msg << endl;
#endif
        return -1;
    }

    return 0;
}
