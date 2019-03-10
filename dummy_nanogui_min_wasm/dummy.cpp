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
#include <random>
#include "emscripten/html5.h"
#include <cmath>

// Includes for the GLTexture class.
#include <cstdint>
#include <memory>
#include <utility>

#include "Box2D/Box2D.h"


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

//random
std::random_device rd;
std::mt19937 rng(rd());

//support drawing types
#define B_TRI 0
#define B_RECT 1
#define B_CIRCLE 2


#define B_TRI_vertexCount 32//1 //single triangle
#define B_RECT_vertexCount 2 //two triangles
#define B_CIRCLE_vertexCount 32 //many triangles

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
//only debug window on screen

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
        dwindow->setVisible(false);



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
nanogui::CheckBox *fps_ch;
nanogui::CheckBox *fxaa_box;
nanogui::CheckBox *filtering;
nanogui::CheckBox *p_on_tab;
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
nanogui::ComboBox *qs;
nanogui::ComboBox *qz;

nanogui::TextBox *res_display;
nanogui::IntBox<int> *max_fb_size_w; //max size of screen
nanogui::IntBox<int> *fps_edit;
nanogui::Label *fps_r;

class Ccgm : public nanogui::Screen {
public:

    Ccgm() : nanogui::Screen(Eigen::Vector2i(1366, 768), "game", /*resizable*/true, /*fullscreen*/false, /*colorBits*/8,
    /*alphaBits*/8, /*depthBits*/24, /*stencilBits*/8,
    /*nSamples*/0, /*glMajor*/3, /*glMinor*/0) {
        using namespace nanogui;
        hidecanvas();
        window1 = new Window(this, "Menu / Settings");
        window1->setFixedSize(Vector2i(350, 410));
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
            if (paused) {
                pto = glfwGetTime();
            } else {
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

        b4->setVisible(false);
        //b4->setVisible(true); //debug visible

        window1->setPosition(Vector2i(425, 300));
        GridLayout *layout =
                new GridLayout(Orientation::Horizontal, 2,
                Alignment::Middle, 5, 5);
        layout->setColAlignment({Alignment::Maximum, Alignment::Fill});
        layout->setRowAlignment({Alignment::Maximum, Alignment::Fill});
        layout->setSpacing(0, 10);
        window1->setLayout(new BoxLayout(Orientation::Vertical, Alignment::Fill, 0, 0));

        Widget *wcontent = new Widget(window1);
        wcontent->setLayout(layout);

        new Label(wcontent, "Hide Menu buttons :", "sans-bold");

        cb = new CheckBox(wcontent, "");
        cb->setFontSize(16);
        cb->setChecked(true);
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
        new Label(wcontent, "Bloom with FXAA (on/off) :", "sans-bold");

        fxaa_box = new CheckBox(wcontent, "");
        fxaa_box->setFontSize(16);
        fxaa_box->setChecked(false);
/*
        new Label(wcontent, "Quality :", "sans-bold");
        qs = new ComboBox(wcontent,{"Minimal", "Lowest", "Low", "Medium", "Best"});
        qs->setSelectedIndex(2);
        qs->setTooltip("Minimal will disable all post-processing.");
*/
        new Label(wcontent, "Current resolution :", "sans-bold");
        res_display = new TextBox(wcontent);
        res_display->setEditable(false);
        res_display->setValue("1366 x 768");
        res_display->setTooltip("Screen 1366 x 768");

        new Label(wcontent, "Resolution Scale :", "sans-bold");
        qz = new ComboBox(wcontent,{"x3 Minimal", "x2 Lowest", "x1.5 Low", "x1 Medium", "x0.5 Best"});
        qz->setSelectedIndex(3);
        qz->setTooltip("Set lowest for better FPS. Base on current screen size.");
        new Label(wcontent, "Max resolution :", "sans-bold");
        max_fb_size_w = new IntBox<int>(wcontent);
        max_fb_size_w->setEditable(true);
        max_fb_size_w->setValue(max_fb_size);
        max_fb_size_w->setUnits("px");
        max_fb_size_w->setDefaultValue("1");
        max_fb_size_w->setFormat("[1-9][0-9]*");
        max_fb_size_w->setSpinnable(true);
        max_fb_size_w->setMinValue(10);
        max_fb_size_w->setValueIncrement(1);
        max_fb_size_w->setFontSize(18);
        new Label(wcontent, "FPS autodetection :", "sans-bold");
        Widget *vals = new Widget(wcontent);
        vals->setLayout(new BoxLayout(Orientation::Horizontal, Alignment::Middle, 0, 6));
        fps_edit = new IntBox<int>(vals);
        fps_edit->setEditable(false);
        fps_edit->setValue(60);
        fps_edit->setUnits("fps");
        fps_edit->setDefaultValue("60");
        fps_edit->setFormat("[1-9][0-9]*");
        fps_edit->setSpinnable(true);
        fps_edit->setMinValue(10);
        fps_edit->setValueIncrement(1);
        fps_edit->setFontSize(18);

        fps_edit->setTooltip("uncheck to edit");
        fps_ch = new CheckBox(vals, "");
        fps_ch->setFontSize(16);
        fps_ch->setChecked(true);
        fps_ch->setCallback([&](bool state) {
            if (!state) {
                fps_edit->setEditable(true);
            } else {
                fps_edit->setValue(60);
                fps_edit->setEditable(false);
            }
        }
        );
        fps_r = new Label(vals, "100", "sans-bold");
        fps_r->setTooltip("FPS now");
        fps_r->setColor(Color(255, 153, 0, 255));

        new Label(wcontent, "Filtering linear :", "sans-bold");

        filtering = new CheckBox(wcontent, "");
        filtering->setFontSize(16);
        filtering->setChecked(true);
        filtering->setTooltip("Uncheck for better FPS.");

        new Label(wcontent, "Pause when hiden :", "sans-bold");

        p_on_tab = new CheckBox(wcontent, "");
        p_on_tab->setFontSize(16);
        p_on_tab->setChecked(true);
        p_on_tab->setTooltip("for Webbrowsers only.");

        new Label(wcontent, "Control :", "sans-bold");
        new Label(wcontent, "mouse/keyboard", "sans-bold");

        performLayout();
        window1->setVisible(false);
        init_glsl_s();

    }

	//left+right control movement to keep move when one of key released
	bool ka = false;
	bool kd = false;

	bool KEY_LEFT = false;
	bool KEY_UP = false;
	bool KEY_RIGHT = false;
	bool KEY_DOWN = false;

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
			(b1->callback())();
			return true;
		}


		if (((key == GLFW_KEY_A) || (key == GLFW_KEY_LEFT)) && action == GLFW_PRESS) {
			KEY_LEFT = true;
			KEY_UP = false;
			KEY_RIGHT = false;
			KEY_DOWN = false;
			return true;
		}

		if (((key == GLFW_KEY_A) || (key == GLFW_KEY_LEFT)) && action == GLFW_RELEASE) {
			KEY_LEFT = false;

			return true;
		}

		if (((key == GLFW_KEY_D) || (key == GLFW_KEY_RIGHT)) && action == GLFW_PRESS) {
			KEY_LEFT = false;
			KEY_UP = false;
			KEY_RIGHT = true;
			KEY_DOWN = false;

			return true;
		}

		if (((key == GLFW_KEY_D) || (key == GLFW_KEY_RIGHT)) && action == GLFW_RELEASE) {
			KEY_RIGHT = false;

			return true;
		}

		if (((key == GLFW_KEY_W) || (key == GLFW_KEY_UP)) && action == GLFW_PRESS) {
			KEY_LEFT = false;
			KEY_UP = true;
			KEY_RIGHT = false;
			KEY_DOWN = false;

			return true;
		}

		if (((key == GLFW_KEY_W) || (key == GLFW_KEY_UP)) && action == GLFW_RELEASE) {
			KEY_UP = false;

			return true;
		}

		if (((key == GLFW_KEY_S) || (key == GLFW_KEY_DOWN)) && action == GLFW_PRESS) {
			KEY_LEFT = false;
			KEY_UP = false;
			KEY_RIGHT = false;
			KEY_DOWN = true;

			return true;
		}

		if (((key == GLFW_KEY_S) || (key == GLFW_KEY_DOWN)) && action == GLFW_RELEASE) {
			KEY_DOWN = false;

			return true;
		}

		if (((key == GLFW_KEY_SPACE) || (key == GLFW_KEY_W)) && action == GLFW_PRESS) {
			//boxhelper->jumpx = true;
			return true;
		}

		return false;
	}

	Eigen::Vector2f oumouse_p = Eigen::Vector2f(0, 0);
	Eigen::Vector2f oumousezw_p = Eigen::Vector2f(0, 0);

	virtual bool mouseMotionEvent(const Eigen::Vector2i &p, const Eigen::Vector2i &rel, int button, int modifiers) {
		if (Screen::mouseMotionEvent(p, rel, button, modifiers)) {
			return true;
		}
		Eigen::Vector2i tsxz = size();
		//if ((button & (1 << GLFW_MOUSE_BUTTON_1)) != 0) {
		if (!paused) {
			oumouse_p = p.cast<float>();
		}

		if (cb->checked()) {
			if (p[0] < 130 && p[1] < 80) {
				fadestop = true;
				b->setVisible(true);
				b1->setVisible(true);
				b2->setVisible(true);
				b3->setVisible(true);
			}
			else {

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

	virtual bool mouseButtonEvent(const Eigen::Vector2i &p, int button, bool down, int modifiers) {
		if (Screen::mouseButtonEvent(p, button, down, modifiers))
			return true;
		ffm = button == GLFW_MOUSE_BUTTON_1 && down;
		oumousezw_p = Eigen::Vector2f(0, 0);
		if (ffm) {

			std::uniform_int_distribution<int> uni(0, 2);
			int cx = uni(rng);

			std::uniform_int_distribution<int> uni2(0, 8);
			int cx2 = uni2(rng);
			oumousezw_p = p.cast<float>();
			if (window1->visible())window1->setVisible(false);
		}
		return false;
	}

	virtual void draw(NVGcontext * ctx) {

		/* Draw the user interface */
		Screen::draw(ctx);
	}

	void FPS(double time) {
		numFrames++;
		u_frames++;
		if (time - lastFpsTime > frameRateSmoothing) {

			fps = (int)(numFrames / (time - lastFpsTime));
			numFrames = 0;
			lastFpsTime = time;
		}
	}

	virtual void drawContents() {
		using namespace nanogui;
		bool resize_to_copy = false; //if framebuffer size not same to screen size(when option zoom enabled)
		int c_u_id = 0; //uniform index to store without calling glGetUniformLocation every time

		reset_x();
		Vector2i tsxz = size();
		Vector2i tsxz_orig = tsxz;
		float txxc = tsxz[1];
		//resize to 16/9
		if ((int)(tsxz[0] * (float)9 / 16) < tsxz[1]) {
			tsxz[1] = (int)(tsxz[0] * (float)9 / 16);
		}
		tsxz_orig = tsxz;
		//Vector2i tmpval=Vector2i(1,1);
		scale_calc_all(tsxz, tsxz.cast<float>());
		resize_to_copy = (tsxz[0] != tsxz_orig[0]) || (tsxz[1] != tsxz_orig[1]);
		if ((qz->selectedIndex() > 3) && ((tsxz[0] > tsxz_orig[0]) || (tsxz[1] > tsxz_orig[1]))) {
			glViewport(0, 0, tsxz[0] - 0.01, tsxz[1] - 0.01); //WebGL or WASM...maybe bug, without -0.01 does not work
		}
		else {
			//if (qz->selectedIndex() <= 3) {
			glViewport(0, 0, tsxz_orig[0], tsxz_orig[1]);
			//}
		}
		Eigen::Vector2i tsxz_t = tsxz_orig;
		umouse = scale_calc_all(tsxz_t, oumouse_p);
		tsxz_t = tsxz_orig;
		umousezw = scale_calc_all(tsxz_t, oumousezw_p);
		if (qz->selectedIndex() == 3) {
		umouse[1] = oumouse_p[1] - (txxc - tsxz[1]);
		umouse[1] = tsxz[1] - umouse[1];
		umousezw[1] = oumousezw_p[1] - (txxc - tsxz[1]);
		umousezw[1] = tsxz[1] - umousezw[1];
		}
        res_display->setValue(to_string(tsxz[0]) + " x " + to_string(tsxz[1]));
        res_display->setTooltip("Screen " + to_string(tsxz_orig[0]) + " x " + to_string(tsxz_orig[1]));

        /*
                debugw->set_text_on_id("orig fb", to_string(tsxz_orig[0]), to_string(tsxz_orig[1]), 0);
                debugw->set_text_on_id("resized fb", to_string(tsxz[0]), to_string(tsxz[1]), 1);
                debugw->set_text_on_id("mouse", to_string(umouse[0]), to_string(umouse[1]), 2);

                bool ifc = isfullscreen();
                debugw->set_text_on_id("is fullscreen", ifc ? "true" : "false", "----", 3);

                debugw->set_text_on_id("fps", to_string(fps), "--", 5);

                debugw->set_text_on_id("box2d numobj", to_string(boxhelper->numobj), "--", 7);
                debugw->set_text_on_id("box2d onscr_obj", to_string(boxhelper->num_onscr_obj), "--", 8);


                for (int i = 0; i < boxhelper->numobj; i++) {
                    if (i > 70)break;
                    debugw->set_text_on_id("box2d " + to_string(i),
                            "x " + to_string((int) boxhelper->s_bodyes[i].x) + " y " +
                            to_string((int) boxhelper->s_bodyes[i].y), to_string((int) boxhelper->m_bodyes[i].angle), 10 + i);
                }
         */
        FPS(glfwGetTime());
        double loctime = glfwGetTime() - ptime - ex_pause_skip_time;

        if (paused) {
            loctime = pto - ptime - ex_pause_skip_time;
        } else if ((p_on_tab->checked())&&(loctime - endframetime > FPSmin)) {
            ex_pause_skip_time += loctime - endframetime - (float) 1 / 60;
            loctime = glfwGetTime() - ptime - ex_pause_skip_time;
        }

        update_vals(loctime);

        //debugw->set_text_on_id("time", to_string(loctime), "----", 4);


        Vector2f screenSize = tsxz.cast<float>();
        Vector2f screenSize_orig = tsxz_orig.cast<float>();
        glDisable(GL_BLEND); //framebuffer

        /*
                //templates

                //texture
                glActiveTexture(GL_TEXTURE0 + 0);
                glBindTexture(GL_TEXTURE_2D, texturesData[indexfx[0]].first.texture());
                mShader.setUniform("u_texture1", 0);

                //framebuffer
                fb1.bind();
                fbother2.bindtexture(tsxz, 0);
                mShader.setUniform("u_texture1", 0);
                mShader.drawIndexed(GL_TRIANGLES, 0, 2);
                fb1.release();
         */

doublefbo_ctrl=!doublefbo_ctrl;
if(doublefbo_ctrl)doublefbo=0;else doublefbo=1;
        //fix first black frame
        if (scrch) {
            if (filtering->checked()) {
                pause_fb_linear.bindtexture(tsxz, 0);
                nvfxaa_fb_linear.bindtexture(tsxz, 0);
                copy_fb_linear.bindtexture(tsxz, 0);
                copy_fb_linear2.bindtexture(tsxz, 0);
                copy_fb_linear3.bindtexture(tsxz, 0);
            } else {
                pause_fb_near.bindtexture(tsxz, 0);
                nvfxaa_fb_near.bindtexture(tsxz, 0);
                copy_fb_near.bindtexture(tsxz, 0);
                copy_fb_near2.bindtexture(tsxz, 0);
                copy_fb_near3.bindtexture(tsxz, 0);
            }
        }

        if ((qz->selectedIndex() > 3)&&((tsxz[0] > tsxz_orig[0]) || (tsxz[1] > tsxz_orig[1]))) {
            glViewport(0, 0, tsxz[0] - 0.01, tsxz[1] - 0.01); //WebGL or WASM...maybe bug, without -0.01 does not work
        } else {
            glViewport(0, 0, tsxz_orig[0], tsxz_orig[1]);
        }

        /*if (filtering->checked())grays_fb_linear.bind();
        else grays_fb_near.bind();
        grays_sh.bind();
        if (filtering->checked())gmap_textured_fb_linear.bindtexture(tsxz, 0, true); //gmap_box2d_fb_linear for sdf
        else gmap_textured_fb_near.bindtexture(tsxz, 0, true);
        c_u_id = 0;
        grays_sh.setUniform("u_texture1", 0, c_u_id++);
        grays_sh.setUniform("u_resolution", screenSize, c_u_id++);
        grays_sh.setUniform("u_time", (float) loctime, c_u_id++);
        grays_sh.drawIndexed(GL_TRIANGLES, 0, 2);
        if (filtering->checked())grays_fb_linear.release();
        else grays_fb_near.release();
         */


        if (filtering->checked())bufA_fb_linear[doublefbo].bind();
        else bufA_fb_near[doublefbo].bind();
        bufA.bind();
        c_u_id = 0;

        bufA.setUniform("u_time", (float) loctime, c_u_id++);
        bufA.setUniform("u_resolution", screenSize, c_u_id++);
        bufA.setUniform("u_mouse", Vector4f(umouse.x(),umouse.y(),umousezw.x(),umousezw.y()), c_u_id++);
		bufA.setUniform("u_keys", Vector4f(KEY_LEFT,KEY_UP,KEY_RIGHT,KEY_DOWN), c_u_id++);
		bufA.setUniform("u_frames", u_frames, c_u_id++);
        if (filtering->checked())bufA_fb_linear[std::abs(doublefbo-1)].bindtexture(tsxz, 0, true); else bufA_fb_near[std::abs(doublefbo-1)].bindtexture(tsxz, 0, true);
        bufA.setUniform("u_texture1", 0);
        if (filtering->checked())bufB_fb_linear[std::abs(doublefbo-1)].bindtexture(tsxz, 1, true); else bufB_fb_near[std::abs(doublefbo-1)].bindtexture(tsxz, 1, true);
        bufA.setUniform("u_texture2", 1);
        if (filtering->checked())bufC_fb_linear[std::abs(doublefbo-1)].bindtexture(tsxz, 2, true); else bufC_fb_near[std::abs(doublefbo-1)].bindtexture(tsxz, 2, true);
        bufA.setUniform("u_texture3", 2);
        if (filtering->checked())bufD_fb_linear[std::abs(doublefbo-1)].bindtexture(tsxz, 3, true); else bufD_fb_near[std::abs(doublefbo-1)].bindtexture(tsxz, 3, true);
        bufA.setUniform("u_texture4", 3);
        glActiveTexture(GL_TEXTURE0 + 4);
        glBindTexture(GL_TEXTURE_2D, texturesData[indexfx[0]].first.texture());
        bufA.setUniform("u_tex_texture1", 4);
        glActiveTexture(GL_TEXTURE0 + 5);
        glBindTexture(GL_TEXTURE_2D, texturesData[indexfx[1]].first.texture());
        bufA.setUniform("u_tex_texture2", 5);
        glActiveTexture(GL_TEXTURE0 + 6);
        glBindTexture(GL_TEXTURE_2D, texturesData[indexfx[2]].first.texture());
        bufA.setUniform("u_tex_texture3", 6);
        glActiveTexture(GL_TEXTURE0 + 7);
        glBindTexture(GL_TEXTURE_2D, texturesData[indexfx[3]].first.texture());
        bufA.setUniform("u_tex_texture4", 7);
        bufA.drawIndexed(GL_TRIANGLES, 0, 2);

        if (filtering->checked())bufA_fb_linear[doublefbo].release();
        else bufA_fb_near[doublefbo].release();
        
        if (filtering->checked())bufB_fb_linear[doublefbo].bind();
        else bufB_fb_near[doublefbo].bind();
        bufB.bind();
        c_u_id = 0;
        bufB.setUniform("u_time", (float) loctime, c_u_id++);
        bufB.setUniform("u_resolution", screenSize, c_u_id++);
        bufB.setUniform("u_mouse", Vector4f(umouse.x(),umouse.y(),umousezw.x(),umousezw.y()), c_u_id++);
		bufB.setUniform("u_keys", Vector4f(KEY_LEFT, KEY_UP, KEY_RIGHT, KEY_DOWN), c_u_id++);
		bufB.setUniform("u_frames", u_frames, c_u_id++);
        if (filtering->checked())bufA_fb_linear[doublefbo].bindtexture(tsxz, 0, true); else bufA_fb_near[doublefbo].bindtexture(tsxz, 0, true);
        bufB.setUniform("u_texture1", 0);
        if (filtering->checked())bufB_fb_linear[std::abs(doublefbo-1)].bindtexture(tsxz, 1, true); else bufB_fb_near[std::abs(doublefbo-1)].bindtexture(tsxz, 1, true);
        bufB.setUniform("u_texture2", 1);
        if (filtering->checked())bufC_fb_linear[std::abs(doublefbo-1)].bindtexture(tsxz, 2, true); else bufC_fb_near[std::abs(doublefbo-1)].bindtexture(tsxz, 2, true);
        bufB.setUniform("u_texture3", 2);
        if (filtering->checked())bufD_fb_linear[std::abs(doublefbo-1)].bindtexture(tsxz, 3, true); else bufD_fb_near[std::abs(doublefbo-1)].bindtexture(tsxz, 3, true);
        bufB.setUniform("u_texture4", 3);
        glActiveTexture(GL_TEXTURE0 + 4);
        glBindTexture(GL_TEXTURE_2D, texturesData[indexfx[0]].first.texture());
        bufB.setUniform("u_tex_texture1", 4);
        glActiveTexture(GL_TEXTURE0 + 5);
        glBindTexture(GL_TEXTURE_2D, texturesData[indexfx[1]].first.texture());
        bufB.setUniform("u_tex_texture2", 5);
        glActiveTexture(GL_TEXTURE0 + 6);
        glBindTexture(GL_TEXTURE_2D, texturesData[indexfx[2]].first.texture());
        bufB.setUniform("u_tex_texture3", 6);
        glActiveTexture(GL_TEXTURE0 + 7);
        glBindTexture(GL_TEXTURE_2D, texturesData[indexfx[3]].first.texture());
        bufB.setUniform("u_tex_texture4", 7);
        bufB.drawIndexed(GL_TRIANGLES, 0, 2);

        if (filtering->checked())bufB_fb_linear[doublefbo].release();
        else bufB_fb_near[doublefbo].release();
        
        if (filtering->checked())bufC_fb_linear[doublefbo].bind();
        else bufC_fb_near[doublefbo].bind();
        bufC.bind();
        c_u_id = 0;
        bufC.setUniform("u_time", (float) loctime, c_u_id++);
        bufC.setUniform("u_resolution", screenSize, c_u_id++);
        bufC.setUniform("u_mouse", Vector4f(umouse.x(),umouse.y(),umousezw.x(),umousezw.y()), c_u_id++);
		bufC.setUniform("u_keys", Vector4f(KEY_LEFT, KEY_UP, KEY_RIGHT, KEY_DOWN), c_u_id++);
		bufC.setUniform("u_frames", u_frames, c_u_id++);
        if (filtering->checked())bufA_fb_linear[doublefbo].bindtexture(tsxz, 0, true); else bufA_fb_near[doublefbo].bindtexture(tsxz, 0, true);
        bufC.setUniform("u_texture1", 0);
        if (filtering->checked())bufB_fb_linear[doublefbo].bindtexture(tsxz, 1, true); else bufB_fb_near[doublefbo].bindtexture(tsxz, 1, true);
        bufC.setUniform("u_texture2", 1);
        if (filtering->checked())bufC_fb_linear[std::abs(doublefbo-1)].bindtexture(tsxz, 2, true); else bufC_fb_near[std::abs(doublefbo-1)].bindtexture(tsxz, 2, true);
        bufC.setUniform("u_texture3", 2);
        if (filtering->checked())bufD_fb_linear[std::abs(doublefbo-1)].bindtexture(tsxz, 3, true); else bufD_fb_near[std::abs(doublefbo-1)].bindtexture(tsxz, 3, true);
        bufC.setUniform("u_texture4", 3);
        glActiveTexture(GL_TEXTURE0 + 4);
        glBindTexture(GL_TEXTURE_2D, texturesData[indexfx[0]].first.texture());
        bufC.setUniform("u_tex_texture1", 4);
        glActiveTexture(GL_TEXTURE0 + 5);
        glBindTexture(GL_TEXTURE_2D, texturesData[indexfx[1]].first.texture());
        bufC.setUniform("u_tex_texture2", 5);
        glActiveTexture(GL_TEXTURE0 + 6);
        glBindTexture(GL_TEXTURE_2D, texturesData[indexfx[2]].first.texture());
        bufC.setUniform("u_tex_texture3", 6);
        glActiveTexture(GL_TEXTURE0 + 7);
        glBindTexture(GL_TEXTURE_2D, texturesData[indexfx[3]].first.texture());
        bufC.setUniform("u_tex_texture4", 7);
        bufC.drawIndexed(GL_TRIANGLES, 0, 2);

        if (filtering->checked())bufC_fb_linear[doublefbo].release();
        else bufC_fb_near[doublefbo].release();

        if (filtering->checked())bufD_fb_linear[doublefbo].bind();
        else bufD_fb_near[doublefbo].bind();
        bufD.bind();
        c_u_id = 0;
        bufD.setUniform("u_time", (float) loctime, c_u_id++);
        bufD.setUniform("u_resolution", screenSize, c_u_id++);
        bufD.setUniform("u_mouse", Vector4f(umouse.x(),umouse.y(),umousezw.x(),umousezw.y()), c_u_id++);
		bufD.setUniform("u_keys", Vector4f(KEY_LEFT, KEY_UP, KEY_RIGHT, KEY_DOWN), c_u_id++);
		bufD.setUniform("u_frames", u_frames, c_u_id++);
        if (filtering->checked())bufA_fb_linear[doublefbo].bindtexture(tsxz, 0, true); else bufA_fb_near[doublefbo].bindtexture(tsxz, 0, true);
        bufD.setUniform("u_texture1", 0);
        if (filtering->checked())bufB_fb_linear[doublefbo].bindtexture(tsxz, 1, true); else bufB_fb_near[doublefbo].bindtexture(tsxz, 1, true);
        bufD.setUniform("u_texture2", 1);
        if (filtering->checked())bufC_fb_linear[doublefbo].bindtexture(tsxz, 2, true); else bufC_fb_near[doublefbo].bindtexture(tsxz, 2, true);
        bufD.setUniform("u_texture3", 2);
        if (filtering->checked())bufD_fb_linear[std::abs(doublefbo-1)].bindtexture(tsxz, 3, true); else bufD_fb_near[std::abs(doublefbo-1)].bindtexture(tsxz, 3, true);
        bufD.setUniform("u_texture4", 3);
        glActiveTexture(GL_TEXTURE0 + 4);
        glBindTexture(GL_TEXTURE_2D, texturesData[indexfx[0]].first.texture());
        bufD.setUniform("u_tex_texture1", 4);
        glActiveTexture(GL_TEXTURE0 + 5);
        glBindTexture(GL_TEXTURE_2D, texturesData[indexfx[1]].first.texture());
        bufD.setUniform("u_tex_texture2", 5);
        glActiveTexture(GL_TEXTURE0 + 6);
        glBindTexture(GL_TEXTURE_2D, texturesData[indexfx[2]].first.texture());
        bufD.setUniform("u_tex_texture3", 6);
        glActiveTexture(GL_TEXTURE0 + 7);
        glBindTexture(GL_TEXTURE_2D, texturesData[indexfx[3]].first.texture());
        bufD.setUniform("u_tex_texture4", 7);
        bufD.drawIndexed(GL_TRIANGLES, 0, 2);

        if (filtering->checked())bufD_fb_linear[doublefbo].release();
        else bufD_fb_near[doublefbo].release();
        

        if (paused) {
            if (filtering->checked())pause_fb_linear.bind();
            else pause_fb_near.bind();
        } else if (fxaa_box->checked()) {
            if (filtering->checked())nvfxaa_fb_linear.bind();
            else nvfxaa_fb_near.bind();
        } else
            if (resize_to_copy) {
            if (filtering->checked())copy_fb_linear.bind();
            else copy_fb_near.bind();
        }

        main_screen.bind();
        c_u_id = 0;
        main_screen.setUniform("u_time", (float) loctime, c_u_id++);
        main_screen.setUniform("u_resolution", screenSize, c_u_id++);
        main_screen.setUniform("u_mouse", Vector4f(umouse.x(),umouse.y(),umousezw.x(),umousezw.y()), c_u_id++);
		main_screen.setUniform("u_keys", Vector4f(KEY_LEFT, KEY_UP, KEY_RIGHT, KEY_DOWN), c_u_id++);
		main_screen.setUniform("u_frames", u_frames, c_u_id++);
        if (filtering->checked())bufA_fb_linear[doublefbo].bindtexture(tsxz, 0, true); else bufA_fb_near[doublefbo].bindtexture(tsxz, 0, true);
        main_screen.setUniform("u_texture1", 0);
        if (filtering->checked())bufB_fb_linear[doublefbo].bindtexture(tsxz, 1, true); else bufB_fb_near[doublefbo].bindtexture(tsxz, 1, true);
        main_screen.setUniform("u_texture2", 1);
        if (filtering->checked())bufC_fb_linear[doublefbo].bindtexture(tsxz, 2, true); else bufC_fb_near[doublefbo].bindtexture(tsxz, 2, true);
        main_screen.setUniform("u_texture3", 2);
        if (filtering->checked())bufD_fb_linear[doublefbo].bindtexture(tsxz, 3, true); else bufD_fb_near[doublefbo].bindtexture(tsxz, 3, true);
        main_screen.setUniform("u_texture4", 3);
        glActiveTexture(GL_TEXTURE0 + 4);
        glBindTexture(GL_TEXTURE_2D, texturesData[indexfx[0]].first.texture());
        main_screen.setUniform("u_tex_texture1", 4);
        glActiveTexture(GL_TEXTURE0 + 5);
        glBindTexture(GL_TEXTURE_2D, texturesData[indexfx[1]].first.texture());
        main_screen.setUniform("u_tex_texture2", 5);
        glActiveTexture(GL_TEXTURE0 + 6);
        glBindTexture(GL_TEXTURE_2D, texturesData[indexfx[2]].first.texture());
        main_screen.setUniform("u_tex_texture3", 6);
        glActiveTexture(GL_TEXTURE0 + 7);
        glBindTexture(GL_TEXTURE_2D, texturesData[indexfx[3]].first.texture());
        main_screen.setUniform("u_tex_texture4", 7);
        main_screen.drawIndexed(GL_TRIANGLES, 0, 2);


        if (paused) {
            if (filtering->checked())pause_fb_linear.release();
            else pause_fb_near.release();
        } else if (fxaa_box->checked()) {
            if (filtering->checked())nvfxaa_fb_linear.release();
            else nvfxaa_fb_near.release();
        } else if (resize_to_copy) {
            if (filtering->checked())copy_fb_linear.release();
            else copy_fb_near.release();
        }

        if (paused) {
            if (fxaa_box->checked()) {
                if (filtering->checked())nvfxaa_fb_linear.bind();
                else nvfxaa_fb_near.bind();
            } else if (resize_to_copy) {
                if (filtering->checked())copy_fb_linear.bind();
                else copy_fb_near.bind();
            }
            pause_sh.bind();
            if (filtering->checked())pause_fb_linear.bindtexture(tsxz, 0, true);
            else pause_fb_near.bindtexture(tsxz, 0, true);
            c_u_id = 0;
            pause_sh.setUniform("u_texture1", 0, c_u_id++);
            pause_sh.setUniform("u_resolution", screenSize, c_u_id++);
            pause_sh.drawIndexed(GL_TRIANGLES, 0, 2);
            if (fxaa_box->checked()) {
                if (filtering->checked())nvfxaa_fb_linear.release();
                else nvfxaa_fb_near.release();
            } else if (resize_to_copy) {
                if (filtering->checked())copy_fb_linear.release();
                else copy_fb_near.release();
            }
        }

        //Copy Framebuffers
        // <FROM_FB>.copyto(copy_fb.getFramebuffer());

        //shader copy
        /*copy_fb.bind();
        cp_sh.bind();
            <FROM_FB>.bindtexture(tsxz, 0, true);
            cp_sh.setUniform("u_texture1", 0);
            cp_sh.setUniform("u_resolution", screenSize);
            cp_sh.drawIndexed(GL_TRIANGLES, 0, 2);
        copy_fb.release();
         */

        //example
        /*copy_fb.bind();
        cp_sh.bind();
        nvfxaa_fb.bindtexture(tsxz, 0, true);
        cp_sh.setUniform("u_texture1", 0);
        cp_sh.setUniform("u_resolution", screenSize);
        cp_sh.drawIndexed(GL_TRIANGLES, 0, 2);
        copy_fb.release();*/

        //nvfxaa_fb.copyto(copy_fb.getFramebuffer());

        if (fxaa_box->checked()) {

            if (filtering->checked())copy_fb_linear2.bind();
            else copy_fb_near2.bind();
            bloom_h_sh.bind();
            if (filtering->checked())nvfxaa_fb_linear.bindtexture(tsxz, 0, true);
            else nvfxaa_fb_near.bindtexture(tsxz, 0, true);
            c_u_id = 0;
            bloom_h_sh.setUniform("u_texture1", 0, c_u_id++);
            bloom_h_sh.setUniform("u_resolution", screenSize, c_u_id++);
            bloom_h_sh.drawIndexed(GL_TRIANGLES, 0, 2);
            if (filtering->checked())copy_fb_linear2.release();
            else copy_fb_near2.release();

            if (filtering->checked())copy_fb_linear3.bind();
            else copy_fb_near3.bind();
            bloom_v_sh.bind();
            if (filtering->checked())copy_fb_linear2.bindtexture(tsxz, 0, true);
            else copy_fb_near2.bindtexture(tsxz, 0, true);
            c_u_id = 0;
            bloom_v_sh.setUniform("u_texture1", 0, c_u_id++);
            bloom_v_sh.setUniform("u_resolution", screenSize, c_u_id++);
            bloom_v_sh.drawIndexed(GL_TRIANGLES, 0, 2);
            if (filtering->checked())copy_fb_linear3.release();
            else copy_fb_near3.release();

            if (filtering->checked())copy_fb_linear2.bind();
            else copy_fb_near2.bind();
            bloom_p_sh.bind();
            if (filtering->checked())nvfxaa_fb_linear.bindtexture(tsxz, 0, true);
            else nvfxaa_fb_near.bindtexture(tsxz, 0, true);
            c_u_id = 0;
            bloom_p_sh.setUniform("u_texture1", 0, c_u_id++);
            if (filtering->checked())copy_fb_linear3.bindtexture(tsxz, 1, true);
            else copy_fb_near3.bindtexture(tsxz, 1, true);
            bloom_p_sh.setUniform("u_texture2", 1, c_u_id++);
            bloom_p_sh.setUniform("u_resolution", screenSize, c_u_id++);
            bloom_p_sh.drawIndexed(GL_TRIANGLES, 0, 2);
            if (filtering->checked())copy_fb_linear2.release();
            else copy_fb_near2.release();

            nvfxaa_sh.bind();
            if (filtering->checked())copy_fb_linear2.bindtexture(tsxz, 0, true);
            else copy_fb_near2.bindtexture(tsxz, 0, true);
            c_u_id = 0;
            nvfxaa_sh.setUniform("u_texture1", 0, c_u_id++);
            if (resize_to_copy) {
                nvfxaa_sh.setUniform("u_resolution", screenSize_orig, c_u_id++);
            } else nvfxaa_sh.setUniform("u_resolution", screenSize, c_u_id++);
            nvfxaa_sh.drawIndexed(GL_TRIANGLES, 0, 2);
        } else if (resize_to_copy) {
            cp_sh.bind();
            if (filtering->checked())copy_fb_linear.bindtexture(tsxz, 0, true);
            else copy_fb_near.bindtexture(tsxz, 0, true);
            c_u_id = 0;
            cp_sh.setUniform("u_texture1", 0, c_u_id++);
            cp_sh.setUniform("u_resolution", screenSize_orig, c_u_id++);
            cp_sh.drawIndexed(GL_TRIANGLES, 0, 2);
        }

        resetx = false;

        if (glfwGetTime() - ptime - ex_pause_skip_time > 300000) {
            if (!paused)resetx = true;
        }


        scrch = (!(((osize - tsxz).norm() == 0)));
        osize = tsxz;
        if ((dxo > 10)&&(!scrch)&&(!passfirstframe)) {
            displaycanvas();
            passfirstframe = true;
        } else {
            dxo++;
        }
        if (!paused) {

            endframetime = glfwGetTime() - ptime - ex_pause_skip_time;
        }

		//click once
		KEY_LEFT = false;
		KEY_UP = false;
		KEY_RIGHT = false;
		//KEY_DOWN = false;

        //glfwPostEmptyEvent(); //win

    }
private:

    bool paused = false; //game paused
    bool resetx = true; //reset pressed
    bool fadestop = false; //keep buttons visible first fewsec, funciton fadebuttons

    double pto = 0; //time when pause clicked
    double ptime = 0; //shift time of all pause
    float FPSmin = 1; //min FPS to detect when this frame rendering paused by something
    int max_fb_size = 4096; //max size of screen

    int indexfx[8] = {0}; //textures indexed fixed

    bool ffm = false; //mouse left click


    Eigen::Vector2i osize = Eigen::Vector2i(1280, 720);
    bool scrch = true; //screen resolution changed

    int dxo = 0; //to pass first 10 frames
    bool passfirstframe = false; //pause passed for first few frames

    //FPS
    double lastFpsTime = 0;
    double frameRateSmoothing = 1.0;
    double numFrames = 0;
    int u_frames = 0;
    double fps = 60;

    double endframetime = 0;
    double ex_pause_skip_time = 0; //time when window hiden somehow(fps < FPSmin)
    
    bool doublefbo_ctrl=true;
    int doublefbo=0;

    nanogui::GLShader main_screen;
    nanogui::GLShader bufA;
    nanogui::GLShader bufB;
    nanogui::GLShader bufC;
    nanogui::GLShader bufD
    ;
    nanogui::GLShader pause_sh;
    nanogui::GLShader nvfxaa_sh;

    nanogui::GLShader bloom_h_sh;
    nanogui::GLShader bloom_v_sh;
    nanogui::GLShader bloom_p_sh;

    nanogui::GLFramebuffer bufA_fb_linear[2];
    nanogui::GLFramebuffer bufB_fb_linear[2];
    nanogui::GLFramebuffer bufC_fb_linear[2];
    nanogui::GLFramebuffer bufD_fb_linear[2];

    nanogui::GLFramebuffer bufA_fb_near[2];
    nanogui::GLFramebuffer bufB_fb_near[2];
    nanogui::GLFramebuffer bufC_fb_near[2];
    nanogui::GLFramebuffer bufD_fb_near[2];
    
    nanogui::GLFramebuffer pause_fb_near;
    nanogui::GLFramebuffer nvfxaa_fb_near;

    nanogui::GLFramebuffer pause_fb_linear;
    nanogui::GLFramebuffer nvfxaa_fb_linear;
    
    nanogui::GLShader cp_sh;
    nanogui::GLFramebuffer copy_fb_near;
    nanogui::GLFramebuffer copy_fb_linear;

    nanogui::GLFramebuffer copy_fb_near2;
    nanogui::GLFramebuffer copy_fb_linear2;
    
    nanogui::GLFramebuffer copy_fb_near3;
    nanogui::GLFramebuffer copy_fb_linear3;


    void settextures();
    void initall();
    void update_vals(double loctime);
    void setupdebug();
    bool isfullscreen();
    void fadebuttons(float time);
    void displaycanvas();
    void hidecanvas();
    void reset_x();
    Eigen::Vector2f scale_calc(Eigen::Vector2f tsxz);
    Eigen::Vector2f scale_calc_all(Eigen::Vector2i &tsxz, Eigen::Vector2f umouse);
    Eigen::Vector2f umouse;
    Eigen::Vector2f umousezw;
    nanogui::MatrixXu polygon_indices(int t);
    nanogui::MatrixXf polygon_positions(int t, Eigen::Vector2f center, Eigen::Vector2f screen_prop, float size_of);
    void init_glsl_s();

    using imagesDataType = vector<pair<GLTexture, GLTexture::handleType>>;
    imagesDataType mImagesData;
    imagesDataType texturesData;
    int mCurrentImage;
};

void Ccgm::init_glsl_s() {

    using namespace nanogui;

for(int i=0;i<2;i++){
    bufA_fb_linear[i].inittexture(Vector2i(1280, 720), false);
    bufB_fb_linear[i].inittexture(Vector2i(1280, 720), false);
    bufC_fb_linear[i].inittexture(Vector2i(1280, 720), false);
    bufD_fb_linear[i].inittexture(Vector2i(1280, 720), false);

    bufA_fb_near[i].inittexture(Vector2i(1280, 720), true);
    bufB_fb_near[i].inittexture(Vector2i(1280, 720), true);
    bufC_fb_near[i].inittexture(Vector2i(1280, 720), true);
    bufD_fb_near[i].inittexture(Vector2i(1280, 720), true);
}
    pause_fb_near.inittexture(Vector2i(1280, 720), true);
    nvfxaa_fb_near.inittexture(Vector2i(1280, 720), true);
    pause_fb_linear.inittexture(Vector2i(1280, 720), false);
    nvfxaa_fb_linear.inittexture(Vector2i(1280, 720), false);
    copy_fb_near.inittexture(Vector2i(1280, 720), true);
    copy_fb_near2.inittexture(Vector2i(1280, 720), true);
    copy_fb_linear.inittexture(Vector2i(1280, 720), false);
    copy_fb_linear2.inittexture(Vector2i(1280, 720), false);
    copy_fb_near3.inittexture(Vector2i(1280, 720), true);
    copy_fb_linear3.inittexture(Vector2i(1280, 720), false);

    main_screen.initFromFiles("main_screen", "shaders/mainv.glsl", "shaders/main_screen.glsl");
    bufA.initFromFiles("bufA", "shaders/mainv.glsl", "shaders/bufA.glsl");
    bufB.initFromFiles("bufB", "shaders/mainv.glsl", "shaders/bufB.glsl");
    bufC.initFromFiles("bufC", "shaders/mainv.glsl", "shaders/bufC.glsl");
    bufD.initFromFiles("bufD", "shaders/mainv.glsl", "shaders/bufD.glsl");
    pause_sh.initFromFiles("pause_sh", "shaders/mainv.glsl", "shaders/pause.glsl");
    nvfxaa_sh.initFromFiles("mvfxaa_sh", "shaders/mainv.glsl", "shaders/nv_fxaa.glsl");
    cp_sh.initFromFiles("cp_sh", "shaders/mainv.glsl", "shaders/cp.glsl");
    bloom_h_sh.initFromFiles("bloom_h_sh", "shaders/mainv.glsl", "shaders/bloom_h.glsl");
    bloom_v_sh.initFromFiles("bloom_v_sh", "shaders/mainv.glsl", "shaders/bloom_v.glsl");
    bloom_p_sh.initFromFiles("bloom_p_sh", "shaders/mainv.glsl", "shaders/bloom_p.glsl");


    MatrixXu indices = polygon_indices(B_RECT);

    MatrixXf positions = polygon_positions(B_RECT, Eigen::Vector2f(0., 0.), Eigen::Vector2f(1., 1.), 1.);
    Vector2f screenSize = size().cast<float>();

    pause_fb_linear.bind();
    pause_sh.bind();
    pause_sh.uploadIndices(indices);
    pause_sh.uploadAttrib("position", positions);
    pause_sh.setUniform("u_resolution", screenSize);
    pause_fb_linear.release();

    nvfxaa_fb_linear.bind();
    nvfxaa_sh.bind();
    nvfxaa_sh.uploadIndices(indices);
    nvfxaa_sh.uploadAttrib("position", positions);
    nvfxaa_sh.setUniform("u_resolution", screenSize);
    nvfxaa_fb_linear.release();

    copy_fb_linear.bind();
    cp_sh.bind();
    cp_sh.uploadIndices(indices);
    cp_sh.uploadAttrib("position", positions);
    cp_sh.setUniform("u_resolution", screenSize);
    copy_fb_linear.release();

    copy_fb_linear2.bind();
    bloom_h_sh.bind();
    bloom_h_sh.uploadIndices(indices);
    bloom_h_sh.uploadAttrib("position", positions);
    bloom_h_sh.setUniform("u_resolution", screenSize);

    bloom_v_sh.bind();
    bloom_v_sh.uploadIndices(indices);
    bloom_v_sh.uploadAttrib("position", positions);
    bloom_v_sh.setUniform("u_resolution", screenSize);

    bloom_p_sh.bind();
    bloom_p_sh.uploadIndices(indices);
    bloom_p_sh.uploadAttrib("position", positions);
    bloom_p_sh.setUniform("u_resolution", screenSize);
    copy_fb_linear2.release();

    bufA_fb_linear[doublefbo].bind();
    bufA.bind();
    bufA.uploadIndices(indices);
    bufA.uploadAttrib("position", positions);
    bufA.setUniform("u_resolution", screenSize);
    bufA_fb_linear[doublefbo].release();

    bufB_fb_linear[doublefbo].bind();
    bufB.bind();
    bufB.uploadIndices(indices);
    bufB.uploadAttrib("position", positions);
    bufB.setUniform("u_resolution", screenSize);
    bufB_fb_linear[doublefbo].release();

    bufC_fb_linear[doublefbo].bind();
    bufC.bind();
    bufC.uploadIndices(indices);
    bufC.uploadAttrib("position", positions);
    bufC.setUniform("u_resolution", screenSize);
    bufC_fb_linear[doublefbo].release();

    bufD_fb_linear[doublefbo].bind();
    bufD.bind();
    bufD.uploadIndices(indices);
    bufD.uploadAttrib("position", positions);
    bufD.setUniform("u_resolution", screenSize);
    bufD_fb_linear[doublefbo].release();

    main_screen.bind();
    main_screen.uploadIndices(indices);
    main_screen.uploadAttrib("position", positions);
    main_screen.setUniform("u_resolution", screenSize);
}

void Ccgm::reset_x() {
    if (resetx) {
        max_fb_size_w->setValue(4096);
        qz->setSelectedIndex(3);
        p_on_tab->setChecked(true);
        ptime = glfwGetTime() - ex_pause_skip_time;
        endframetime = 0;
    }
}

bool Ccgm::isfullscreen() {
    EmscriptenFullscreenChangeEvent fsce;
    EMSCRIPTEN_RESULT ret = emscripten_get_fullscreen_status(&fsce);

    return fsce.isFullscreen;
}

void Ccgm::hidecanvas() {

    emscripten_run_script("document.getElementById('spinner').hidden = false;document.getElementById('imloader').style.display=\"\"");
}

void Ccgm::displaycanvas() {

    emscripten_run_script("resize_glfw_wasm()");
    emscripten_run_script("document.getElementById('spinner').hidden = true;document.getElementById('imloader').style.display=\"none\"");
}

void Ccgm::settextures() {
    using namespace nanogui;
    vector<pair<int, string>> textres = loadImageDirectory(mNVGContext, "textures");
    string resourcesFolderPath("./");
    int i = 0;
    for (auto& texturex : textres) {
        GLTexture texture(texturex.second);

        //its fixes for "random non sorted file names in readdir(loadImageDirectory use it)"
        
        if (texturex.second == ("textures/tex1"))
            indexfx[0] = i;
        if (texturex.second == ("textures/tex2"))
            indexfx[1] = i;
        if (texturex.second == ("textures/tex3"))
            indexfx[2] = i;
        if (texturex.second == ("textures/tex4"))
            indexfx[3] = i;
        //bool fmt = texturex.second == ("textures/tx6") || texturex.second == ("textures/tx7");
        auto data = texture.load(resourcesFolderPath + texturex.second + ".png", false, false);
        texturesData.emplace_back(std::move(texture), std::move(data));
        i++;
    }
}

void Ccgm::fadebuttons(float time) {
    if (!(cb->checked()))return;
    using namespace nanogui;
    if ((!fadestop)) {
        if (time < 3) {
            b->setVisible(true);
            b1->setVisible(true);
            b2->setVisible(true);
            b3->setVisible(true);
            return;
        } else {
            b->setVisible(false);
            b1->setVisible(false);
            b2->setVisible(false);
            b3->setVisible(false);

        }
    }
}

nanogui::MatrixXu Ccgm::polygon_indices(int t) {
    using namespace nanogui;
    switch (t) {
            /*case B_TRI:
            {
                MatrixXu indices(3, 2);
                indices.col(0) << 0, 1, 2;
                indices.col(1) << 2, 3, 0;
                return indices;
            }*/
        case B_RECT:
        {
            MatrixXu indices(3, 2);
            indices.col(0) << 0, 1, 2;
            indices.col(1) << 2, 3, 0;
            return indices;
        }
        default:
        { //B_CIRCLE
            MatrixXu indices(3, B_CIRCLE_vertexCount);

            for (int i = 0; i < B_CIRCLE_vertexCount; i++) {

                indices(0, i) = 0;
                indices(1, i) = (i + 1) % B_CIRCLE_vertexCount;
                indices(2, i) = (i + 2) % B_CIRCLE_vertexCount;
            }
            return indices;
        }
    }
}

nanogui::MatrixXf Ccgm::polygon_positions(int t, Eigen::Vector2f center, Eigen::Vector2f screen_prop, float size_of) {
    using namespace nanogui;
    switch (t) {
            /*case B_TRI:
            {
                MatrixXf positions(3, 3);
                positions.col(0) << -(size_of) * screen_prop.x() + center.x(), -(size_of) * screen_prop.y() + center.y(), 0;
                positions.col(1) << (size_of) * screen_prop.x() + center.x(), -(size_of) * screen_prop.y() + center.y(), 0;
                positions.col(2) << 0. + center.x(), (size_of) * screen_prop.y() + center.y(), 0;
                return positions;
            }*/
        case B_RECT:
        {
            MatrixXf positions(3, 4);
            positions.col(0) << -(size_of) * screen_prop.x() + center.x(), -(size_of + 0.002) * screen_prop.y() + center.y(), 0; //0.002 for tiles
            positions.col(1) << (size_of) * screen_prop.x() + center.x(), -(size_of + 0.002) * screen_prop.y() + center.y(), 0;
            positions.col(2) << (size_of) * screen_prop.x() + center.x(), (size_of) * screen_prop.y() + center.y(), 0;
            positions.col(3) << -(size_of) * screen_prop.x() + center.x(), (size_of) * screen_prop.y() + center.y(), 0;
            return positions;
        }
        default:
        { //B_CIRCLE
            MatrixXf positions(3, B_CIRCLE_vertexCount);
            const float segments = B_CIRCLE_vertexCount;

            float theta = 0.0f;
            const float k_increment = 2.0f * b2_pi / segments;
            float radius = size_of;
            for (int i = 0; i < segments; ++i) {

                Eigen::Vector2f v = Eigen::Vector2f(+center.x() + radius * cosf(theta) * screen_prop.x(), +center.y() + radius * sinf(theta) * screen_prop.y());
                positions(0, i) = v.x();
                positions(1, i) = v.y();
                positions(2, i) = 0;
                theta += k_increment;
            }
            return positions;
        };
    }

}

Eigen::Vector2f Ccgm::scale_calc_all(Eigen::Vector2i &tsxz, Eigen::Vector2f umouse) {
    tsxz = scale_calc(tsxz.cast<float>()).cast<int>();
    umouse = scale_calc(umouse);
    umouse = Eigen::Vector2f(umouse[0], tsxz[1] - umouse[1]);
    if (!(tsxz[0] > 0))tsxz[0] = 1;
    if (!(tsxz[1] > 0))tsxz[1] = 1;
    //to max size
    if ((tsxz[0] > max_fb_size) || (tsxz[1] > max_fb_size)) {
        float prop = (float) tsxz[0] / tsxz[1];
        if (prop >= 1) {
            float oposx = (float) umouse[0] / tsxz[0];
            float oposy = (float) umouse[1] / tsxz[1];
            tsxz[0] = max_fb_size;
            tsxz[1] = max_fb_size / prop;
            umouse[0] = tsxz[0] * oposx;
            umouse[1] = tsxz[1] * oposy;
        } else {

            float oposx = (float) umouse[0] / tsxz[0];
            float oposy = (float) umouse[1] / tsxz[1];
            tsxz[1] = max_fb_size;
            tsxz[0] = max_fb_size*prop;
            umouse[0] = tsxz[0] * oposx;
            umouse[1] = tsxz[1] * oposy;
        }
    }
    return umouse;
}

Eigen::Vector2f Ccgm::scale_calc(Eigen::Vector2f tsxz) {
    if (qz->selectedIndex() != 3) {
        if (qz->selectedIndex() == 0) {
            tsxz[0] = tsxz[0]*((float) 1 / 3);
            tsxz[1] = tsxz[1]*((float) 1 / 3);
        } else
            if (qz->selectedIndex() == 1) {
            tsxz[0] = tsxz[0]*((float) 1 / 2);
            tsxz[1] = tsxz[1]*((float) 1 / 2);
        } else
            if (qz->selectedIndex() == 2) {
            tsxz[0] = tsxz[0]*((float) 1 / 1.5);
            tsxz[1] = tsxz[1]*((float) 1 / 1.5);
        } else
            if (qz->selectedIndex() == 4) {

            tsxz[0] = tsxz[0]*((float) 2);
            tsxz[1] = tsxz[1]*((float) 2);
        }
    }
    return tsxz;
}

void Ccgm::setupdebug() {

    debugw = new debug_table(this);
}

void Ccgm::initall() {

    setupdebug();
}

void Ccgm::update_vals(double loctime) {
    fadebuttons(loctime);
    max_fb_size = max_fb_size_w->value();
    if (fps_ch->checked())fps_edit->setValue(std::max(fps_edit->value(), (int) fps));
    fps_r->setCaption(to_string((int) fps));
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
