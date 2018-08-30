/*
    src/theme.cpp -- Storage class for basic theme-related properties

    The text box widget was contributed by Christian Schueller.

    NanoGUI was developed by Wenzel Jakob <wenzel.jakob@epfl.ch>.
    The widget drawing code is based on the NanoVG demo application
    by Mikko Mononen.

    All rights reserved. Use of this source code is governed by a
    BSD-style license that can be found in the LICENSE.txt file.
*/

#include <nanogui/theme.h>
#include <nanogui/opengl.h>
#include <nanogui/entypo.h>
#include <nanogui_resources.h>

NAMESPACE_BEGIN(nanogui)

Theme::Theme(NVGcontext *ctx) {
    mStandardFontSize                 = 18;
    mButtonFontSize                   = 20;
    mTextBoxFontSize                  = 20;
    mIconScale                        = 0.77f;

    mWindowCornerRadius               = 0;
    mWindowHeaderHeight               = 25;
    mWindowDropShadowSize             = 4;
    mButtonCornerRadius               = 0;
    mTabBorderWidth                   = 0.75f;
    mTabInnerMargin                   = 5;
    mTabMinButtonWidth                = 50;
    mTabMaxButtonWidth                = 160;
    mTabControlWidth                  = 20;
    mTabButtonHorizontalPadding       = 10;
    mTabButtonVerticalPadding         = 2;

    mDropShadow                       = Color(0, 128);
    mTransparent                      = Color(0, 0);
    mBorderDark                       = Color(109, 155);
    mBorderLight                      = Color(109, 155);
    mBorderMedium                     = Color(109, 155);
    mTextColor                        = Color(232, 230);
    mDisabledTextColor                = Color(202, 200);
    mTextColorShadow                  = Color(0, 160);
    mIconColor                        = mTextColor;

    mButtonGradientTopFocused         = Color(65,73,78, 230);
    mButtonGradientBotFocused         = Color(65,73,78, 230);// Color(87,90,99, 230);
    mButtonGradientTopUnfocused       = Color(60,70,78, 230);
    mButtonGradientBotUnfocused       = Color(60,70,78, 230);// Color(80,85,80, 230);
    mButtonGradientTopPushed          = Color(25,33,38, 230);
    mButtonGradientBotPushed          = Color(25,33,38, 230);//= Color(35,45,45, 230);

    /* Window-related */
    mWindowFillUnfocused              = Color(40,55,72, 190);
    mWindowFillFocused                = Color(40,55,72, 210);
    mWindowTitleUnfocused             = Color(202, 230);
    mWindowTitleFocused               = Color(232, 230);

    mWindowHeaderGradientTop          = Color(7,71,186, 230);
    mWindowHeaderGradientBot          = Color(7,71,186, 230);// Color(0,21,65, 230);
    mWindowHeaderSepTop               = Color(80, 155);
    mWindowHeaderSepBot               = Color(80, 155);

    mWindowPopup                      = Color(25,29,55, 230);
    mWindowPopupTransparent           = Color(50, 0);

    mCheckBoxIcon                     = ENTYPO_ICON_CHECK;
    mMessageInformationIcon           = ENTYPO_ICON_INFO_WITH_CIRCLE;
    mMessageQuestionIcon              = ENTYPO_ICON_HELP_WITH_CIRCLE;
    mMessageWarningIcon               = ENTYPO_ICON_WARNING;
    mMessageAltButtonIcon             = ENTYPO_ICON_CIRCLE_WITH_CROSS;
    mMessagePrimaryButtonIcon         = ENTYPO_ICON_CHECK;
    mPopupChevronRightIcon            = ENTYPO_ICON_CHEVRON_RIGHT;
    mPopupChevronLeftIcon             = ENTYPO_ICON_CHEVRON_LEFT;
    mTabHeaderLeftIcon                = ENTYPO_ICON_ARROW_BOLD_LEFT;
    mTabHeaderRightIcon               = ENTYPO_ICON_ARROW_BOLD_RIGHT;
    mTextBoxUpIcon                    = ENTYPO_ICON_CHEVRON_UP;
    mTextBoxDownIcon                  = ENTYPO_ICON_CHEVRON_DOWN;

    mFontNormal = nvgCreateFontMem(ctx, "sans", roboto_regular_ttf,
                                   roboto_regular_ttf_size, 0);
    mFontBold = nvgCreateFontMem(ctx, "sans-bold", roboto_bold_ttf,
                                 roboto_bold_ttf_size, 0);
    mFontIcons = nvgCreateFontMem(ctx, "icons", entypo_ttf,
                                  entypo_ttf_size, 0);
    if (mFontNormal == -1 || mFontBold == -1 || mFontIcons == -1)
        throw std::runtime_error("Could not load fonts!");
}

NAMESPACE_END(nanogui)
