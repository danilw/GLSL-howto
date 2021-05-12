
// https://www.shadertoy.com/view/fsSSzd

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
  highp vec4 _ucol_1;
  highp vec3 _urd_2;
  vec3 _uro_3;
  highp vec2 _uuv_4;
  highp vec2 tmpvar_5;
  tmpvar_5 = ((fragCoord.xy / iResolution.xy) - 0.5);
  _uuv_4.y = tmpvar_5.y;
  _uuv_4.x = (tmpvar_5.x * (iResolution.x / iResolution.y));
  _uro_3.y = 0.5;
  float tmpvar_6;
  tmpvar_6 = (3.841593 + (6.283185 * (0.5 - 
    (0.0 / iResolution.x)
  )));
  mat2 tmpvar_7;
  tmpvar_7[uint(0)].x = cos(tmpvar_6);
  tmpvar_7[uint(0)].y = sin(tmpvar_6);
  tmpvar_7[1u].x = -(sin(tmpvar_6));
  tmpvar_7[1u].y = cos(tmpvar_6);
  _uro_3.xz = (tmpvar_7 * vec2(0.0, -2.0));
  highp vec3 tmpvar_8;
  tmpvar_8.xy = _uuv_4;
  tmpvar_8.z = 1.0;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize(tmpvar_8);
  _urd_2.y = tmpvar_9.y;
  mat2 tmpvar_10;
  tmpvar_10[uint(0)].x = cos(tmpvar_6);
  tmpvar_10[uint(0)].y = sin(tmpvar_6);
  tmpvar_10[1u].x = -(sin(tmpvar_6));
  tmpvar_10[1u].y = cos(tmpvar_6);
  _urd_2.xz = (tmpvar_10 * tmpvar_9.xz);
  highp vec4 _ucol_11;
  vec3 _uro_12;
  _uro_12 = _uro_3;
  highp vec3 _urd_13;
  _urd_13 = _urd_2;
  highp float _unewD_14;
  highp float _ud_15;
  _ud_15 = 0.0;
  _unewD_14 = 0.01;
  while (true) {
    if (!(((_unewD_14 >= 0.01) && (_ud_15 < 4.5)))) {
      break;
    };
    highp vec3 _up_16;
    _up_16 = (_uro_12 + (_urd_13 * _ud_15));
    highp vec4 _uhit_17;
    _uhit_17 = vec4(4.5, 0.0, 0.0, 0.0);
    highp float tmpvar_18;
    highp vec3 _up_19;
    _up_19 = (_up_16 - vec3(0.0, -2.0, 0.0));
    tmpvar_18 = (sqrt(dot (_up_19, _up_19)) - 2.0);
    highp vec4 tmpvar_20;
    if ((tmpvar_18 < 4.5)) {
      highp vec3 _up_21;
      _up_21 = (_up_16 - vec3(0.0, -2.0, 0.0));
      highp vec4 tmpvar_22;
      tmpvar_22.yzw = vec3(0.1, 0.0, 0.0);
      tmpvar_22.x = (sqrt(dot (_up_21, _up_21)) - 2.0);
      tmpvar_20 = tmpvar_22;
    } else {
      tmpvar_20 = vec4(4.5, 0.0, 0.0, 0.0);
    };
    _uhit_17 = tmpvar_20;
    highp float tmpvar_23;
    highp vec3 tmpvar_24;
    tmpvar_24 = (abs((_up_16 - vec3(0.0, 0.5, 0.0))) - vec3(0.3, 0.5, 0.3));
    highp vec3 tmpvar_25;
    tmpvar_25 = max (tmpvar_24, 0.0);
    tmpvar_23 = (sqrt(dot (tmpvar_25, tmpvar_25)) + min (max (tmpvar_24.x, 
      max (tmpvar_24.y, tmpvar_24.z)
    ), 0.0));
    highp vec4 tmpvar_26;
    if ((tmpvar_23 < tmpvar_20.x)) {
      highp vec3 tmpvar_27;
      tmpvar_27 = (abs((_up_16 - vec3(0.0, 0.5, 0.0))) - vec3(0.3, 0.5, 0.3));
      highp vec3 tmpvar_28;
      tmpvar_28 = max (tmpvar_27, 0.0);
      highp vec4 tmpvar_29;
      tmpvar_29.yzw = vec3(-0.1, 0.0, 0.0);
      tmpvar_29.x = (sqrt(dot (tmpvar_28, tmpvar_28)) + min (max (tmpvar_27.x, 
        max (tmpvar_27.y, tmpvar_27.z)
      ), 0.0));
      tmpvar_26 = tmpvar_29;
    } else {
      tmpvar_26 = tmpvar_20;
    };
    if ((tmpvar_26.y < 0.0)) {
      highp vec3 _upArm1R_30;
      highp vec3 _upArm0R_31;
      highp vec3 _upArm1L_32;
      highp vec3 _upArm0L_33;
      highp vec3 _upLeg1R_34;
      highp vec3 _upLeg0R_35;
      highp vec3 _upLeg1L_36;
      highp vec3 _upLeg0L_37;
      highp vec3 _upHead_38;
      highp vec3 _upNeck_39;
      highp vec3 _upChest_40;
      highp vec3 _upWaist_41;
      highp vec3 _upPelvis_42;
      float tmpvar_43;
      tmpvar_43 = (iTime * 4.0);
      highp int tmpvar_44;
      tmpvar_44 = ((int(tmpvar_43)% 4));
      highp int tmpvar_45;
      tmpvar_45 = ( (int((tmpvar_43 / 4.0))% 2));
      highp int _uidx1_46;
      highp int tmpvar_47;
      if ((tmpvar_45 == 0)) {
        tmpvar_47 = 1;
      } else {
        tmpvar_47 = -1;
      };
      float tmpvar_48;
      tmpvar_48 = fract((iTime * 4.0));
      highp int tmpvar_49;
      tmpvar_49 = (tmpvar_44 - 1);
      highp int tmpvar_50;
      if ((tmpvar_47 >= 0)) {
        tmpvar_50 = 0;
      } else {
        tmpvar_50 = 1;
      };
      highp int tmpvar_51;
      tmpvar_51 = (10 + tmpvar_50);
      _uidx1_46 = tmpvar_51;
      if ((tmpvar_49 < 0)) {
        highp int tmpvar_52;
        if ((tmpvar_47 >= 0)) {
          tmpvar_52 = 1;
        } else {
          tmpvar_52 = 0;
        };
        _uidx1_46 = (10 + tmpvar_52);
      };
      highp int tmpvar_53;
      if ((tmpvar_49 < 0)) {
        tmpvar_53 = 3;
      } else {
        tmpvar_53 = tmpvar_49;
      };
      float tmpvar_54;
      tmpvar_54 = ((mix (
        vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (float(_uidx1_46), 0.0, 11.0))][int(clamp (float(tmpvar_53), 0.0, 3.0))]
      , 
        vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (float(tmpvar_51), 0.0, 11.0))][int(clamp (float(tmpvar_44), 0.0, 3.0))]
      , tmpvar_48) * 3.141593) / 180.0);
      highp int _uidx1_55;
      highp int tmpvar_56;
      if ((tmpvar_45 == 0)) {
        tmpvar_56 = 1;
      } else {
        tmpvar_56 = -1;
      };
      float tmpvar_57;
      tmpvar_57 = fract((iTime * 4.0));
      highp int tmpvar_58;
      tmpvar_58 = (tmpvar_44 - 1);
      highp int tmpvar_59;
      if ((tmpvar_56 >= 0)) {
        tmpvar_59 = 0;
      } else {
        tmpvar_59 = 1;
      };
      _uidx1_55 = tmpvar_59;
      if ((tmpvar_58 < 0)) {
        highp int tmpvar_60;
        if ((tmpvar_56 >= 0)) {
          tmpvar_60 = 1;
        } else {
          tmpvar_60 = 0;
        };
        _uidx1_55 = tmpvar_60;
      };
      highp int tmpvar_61;
      if ((tmpvar_58 < 0)) {
        tmpvar_61 = 3;
      } else {
        tmpvar_61 = tmpvar_58;
      };
      vec3 tmpvar_62;
      tmpvar_62.xz = vec2(0.0, 0.0);
      tmpvar_62.y = (-0.5 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[
        int(clamp (float(_uidx1_55), 0.0, 11.0))
      ][
        int(clamp (float(tmpvar_61), 0.0, 3.0))
      ], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[
        int(clamp (float(tmpvar_59), 0.0, 11.0))
      ][
        int(clamp (float(tmpvar_44), 0.0, 3.0))
      ], tmpvar_57));
      highp vec3 tmpvar_63;
      tmpvar_63 = (_up_16 + tmpvar_62);
      _upPelvis_42.z = tmpvar_63.z;
      mat2 tmpvar_64;
      tmpvar_64[uint(0)].x = cos(tmpvar_54);
      tmpvar_64[uint(0)].y = sin(tmpvar_54);
      tmpvar_64[1u].x = -(sin(tmpvar_54));
      tmpvar_64[1u].y = cos(tmpvar_54);
      _upPelvis_42.xy = (tmpvar_63.xy * tmpvar_64);
      highp vec3 tmpvar_65;
      tmpvar_65 = (abs((_upPelvis_42 - vec3(0.0, 0.0, 0.025))) - vec3(0.085, 0.05, 0.05));
      highp vec3 tmpvar_66;
      tmpvar_66 = max (tmpvar_65, 0.0);
      highp vec3 tmpvar_67;
      tmpvar_67 = (_upPelvis_42 + vec3(0.0, -0.05, -0.02));
      _upWaist_41.z = tmpvar_67.z;
      mat2 tmpvar_68;
      tmpvar_68[uint(0)].x = cos(-(tmpvar_54));
      tmpvar_68[uint(0)].y = sin(-(tmpvar_54));
      tmpvar_68[1u].x = -(sin(-(tmpvar_54)));
      tmpvar_68[1u].y = cos(-(tmpvar_54));
      _upWaist_41.xy = (tmpvar_67.xy * tmpvar_68);
      _upWaist_41.yz = (_upWaist_41.yz * mat2(1.0, 0.0, -0.0, 1.0));
      highp vec3 tmpvar_69;
      tmpvar_69 = (abs((_upWaist_41 - vec3(0.0, 0.04, 0.0))) - vec3(0.075, 0.08, 0.03));
      highp vec3 tmpvar_70;
      tmpvar_70 = max (tmpvar_69, 0.0);
      highp vec3 tmpvar_71;
      tmpvar_71 = (_upWaist_41 + vec3(0.0, -0.14, -0.01));
      _upChest_40.x = tmpvar_71.x;
      _upChest_40.yz = (tmpvar_71.yz * mat2(1.0, 0.0, -0.0, 1.0));
      highp vec3 tmpvar_72;
      tmpvar_72 = (abs((_upChest_40 - vec3(0.0, 0.04, 0.0))) - vec3(0.09, 0.08, 0.05));
      highp vec3 tmpvar_73;
      tmpvar_73 = max (tmpvar_72, 0.0);
      highp vec3 tmpvar_74;
      tmpvar_74 = (_upChest_40 + vec3(0.0, -0.15, 0.0));
      _upNeck_39.x = tmpvar_74.x;
      _upNeck_39.yz = (tmpvar_74.yz * mat2(1.0, 0.0, -0.0, 1.0));
      highp vec3 tmpvar_75;
      tmpvar_75 = (abs((_upNeck_39 - vec3(0.0, 0.01, 0.0))) - vec3(0.02, 0.04, 0.02));
      highp vec3 tmpvar_76;
      tmpvar_76 = max (tmpvar_75, 0.0);
      highp vec3 tmpvar_77;
      tmpvar_77 = (_upNeck_39 + vec3(0.0, -0.1, 0.0));
      _upHead_38.x = tmpvar_77.x;
      _upHead_38.yz = (tmpvar_77.yz * mat2(1.0, 0.0, -0.0, 1.0));
      highp vec3 tmpvar_78;
      tmpvar_78 = (abs((_upHead_38 - vec3(0.0, 0.04, -0.025))) - vec3(0.05, 0.08, 0.06));
      highp vec3 tmpvar_79;
      tmpvar_79 = max (tmpvar_78, 0.0);
      highp float tmpvar_80;
      tmpvar_80 = min (min (min (
        min (min (4.5, (sqrt(
          dot (tmpvar_66, tmpvar_66)
        ) + min (
          max (tmpvar_65.x, max (tmpvar_65.y, tmpvar_65.z))
        , 0.0))), (sqrt(dot (tmpvar_70, tmpvar_70)) + min (max (tmpvar_69.x, 
          max (tmpvar_69.y, tmpvar_69.z)
        ), 0.0)))
      , 
        (sqrt(dot (tmpvar_73, tmpvar_73)) + min (max (tmpvar_72.x, max (tmpvar_72.y, tmpvar_72.z)), 0.0))
      ), (
        sqrt(dot (tmpvar_76, tmpvar_76))
       + 
        min (max (tmpvar_75.x, max (tmpvar_75.y, tmpvar_75.z)), 0.0)
      )), (sqrt(
        dot (tmpvar_79, tmpvar_79)
      ) + min (
        max (tmpvar_78.x, max (tmpvar_78.y, tmpvar_78.z))
      , 0.0)));
      highp vec3 tmpvar_81;
      tmpvar_81 = (_upPelvis_42 + vec3(0.06, 0.025, 0.0));
      _upLeg0L_37.z = tmpvar_81.z;
      mat2 tmpvar_82;
      tmpvar_82[uint(0)].x = cos(-(tmpvar_54));
      tmpvar_82[uint(0)].y = sin(-(tmpvar_54));
      tmpvar_82[1u].x = -(sin(-(tmpvar_54)));
      tmpvar_82[1u].y = cos(-(tmpvar_54));
      _upLeg0L_37.xy = (tmpvar_81.xy * tmpvar_82);
      highp int _uidx1_83;
      highp int tmpvar_84;
      if ((tmpvar_45 == 0)) {
        tmpvar_84 = 1;
      } else {
        tmpvar_84 = -1;
      };
      float tmpvar_85;
      tmpvar_85 = fract((iTime * 4.0));
      highp int tmpvar_86;
      tmpvar_86 = (tmpvar_44 - 1);
      highp int tmpvar_87;
      if ((tmpvar_84 >= 0)) {
        tmpvar_87 = 0;
      } else {
        tmpvar_87 = 1;
      };
      highp int tmpvar_88;
      tmpvar_88 = (2 + tmpvar_87);
      _uidx1_83 = tmpvar_88;
      if ((tmpvar_86 < 0)) {
        highp int tmpvar_89;
        if ((tmpvar_84 >= 0)) {
          tmpvar_89 = 1;
        } else {
          tmpvar_89 = 0;
        };
        _uidx1_83 = (2 + tmpvar_89);
      };
      highp int tmpvar_90;
      if ((tmpvar_86 < 0)) {
        tmpvar_90 = 3;
      } else {
        tmpvar_90 = tmpvar_86;
      };
      float tmpvar_91;
      tmpvar_91 = cos(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_83), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_90), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_88), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_44), 0.0, 3.0)
        )], tmpvar_85))
       * 3.141593) / 180.0));
      highp int _uidx1_92;
      highp int tmpvar_93;
      if ((tmpvar_45 == 0)) {
        tmpvar_93 = 1;
      } else {
        tmpvar_93 = -1;
      };
      float tmpvar_94;
      tmpvar_94 = fract((iTime * 4.0));
      highp int tmpvar_95;
      tmpvar_95 = (tmpvar_44 - 1);
      highp int tmpvar_96;
      if ((tmpvar_93 >= 0)) {
        tmpvar_96 = 0;
      } else {
        tmpvar_96 = 1;
      };
      highp int tmpvar_97;
      tmpvar_97 = (2 + tmpvar_96);
      _uidx1_92 = tmpvar_97;
      if ((tmpvar_95 < 0)) {
        highp int tmpvar_98;
        if ((tmpvar_93 >= 0)) {
          tmpvar_98 = 1;
        } else {
          tmpvar_98 = 0;
        };
        _uidx1_92 = (2 + tmpvar_98);
      };
      highp int tmpvar_99;
      if ((tmpvar_95 < 0)) {
        tmpvar_99 = 3;
      } else {
        tmpvar_99 = tmpvar_95;
      };
      float tmpvar_100;
      tmpvar_100 = sin(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_92), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_99), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_97), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_44), 0.0, 3.0)
        )], tmpvar_94))
       * 3.141593) / 180.0));
      highp int _uidx1_101;
      highp int tmpvar_102;
      if ((tmpvar_45 == 0)) {
        tmpvar_102 = 1;
      } else {
        tmpvar_102 = -1;
      };
      float tmpvar_103;
      tmpvar_103 = fract((iTime * 4.0));
      highp int tmpvar_104;
      tmpvar_104 = (tmpvar_44 - 1);
      highp int tmpvar_105;
      if ((tmpvar_102 >= 0)) {
        tmpvar_105 = 0;
      } else {
        tmpvar_105 = 1;
      };
      highp int tmpvar_106;
      tmpvar_106 = (2 + tmpvar_105);
      _uidx1_101 = tmpvar_106;
      if ((tmpvar_104 < 0)) {
        highp int tmpvar_107;
        if ((tmpvar_102 >= 0)) {
          tmpvar_107 = 1;
        } else {
          tmpvar_107 = 0;
        };
        _uidx1_101 = (2 + tmpvar_107);
      };
      highp int tmpvar_108;
      if ((tmpvar_104 < 0)) {
        tmpvar_108 = 3;
      } else {
        tmpvar_108 = tmpvar_104;
      };
      float tmpvar_109;
      tmpvar_109 = sin(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_101), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_108), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_106), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_44), 0.0, 3.0)
        )], tmpvar_103))
       * 3.141593) / 180.0));
      highp int _uidx1_110;
      highp int tmpvar_111;
      if ((tmpvar_45 == 0)) {
        tmpvar_111 = 1;
      } else {
        tmpvar_111 = -1;
      };
      float tmpvar_112;
      tmpvar_112 = fract((iTime * 4.0));
      highp int tmpvar_113;
      tmpvar_113 = (tmpvar_44 - 1);
      highp int tmpvar_114;
      if ((tmpvar_111 >= 0)) {
        tmpvar_114 = 0;
      } else {
        tmpvar_114 = 1;
      };
      highp int tmpvar_115;
      tmpvar_115 = (2 + tmpvar_114);
      _uidx1_110 = tmpvar_115;
      if ((tmpvar_113 < 0)) {
        highp int tmpvar_116;
        if ((tmpvar_111 >= 0)) {
          tmpvar_116 = 1;
        } else {
          tmpvar_116 = 0;
        };
        _uidx1_110 = (2 + tmpvar_116);
      };
      highp int tmpvar_117;
      if ((tmpvar_113 < 0)) {
        tmpvar_117 = 3;
      } else {
        tmpvar_117 = tmpvar_113;
      };
      mat2 tmpvar_118;
      tmpvar_118[uint(0)].x = tmpvar_91;
      tmpvar_118[uint(0)].y = tmpvar_100;
      tmpvar_118[1u].x = -(tmpvar_109);
      tmpvar_118[1u].y = cos(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_110), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_117), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_115), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_44), 0.0, 3.0)
        )], tmpvar_112))
       * 3.141593) / 180.0));
      _upLeg0L_37.yz = (_upLeg0L_37.yz * tmpvar_118);
      highp vec3 tmpvar_119;
      tmpvar_119 = (abs((_upLeg0L_37 - vec3(0.0, 0.1, 0.0))) - vec3(0.025, 0.1, 0.025));
      highp vec3 tmpvar_120;
      tmpvar_120 = max (tmpvar_119, 0.0);
      highp float tmpvar_121;
      tmpvar_121 = min (tmpvar_80, (sqrt(
        dot (tmpvar_120, tmpvar_120)
      ) + min (
        max (tmpvar_119.x, max (tmpvar_119.y, tmpvar_119.z))
      , 0.0)));
      highp vec3 tmpvar_122;
      tmpvar_122 = (_upLeg0L_37 + vec3(0.01, -0.18, 0.02));
      _upLeg1L_36 = tmpvar_122;
      highp int _uidx1_123;
      highp int tmpvar_124;
      if ((tmpvar_45 == 0)) {
        tmpvar_124 = 1;
      } else {
        tmpvar_124 = -1;
      };
      float tmpvar_125;
      tmpvar_125 = fract((iTime * 4.0));
      highp int tmpvar_126;
      tmpvar_126 = (tmpvar_44 - 1);
      highp int tmpvar_127;
      if ((tmpvar_124 >= 0)) {
        tmpvar_127 = 0;
      } else {
        tmpvar_127 = 1;
      };
      highp int tmpvar_128;
      tmpvar_128 = (4 + tmpvar_127);
      _uidx1_123 = tmpvar_128;
      if ((tmpvar_126 < 0)) {
        highp int tmpvar_129;
        if ((tmpvar_124 >= 0)) {
          tmpvar_129 = 1;
        } else {
          tmpvar_129 = 0;
        };
        _uidx1_123 = (4 + tmpvar_129);
      };
      highp int tmpvar_130;
      if ((tmpvar_126 < 0)) {
        tmpvar_130 = 3;
      } else {
        tmpvar_130 = tmpvar_126;
      };
      float tmpvar_131;
      tmpvar_131 = cos(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_123)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_130)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_128)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_44)
        , 0.0, 3.0))], tmpvar_125)
       * 3.141593) / 180.0));
      highp int _uidx1_132;
      highp int tmpvar_133;
      if ((tmpvar_45 == 0)) {
        tmpvar_133 = 1;
      } else {
        tmpvar_133 = -1;
      };
      float tmpvar_134;
      tmpvar_134 = fract((iTime * 4.0));
      highp int tmpvar_135;
      tmpvar_135 = (tmpvar_44 - 1);
      highp int tmpvar_136;
      if ((tmpvar_133 >= 0)) {
        tmpvar_136 = 0;
      } else {
        tmpvar_136 = 1;
      };
      highp int tmpvar_137;
      tmpvar_137 = (4 + tmpvar_136);
      _uidx1_132 = tmpvar_137;
      if ((tmpvar_135 < 0)) {
        highp int tmpvar_138;
        if ((tmpvar_133 >= 0)) {
          tmpvar_138 = 1;
        } else {
          tmpvar_138 = 0;
        };
        _uidx1_132 = (4 + tmpvar_138);
      };
      highp int tmpvar_139;
      if ((tmpvar_135 < 0)) {
        tmpvar_139 = 3;
      } else {
        tmpvar_139 = tmpvar_135;
      };
      float tmpvar_140;
      tmpvar_140 = sin(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_132)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_139)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_137)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_44)
        , 0.0, 3.0))], tmpvar_134)
       * 3.141593) / 180.0));
      highp int _uidx1_141;
      highp int tmpvar_142;
      if ((tmpvar_45 == 0)) {
        tmpvar_142 = 1;
      } else {
        tmpvar_142 = -1;
      };
      float tmpvar_143;
      tmpvar_143 = fract((iTime * 4.0));
      highp int tmpvar_144;
      tmpvar_144 = (tmpvar_44 - 1);
      highp int tmpvar_145;
      if ((tmpvar_142 >= 0)) {
        tmpvar_145 = 0;
      } else {
        tmpvar_145 = 1;
      };
      highp int tmpvar_146;
      tmpvar_146 = (4 + tmpvar_145);
      _uidx1_141 = tmpvar_146;
      if ((tmpvar_144 < 0)) {
        highp int tmpvar_147;
        if ((tmpvar_142 >= 0)) {
          tmpvar_147 = 1;
        } else {
          tmpvar_147 = 0;
        };
        _uidx1_141 = (4 + tmpvar_147);
      };
      highp int tmpvar_148;
      if ((tmpvar_144 < 0)) {
        tmpvar_148 = 3;
      } else {
        tmpvar_148 = tmpvar_144;
      };
      float tmpvar_149;
      tmpvar_149 = sin(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_141)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_148)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_146)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_44)
        , 0.0, 3.0))], tmpvar_143)
       * 3.141593) / 180.0));
      highp int _uidx1_150;
      highp int tmpvar_151;
      if ((tmpvar_45 == 0)) {
        tmpvar_151 = 1;
      } else {
        tmpvar_151 = -1;
      };
      float tmpvar_152;
      tmpvar_152 = fract((iTime * 4.0));
      highp int tmpvar_153;
      tmpvar_153 = (tmpvar_44 - 1);
      highp int tmpvar_154;
      if ((tmpvar_151 >= 0)) {
        tmpvar_154 = 0;
      } else {
        tmpvar_154 = 1;
      };
      highp int tmpvar_155;
      tmpvar_155 = (4 + tmpvar_154);
      _uidx1_150 = tmpvar_155;
      if ((tmpvar_153 < 0)) {
        highp int tmpvar_156;
        if ((tmpvar_151 >= 0)) {
          tmpvar_156 = 1;
        } else {
          tmpvar_156 = 0;
        };
        _uidx1_150 = (4 + tmpvar_156);
      };
      highp int tmpvar_157;
      if ((tmpvar_153 < 0)) {
        tmpvar_157 = 3;
      } else {
        tmpvar_157 = tmpvar_153;
      };
      mat2 tmpvar_158;
      tmpvar_158[uint(0)].x = tmpvar_131;
      tmpvar_158[uint(0)].y = tmpvar_140;
      tmpvar_158[1u].x = -(tmpvar_149);
      tmpvar_158[1u].y = cos(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_150)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_157)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_155)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_44)
        , 0.0, 3.0))], tmpvar_152)
       * 3.141593) / 180.0));
      _upLeg1L_36.yz = (tmpvar_122.yz * tmpvar_158);
      highp vec3 tmpvar_159;
      tmpvar_159 = (abs((_upLeg1L_36 - vec3(0.0, 0.1, 0.0))) - vec3(0.025, 0.1, 0.025));
      highp vec3 tmpvar_160;
      tmpvar_160 = max (tmpvar_159, 0.0);
      highp float tmpvar_161;
      tmpvar_161 = min (tmpvar_121, (sqrt(
        dot (tmpvar_160, tmpvar_160)
      ) + min (
        max (tmpvar_159.x, max (tmpvar_159.y, tmpvar_159.z))
      , 0.0)));
      highp vec3 tmpvar_162;
      tmpvar_162 = (_upPelvis_42 + vec3(-0.06, 0.025, 0.0));
      _upLeg0R_35.z = tmpvar_162.z;
      mat2 tmpvar_163;
      tmpvar_163[uint(0)].x = cos(-(tmpvar_54));
      tmpvar_163[uint(0)].y = sin(-(tmpvar_54));
      tmpvar_163[1u].x = -(sin(-(tmpvar_54)));
      tmpvar_163[1u].y = cos(-(tmpvar_54));
      _upLeg0R_35.xy = (tmpvar_162.xy * tmpvar_163);
      highp int _us_164;
      _us_164 = -1;
      highp int _uidx1_165;
      highp int tmpvar_166;
      if ((tmpvar_45 == 0)) {
        tmpvar_166 = 1;
      } else {
        tmpvar_166 = -1;
      };
      _us_164 = -(tmpvar_166);
      float tmpvar_167;
      tmpvar_167 = fract((iTime * 4.0));
      highp int tmpvar_168;
      tmpvar_168 = (tmpvar_44 - 1);
      highp int tmpvar_169;
      if ((_us_164 >= 0)) {
        tmpvar_169 = 0;
      } else {
        tmpvar_169 = 1;
      };
      highp int tmpvar_170;
      tmpvar_170 = (2 + tmpvar_169);
      _uidx1_165 = tmpvar_170;
      if ((tmpvar_168 < 0)) {
        highp int tmpvar_171;
        if ((_us_164 >= 0)) {
          tmpvar_171 = 1;
        } else {
          tmpvar_171 = 0;
        };
        _uidx1_165 = (2 + tmpvar_171);
      };
      highp int tmpvar_172;
      if ((tmpvar_168 < 0)) {
        tmpvar_172 = 3;
      } else {
        tmpvar_172 = tmpvar_168;
      };
      float tmpvar_173;
      tmpvar_173 = cos(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_165), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_172), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_170), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_44), 0.0, 3.0)
        )], tmpvar_167))
       * 3.141593) / 180.0));
      highp int _us_174;
      _us_174 = -1;
      highp int _uidx1_175;
      highp int tmpvar_176;
      if ((tmpvar_45 == 0)) {
        tmpvar_176 = 1;
      } else {
        tmpvar_176 = -1;
      };
      _us_174 = -(tmpvar_176);
      float tmpvar_177;
      tmpvar_177 = fract((iTime * 4.0));
      highp int tmpvar_178;
      tmpvar_178 = (tmpvar_44 - 1);
      highp int tmpvar_179;
      if ((_us_174 >= 0)) {
        tmpvar_179 = 0;
      } else {
        tmpvar_179 = 1;
      };
      highp int tmpvar_180;
      tmpvar_180 = (2 + tmpvar_179);
      _uidx1_175 = tmpvar_180;
      if ((tmpvar_178 < 0)) {
        highp int tmpvar_181;
        if ((_us_174 >= 0)) {
          tmpvar_181 = 1;
        } else {
          tmpvar_181 = 0;
        };
        _uidx1_175 = (2 + tmpvar_181);
      };
      highp int tmpvar_182;
      if ((tmpvar_178 < 0)) {
        tmpvar_182 = 3;
      } else {
        tmpvar_182 = tmpvar_178;
      };
      float tmpvar_183;
      tmpvar_183 = sin(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_175), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_182), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_180), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_44), 0.0, 3.0)
        )], tmpvar_177))
       * 3.141593) / 180.0));
      highp int _us_184;
      _us_184 = -1;
      highp int _uidx1_185;
      highp int tmpvar_186;
      if ((tmpvar_45 == 0)) {
        tmpvar_186 = 1;
      } else {
        tmpvar_186 = -1;
      };
      _us_184 = -(tmpvar_186);
      float tmpvar_187;
      tmpvar_187 = fract((iTime * 4.0));
      highp int tmpvar_188;
      tmpvar_188 = (tmpvar_44 - 1);
      highp int tmpvar_189;
      if ((_us_184 >= 0)) {
        tmpvar_189 = 0;
      } else {
        tmpvar_189 = 1;
      };
      highp int tmpvar_190;
      tmpvar_190 = (2 + tmpvar_189);
      _uidx1_185 = tmpvar_190;
      if ((tmpvar_188 < 0)) {
        highp int tmpvar_191;
        if ((_us_184 >= 0)) {
          tmpvar_191 = 1;
        } else {
          tmpvar_191 = 0;
        };
        _uidx1_185 = (2 + tmpvar_191);
      };
      highp int tmpvar_192;
      if ((tmpvar_188 < 0)) {
        tmpvar_192 = 3;
      } else {
        tmpvar_192 = tmpvar_188;
      };
      float tmpvar_193;
      tmpvar_193 = sin(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_185), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_192), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_190), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_44), 0.0, 3.0)
        )], tmpvar_187))
       * 3.141593) / 180.0));
      highp int _us_194;
      _us_194 = -1;
      highp int _uidx1_195;
      highp int tmpvar_196;
      if ((tmpvar_45 == 0)) {
        tmpvar_196 = 1;
      } else {
        tmpvar_196 = -1;
      };
      _us_194 = -(tmpvar_196);
      float tmpvar_197;
      tmpvar_197 = fract((iTime * 4.0));
      highp int tmpvar_198;
      tmpvar_198 = (tmpvar_44 - 1);
      highp int tmpvar_199;
      if ((_us_194 >= 0)) {
        tmpvar_199 = 0;
      } else {
        tmpvar_199 = 1;
      };
      highp int tmpvar_200;
      tmpvar_200 = (2 + tmpvar_199);
      _uidx1_195 = tmpvar_200;
      if ((tmpvar_198 < 0)) {
        highp int tmpvar_201;
        if ((_us_194 >= 0)) {
          tmpvar_201 = 1;
        } else {
          tmpvar_201 = 0;
        };
        _uidx1_195 = (2 + tmpvar_201);
      };
      highp int tmpvar_202;
      if ((tmpvar_198 < 0)) {
        tmpvar_202 = 3;
      } else {
        tmpvar_202 = tmpvar_198;
      };
      mat2 tmpvar_203;
      tmpvar_203[uint(0)].x = tmpvar_173;
      tmpvar_203[uint(0)].y = tmpvar_183;
      tmpvar_203[1u].x = -(tmpvar_193);
      tmpvar_203[1u].y = cos(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_195), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_202), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_200), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_44), 0.0, 3.0)
        )], tmpvar_197))
       * 3.141593) / 180.0));
      _upLeg0R_35.yz = (_upLeg0R_35.yz * tmpvar_203);
      highp vec3 tmpvar_204;
      tmpvar_204 = (abs((_upLeg0R_35 - vec3(0.0, 0.1, 0.0))) - vec3(0.025, 0.1, 0.025));
      highp vec3 tmpvar_205;
      tmpvar_205 = max (tmpvar_204, 0.0);
      highp float tmpvar_206;
      tmpvar_206 = min (tmpvar_161, (sqrt(
        dot (tmpvar_205, tmpvar_205)
      ) + min (
        max (tmpvar_204.x, max (tmpvar_204.y, tmpvar_204.z))
      , 0.0)));
      highp vec3 tmpvar_207;
      tmpvar_207 = (_upLeg0R_35 + vec3(-0.01, -0.18, 0.02));
      _upLeg1R_34 = tmpvar_207;
      highp int _us_208;
      _us_208 = -1;
      highp int _uidx1_209;
      highp int tmpvar_210;
      if ((tmpvar_45 == 0)) {
        tmpvar_210 = 1;
      } else {
        tmpvar_210 = -1;
      };
      _us_208 = -(tmpvar_210);
      float tmpvar_211;
      tmpvar_211 = fract((iTime * 4.0));
      highp int tmpvar_212;
      tmpvar_212 = (tmpvar_44 - 1);
      highp int tmpvar_213;
      if ((_us_208 >= 0)) {
        tmpvar_213 = 0;
      } else {
        tmpvar_213 = 1;
      };
      highp int tmpvar_214;
      tmpvar_214 = (4 + tmpvar_213);
      _uidx1_209 = tmpvar_214;
      if ((tmpvar_212 < 0)) {
        highp int tmpvar_215;
        if ((_us_208 >= 0)) {
          tmpvar_215 = 1;
        } else {
          tmpvar_215 = 0;
        };
        _uidx1_209 = (4 + tmpvar_215);
      };
      highp int tmpvar_216;
      if ((tmpvar_212 < 0)) {
        tmpvar_216 = 3;
      } else {
        tmpvar_216 = tmpvar_212;
      };
      float tmpvar_217;
      tmpvar_217 = cos(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_209)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_216)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_214)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_44)
        , 0.0, 3.0))], tmpvar_211)
       * 3.141593) / 180.0));
      highp int _us_218;
      _us_218 = -1;
      highp int _uidx1_219;
      highp int tmpvar_220;
      if ((tmpvar_45 == 0)) {
        tmpvar_220 = 1;
      } else {
        tmpvar_220 = -1;
      };
      _us_218 = -(tmpvar_220);
      float tmpvar_221;
      tmpvar_221 = fract((iTime * 4.0));
      highp int tmpvar_222;
      tmpvar_222 = (tmpvar_44 - 1);
      highp int tmpvar_223;
      if ((_us_218 >= 0)) {
        tmpvar_223 = 0;
      } else {
        tmpvar_223 = 1;
      };
      highp int tmpvar_224;
      tmpvar_224 = (4 + tmpvar_223);
      _uidx1_219 = tmpvar_224;
      if ((tmpvar_222 < 0)) {
        highp int tmpvar_225;
        if ((_us_218 >= 0)) {
          tmpvar_225 = 1;
        } else {
          tmpvar_225 = 0;
        };
        _uidx1_219 = (4 + tmpvar_225);
      };
      highp int tmpvar_226;
      if ((tmpvar_222 < 0)) {
        tmpvar_226 = 3;
      } else {
        tmpvar_226 = tmpvar_222;
      };
      float tmpvar_227;
      tmpvar_227 = sin(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_219)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_226)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_224)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_44)
        , 0.0, 3.0))], tmpvar_221)
       * 3.141593) / 180.0));
      highp int _us_228;
      _us_228 = -1;
      highp int _uidx1_229;
      highp int tmpvar_230;
      if ((tmpvar_45 == 0)) {
        tmpvar_230 = 1;
      } else {
        tmpvar_230 = -1;
      };
      _us_228 = -(tmpvar_230);
      float tmpvar_231;
      tmpvar_231 = fract((iTime * 4.0));
      highp int tmpvar_232;
      tmpvar_232 = (tmpvar_44 - 1);
      highp int tmpvar_233;
      if ((_us_228 >= 0)) {
        tmpvar_233 = 0;
      } else {
        tmpvar_233 = 1;
      };
      highp int tmpvar_234;
      tmpvar_234 = (4 + tmpvar_233);
      _uidx1_229 = tmpvar_234;
      if ((tmpvar_232 < 0)) {
        highp int tmpvar_235;
        if ((_us_228 >= 0)) {
          tmpvar_235 = 1;
        } else {
          tmpvar_235 = 0;
        };
        _uidx1_229 = (4 + tmpvar_235);
      };
      highp int tmpvar_236;
      if ((tmpvar_232 < 0)) {
        tmpvar_236 = 3;
      } else {
        tmpvar_236 = tmpvar_232;
      };
      float tmpvar_237;
      tmpvar_237 = sin(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_229)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_236)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_234)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_44)
        , 0.0, 3.0))], tmpvar_231)
       * 3.141593) / 180.0));
      highp int _us_238;
      _us_238 = -1;
      highp int _uidx1_239;
      highp int tmpvar_240;
      if ((tmpvar_45 == 0)) {
        tmpvar_240 = 1;
      } else {
        tmpvar_240 = -1;
      };
      _us_238 = -(tmpvar_240);
      float tmpvar_241;
      tmpvar_241 = fract((iTime * 4.0));
      highp int tmpvar_242;
      tmpvar_242 = (tmpvar_44 - 1);
      highp int tmpvar_243;
      if ((_us_238 >= 0)) {
        tmpvar_243 = 0;
      } else {
        tmpvar_243 = 1;
      };
      highp int tmpvar_244;
      tmpvar_244 = (4 + tmpvar_243);
      _uidx1_239 = tmpvar_244;
      if ((tmpvar_242 < 0)) {
        highp int tmpvar_245;
        if ((_us_238 >= 0)) {
          tmpvar_245 = 1;
        } else {
          tmpvar_245 = 0;
        };
        _uidx1_239 = (4 + tmpvar_245);
      };
      highp int tmpvar_246;
      if ((tmpvar_242 < 0)) {
        tmpvar_246 = 3;
      } else {
        tmpvar_246 = tmpvar_242;
      };
      mat2 tmpvar_247;
      tmpvar_247[uint(0)].x = tmpvar_217;
      tmpvar_247[uint(0)].y = tmpvar_227;
      tmpvar_247[1u].x = -(tmpvar_237);
      tmpvar_247[1u].y = cos(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_239)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_246)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_244)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_44)
        , 0.0, 3.0))], tmpvar_241)
       * 3.141593) / 180.0));
      _upLeg1R_34.yz = (tmpvar_207.yz * tmpvar_247);
      highp vec3 tmpvar_248;
      tmpvar_248 = (abs((_upLeg1R_34 - vec3(0.0, 0.1, 0.0))) - vec3(0.025, 0.1, 0.025));
      highp vec3 tmpvar_249;
      tmpvar_249 = max (tmpvar_248, 0.0);
      highp float tmpvar_250;
      tmpvar_250 = min (tmpvar_206, (sqrt(
        dot (tmpvar_249, tmpvar_249)
      ) + min (
        max (tmpvar_248.x, max (tmpvar_248.y, tmpvar_248.z))
      , 0.0)));
      highp vec3 tmpvar_251;
      tmpvar_251 = (_upChest_40 + vec3(0.125, -0.1, 0.0));
      _upArm0L_33 = tmpvar_251;
      highp int _uidx1_252;
      highp int tmpvar_253;
      if ((tmpvar_45 == 0)) {
        tmpvar_253 = 1;
      } else {
        tmpvar_253 = -1;
      };
      float tmpvar_254;
      tmpvar_254 = fract((iTime * 4.0));
      highp int tmpvar_255;
      tmpvar_255 = (tmpvar_44 - 1);
      highp int tmpvar_256;
      if ((tmpvar_253 >= 0)) {
        tmpvar_256 = 0;
      } else {
        tmpvar_256 = 1;
      };
      highp int tmpvar_257;
      tmpvar_257 = (6 + tmpvar_256);
      _uidx1_252 = tmpvar_257;
      if ((tmpvar_255 < 0)) {
        highp int tmpvar_258;
        if ((tmpvar_253 >= 0)) {
          tmpvar_258 = 1;
        } else {
          tmpvar_258 = 0;
        };
        _uidx1_252 = (6 + tmpvar_258);
      };
      highp int tmpvar_259;
      if ((tmpvar_255 < 0)) {
        tmpvar_259 = 3;
      } else {
        tmpvar_259 = tmpvar_255;
      };
      float tmpvar_260;
      tmpvar_260 = cos(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_252), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_259), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_257), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_44), 0.0, 3.0)
        )], tmpvar_254))
       * 3.141593) / 180.0));
      highp int _uidx1_261;
      highp int tmpvar_262;
      if ((tmpvar_45 == 0)) {
        tmpvar_262 = 1;
      } else {
        tmpvar_262 = -1;
      };
      float tmpvar_263;
      tmpvar_263 = fract((iTime * 4.0));
      highp int tmpvar_264;
      tmpvar_264 = (tmpvar_44 - 1);
      highp int tmpvar_265;
      if ((tmpvar_262 >= 0)) {
        tmpvar_265 = 0;
      } else {
        tmpvar_265 = 1;
      };
      highp int tmpvar_266;
      tmpvar_266 = (6 + tmpvar_265);
      _uidx1_261 = tmpvar_266;
      if ((tmpvar_264 < 0)) {
        highp int tmpvar_267;
        if ((tmpvar_262 >= 0)) {
          tmpvar_267 = 1;
        } else {
          tmpvar_267 = 0;
        };
        _uidx1_261 = (6 + tmpvar_267);
      };
      highp int tmpvar_268;
      if ((tmpvar_264 < 0)) {
        tmpvar_268 = 3;
      } else {
        tmpvar_268 = tmpvar_264;
      };
      float tmpvar_269;
      tmpvar_269 = sin(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_261), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_268), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_266), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_44), 0.0, 3.0)
        )], tmpvar_263))
       * 3.141593) / 180.0));
      highp int _uidx1_270;
      highp int tmpvar_271;
      if ((tmpvar_45 == 0)) {
        tmpvar_271 = 1;
      } else {
        tmpvar_271 = -1;
      };
      float tmpvar_272;
      tmpvar_272 = fract((iTime * 4.0));
      highp int tmpvar_273;
      tmpvar_273 = (tmpvar_44 - 1);
      highp int tmpvar_274;
      if ((tmpvar_271 >= 0)) {
        tmpvar_274 = 0;
      } else {
        tmpvar_274 = 1;
      };
      highp int tmpvar_275;
      tmpvar_275 = (6 + tmpvar_274);
      _uidx1_270 = tmpvar_275;
      if ((tmpvar_273 < 0)) {
        highp int tmpvar_276;
        if ((tmpvar_271 >= 0)) {
          tmpvar_276 = 1;
        } else {
          tmpvar_276 = 0;
        };
        _uidx1_270 = (6 + tmpvar_276);
      };
      highp int tmpvar_277;
      if ((tmpvar_273 < 0)) {
        tmpvar_277 = 3;
      } else {
        tmpvar_277 = tmpvar_273;
      };
      float tmpvar_278;
      tmpvar_278 = sin(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_270), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_277), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_275), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_44), 0.0, 3.0)
        )], tmpvar_272))
       * 3.141593) / 180.0));
      highp int _uidx1_279;
      highp int tmpvar_280;
      if ((tmpvar_45 == 0)) {
        tmpvar_280 = 1;
      } else {
        tmpvar_280 = -1;
      };
      float tmpvar_281;
      tmpvar_281 = fract((iTime * 4.0));
      highp int tmpvar_282;
      tmpvar_282 = (tmpvar_44 - 1);
      highp int tmpvar_283;
      if ((tmpvar_280 >= 0)) {
        tmpvar_283 = 0;
      } else {
        tmpvar_283 = 1;
      };
      highp int tmpvar_284;
      tmpvar_284 = (6 + tmpvar_283);
      _uidx1_279 = tmpvar_284;
      if ((tmpvar_282 < 0)) {
        highp int tmpvar_285;
        if ((tmpvar_280 >= 0)) {
          tmpvar_285 = 1;
        } else {
          tmpvar_285 = 0;
        };
        _uidx1_279 = (6 + tmpvar_285);
      };
      highp int tmpvar_286;
      if ((tmpvar_282 < 0)) {
        tmpvar_286 = 3;
      } else {
        tmpvar_286 = tmpvar_282;
      };
      mat2 tmpvar_287;
      tmpvar_287[uint(0)].x = tmpvar_260;
      tmpvar_287[uint(0)].y = tmpvar_269;
      tmpvar_287[1u].x = -(tmpvar_278);
      tmpvar_287[1u].y = cos(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_279), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_286), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_284), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_44), 0.0, 3.0)
        )], tmpvar_281))
       * 3.141593) / 180.0));
      _upArm0L_33.yz = (tmpvar_251.yz * tmpvar_287);
      highp vec3 tmpvar_288;
      tmpvar_288 = (abs((_upArm0L_33 - vec3(0.0, 0.08, 0.0))) - vec3(0.02, 0.08, 0.02));
      highp vec3 tmpvar_289;
      tmpvar_289 = max (tmpvar_288, 0.0);
      highp float tmpvar_290;
      tmpvar_290 = min (tmpvar_250, (sqrt(
        dot (tmpvar_289, tmpvar_289)
      ) + min (
        max (tmpvar_288.x, max (tmpvar_288.y, tmpvar_288.z))
      , 0.0)));
      highp vec3 tmpvar_291;
      tmpvar_291 = (_upArm0L_33 + vec3(0.0, -0.16, 0.0));
      _upArm1L_32 = tmpvar_291;
      highp int _uidx1_292;
      highp int tmpvar_293;
      if ((tmpvar_45 == 0)) {
        tmpvar_293 = 1;
      } else {
        tmpvar_293 = -1;
      };
      float tmpvar_294;
      tmpvar_294 = fract((iTime * 4.0));
      highp int tmpvar_295;
      tmpvar_295 = (tmpvar_44 - 1);
      highp int tmpvar_296;
      if ((tmpvar_293 >= 0)) {
        tmpvar_296 = 0;
      } else {
        tmpvar_296 = 1;
      };
      highp int tmpvar_297;
      tmpvar_297 = (8 + tmpvar_296);
      _uidx1_292 = tmpvar_297;
      if ((tmpvar_295 < 0)) {
        highp int tmpvar_298;
        if ((tmpvar_293 >= 0)) {
          tmpvar_298 = 1;
        } else {
          tmpvar_298 = 0;
        };
        _uidx1_292 = (8 + tmpvar_298);
      };
      highp int tmpvar_299;
      if ((tmpvar_295 < 0)) {
        tmpvar_299 = 3;
      } else {
        tmpvar_299 = tmpvar_295;
      };
      float tmpvar_300;
      tmpvar_300 = cos(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_292)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_299)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_297)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_44)
        , 0.0, 3.0))], tmpvar_294)
       * 3.141593) / 180.0));
      highp int _uidx1_301;
      highp int tmpvar_302;
      if ((tmpvar_45 == 0)) {
        tmpvar_302 = 1;
      } else {
        tmpvar_302 = -1;
      };
      float tmpvar_303;
      tmpvar_303 = fract((iTime * 4.0));
      highp int tmpvar_304;
      tmpvar_304 = (tmpvar_44 - 1);
      highp int tmpvar_305;
      if ((tmpvar_302 >= 0)) {
        tmpvar_305 = 0;
      } else {
        tmpvar_305 = 1;
      };
      highp int tmpvar_306;
      tmpvar_306 = (8 + tmpvar_305);
      _uidx1_301 = tmpvar_306;
      if ((tmpvar_304 < 0)) {
        highp int tmpvar_307;
        if ((tmpvar_302 >= 0)) {
          tmpvar_307 = 1;
        } else {
          tmpvar_307 = 0;
        };
        _uidx1_301 = (8 + tmpvar_307);
      };
      highp int tmpvar_308;
      if ((tmpvar_304 < 0)) {
        tmpvar_308 = 3;
      } else {
        tmpvar_308 = tmpvar_304;
      };
      float tmpvar_309;
      tmpvar_309 = sin(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_301)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_308)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_306)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_44)
        , 0.0, 3.0))], tmpvar_303)
       * 3.141593) / 180.0));
      highp int _uidx1_310;
      highp int tmpvar_311;
      if ((tmpvar_45 == 0)) {
        tmpvar_311 = 1;
      } else {
        tmpvar_311 = -1;
      };
      float tmpvar_312;
      tmpvar_312 = fract((iTime * 4.0));
      highp int tmpvar_313;
      tmpvar_313 = (tmpvar_44 - 1);
      highp int tmpvar_314;
      if ((tmpvar_311 >= 0)) {
        tmpvar_314 = 0;
      } else {
        tmpvar_314 = 1;
      };
      highp int tmpvar_315;
      tmpvar_315 = (8 + tmpvar_314);
      _uidx1_310 = tmpvar_315;
      if ((tmpvar_313 < 0)) {
        highp int tmpvar_316;
        if ((tmpvar_311 >= 0)) {
          tmpvar_316 = 1;
        } else {
          tmpvar_316 = 0;
        };
        _uidx1_310 = (8 + tmpvar_316);
      };
      highp int tmpvar_317;
      if ((tmpvar_313 < 0)) {
        tmpvar_317 = 3;
      } else {
        tmpvar_317 = tmpvar_313;
      };
      float tmpvar_318;
      tmpvar_318 = sin(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_310)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_317)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_315)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_44)
        , 0.0, 3.0))], tmpvar_312)
       * 3.141593) / 180.0));
      highp int _uidx1_319;
      highp int tmpvar_320;
      if ((tmpvar_45 == 0)) {
        tmpvar_320 = 1;
      } else {
        tmpvar_320 = -1;
      };
      float tmpvar_321;
      tmpvar_321 = fract((iTime * 4.0));
      highp int tmpvar_322;
      tmpvar_322 = (tmpvar_44 - 1);
      highp int tmpvar_323;
      if ((tmpvar_320 >= 0)) {
        tmpvar_323 = 0;
      } else {
        tmpvar_323 = 1;
      };
      highp int tmpvar_324;
      tmpvar_324 = (8 + tmpvar_323);
      _uidx1_319 = tmpvar_324;
      if ((tmpvar_322 < 0)) {
        highp int tmpvar_325;
        if ((tmpvar_320 >= 0)) {
          tmpvar_325 = 1;
        } else {
          tmpvar_325 = 0;
        };
        _uidx1_319 = (8 + tmpvar_325);
      };
      highp int tmpvar_326;
      if ((tmpvar_322 < 0)) {
        tmpvar_326 = 3;
      } else {
        tmpvar_326 = tmpvar_322;
      };
      mat2 tmpvar_327;
      tmpvar_327[uint(0)].x = tmpvar_300;
      tmpvar_327[uint(0)].y = tmpvar_309;
      tmpvar_327[1u].x = -(tmpvar_318);
      tmpvar_327[1u].y = cos(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_319)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_326)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_324)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_44)
        , 0.0, 3.0))], tmpvar_321)
       * 3.141593) / 180.0));
      _upArm1L_32.yz = (tmpvar_291.yz * tmpvar_327);
      highp vec3 tmpvar_328;
      tmpvar_328 = (abs((_upArm1L_32 - vec3(0.0, 0.08, 0.0))) - vec3(0.02, 0.08, 0.02));
      highp vec3 tmpvar_329;
      tmpvar_329 = max (tmpvar_328, 0.0);
      highp float tmpvar_330;
      tmpvar_330 = min (tmpvar_290, (sqrt(
        dot (tmpvar_329, tmpvar_329)
      ) + min (
        max (tmpvar_328.x, max (tmpvar_328.y, tmpvar_328.z))
      , 0.0)));
      highp vec3 tmpvar_331;
      tmpvar_331 = (_upChest_40 + vec3(-0.125, -0.1, 0.0));
      _upArm0R_31 = tmpvar_331;
      highp int _us_332;
      _us_332 = -1;
      highp int _uidx1_333;
      highp int tmpvar_334;
      if ((tmpvar_45 == 0)) {
        tmpvar_334 = 1;
      } else {
        tmpvar_334 = -1;
      };
      _us_332 = -(tmpvar_334);
      float tmpvar_335;
      tmpvar_335 = fract((iTime * 4.0));
      highp int tmpvar_336;
      tmpvar_336 = (tmpvar_44 - 1);
      highp int tmpvar_337;
      if ((_us_332 >= 0)) {
        tmpvar_337 = 0;
      } else {
        tmpvar_337 = 1;
      };
      highp int tmpvar_338;
      tmpvar_338 = (6 + tmpvar_337);
      _uidx1_333 = tmpvar_338;
      if ((tmpvar_336 < 0)) {
        highp int tmpvar_339;
        if ((_us_332 >= 0)) {
          tmpvar_339 = 1;
        } else {
          tmpvar_339 = 0;
        };
        _uidx1_333 = (6 + tmpvar_339);
      };
      highp int tmpvar_340;
      if ((tmpvar_336 < 0)) {
        tmpvar_340 = 3;
      } else {
        tmpvar_340 = tmpvar_336;
      };
      float tmpvar_341;
      tmpvar_341 = cos(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_333), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_340), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_338), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_44), 0.0, 3.0)
        )], tmpvar_335))
       * 3.141593) / 180.0));
      highp int _us_342;
      _us_342 = -1;
      highp int _uidx1_343;
      highp int tmpvar_344;
      if ((tmpvar_45 == 0)) {
        tmpvar_344 = 1;
      } else {
        tmpvar_344 = -1;
      };
      _us_342 = -(tmpvar_344);
      float tmpvar_345;
      tmpvar_345 = fract((iTime * 4.0));
      highp int tmpvar_346;
      tmpvar_346 = (tmpvar_44 - 1);
      highp int tmpvar_347;
      if ((_us_342 >= 0)) {
        tmpvar_347 = 0;
      } else {
        tmpvar_347 = 1;
      };
      highp int tmpvar_348;
      tmpvar_348 = (6 + tmpvar_347);
      _uidx1_343 = tmpvar_348;
      if ((tmpvar_346 < 0)) {
        highp int tmpvar_349;
        if ((_us_342 >= 0)) {
          tmpvar_349 = 1;
        } else {
          tmpvar_349 = 0;
        };
        _uidx1_343 = (6 + tmpvar_349);
      };
      highp int tmpvar_350;
      if ((tmpvar_346 < 0)) {
        tmpvar_350 = 3;
      } else {
        tmpvar_350 = tmpvar_346;
      };
      float tmpvar_351;
      tmpvar_351 = sin(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_343), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_350), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_348), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_44), 0.0, 3.0)
        )], tmpvar_345))
       * 3.141593) / 180.0));
      highp int _us_352;
      _us_352 = -1;
      highp int _uidx1_353;
      highp int tmpvar_354;
      if ((tmpvar_45 == 0)) {
        tmpvar_354 = 1;
      } else {
        tmpvar_354 = -1;
      };
      _us_352 = -(tmpvar_354);
      float tmpvar_355;
      tmpvar_355 = fract((iTime * 4.0));
      highp int tmpvar_356;
      tmpvar_356 = (tmpvar_44 - 1);
      highp int tmpvar_357;
      if ((_us_352 >= 0)) {
        tmpvar_357 = 0;
      } else {
        tmpvar_357 = 1;
      };
      highp int tmpvar_358;
      tmpvar_358 = (6 + tmpvar_357);
      _uidx1_353 = tmpvar_358;
      if ((tmpvar_356 < 0)) {
        highp int tmpvar_359;
        if ((_us_352 >= 0)) {
          tmpvar_359 = 1;
        } else {
          tmpvar_359 = 0;
        };
        _uidx1_353 = (6 + tmpvar_359);
      };
      highp int tmpvar_360;
      if ((tmpvar_356 < 0)) {
        tmpvar_360 = 3;
      } else {
        tmpvar_360 = tmpvar_356;
      };
      float tmpvar_361;
      tmpvar_361 = sin(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_353), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_360), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_358), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_44), 0.0, 3.0)
        )], tmpvar_355))
       * 3.141593) / 180.0));
      highp int _us_362;
      _us_362 = -1;
      highp int _uidx1_363;
      highp int tmpvar_364;
      if ((tmpvar_45 == 0)) {
        tmpvar_364 = 1;
      } else {
        tmpvar_364 = -1;
      };
      _us_362 = -(tmpvar_364);
      float tmpvar_365;
      tmpvar_365 = fract((iTime * 4.0));
      highp int tmpvar_366;
      tmpvar_366 = (tmpvar_44 - 1);
      highp int tmpvar_367;
      if ((_us_362 >= 0)) {
        tmpvar_367 = 0;
      } else {
        tmpvar_367 = 1;
      };
      highp int tmpvar_368;
      tmpvar_368 = (6 + tmpvar_367);
      _uidx1_363 = tmpvar_368;
      if ((tmpvar_366 < 0)) {
        highp int tmpvar_369;
        if ((_us_362 >= 0)) {
          tmpvar_369 = 1;
        } else {
          tmpvar_369 = 0;
        };
        _uidx1_363 = (6 + tmpvar_369);
      };
      highp int tmpvar_370;
      if ((tmpvar_366 < 0)) {
        tmpvar_370 = 3;
      } else {
        tmpvar_370 = tmpvar_366;
      };
      mat2 tmpvar_371;
      tmpvar_371[uint(0)].x = tmpvar_341;
      tmpvar_371[uint(0)].y = tmpvar_351;
      tmpvar_371[1u].x = -(tmpvar_361);
      tmpvar_371[1u].y = cos(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_363), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_370), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_368), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_44), 0.0, 3.0)
        )], tmpvar_365))
       * 3.141593) / 180.0));
      _upArm0R_31.yz = (tmpvar_331.yz * tmpvar_371);
      highp vec3 tmpvar_372;
      tmpvar_372 = (abs((_upArm0R_31 - vec3(0.0, 0.08, 0.0))) - vec3(0.02, 0.08, 0.02));
      highp vec3 tmpvar_373;
      tmpvar_373 = max (tmpvar_372, 0.0);
      highp float tmpvar_374;
      tmpvar_374 = min (tmpvar_330, (sqrt(
        dot (tmpvar_373, tmpvar_373)
      ) + min (
        max (tmpvar_372.x, max (tmpvar_372.y, tmpvar_372.z))
      , 0.0)));
      highp vec3 tmpvar_375;
      tmpvar_375 = (_upArm0R_31 + vec3(0.0, -0.16, 0.0));
      _upArm1R_30 = tmpvar_375;
      highp int _us_376;
      _us_376 = -1;
      highp int _uidx1_377;
      highp int tmpvar_378;
      if ((tmpvar_45 == 0)) {
        tmpvar_378 = 1;
      } else {
        tmpvar_378 = -1;
      };
      _us_376 = -(tmpvar_378);
      float tmpvar_379;
      tmpvar_379 = fract((iTime * 4.0));
      highp int tmpvar_380;
      tmpvar_380 = (tmpvar_44 - 1);
      highp int tmpvar_381;
      if ((_us_376 >= 0)) {
        tmpvar_381 = 0;
      } else {
        tmpvar_381 = 1;
      };
      highp int tmpvar_382;
      tmpvar_382 = (8 + tmpvar_381);
      _uidx1_377 = tmpvar_382;
      if ((tmpvar_380 < 0)) {
        highp int tmpvar_383;
        if ((_us_376 >= 0)) {
          tmpvar_383 = 1;
        } else {
          tmpvar_383 = 0;
        };
        _uidx1_377 = (8 + tmpvar_383);
      };
      highp int tmpvar_384;
      if ((tmpvar_380 < 0)) {
        tmpvar_384 = 3;
      } else {
        tmpvar_384 = tmpvar_380;
      };
      float tmpvar_385;
      tmpvar_385 = cos(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_377)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_384)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_382)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_44)
        , 0.0, 3.0))], tmpvar_379)
       * 3.141593) / 180.0));
      highp int _us_386;
      _us_386 = -1;
      highp int _uidx1_387;
      highp int tmpvar_388;
      if ((tmpvar_45 == 0)) {
        tmpvar_388 = 1;
      } else {
        tmpvar_388 = -1;
      };
      _us_386 = -(tmpvar_388);
      float tmpvar_389;
      tmpvar_389 = fract((iTime * 4.0));
      highp int tmpvar_390;
      tmpvar_390 = (tmpvar_44 - 1);
      highp int tmpvar_391;
      if ((_us_386 >= 0)) {
        tmpvar_391 = 0;
      } else {
        tmpvar_391 = 1;
      };
      highp int tmpvar_392;
      tmpvar_392 = (8 + tmpvar_391);
      _uidx1_387 = tmpvar_392;
      if ((tmpvar_390 < 0)) {
        highp int tmpvar_393;
        if ((_us_386 >= 0)) {
          tmpvar_393 = 1;
        } else {
          tmpvar_393 = 0;
        };
        _uidx1_387 = (8 + tmpvar_393);
      };
      highp int tmpvar_394;
      if ((tmpvar_390 < 0)) {
        tmpvar_394 = 3;
      } else {
        tmpvar_394 = tmpvar_390;
      };
      float tmpvar_395;
      tmpvar_395 = sin(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_387)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_394)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_392)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_44)
        , 0.0, 3.0))], tmpvar_389)
       * 3.141593) / 180.0));
      highp int _us_396;
      _us_396 = -1;
      highp int _uidx1_397;
      highp int tmpvar_398;
      if ((tmpvar_45 == 0)) {
        tmpvar_398 = 1;
      } else {
        tmpvar_398 = -1;
      };
      _us_396 = -(tmpvar_398);
      float tmpvar_399;
      tmpvar_399 = fract((iTime * 4.0));
      highp int tmpvar_400;
      tmpvar_400 = (tmpvar_44 - 1);
      highp int tmpvar_401;
      if ((_us_396 >= 0)) {
        tmpvar_401 = 0;
      } else {
        tmpvar_401 = 1;
      };
      highp int tmpvar_402;
      tmpvar_402 = (8 + tmpvar_401);
      _uidx1_397 = tmpvar_402;
      if ((tmpvar_400 < 0)) {
        highp int tmpvar_403;
        if ((_us_396 >= 0)) {
          tmpvar_403 = 1;
        } else {
          tmpvar_403 = 0;
        };
        _uidx1_397 = (8 + tmpvar_403);
      };
      highp int tmpvar_404;
      if ((tmpvar_400 < 0)) {
        tmpvar_404 = 3;
      } else {
        tmpvar_404 = tmpvar_400;
      };
      float tmpvar_405;
      tmpvar_405 = sin(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_397)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_404)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_402)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_44)
        , 0.0, 3.0))], tmpvar_399)
       * 3.141593) / 180.0));
      highp int _us_406;
      _us_406 = -1;
      highp int _uidx1_407;
      highp int tmpvar_408;
      if ((tmpvar_45 == 0)) {
        tmpvar_408 = 1;
      } else {
        tmpvar_408 = -1;
      };
      _us_406 = -(tmpvar_408);
      float tmpvar_409;
      tmpvar_409 = fract((iTime * 4.0));
      highp int tmpvar_410;
      tmpvar_410 = (tmpvar_44 - 1);
      highp int tmpvar_411;
      if ((_us_406 >= 0)) {
        tmpvar_411 = 0;
      } else {
        tmpvar_411 = 1;
      };
      highp int tmpvar_412;
      tmpvar_412 = (8 + tmpvar_411);
      _uidx1_407 = tmpvar_412;
      if ((tmpvar_410 < 0)) {
        highp int tmpvar_413;
        if ((_us_406 >= 0)) {
          tmpvar_413 = 1;
        } else {
          tmpvar_413 = 0;
        };
        _uidx1_407 = (8 + tmpvar_413);
      };
      highp int tmpvar_414;
      if ((tmpvar_410 < 0)) {
        tmpvar_414 = 3;
      } else {
        tmpvar_414 = tmpvar_410;
      };
      mat2 tmpvar_415;
      tmpvar_415[uint(0)].x = tmpvar_385;
      tmpvar_415[uint(0)].y = tmpvar_395;
      tmpvar_415[1u].x = -(tmpvar_405);
      tmpvar_415[1u].y = cos(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_407)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_414)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_412)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_44)
        , 0.0, 3.0))], tmpvar_409)
       * 3.141593) / 180.0));
      _upArm1R_30.yz = (tmpvar_375.yz * tmpvar_415);
      highp vec3 tmpvar_416;
      tmpvar_416 = (abs((_upArm1R_30 - vec3(0.0, 0.08, 0.0))) - vec3(0.02, 0.08, 0.02));
      highp vec3 tmpvar_417;
      tmpvar_417 = max (tmpvar_416, 0.0);
      highp float tmpvar_418;
      tmpvar_418 = min (tmpvar_374, (sqrt(
        dot (tmpvar_417, tmpvar_417)
      ) + min (
        max (tmpvar_416.x, max (tmpvar_416.y, tmpvar_416.z))
      , 0.0)));
      highp vec4 tmpvar_419;
      if ((tmpvar_418 < tmpvar_20.x)) {
        highp vec3 _upArm1R_420;
        highp vec3 _upArm0R_421;
        highp vec3 _upArm1L_422;
        highp vec3 _upArm0L_423;
        highp vec3 _upLeg1R_424;
        highp vec3 _upLeg0R_425;
        highp vec3 _upLeg1L_426;
        highp vec3 _upLeg0L_427;
        highp vec3 _upHead_428;
        highp vec3 _upNeck_429;
        highp vec3 _upChest_430;
        highp vec3 _upWaist_431;
        highp vec3 _upPelvis_432;
        float tmpvar_433;
        tmpvar_433 = (iTime * 4.0);
        highp int tmpvar_434;
        tmpvar_434 = ((int(tmpvar_433)% 4));
        highp int tmpvar_435;
        tmpvar_435 = ((int((tmpvar_433 / 4.0))% 2));
        highp int _uidx1_436;
        highp int tmpvar_437;
        if ((tmpvar_435 == 0)) {
          tmpvar_437 = 1;
        } else {
          tmpvar_437 = -1;
        };
        float tmpvar_438;
        tmpvar_438 = fract((iTime * 4.0));
        highp int tmpvar_439;
        tmpvar_439 = (tmpvar_434 - 1);
        highp int tmpvar_440;
        if ((tmpvar_437 >= 0)) {
          tmpvar_440 = 0;
        } else {
          tmpvar_440 = 1;
        };
        highp int tmpvar_441;
        tmpvar_441 = (10 + tmpvar_440);
        _uidx1_436 = tmpvar_441;
        if ((tmpvar_439 < 0)) {
          highp int tmpvar_442;
          if ((tmpvar_437 >= 0)) {
            tmpvar_442 = 1;
          } else {
            tmpvar_442 = 0;
          };
          _uidx1_436 = (10 + tmpvar_442);
        };
        highp int tmpvar_443;
        if ((tmpvar_439 < 0)) {
          tmpvar_443 = 3;
        } else {
          tmpvar_443 = tmpvar_439;
        };
        float tmpvar_444;
        tmpvar_444 = ((mix (
          vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (float(_uidx1_436), 0.0, 11.0))][int(clamp (float(tmpvar_443), 0.0, 3.0))]
        , 
          vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (float(tmpvar_441), 0.0, 11.0))][int(clamp (float(tmpvar_434), 0.0, 3.0))]
        , tmpvar_438) * 3.141593) / 180.0);
        highp int _uidx1_445;
        highp int tmpvar_446;
        if ((tmpvar_435 == 0)) {
          tmpvar_446 = 1;
        } else {
          tmpvar_446 = -1;
        };
        float tmpvar_447;
        tmpvar_447 = fract((iTime * 4.0));
        highp int tmpvar_448;
        tmpvar_448 = (tmpvar_434 - 1);
        highp int tmpvar_449;
        if ((tmpvar_446 >= 0)) {
          tmpvar_449 = 0;
        } else {
          tmpvar_449 = 1;
        };
        _uidx1_445 = tmpvar_449;
        if ((tmpvar_448 < 0)) {
          highp int tmpvar_450;
          if ((tmpvar_446 >= 0)) {
            tmpvar_450 = 1;
          } else {
            tmpvar_450 = 0;
          };
          _uidx1_445 = tmpvar_450;
        };
        highp int tmpvar_451;
        if ((tmpvar_448 < 0)) {
          tmpvar_451 = 3;
        } else {
          tmpvar_451 = tmpvar_448;
        };
        vec3 tmpvar_452;
        tmpvar_452.xz = vec2(0.0, 0.0);
        tmpvar_452.y = (-0.5 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[
          int(clamp (float(_uidx1_445), 0.0, 11.0))
        ][
          int(clamp (float(tmpvar_451), 0.0, 3.0))
        ], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[
          int(clamp (float(tmpvar_449), 0.0, 11.0))
        ][
          int(clamp (float(tmpvar_434), 0.0, 3.0))
        ], tmpvar_447));
        highp vec3 tmpvar_453;
        tmpvar_453 = (_up_16 + tmpvar_452);
        _upPelvis_432.z = tmpvar_453.z;
        mat2 tmpvar_454;
        tmpvar_454[uint(0)].x = cos(tmpvar_444);
        tmpvar_454[uint(0)].y = sin(tmpvar_444);
        tmpvar_454[1u].x = -(sin(tmpvar_444));
        tmpvar_454[1u].y = cos(tmpvar_444);
        _upPelvis_432.xy = (tmpvar_453.xy * tmpvar_454);
        highp vec3 tmpvar_455;
        tmpvar_455 = (abs((_upPelvis_432 - vec3(0.0, 0.0, 0.025))) - vec3(0.085, 0.05, 0.05));
        highp vec3 tmpvar_456;
        tmpvar_456 = max (tmpvar_455, 0.0);
        highp vec3 tmpvar_457;
        tmpvar_457 = (_upPelvis_432 + vec3(0.0, -0.05, -0.02));
        _upWaist_431.z = tmpvar_457.z;
        mat2 tmpvar_458;
        tmpvar_458[uint(0)].x = cos(-(tmpvar_444));
        tmpvar_458[uint(0)].y = sin(-(tmpvar_444));
        tmpvar_458[1u].x = -(sin(-(tmpvar_444)));
        tmpvar_458[1u].y = cos(-(tmpvar_444));
        _upWaist_431.xy = (tmpvar_457.xy * tmpvar_458);
        _upWaist_431.yz = (_upWaist_431.yz * mat2(1.0, 0.0, -0.0, 1.0));
        highp vec3 tmpvar_459;
        tmpvar_459 = (abs((_upWaist_431 - vec3(0.0, 0.04, 0.0))) - vec3(0.075, 0.08, 0.03));
        highp vec3 tmpvar_460;
        tmpvar_460 = max (tmpvar_459, 0.0);
        highp vec3 tmpvar_461;
        tmpvar_461 = (_upWaist_431 + vec3(0.0, -0.14, -0.01));
        _upChest_430.x = tmpvar_461.x;
        _upChest_430.yz = (tmpvar_461.yz * mat2(1.0, 0.0, -0.0, 1.0));
        highp vec3 tmpvar_462;
        tmpvar_462 = (abs((_upChest_430 - vec3(0.0, 0.04, 0.0))) - vec3(0.09, 0.08, 0.05));
        highp vec3 tmpvar_463;
        tmpvar_463 = max (tmpvar_462, 0.0);
        highp vec3 tmpvar_464;
        tmpvar_464 = (_upChest_430 + vec3(0.0, -0.15, 0.0));
        _upNeck_429.x = tmpvar_464.x;
        _upNeck_429.yz = (tmpvar_464.yz * mat2(1.0, 0.0, -0.0, 1.0));
        highp vec3 tmpvar_465;
        tmpvar_465 = (abs((_upNeck_429 - vec3(0.0, 0.01, 0.0))) - vec3(0.02, 0.04, 0.02));
        highp vec3 tmpvar_466;
        tmpvar_466 = max (tmpvar_465, 0.0);
        highp vec3 tmpvar_467;
        tmpvar_467 = (_upNeck_429 + vec3(0.0, -0.1, 0.0));
        _upHead_428.x = tmpvar_467.x;
        _upHead_428.yz = (tmpvar_467.yz * mat2(1.0, 0.0, -0.0, 1.0));
        highp vec3 tmpvar_468;
        tmpvar_468 = (abs((_upHead_428 - vec3(0.0, 0.04, -0.025))) - vec3(0.05, 0.08, 0.06));
        highp vec3 tmpvar_469;
        tmpvar_469 = max (tmpvar_468, 0.0);
        highp float tmpvar_470;
        tmpvar_470 = min (min (min (
          min (min (4.5, (sqrt(
            dot (tmpvar_456, tmpvar_456)
          ) + min (
            max (tmpvar_455.x, max (tmpvar_455.y, tmpvar_455.z))
          , 0.0))), (sqrt(dot (tmpvar_460, tmpvar_460)) + min (max (tmpvar_459.x, 
            max (tmpvar_459.y, tmpvar_459.z)
          ), 0.0)))
        , 
          (sqrt(dot (tmpvar_463, tmpvar_463)) + min (max (tmpvar_462.x, max (tmpvar_462.y, tmpvar_462.z)), 0.0))
        ), (
          sqrt(dot (tmpvar_466, tmpvar_466))
         + 
          min (max (tmpvar_465.x, max (tmpvar_465.y, tmpvar_465.z)), 0.0)
        )), (sqrt(
          dot (tmpvar_469, tmpvar_469)
        ) + min (
          max (tmpvar_468.x, max (tmpvar_468.y, tmpvar_468.z))
        , 0.0)));
        highp vec3 tmpvar_471;
        tmpvar_471 = (_upPelvis_432 + vec3(0.06, 0.025, 0.0));
        _upLeg0L_427.z = tmpvar_471.z;
        mat2 tmpvar_472;
        tmpvar_472[uint(0)].x = cos(-(tmpvar_444));
        tmpvar_472[uint(0)].y = sin(-(tmpvar_444));
        tmpvar_472[1u].x = -(sin(-(tmpvar_444)));
        tmpvar_472[1u].y = cos(-(tmpvar_444));
        _upLeg0L_427.xy = (tmpvar_471.xy * tmpvar_472);
        highp int _uidx1_473;
        highp int tmpvar_474;
        if ((tmpvar_435 == 0)) {
          tmpvar_474 = 1;
        } else {
          tmpvar_474 = -1;
        };
        float tmpvar_475;
        tmpvar_475 = fract((iTime * 4.0));
        highp int tmpvar_476;
        tmpvar_476 = (tmpvar_434 - 1);
        highp int tmpvar_477;
        if ((tmpvar_474 >= 0)) {
          tmpvar_477 = 0;
        } else {
          tmpvar_477 = 1;
        };
        highp int tmpvar_478;
        tmpvar_478 = (2 + tmpvar_477);
        _uidx1_473 = tmpvar_478;
        if ((tmpvar_476 < 0)) {
          highp int tmpvar_479;
          if ((tmpvar_474 >= 0)) {
            tmpvar_479 = 1;
          } else {
            tmpvar_479 = 0;
          };
          _uidx1_473 = (2 + tmpvar_479);
        };
        highp int tmpvar_480;
        if ((tmpvar_476 < 0)) {
          tmpvar_480 = 3;
        } else {
          tmpvar_480 = tmpvar_476;
        };
        float tmpvar_481;
        tmpvar_481 = cos(((
          (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
            clamp (float(_uidx1_473), 0.0, 11.0)
          )][int(
            clamp (float(tmpvar_480), 0.0, 3.0)
          )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
            clamp (float(tmpvar_478), 0.0, 11.0)
          )][int(
            clamp (float(tmpvar_434), 0.0, 3.0)
          )], tmpvar_475))
         * 3.141593) / 180.0));
        highp int _uidx1_482;
        highp int tmpvar_483;
        if ((tmpvar_435 == 0)) {
          tmpvar_483 = 1;
        } else {
          tmpvar_483 = -1;
        };
        float tmpvar_484;
        tmpvar_484 = fract((iTime * 4.0));
        highp int tmpvar_485;
        tmpvar_485 = (tmpvar_434 - 1);
        highp int tmpvar_486;
        if ((tmpvar_483 >= 0)) {
          tmpvar_486 = 0;
        } else {
          tmpvar_486 = 1;
        };
        highp int tmpvar_487;
        tmpvar_487 = (2 + tmpvar_486);
        _uidx1_482 = tmpvar_487;
        if ((tmpvar_485 < 0)) {
          highp int tmpvar_488;
          if ((tmpvar_483 >= 0)) {
            tmpvar_488 = 1;
          } else {
            tmpvar_488 = 0;
          };
          _uidx1_482 = (2 + tmpvar_488);
        };
        highp int tmpvar_489;
        if ((tmpvar_485 < 0)) {
          tmpvar_489 = 3;
        } else {
          tmpvar_489 = tmpvar_485;
        };
        float tmpvar_490;
        tmpvar_490 = sin(((
          (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
            clamp (float(_uidx1_482), 0.0, 11.0)
          )][int(
            clamp (float(tmpvar_489), 0.0, 3.0)
          )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
            clamp (float(tmpvar_487), 0.0, 11.0)
          )][int(
            clamp (float(tmpvar_434), 0.0, 3.0)
          )], tmpvar_484))
         * 3.141593) / 180.0));
        highp int _uidx1_491;
        highp int tmpvar_492;
        if ((tmpvar_435 == 0)) {
          tmpvar_492 = 1;
        } else {
          tmpvar_492 = -1;
        };
        float tmpvar_493;
        tmpvar_493 = fract((iTime * 4.0));
        highp int tmpvar_494;
        tmpvar_494 = (tmpvar_434 - 1);
        highp int tmpvar_495;
        if ((tmpvar_492 >= 0)) {
          tmpvar_495 = 0;
        } else {
          tmpvar_495 = 1;
        };
        highp int tmpvar_496;
        tmpvar_496 = (2 + tmpvar_495);
        _uidx1_491 = tmpvar_496;
        if ((tmpvar_494 < 0)) {
          highp int tmpvar_497;
          if ((tmpvar_492 >= 0)) {
            tmpvar_497 = 1;
          } else {
            tmpvar_497 = 0;
          };
          _uidx1_491 = (2 + tmpvar_497);
        };
        highp int tmpvar_498;
        if ((tmpvar_494 < 0)) {
          tmpvar_498 = 3;
        } else {
          tmpvar_498 = tmpvar_494;
        };
        float tmpvar_499;
        tmpvar_499 = sin(((
          (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
            clamp (float(_uidx1_491), 0.0, 11.0)
          )][int(
            clamp (float(tmpvar_498), 0.0, 3.0)
          )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
            clamp (float(tmpvar_496), 0.0, 11.0)
          )][int(
            clamp (float(tmpvar_434), 0.0, 3.0)
          )], tmpvar_493))
         * 3.141593) / 180.0));
        highp int _uidx1_500;
        highp int tmpvar_501;
        if ((tmpvar_435 == 0)) {
          tmpvar_501 = 1;
        } else {
          tmpvar_501 = -1;
        };
        float tmpvar_502;
        tmpvar_502 = fract((iTime * 4.0));
        highp int tmpvar_503;
        tmpvar_503 = (tmpvar_434 - 1);
        highp int tmpvar_504;
        if ((tmpvar_501 >= 0)) {
          tmpvar_504 = 0;
        } else {
          tmpvar_504 = 1;
        };
        highp int tmpvar_505;
        tmpvar_505 = (2 + tmpvar_504);
        _uidx1_500 = tmpvar_505;
        if ((tmpvar_503 < 0)) {
          highp int tmpvar_506;
          if ((tmpvar_501 >= 0)) {
            tmpvar_506 = 1;
          } else {
            tmpvar_506 = 0;
          };
          _uidx1_500 = (2 + tmpvar_506);
        };
        highp int tmpvar_507;
        if ((tmpvar_503 < 0)) {
          tmpvar_507 = 3;
        } else {
          tmpvar_507 = tmpvar_503;
        };
        mat2 tmpvar_508;
        tmpvar_508[uint(0)].x = tmpvar_481;
        tmpvar_508[uint(0)].y = tmpvar_490;
        tmpvar_508[1u].x = -(tmpvar_499);
        tmpvar_508[1u].y = cos(((
          (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
            clamp (float(_uidx1_500), 0.0, 11.0)
          )][int(
            clamp (float(tmpvar_507), 0.0, 3.0)
          )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
            clamp (float(tmpvar_505), 0.0, 11.0)
          )][int(
            clamp (float(tmpvar_434), 0.0, 3.0)
          )], tmpvar_502))
         * 3.141593) / 180.0));
        _upLeg0L_427.yz = (_upLeg0L_427.yz * tmpvar_508);
        highp vec3 tmpvar_509;
        tmpvar_509 = (abs((_upLeg0L_427 - vec3(0.0, 0.1, 0.0))) - vec3(0.025, 0.1, 0.025));
        highp vec3 tmpvar_510;
        tmpvar_510 = max (tmpvar_509, 0.0);
        highp float tmpvar_511;
        tmpvar_511 = min (tmpvar_470, (sqrt(
          dot (tmpvar_510, tmpvar_510)
        ) + min (
          max (tmpvar_509.x, max (tmpvar_509.y, tmpvar_509.z))
        , 0.0)));
        highp vec3 tmpvar_512;
        tmpvar_512 = (_upLeg0L_427 + vec3(0.01, -0.18, 0.02));
        _upLeg1L_426 = tmpvar_512;
        highp int _uidx1_513;
        highp int tmpvar_514;
        if ((tmpvar_435 == 0)) {
          tmpvar_514 = 1;
        } else {
          tmpvar_514 = -1;
        };
        float tmpvar_515;
        tmpvar_515 = fract((iTime * 4.0));
        highp int tmpvar_516;
        tmpvar_516 = (tmpvar_434 - 1);
        highp int tmpvar_517;
        if ((tmpvar_514 >= 0)) {
          tmpvar_517 = 0;
        } else {
          tmpvar_517 = 1;
        };
        highp int tmpvar_518;
        tmpvar_518 = (4 + tmpvar_517);
        _uidx1_513 = tmpvar_518;
        if ((tmpvar_516 < 0)) {
          highp int tmpvar_519;
          if ((tmpvar_514 >= 0)) {
            tmpvar_519 = 1;
          } else {
            tmpvar_519 = 0;
          };
          _uidx1_513 = (4 + tmpvar_519);
        };
        highp int tmpvar_520;
        if ((tmpvar_516 < 0)) {
          tmpvar_520 = 3;
        } else {
          tmpvar_520 = tmpvar_516;
        };
        float tmpvar_521;
        tmpvar_521 = cos(((
          mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
            float(_uidx1_513)
          , 0.0, 11.0))][int(clamp (
            float(tmpvar_520)
          , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
            float(tmpvar_518)
          , 0.0, 11.0))][int(clamp (
            float(tmpvar_434)
          , 0.0, 3.0))], tmpvar_515)
         * 3.141593) / 180.0));
        highp int _uidx1_522;
        highp int tmpvar_523;
        if ((tmpvar_435 == 0)) {
          tmpvar_523 = 1;
        } else {
          tmpvar_523 = -1;
        };
        float tmpvar_524;
        tmpvar_524 = fract((iTime * 4.0));
        highp int tmpvar_525;
        tmpvar_525 = (tmpvar_434 - 1);
        highp int tmpvar_526;
        if ((tmpvar_523 >= 0)) {
          tmpvar_526 = 0;
        } else {
          tmpvar_526 = 1;
        };
        highp int tmpvar_527;
        tmpvar_527 = (4 + tmpvar_526);
        _uidx1_522 = tmpvar_527;
        if ((tmpvar_525 < 0)) {
          highp int tmpvar_528;
          if ((tmpvar_523 >= 0)) {
            tmpvar_528 = 1;
          } else {
            tmpvar_528 = 0;
          };
          _uidx1_522 = (4 + tmpvar_528);
        };
        highp int tmpvar_529;
        if ((tmpvar_525 < 0)) {
          tmpvar_529 = 3;
        } else {
          tmpvar_529 = tmpvar_525;
        };
        float tmpvar_530;
        tmpvar_530 = sin(((
          mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
            float(_uidx1_522)
          , 0.0, 11.0))][int(clamp (
            float(tmpvar_529)
          , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
            float(tmpvar_527)
          , 0.0, 11.0))][int(clamp (
            float(tmpvar_434)
          , 0.0, 3.0))], tmpvar_524)
         * 3.141593) / 180.0));
        highp int _uidx1_531;
        highp int tmpvar_532;
        if ((tmpvar_435 == 0)) {
          tmpvar_532 = 1;
        } else {
          tmpvar_532 = -1;
        };
        float tmpvar_533;
        tmpvar_533 = fract((iTime * 4.0));
        highp int tmpvar_534;
        tmpvar_534 = (tmpvar_434 - 1);
        highp int tmpvar_535;
        if ((tmpvar_532 >= 0)) {
          tmpvar_535 = 0;
        } else {
          tmpvar_535 = 1;
        };
        highp int tmpvar_536;
        tmpvar_536 = (4 + tmpvar_535);
        _uidx1_531 = tmpvar_536;
        if ((tmpvar_534 < 0)) {
          highp int tmpvar_537;
          if ((tmpvar_532 >= 0)) {
            tmpvar_537 = 1;
          } else {
            tmpvar_537 = 0;
          };
          _uidx1_531 = (4 + tmpvar_537);
        };
        highp int tmpvar_538;
        if ((tmpvar_534 < 0)) {
          tmpvar_538 = 3;
        } else {
          tmpvar_538 = tmpvar_534;
        };
        float tmpvar_539;
        tmpvar_539 = sin(((
          mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
            float(_uidx1_531)
          , 0.0, 11.0))][int(clamp (
            float(tmpvar_538)
          , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
            float(tmpvar_536)
          , 0.0, 11.0))][int(clamp (
            float(tmpvar_434)
          , 0.0, 3.0))], tmpvar_533)
         * 3.141593) / 180.0));
        highp int _uidx1_540;
        highp int tmpvar_541;
        if ((tmpvar_435 == 0)) {
          tmpvar_541 = 1;
        } else {
          tmpvar_541 = -1;
        };
        float tmpvar_542;
        tmpvar_542 = fract((iTime * 4.0));
        highp int tmpvar_543;
        tmpvar_543 = (tmpvar_434 - 1);
        highp int tmpvar_544;
        if ((tmpvar_541 >= 0)) {
          tmpvar_544 = 0;
        } else {
          tmpvar_544 = 1;
        };
        highp int tmpvar_545;
        tmpvar_545 = (4 + tmpvar_544);
        _uidx1_540 = tmpvar_545;
        if ((tmpvar_543 < 0)) {
          highp int tmpvar_546;
          if ((tmpvar_541 >= 0)) {
            tmpvar_546 = 1;
          } else {
            tmpvar_546 = 0;
          };
          _uidx1_540 = (4 + tmpvar_546);
        };
        highp int tmpvar_547;
        if ((tmpvar_543 < 0)) {
          tmpvar_547 = 3;
        } else {
          tmpvar_547 = tmpvar_543;
        };
        mat2 tmpvar_548;
        tmpvar_548[uint(0)].x = tmpvar_521;
        tmpvar_548[uint(0)].y = tmpvar_530;
        tmpvar_548[1u].x = -(tmpvar_539);
        tmpvar_548[1u].y = cos(((
          mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
            float(_uidx1_540)
          , 0.0, 11.0))][int(clamp (
            float(tmpvar_547)
          , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
            float(tmpvar_545)
          , 0.0, 11.0))][int(clamp (
            float(tmpvar_434)
          , 0.0, 3.0))], tmpvar_542)
         * 3.141593) / 180.0));
        _upLeg1L_426.yz = (tmpvar_512.yz * tmpvar_548);
        highp vec3 tmpvar_549;
        tmpvar_549 = (abs((_upLeg1L_426 - vec3(0.0, 0.1, 0.0))) - vec3(0.025, 0.1, 0.025));
        highp vec3 tmpvar_550;
        tmpvar_550 = max (tmpvar_549, 0.0);
        highp float tmpvar_551;
        tmpvar_551 = min (tmpvar_511, (sqrt(
          dot (tmpvar_550, tmpvar_550)
        ) + min (
          max (tmpvar_549.x, max (tmpvar_549.y, tmpvar_549.z))
        , 0.0)));
        highp vec3 tmpvar_552;
        tmpvar_552 = (_upPelvis_432 + vec3(-0.06, 0.025, 0.0));
        _upLeg0R_425.z = tmpvar_552.z;
        mat2 tmpvar_553;
        tmpvar_553[uint(0)].x = cos(-(tmpvar_444));
        tmpvar_553[uint(0)].y = sin(-(tmpvar_444));
        tmpvar_553[1u].x = -(sin(-(tmpvar_444)));
        tmpvar_553[1u].y = cos(-(tmpvar_444));
        _upLeg0R_425.xy = (tmpvar_552.xy * tmpvar_553);
        highp int _us_554;
        _us_554 = -1;
        highp int _uidx1_555;
        highp int tmpvar_556;
        if ((tmpvar_435 == 0)) {
          tmpvar_556 = 1;
        } else {
          tmpvar_556 = -1;
        };
        _us_554 = -(tmpvar_556);
        float tmpvar_557;
        tmpvar_557 = fract((iTime * 4.0));
        highp int tmpvar_558;
        tmpvar_558 = (tmpvar_434 - 1);
        highp int tmpvar_559;
        if ((_us_554 >= 0)) {
          tmpvar_559 = 0;
        } else {
          tmpvar_559 = 1;
        };
        highp int tmpvar_560;
        tmpvar_560 = (2 + tmpvar_559);
        _uidx1_555 = tmpvar_560;
        if ((tmpvar_558 < 0)) {
          highp int tmpvar_561;
          if ((_us_554 >= 0)) {
            tmpvar_561 = 1;
          } else {
            tmpvar_561 = 0;
          };
          _uidx1_555 = (2 + tmpvar_561);
        };
        highp int tmpvar_562;
        if ((tmpvar_558 < 0)) {
          tmpvar_562 = 3;
        } else {
          tmpvar_562 = tmpvar_558;
        };
        float tmpvar_563;
        tmpvar_563 = cos(((
          (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
            clamp (float(_uidx1_555), 0.0, 11.0)
          )][int(
            clamp (float(tmpvar_562), 0.0, 3.0)
          )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
            clamp (float(tmpvar_560), 0.0, 11.0)
          )][int(
            clamp (float(tmpvar_434), 0.0, 3.0)
          )], tmpvar_557))
         * 3.141593) / 180.0));
        highp int _us_564;
        _us_564 = -1;
        highp int _uidx1_565;
        highp int tmpvar_566;
        if ((tmpvar_435 == 0)) {
          tmpvar_566 = 1;
        } else {
          tmpvar_566 = -1;
        };
        _us_564 = -(tmpvar_566);
        float tmpvar_567;
        tmpvar_567 = fract((iTime * 4.0));
        highp int tmpvar_568;
        tmpvar_568 = (tmpvar_434 - 1);
        highp int tmpvar_569;
        if ((_us_564 >= 0)) {
          tmpvar_569 = 0;
        } else {
          tmpvar_569 = 1;
        };
        highp int tmpvar_570;
        tmpvar_570 = (2 + tmpvar_569);
        _uidx1_565 = tmpvar_570;
        if ((tmpvar_568 < 0)) {
          highp int tmpvar_571;
          if ((_us_564 >= 0)) {
            tmpvar_571 = 1;
          } else {
            tmpvar_571 = 0;
          };
          _uidx1_565 = (2 + tmpvar_571);
        };
        highp int tmpvar_572;
        if ((tmpvar_568 < 0)) {
          tmpvar_572 = 3;
        } else {
          tmpvar_572 = tmpvar_568;
        };
        float tmpvar_573;
        tmpvar_573 = sin(((
          (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
            clamp (float(_uidx1_565), 0.0, 11.0)
          )][int(
            clamp (float(tmpvar_572), 0.0, 3.0)
          )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
            clamp (float(tmpvar_570), 0.0, 11.0)
          )][int(
            clamp (float(tmpvar_434), 0.0, 3.0)
          )], tmpvar_567))
         * 3.141593) / 180.0));
        highp int _us_574;
        _us_574 = -1;
        highp int _uidx1_575;
        highp int tmpvar_576;
        if ((tmpvar_435 == 0)) {
          tmpvar_576 = 1;
        } else {
          tmpvar_576 = -1;
        };
        _us_574 = -(tmpvar_576);
        float tmpvar_577;
        tmpvar_577 = fract((iTime * 4.0));
        highp int tmpvar_578;
        tmpvar_578 = (tmpvar_434 - 1);
        highp int tmpvar_579;
        if ((_us_574 >= 0)) {
          tmpvar_579 = 0;
        } else {
          tmpvar_579 = 1;
        };
        highp int tmpvar_580;
        tmpvar_580 = (2 + tmpvar_579);
        _uidx1_575 = tmpvar_580;
        if ((tmpvar_578 < 0)) {
          highp int tmpvar_581;
          if ((_us_574 >= 0)) {
            tmpvar_581 = 1;
          } else {
            tmpvar_581 = 0;
          };
          _uidx1_575 = (2 + tmpvar_581);
        };
        highp int tmpvar_582;
        if ((tmpvar_578 < 0)) {
          tmpvar_582 = 3;
        } else {
          tmpvar_582 = tmpvar_578;
        };
        float tmpvar_583;
        tmpvar_583 = sin(((
          (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
            clamp (float(_uidx1_575), 0.0, 11.0)
          )][int(
            clamp (float(tmpvar_582), 0.0, 3.0)
          )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
            clamp (float(tmpvar_580), 0.0, 11.0)
          )][int(
            clamp (float(tmpvar_434), 0.0, 3.0)
          )], tmpvar_577))
         * 3.141593) / 180.0));
        highp int _us_584;
        _us_584 = -1;
        highp int _uidx1_585;
        highp int tmpvar_586;
        if ((tmpvar_435 == 0)) {
          tmpvar_586 = 1;
        } else {
          tmpvar_586 = -1;
        };
        _us_584 = -(tmpvar_586);
        float tmpvar_587;
        tmpvar_587 = fract((iTime * 4.0));
        highp int tmpvar_588;
        tmpvar_588 = (tmpvar_434 - 1);
        highp int tmpvar_589;
        if ((_us_584 >= 0)) {
          tmpvar_589 = 0;
        } else {
          tmpvar_589 = 1;
        };
        highp int tmpvar_590;
        tmpvar_590 = (2 + tmpvar_589);
        _uidx1_585 = tmpvar_590;
        if ((tmpvar_588 < 0)) {
          highp int tmpvar_591;
          if ((_us_584 >= 0)) {
            tmpvar_591 = 1;
          } else {
            tmpvar_591 = 0;
          };
          _uidx1_585 = (2 + tmpvar_591);
        };
        highp int tmpvar_592;
        if ((tmpvar_588 < 0)) {
          tmpvar_592 = 3;
        } else {
          tmpvar_592 = tmpvar_588;
        };
        mat2 tmpvar_593;
        tmpvar_593[uint(0)].x = tmpvar_563;
        tmpvar_593[uint(0)].y = tmpvar_573;
        tmpvar_593[1u].x = -(tmpvar_583);
        tmpvar_593[1u].y = cos(((
          (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
            clamp (float(_uidx1_585), 0.0, 11.0)
          )][int(
            clamp (float(tmpvar_592), 0.0, 3.0)
          )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
            clamp (float(tmpvar_590), 0.0, 11.0)
          )][int(
            clamp (float(tmpvar_434), 0.0, 3.0)
          )], tmpvar_587))
         * 3.141593) / 180.0));
        _upLeg0R_425.yz = (_upLeg0R_425.yz * tmpvar_593);
        highp vec3 tmpvar_594;
        tmpvar_594 = (abs((_upLeg0R_425 - vec3(0.0, 0.1, 0.0))) - vec3(0.025, 0.1, 0.025));
        highp vec3 tmpvar_595;
        tmpvar_595 = max (tmpvar_594, 0.0);
        highp float tmpvar_596;
        tmpvar_596 = min (tmpvar_551, (sqrt(
          dot (tmpvar_595, tmpvar_595)
        ) + min (
          max (tmpvar_594.x, max (tmpvar_594.y, tmpvar_594.z))
        , 0.0)));
        highp vec3 tmpvar_597;
        tmpvar_597 = (_upLeg0R_425 + vec3(-0.01, -0.18, 0.02));
        _upLeg1R_424 = tmpvar_597;
        highp int _us_598;
        _us_598 = -1;
        highp int _uidx1_599;
        highp int tmpvar_600;
        if ((tmpvar_435 == 0)) {
          tmpvar_600 = 1;
        } else {
          tmpvar_600 = -1;
        };
        _us_598 = -(tmpvar_600);
        float tmpvar_601;
        tmpvar_601 = fract((iTime * 4.0));
        highp int tmpvar_602;
        tmpvar_602 = (tmpvar_434 - 1);
        highp int tmpvar_603;
        if ((_us_598 >= 0)) {
          tmpvar_603 = 0;
        } else {
          tmpvar_603 = 1;
        };
        highp int tmpvar_604;
        tmpvar_604 = (4 + tmpvar_603);
        _uidx1_599 = tmpvar_604;
        if ((tmpvar_602 < 0)) {
          highp int tmpvar_605;
          if ((_us_598 >= 0)) {
            tmpvar_605 = 1;
          } else {
            tmpvar_605 = 0;
          };
          _uidx1_599 = (4 + tmpvar_605);
        };
        highp int tmpvar_606;
        if ((tmpvar_602 < 0)) {
          tmpvar_606 = 3;
        } else {
          tmpvar_606 = tmpvar_602;
        };
        float tmpvar_607;
        tmpvar_607 = cos(((
          mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
            float(_uidx1_599)
          , 0.0, 11.0))][int(clamp (
            float(tmpvar_606)
          , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
            float(tmpvar_604)
          , 0.0, 11.0))][int(clamp (
            float(tmpvar_434)
          , 0.0, 3.0))], tmpvar_601)
         * 3.141593) / 180.0));
        highp int _us_608;
        _us_608 = -1;
        highp int _uidx1_609;
        highp int tmpvar_610;
        if ((tmpvar_435 == 0)) {
          tmpvar_610 = 1;
        } else {
          tmpvar_610 = -1;
        };
        _us_608 = -(tmpvar_610);
        float tmpvar_611;
        tmpvar_611 = fract((iTime * 4.0));
        highp int tmpvar_612;
        tmpvar_612 = (tmpvar_434 - 1);
        highp int tmpvar_613;
        if ((_us_608 >= 0)) {
          tmpvar_613 = 0;
        } else {
          tmpvar_613 = 1;
        };
        highp int tmpvar_614;
        tmpvar_614 = (4 + tmpvar_613);
        _uidx1_609 = tmpvar_614;
        if ((tmpvar_612 < 0)) {
          highp int tmpvar_615;
          if ((_us_608 >= 0)) {
            tmpvar_615 = 1;
          } else {
            tmpvar_615 = 0;
          };
          _uidx1_609 = (4 + tmpvar_615);
        };
        highp int tmpvar_616;
        if ((tmpvar_612 < 0)) {
          tmpvar_616 = 3;
        } else {
          tmpvar_616 = tmpvar_612;
        };
        float tmpvar_617;
        tmpvar_617 = sin(((
          mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
            float(_uidx1_609)
          , 0.0, 11.0))][int(clamp (
            float(tmpvar_616)
          , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
            float(tmpvar_614)
          , 0.0, 11.0))][int(clamp (
            float(tmpvar_434)
          , 0.0, 3.0))], tmpvar_611)
         * 3.141593) / 180.0));
        highp int _us_618;
        _us_618 = -1;
        highp int _uidx1_619;
        highp int tmpvar_620;
        if ((tmpvar_435 == 0)) {
          tmpvar_620 = 1;
        } else {
          tmpvar_620 = -1;
        };
        _us_618 = -(tmpvar_620);
        float tmpvar_621;
        tmpvar_621 = fract((iTime * 4.0));
        highp int tmpvar_622;
        tmpvar_622 = (tmpvar_434 - 1);
        highp int tmpvar_623;
        if ((_us_618 >= 0)) {
          tmpvar_623 = 0;
        } else {
          tmpvar_623 = 1;
        };
        highp int tmpvar_624;
        tmpvar_624 = (4 + tmpvar_623);
        _uidx1_619 = tmpvar_624;
        if ((tmpvar_622 < 0)) {
          highp int tmpvar_625;
          if ((_us_618 >= 0)) {
            tmpvar_625 = 1;
          } else {
            tmpvar_625 = 0;
          };
          _uidx1_619 = (4 + tmpvar_625);
        };
        highp int tmpvar_626;
        if ((tmpvar_622 < 0)) {
          tmpvar_626 = 3;
        } else {
          tmpvar_626 = tmpvar_622;
        };
        float tmpvar_627;
        tmpvar_627 = sin(((
          mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
            float(_uidx1_619)
          , 0.0, 11.0))][int(clamp (
            float(tmpvar_626)
          , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
            float(tmpvar_624)
          , 0.0, 11.0))][int(clamp (
            float(tmpvar_434)
          , 0.0, 3.0))], tmpvar_621)
         * 3.141593) / 180.0));
        highp int _us_628;
        _us_628 = -1;
        highp int _uidx1_629;
        highp int tmpvar_630;
        if ((tmpvar_435 == 0)) {
          tmpvar_630 = 1;
        } else {
          tmpvar_630 = -1;
        };
        _us_628 = -(tmpvar_630);
        float tmpvar_631;
        tmpvar_631 = fract((iTime * 4.0));
        highp int tmpvar_632;
        tmpvar_632 = (tmpvar_434 - 1);
        highp int tmpvar_633;
        if ((_us_628 >= 0)) {
          tmpvar_633 = 0;
        } else {
          tmpvar_633 = 1;
        };
        highp int tmpvar_634;
        tmpvar_634 = (4 + tmpvar_633);
        _uidx1_629 = tmpvar_634;
        if ((tmpvar_632 < 0)) {
          highp int tmpvar_635;
          if ((_us_628 >= 0)) {
            tmpvar_635 = 1;
          } else {
            tmpvar_635 = 0;
          };
          _uidx1_629 = (4 + tmpvar_635);
        };
        highp int tmpvar_636;
        if ((tmpvar_632 < 0)) {
          tmpvar_636 = 3;
        } else {
          tmpvar_636 = tmpvar_632;
        };
        mat2 tmpvar_637;
        tmpvar_637[uint(0)].x = tmpvar_607;
        tmpvar_637[uint(0)].y = tmpvar_617;
        tmpvar_637[1u].x = -(tmpvar_627);
        tmpvar_637[1u].y = cos(((
          mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
            float(_uidx1_629)
          , 0.0, 11.0))][int(clamp (
            float(tmpvar_636)
          , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
            float(tmpvar_634)
          , 0.0, 11.0))][int(clamp (
            float(tmpvar_434)
          , 0.0, 3.0))], tmpvar_631)
         * 3.141593) / 180.0));
        _upLeg1R_424.yz = (tmpvar_597.yz * tmpvar_637);
        highp vec3 tmpvar_638;
        tmpvar_638 = (abs((_upLeg1R_424 - vec3(0.0, 0.1, 0.0))) - vec3(0.025, 0.1, 0.025));
        highp vec3 tmpvar_639;
        tmpvar_639 = max (tmpvar_638, 0.0);
        highp float tmpvar_640;
        tmpvar_640 = min (tmpvar_596, (sqrt(
          dot (tmpvar_639, tmpvar_639)
        ) + min (
          max (tmpvar_638.x, max (tmpvar_638.y, tmpvar_638.z))
        , 0.0)));
        highp vec3 tmpvar_641;
        tmpvar_641 = (_upChest_430 + vec3(0.125, -0.1, 0.0));
        _upArm0L_423 = tmpvar_641;
        highp int _uidx1_642;
        highp int tmpvar_643;
        if ((tmpvar_435 == 0)) {
          tmpvar_643 = 1;
        } else {
          tmpvar_643 = -1;
        };
        float tmpvar_644;
        tmpvar_644 = fract((iTime * 4.0));
        highp int tmpvar_645;
        tmpvar_645 = (tmpvar_434 - 1);
        highp int tmpvar_646;
        if ((tmpvar_643 >= 0)) {
          tmpvar_646 = 0;
        } else {
          tmpvar_646 = 1;
        };
        highp int tmpvar_647;
        tmpvar_647 = (6 + tmpvar_646);
        _uidx1_642 = tmpvar_647;
        if ((tmpvar_645 < 0)) {
          highp int tmpvar_648;
          if ((tmpvar_643 >= 0)) {
            tmpvar_648 = 1;
          } else {
            tmpvar_648 = 0;
          };
          _uidx1_642 = (6 + tmpvar_648);
        };
        highp int tmpvar_649;
        if ((tmpvar_645 < 0)) {
          tmpvar_649 = 3;
        } else {
          tmpvar_649 = tmpvar_645;
        };
        float tmpvar_650;
        tmpvar_650 = cos(((
          (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
            clamp (float(_uidx1_642), 0.0, 11.0)
          )][int(
            clamp (float(tmpvar_649), 0.0, 3.0)
          )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
            clamp (float(tmpvar_647), 0.0, 11.0)
          )][int(
            clamp (float(tmpvar_434), 0.0, 3.0)
          )], tmpvar_644))
         * 3.141593) / 180.0));
        highp int _uidx1_651;
        highp int tmpvar_652;
        if ((tmpvar_435 == 0)) {
          tmpvar_652 = 1;
        } else {
          tmpvar_652 = -1;
        };
        float tmpvar_653;
        tmpvar_653 = fract((iTime * 4.0));
        highp int tmpvar_654;
        tmpvar_654 = (tmpvar_434 - 1);
        highp int tmpvar_655;
        if ((tmpvar_652 >= 0)) {
          tmpvar_655 = 0;
        } else {
          tmpvar_655 = 1;
        };
        highp int tmpvar_656;
        tmpvar_656 = (6 + tmpvar_655);
        _uidx1_651 = tmpvar_656;
        if ((tmpvar_654 < 0)) {
          highp int tmpvar_657;
          if ((tmpvar_652 >= 0)) {
            tmpvar_657 = 1;
          } else {
            tmpvar_657 = 0;
          };
          _uidx1_651 = (6 + tmpvar_657);
        };
        highp int tmpvar_658;
        if ((tmpvar_654 < 0)) {
          tmpvar_658 = 3;
        } else {
          tmpvar_658 = tmpvar_654;
        };
        float tmpvar_659;
        tmpvar_659 = sin(((
          (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
            clamp (float(_uidx1_651), 0.0, 11.0)
          )][int(
            clamp (float(tmpvar_658), 0.0, 3.0)
          )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
            clamp (float(tmpvar_656), 0.0, 11.0)
          )][int(
            clamp (float(tmpvar_434), 0.0, 3.0)
          )], tmpvar_653))
         * 3.141593) / 180.0));
        highp int _uidx1_660;
        highp int tmpvar_661;
        if ((tmpvar_435 == 0)) {
          tmpvar_661 = 1;
        } else {
          tmpvar_661 = -1;
        };
        float tmpvar_662;
        tmpvar_662 = fract((iTime * 4.0));
        highp int tmpvar_663;
        tmpvar_663 = (tmpvar_434 - 1);
        highp int tmpvar_664;
        if ((tmpvar_661 >= 0)) {
          tmpvar_664 = 0;
        } else {
          tmpvar_664 = 1;
        };
        highp int tmpvar_665;
        tmpvar_665 = (6 + tmpvar_664);
        _uidx1_660 = tmpvar_665;
        if ((tmpvar_663 < 0)) {
          highp int tmpvar_666;
          if ((tmpvar_661 >= 0)) {
            tmpvar_666 = 1;
          } else {
            tmpvar_666 = 0;
          };
          _uidx1_660 = (6 + tmpvar_666);
        };
        highp int tmpvar_667;
        if ((tmpvar_663 < 0)) {
          tmpvar_667 = 3;
        } else {
          tmpvar_667 = tmpvar_663;
        };
        float tmpvar_668;
        tmpvar_668 = sin(((
          (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
            clamp (float(_uidx1_660), 0.0, 11.0)
          )][int(
            clamp (float(tmpvar_667), 0.0, 3.0)
          )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
            clamp (float(tmpvar_665), 0.0, 11.0)
          )][int(
            clamp (float(tmpvar_434), 0.0, 3.0)
          )], tmpvar_662))
         * 3.141593) / 180.0));
        highp int _uidx1_669;
        highp int tmpvar_670;
        if ((tmpvar_435 == 0)) {
          tmpvar_670 = 1;
        } else {
          tmpvar_670 = -1;
        };
        float tmpvar_671;
        tmpvar_671 = fract((iTime * 4.0));
        highp int tmpvar_672;
        tmpvar_672 = (tmpvar_434 - 1);
        highp int tmpvar_673;
        if ((tmpvar_670 >= 0)) {
          tmpvar_673 = 0;
        } else {
          tmpvar_673 = 1;
        };
        highp int tmpvar_674;
        tmpvar_674 = (6 + tmpvar_673);
        _uidx1_669 = tmpvar_674;
        if ((tmpvar_672 < 0)) {
          highp int tmpvar_675;
          if ((tmpvar_670 >= 0)) {
            tmpvar_675 = 1;
          } else {
            tmpvar_675 = 0;
          };
          _uidx1_669 = (6 + tmpvar_675);
        };
        highp int tmpvar_676;
        if ((tmpvar_672 < 0)) {
          tmpvar_676 = 3;
        } else {
          tmpvar_676 = tmpvar_672;
        };
        mat2 tmpvar_677;
        tmpvar_677[uint(0)].x = tmpvar_650;
        tmpvar_677[uint(0)].y = tmpvar_659;
        tmpvar_677[1u].x = -(tmpvar_668);
        tmpvar_677[1u].y = cos(((
          (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
            clamp (float(_uidx1_669), 0.0, 11.0)
          )][int(
            clamp (float(tmpvar_676), 0.0, 3.0)
          )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
            clamp (float(tmpvar_674), 0.0, 11.0)
          )][int(
            clamp (float(tmpvar_434), 0.0, 3.0)
          )], tmpvar_671))
         * 3.141593) / 180.0));
        _upArm0L_423.yz = (tmpvar_641.yz * tmpvar_677);
        highp vec3 tmpvar_678;
        tmpvar_678 = (abs((_upArm0L_423 - vec3(0.0, 0.08, 0.0))) - vec3(0.02, 0.08, 0.02));
        highp vec3 tmpvar_679;
        tmpvar_679 = max (tmpvar_678, 0.0);
        highp float tmpvar_680;
        tmpvar_680 = min (tmpvar_640, (sqrt(
          dot (tmpvar_679, tmpvar_679)
        ) + min (
          max (tmpvar_678.x, max (tmpvar_678.y, tmpvar_678.z))
        , 0.0)));
        highp vec3 tmpvar_681;
        tmpvar_681 = (_upArm0L_423 + vec3(0.0, -0.16, 0.0));
        _upArm1L_422 = tmpvar_681;
        highp int _uidx1_682;
        highp int tmpvar_683;
        if ((tmpvar_435 == 0)) {
          tmpvar_683 = 1;
        } else {
          tmpvar_683 = -1;
        };
        float tmpvar_684;
        tmpvar_684 = fract((iTime * 4.0));
        highp int tmpvar_685;
        tmpvar_685 = (tmpvar_434 - 1);
        highp int tmpvar_686;
        if ((tmpvar_683 >= 0)) {
          tmpvar_686 = 0;
        } else {
          tmpvar_686 = 1;
        };
        highp int tmpvar_687;
        tmpvar_687 = (8 + tmpvar_686);
        _uidx1_682 = tmpvar_687;
        if ((tmpvar_685 < 0)) {
          highp int tmpvar_688;
          if ((tmpvar_683 >= 0)) {
            tmpvar_688 = 1;
          } else {
            tmpvar_688 = 0;
          };
          _uidx1_682 = (8 + tmpvar_688);
        };
        highp int tmpvar_689;
        if ((tmpvar_685 < 0)) {
          tmpvar_689 = 3;
        } else {
          tmpvar_689 = tmpvar_685;
        };
        float tmpvar_690;
        tmpvar_690 = cos(((
          mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
            float(_uidx1_682)
          , 0.0, 11.0))][int(clamp (
            float(tmpvar_689)
          , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
            float(tmpvar_687)
          , 0.0, 11.0))][int(clamp (
            float(tmpvar_434)
          , 0.0, 3.0))], tmpvar_684)
         * 3.141593) / 180.0));
        highp int _uidx1_691;
        highp int tmpvar_692;
        if ((tmpvar_435 == 0)) {
          tmpvar_692 = 1;
        } else {
          tmpvar_692 = -1;
        };
        float tmpvar_693;
        tmpvar_693 = fract((iTime * 4.0));
        highp int tmpvar_694;
        tmpvar_694 = (tmpvar_434 - 1);
        highp int tmpvar_695;
        if ((tmpvar_692 >= 0)) {
          tmpvar_695 = 0;
        } else {
          tmpvar_695 = 1;
        };
        highp int tmpvar_696;
        tmpvar_696 = (8 + tmpvar_695);
        _uidx1_691 = tmpvar_696;
        if ((tmpvar_694 < 0)) {
          highp int tmpvar_697;
          if ((tmpvar_692 >= 0)) {
            tmpvar_697 = 1;
          } else {
            tmpvar_697 = 0;
          };
          _uidx1_691 = (8 + tmpvar_697);
        };
        highp int tmpvar_698;
        if ((tmpvar_694 < 0)) {
          tmpvar_698 = 3;
        } else {
          tmpvar_698 = tmpvar_694;
        };
        float tmpvar_699;
        tmpvar_699 = sin(((
          mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
            float(_uidx1_691)
          , 0.0, 11.0))][int(clamp (
            float(tmpvar_698)
          , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
            float(tmpvar_696)
          , 0.0, 11.0))][int(clamp (
            float(tmpvar_434)
          , 0.0, 3.0))], tmpvar_693)
         * 3.141593) / 180.0));
        highp int _uidx1_700;
        highp int tmpvar_701;
        if ((tmpvar_435 == 0)) {
          tmpvar_701 = 1;
        } else {
          tmpvar_701 = -1;
        };
        float tmpvar_702;
        tmpvar_702 = fract((iTime * 4.0));
        highp int tmpvar_703;
        tmpvar_703 = (tmpvar_434 - 1);
        highp int tmpvar_704;
        if ((tmpvar_701 >= 0)) {
          tmpvar_704 = 0;
        } else {
          tmpvar_704 = 1;
        };
        highp int tmpvar_705;
        tmpvar_705 = (8 + tmpvar_704);
        _uidx1_700 = tmpvar_705;
        if ((tmpvar_703 < 0)) {
          highp int tmpvar_706;
          if ((tmpvar_701 >= 0)) {
            tmpvar_706 = 1;
          } else {
            tmpvar_706 = 0;
          };
          _uidx1_700 = (8 + tmpvar_706);
        };
        highp int tmpvar_707;
        if ((tmpvar_703 < 0)) {
          tmpvar_707 = 3;
        } else {
          tmpvar_707 = tmpvar_703;
        };
        float tmpvar_708;
        tmpvar_708 = sin(((
          mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
            float(_uidx1_700)
          , 0.0, 11.0))][int(clamp (
            float(tmpvar_707)
          , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
            float(tmpvar_705)
          , 0.0, 11.0))][int(clamp (
            float(tmpvar_434)
          , 0.0, 3.0))], tmpvar_702)
         * 3.141593) / 180.0));
        highp int _uidx1_709;
        highp int tmpvar_710;
        if ((tmpvar_435 == 0)) {
          tmpvar_710 = 1;
        } else {
          tmpvar_710 = -1;
        };
        float tmpvar_711;
        tmpvar_711 = fract((iTime * 4.0));
        highp int tmpvar_712;
        tmpvar_712 = (tmpvar_434 - 1);
        highp int tmpvar_713;
        if ((tmpvar_710 >= 0)) {
          tmpvar_713 = 0;
        } else {
          tmpvar_713 = 1;
        };
        highp int tmpvar_714;
        tmpvar_714 = (8 + tmpvar_713);
        _uidx1_709 = tmpvar_714;
        if ((tmpvar_712 < 0)) {
          highp int tmpvar_715;
          if ((tmpvar_710 >= 0)) {
            tmpvar_715 = 1;
          } else {
            tmpvar_715 = 0;
          };
          _uidx1_709 = (8 + tmpvar_715);
        };
        highp int tmpvar_716;
        if ((tmpvar_712 < 0)) {
          tmpvar_716 = 3;
        } else {
          tmpvar_716 = tmpvar_712;
        };
        mat2 tmpvar_717;
        tmpvar_717[uint(0)].x = tmpvar_690;
        tmpvar_717[uint(0)].y = tmpvar_699;
        tmpvar_717[1u].x = -(tmpvar_708);
        tmpvar_717[1u].y = cos(((
          mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
            float(_uidx1_709)
          , 0.0, 11.0))][int(clamp (
            float(tmpvar_716)
          , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
            float(tmpvar_714)
          , 0.0, 11.0))][int(clamp (
            float(tmpvar_434)
          , 0.0, 3.0))], tmpvar_711)
         * 3.141593) / 180.0));
        _upArm1L_422.yz = (tmpvar_681.yz * tmpvar_717);
        highp vec3 tmpvar_718;
        tmpvar_718 = (abs((_upArm1L_422 - vec3(0.0, 0.08, 0.0))) - vec3(0.02, 0.08, 0.02));
        highp vec3 tmpvar_719;
        tmpvar_719 = max (tmpvar_718, 0.0);
        highp float tmpvar_720;
        tmpvar_720 = min (tmpvar_680, (sqrt(
          dot (tmpvar_719, tmpvar_719)
        ) + min (
          max (tmpvar_718.x, max (tmpvar_718.y, tmpvar_718.z))
        , 0.0)));
        highp vec3 tmpvar_721;
        tmpvar_721 = (_upChest_430 + vec3(-0.125, -0.1, 0.0));
        _upArm0R_421 = tmpvar_721;
        highp int _us_722;
        _us_722 = -1;
        highp int _uidx1_723;
        highp int tmpvar_724;
        if ((tmpvar_435 == 0)) {
          tmpvar_724 = 1;
        } else {
          tmpvar_724 = -1;
        };
        _us_722 = -(tmpvar_724);
        float tmpvar_725;
        tmpvar_725 = fract((iTime * 4.0));
        highp int tmpvar_726;
        tmpvar_726 = (tmpvar_434 - 1);
        highp int tmpvar_727;
        if ((_us_722 >= 0)) {
          tmpvar_727 = 0;
        } else {
          tmpvar_727 = 1;
        };
        highp int tmpvar_728;
        tmpvar_728 = (6 + tmpvar_727);
        _uidx1_723 = tmpvar_728;
        if ((tmpvar_726 < 0)) {
          highp int tmpvar_729;
          if ((_us_722 >= 0)) {
            tmpvar_729 = 1;
          } else {
            tmpvar_729 = 0;
          };
          _uidx1_723 = (6 + tmpvar_729);
        };
        highp int tmpvar_730;
        if ((tmpvar_726 < 0)) {
          tmpvar_730 = 3;
        } else {
          tmpvar_730 = tmpvar_726;
        };
        float tmpvar_731;
        tmpvar_731 = cos(((
          (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
            clamp (float(_uidx1_723), 0.0, 11.0)
          )][int(
            clamp (float(tmpvar_730), 0.0, 3.0)
          )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
            clamp (float(tmpvar_728), 0.0, 11.0)
          )][int(
            clamp (float(tmpvar_434), 0.0, 3.0)
          )], tmpvar_725))
         * 3.141593) / 180.0));
        highp int _us_732;
        _us_732 = -1;
        highp int _uidx1_733;
        highp int tmpvar_734;
        if ((tmpvar_435 == 0)) {
          tmpvar_734 = 1;
        } else {
          tmpvar_734 = -1;
        };
        _us_732 = -(tmpvar_734);
        float tmpvar_735;
        tmpvar_735 = fract((iTime * 4.0));
        highp int tmpvar_736;
        tmpvar_736 = (tmpvar_434 - 1);
        highp int tmpvar_737;
        if ((_us_732 >= 0)) {
          tmpvar_737 = 0;
        } else {
          tmpvar_737 = 1;
        };
        highp int tmpvar_738;
        tmpvar_738 = (6 + tmpvar_737);
        _uidx1_733 = tmpvar_738;
        if ((tmpvar_736 < 0)) {
          highp int tmpvar_739;
          if ((_us_732 >= 0)) {
            tmpvar_739 = 1;
          } else {
            tmpvar_739 = 0;
          };
          _uidx1_733 = (6 + tmpvar_739);
        };
        highp int tmpvar_740;
        if ((tmpvar_736 < 0)) {
          tmpvar_740 = 3;
        } else {
          tmpvar_740 = tmpvar_736;
        };
        float tmpvar_741;
        tmpvar_741 = sin(((
          (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
            clamp (float(_uidx1_733), 0.0, 11.0)
          )][int(
            clamp (float(tmpvar_740), 0.0, 3.0)
          )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
            clamp (float(tmpvar_738), 0.0, 11.0)
          )][int(
            clamp (float(tmpvar_434), 0.0, 3.0)
          )], tmpvar_735))
         * 3.141593) / 180.0));
        highp int _us_742;
        _us_742 = -1;
        highp int _uidx1_743;
        highp int tmpvar_744;
        if ((tmpvar_435 == 0)) {
          tmpvar_744 = 1;
        } else {
          tmpvar_744 = -1;
        };
        _us_742 = -(tmpvar_744);
        float tmpvar_745;
        tmpvar_745 = fract((iTime * 4.0));
        highp int tmpvar_746;
        tmpvar_746 = (tmpvar_434 - 1);
        highp int tmpvar_747;
        if ((_us_742 >= 0)) {
          tmpvar_747 = 0;
        } else {
          tmpvar_747 = 1;
        };
        highp int tmpvar_748;
        tmpvar_748 = (6 + tmpvar_747);
        _uidx1_743 = tmpvar_748;
        if ((tmpvar_746 < 0)) {
          highp int tmpvar_749;
          if ((_us_742 >= 0)) {
            tmpvar_749 = 1;
          } else {
            tmpvar_749 = 0;
          };
          _uidx1_743 = (6 + tmpvar_749);
        };
        highp int tmpvar_750;
        if ((tmpvar_746 < 0)) {
          tmpvar_750 = 3;
        } else {
          tmpvar_750 = tmpvar_746;
        };
        float tmpvar_751;
        tmpvar_751 = sin(((
          (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
            clamp (float(_uidx1_743), 0.0, 11.0)
          )][int(
            clamp (float(tmpvar_750), 0.0, 3.0)
          )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
            clamp (float(tmpvar_748), 0.0, 11.0)
          )][int(
            clamp (float(tmpvar_434), 0.0, 3.0)
          )], tmpvar_745))
         * 3.141593) / 180.0));
        highp int _us_752;
        _us_752 = -1;
        highp int _uidx1_753;
        highp int tmpvar_754;
        if ((tmpvar_435 == 0)) {
          tmpvar_754 = 1;
        } else {
          tmpvar_754 = -1;
        };
        _us_752 = -(tmpvar_754);
        float tmpvar_755;
        tmpvar_755 = fract((iTime * 4.0));
        highp int tmpvar_756;
        tmpvar_756 = (tmpvar_434 - 1);
        highp int tmpvar_757;
        if ((_us_752 >= 0)) {
          tmpvar_757 = 0;
        } else {
          tmpvar_757 = 1;
        };
        highp int tmpvar_758;
        tmpvar_758 = (6 + tmpvar_757);
        _uidx1_753 = tmpvar_758;
        if ((tmpvar_756 < 0)) {
          highp int tmpvar_759;
          if ((_us_752 >= 0)) {
            tmpvar_759 = 1;
          } else {
            tmpvar_759 = 0;
          };
          _uidx1_753 = (6 + tmpvar_759);
        };
        highp int tmpvar_760;
        if ((tmpvar_756 < 0)) {
          tmpvar_760 = 3;
        } else {
          tmpvar_760 = tmpvar_756;
        };
        mat2 tmpvar_761;
        tmpvar_761[uint(0)].x = tmpvar_731;
        tmpvar_761[uint(0)].y = tmpvar_741;
        tmpvar_761[1u].x = -(tmpvar_751);
        tmpvar_761[1u].y = cos(((
          (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
            clamp (float(_uidx1_753), 0.0, 11.0)
          )][int(
            clamp (float(tmpvar_760), 0.0, 3.0)
          )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
            clamp (float(tmpvar_758), 0.0, 11.0)
          )][int(
            clamp (float(tmpvar_434), 0.0, 3.0)
          )], tmpvar_755))
         * 3.141593) / 180.0));
        _upArm0R_421.yz = (tmpvar_721.yz * tmpvar_761);
        highp vec3 tmpvar_762;
        tmpvar_762 = (abs((_upArm0R_421 - vec3(0.0, 0.08, 0.0))) - vec3(0.02, 0.08, 0.02));
        highp vec3 tmpvar_763;
        tmpvar_763 = max (tmpvar_762, 0.0);
        highp float tmpvar_764;
        tmpvar_764 = min (tmpvar_720, (sqrt(
          dot (tmpvar_763, tmpvar_763)
        ) + min (
          max (tmpvar_762.x, max (tmpvar_762.y, tmpvar_762.z))
        , 0.0)));
        highp vec3 tmpvar_765;
        tmpvar_765 = (_upArm0R_421 + vec3(0.0, -0.16, 0.0));
        _upArm1R_420 = tmpvar_765;
        highp int _us_766;
        _us_766 = -1;
        highp int _uidx1_767;
        highp int tmpvar_768;
        if ((tmpvar_435 == 0)) {
          tmpvar_768 = 1;
        } else {
          tmpvar_768 = -1;
        };
        _us_766 = -(tmpvar_768);
        float tmpvar_769;
        tmpvar_769 = fract((iTime * 4.0));
        highp int tmpvar_770;
        tmpvar_770 = (tmpvar_434 - 1);
        highp int tmpvar_771;
        if ((_us_766 >= 0)) {
          tmpvar_771 = 0;
        } else {
          tmpvar_771 = 1;
        };
        highp int tmpvar_772;
        tmpvar_772 = (8 + tmpvar_771);
        _uidx1_767 = tmpvar_772;
        if ((tmpvar_770 < 0)) {
          highp int tmpvar_773;
          if ((_us_766 >= 0)) {
            tmpvar_773 = 1;
          } else {
            tmpvar_773 = 0;
          };
          _uidx1_767 = (8 + tmpvar_773);
        };
        highp int tmpvar_774;
        if ((tmpvar_770 < 0)) {
          tmpvar_774 = 3;
        } else {
          tmpvar_774 = tmpvar_770;
        };
        float tmpvar_775;
        tmpvar_775 = cos(((
          mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
            float(_uidx1_767)
          , 0.0, 11.0))][int(clamp (
            float(tmpvar_774)
          , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
            float(tmpvar_772)
          , 0.0, 11.0))][int(clamp (
            float(tmpvar_434)
          , 0.0, 3.0))], tmpvar_769)
         * 3.141593) / 180.0));
        highp int _us_776;
        _us_776 = -1;
        highp int _uidx1_777;
        highp int tmpvar_778;
        if ((tmpvar_435 == 0)) {
          tmpvar_778 = 1;
        } else {
          tmpvar_778 = -1;
        };
        _us_776 = -(tmpvar_778);
        float tmpvar_779;
        tmpvar_779 = fract((iTime * 4.0));
        highp int tmpvar_780;
        tmpvar_780 = (tmpvar_434 - 1);
        highp int tmpvar_781;
        if ((_us_776 >= 0)) {
          tmpvar_781 = 0;
        } else {
          tmpvar_781 = 1;
        };
        highp int tmpvar_782;
        tmpvar_782 = (8 + tmpvar_781);
        _uidx1_777 = tmpvar_782;
        if ((tmpvar_780 < 0)) {
          highp int tmpvar_783;
          if ((_us_776 >= 0)) {
            tmpvar_783 = 1;
          } else {
            tmpvar_783 = 0;
          };
          _uidx1_777 = (8 + tmpvar_783);
        };
        highp int tmpvar_784;
        if ((tmpvar_780 < 0)) {
          tmpvar_784 = 3;
        } else {
          tmpvar_784 = tmpvar_780;
        };
        float tmpvar_785;
        tmpvar_785 = sin(((
          mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
            float(_uidx1_777)
          , 0.0, 11.0))][int(clamp (
            float(tmpvar_784)
          , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
            float(tmpvar_782)
          , 0.0, 11.0))][int(clamp (
            float(tmpvar_434)
          , 0.0, 3.0))], tmpvar_779)
         * 3.141593) / 180.0));
        highp int _us_786;
        _us_786 = -1;
        highp int _uidx1_787;
        highp int tmpvar_788;
        if ((tmpvar_435 == 0)) {
          tmpvar_788 = 1;
        } else {
          tmpvar_788 = -1;
        };
        _us_786 = -(tmpvar_788);
        float tmpvar_789;
        tmpvar_789 = fract((iTime * 4.0));
        highp int tmpvar_790;
        tmpvar_790 = (tmpvar_434 - 1);
        highp int tmpvar_791;
        if ((_us_786 >= 0)) {
          tmpvar_791 = 0;
        } else {
          tmpvar_791 = 1;
        };
        highp int tmpvar_792;
        tmpvar_792 = (8 + tmpvar_791);
        _uidx1_787 = tmpvar_792;
        if ((tmpvar_790 < 0)) {
          highp int tmpvar_793;
          if ((_us_786 >= 0)) {
            tmpvar_793 = 1;
          } else {
            tmpvar_793 = 0;
          };
          _uidx1_787 = (8 + tmpvar_793);
        };
        highp int tmpvar_794;
        if ((tmpvar_790 < 0)) {
          tmpvar_794 = 3;
        } else {
          tmpvar_794 = tmpvar_790;
        };
        float tmpvar_795;
        tmpvar_795 = sin(((
          mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
            float(_uidx1_787)
          , 0.0, 11.0))][int(clamp (
            float(tmpvar_794)
          , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
            float(tmpvar_792)
          , 0.0, 11.0))][int(clamp (
            float(tmpvar_434)
          , 0.0, 3.0))], tmpvar_789)
         * 3.141593) / 180.0));
        highp int _us_796;
        _us_796 = -1;
        highp int _uidx1_797;
        highp int tmpvar_798;
        if ((tmpvar_435 == 0)) {
          tmpvar_798 = 1;
        } else {
          tmpvar_798 = -1;
        };
        _us_796 = -(tmpvar_798);
        float tmpvar_799;
        tmpvar_799 = fract((iTime * 4.0));
        highp int tmpvar_800;
        tmpvar_800 = (tmpvar_434 - 1);
        highp int tmpvar_801;
        if ((_us_796 >= 0)) {
          tmpvar_801 = 0;
        } else {
          tmpvar_801 = 1;
        };
        highp int tmpvar_802;
        tmpvar_802 = (8 + tmpvar_801);
        _uidx1_797 = tmpvar_802;
        if ((tmpvar_800 < 0)) {
          highp int tmpvar_803;
          if ((_us_796 >= 0)) {
            tmpvar_803 = 1;
          } else {
            tmpvar_803 = 0;
          };
          _uidx1_797 = (8 + tmpvar_803);
        };
        highp int tmpvar_804;
        if ((tmpvar_800 < 0)) {
          tmpvar_804 = 3;
        } else {
          tmpvar_804 = tmpvar_800;
        };
        mat2 tmpvar_805;
        tmpvar_805[uint(0)].x = tmpvar_775;
        tmpvar_805[uint(0)].y = tmpvar_785;
        tmpvar_805[1u].x = -(tmpvar_795);
        tmpvar_805[1u].y = cos(((
          mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
            float(_uidx1_797)
          , 0.0, 11.0))][int(clamp (
            float(tmpvar_804)
          , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
            float(tmpvar_802)
          , 0.0, 11.0))][int(clamp (
            float(tmpvar_434)
          , 0.0, 3.0))], tmpvar_799)
         * 3.141593) / 180.0));
        _upArm1R_420.yz = (tmpvar_765.yz * tmpvar_805);
        highp vec3 tmpvar_806;
        tmpvar_806 = (abs((_upArm1R_420 - vec3(0.0, 0.08, 0.0))) - vec3(0.02, 0.08, 0.02));
        highp vec3 tmpvar_807;
        tmpvar_807 = max (tmpvar_806, 0.0);
        highp vec4 tmpvar_808;
        tmpvar_808.yzw = vec3(0.2, 0.0, 0.0);
        tmpvar_808.x = min (tmpvar_764, (sqrt(
          dot (tmpvar_807, tmpvar_807)
        ) + min (
          max (tmpvar_806.x, max (tmpvar_806.y, tmpvar_806.z))
        , 0.0)));
        tmpvar_419 = tmpvar_808;
      } else {
        tmpvar_419 = tmpvar_20;
      };
      _uhit_17 = tmpvar_419;
    };
    _unewD_14 = _uhit_17.x;
    _ud_15 = min (4.5, (_ud_15 + _uhit_17.x));
  };
  highp vec3 tmpvar_809;
  tmpvar_809 = (_uro_3 + (_urd_2 * (_ud_15 - 0.02)));
  highp vec3 _up_810;
  _up_810 = (tmpvar_809 + vec3(1e-05, -1e-05, -1e-05));
  highp vec4 _uhit_811;
  _uhit_811 = vec4(4.5, 0.0, 0.0, 0.0);
  highp float tmpvar_812;
  highp vec3 _up_813;
  _up_813 = (_up_810 - vec3(0.0, -2.0, 0.0));
  tmpvar_812 = (sqrt(dot (_up_813, _up_813)) - 2.0);
  highp vec4 tmpvar_814;
  if ((tmpvar_812 < 4.5)) {
    highp vec3 _up_815;
    _up_815 = (_up_810 - vec3(0.0, -2.0, 0.0));
    highp vec4 tmpvar_816;
    tmpvar_816.yzw = vec3(0.1, 0.0, 0.0);
    tmpvar_816.x = (sqrt(dot (_up_815, _up_815)) - 2.0);
    tmpvar_814 = tmpvar_816;
  } else {
    tmpvar_814 = vec4(4.5, 0.0, 0.0, 0.0);
  };
  _uhit_811 = tmpvar_814;
  highp float tmpvar_817;
  highp vec3 tmpvar_818;
  tmpvar_818 = (abs((_up_810 - vec3(0.0, 0.5, 0.0))) - vec3(0.3, 0.5, 0.3));
  highp vec3 tmpvar_819;
  tmpvar_819 = max (tmpvar_818, 0.0);
  tmpvar_817 = (sqrt(dot (tmpvar_819, tmpvar_819)) + min (max (tmpvar_818.x, 
    max (tmpvar_818.y, tmpvar_818.z)
  ), 0.0));
  highp vec4 tmpvar_820;
  if ((tmpvar_817 < tmpvar_814.x)) {
    highp vec3 tmpvar_821;
    tmpvar_821 = (abs((_up_810 - vec3(0.0, 0.5, 0.0))) - vec3(0.3, 0.5, 0.3));
    highp vec3 tmpvar_822;
    tmpvar_822 = max (tmpvar_821, 0.0);
    highp vec4 tmpvar_823;
    tmpvar_823.yzw = vec3(-0.1, 0.0, 0.0);
    tmpvar_823.x = (sqrt(dot (tmpvar_822, tmpvar_822)) + min (max (tmpvar_821.x, 
      max (tmpvar_821.y, tmpvar_821.z)
    ), 0.0));
    tmpvar_820 = tmpvar_823;
  } else {
    tmpvar_820 = tmpvar_814;
  };
  if ((tmpvar_820.y < 0.0)) {
    highp vec3 _upArm1R_824;
    highp vec3 _upArm0R_825;
    highp vec3 _upArm1L_826;
    highp vec3 _upArm0L_827;
    highp vec3 _upLeg1R_828;
    highp vec3 _upLeg0R_829;
    highp vec3 _upLeg1L_830;
    highp vec3 _upLeg0L_831;
    highp vec3 _upHead_832;
    highp vec3 _upNeck_833;
    highp vec3 _upChest_834;
    highp vec3 _upWaist_835;
    highp vec3 _upPelvis_836;
    float tmpvar_837;
    tmpvar_837 = (iTime * 4.0);
    highp int tmpvar_838;
    tmpvar_838 = ((int(tmpvar_837)% 4));
    highp int tmpvar_839;
    tmpvar_839 = ((int((tmpvar_837 / 4.0))% 2));
    highp int _uidx1_840;
    highp int tmpvar_841;
    if ((tmpvar_839 == 0)) {
      tmpvar_841 = 1;
    } else {
      tmpvar_841 = -1;
    };
    float tmpvar_842;
    tmpvar_842 = fract((iTime * 4.0));
    highp int tmpvar_843;
    tmpvar_843 = (tmpvar_838 - 1);
    highp int tmpvar_844;
    if ((tmpvar_841 >= 0)) {
      tmpvar_844 = 0;
    } else {
      tmpvar_844 = 1;
    };
    highp int tmpvar_845;
    tmpvar_845 = (10 + tmpvar_844);
    _uidx1_840 = tmpvar_845;
    if ((tmpvar_843 < 0)) {
      highp int tmpvar_846;
      if ((tmpvar_841 >= 0)) {
        tmpvar_846 = 1;
      } else {
        tmpvar_846 = 0;
      };
      _uidx1_840 = (10 + tmpvar_846);
    };
    highp int tmpvar_847;
    if ((tmpvar_843 < 0)) {
      tmpvar_847 = 3;
    } else {
      tmpvar_847 = tmpvar_843;
    };
    float tmpvar_848;
    tmpvar_848 = ((mix (
      vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (float(_uidx1_840), 0.0, 11.0))][int(clamp (float(tmpvar_847), 0.0, 3.0))]
    , 
      vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (float(tmpvar_845), 0.0, 11.0))][int(clamp (float(tmpvar_838), 0.0, 3.0))]
    , tmpvar_842) * 3.141593) / 180.0);
    highp int _uidx1_849;
    highp int tmpvar_850;
    if ((tmpvar_839 == 0)) {
      tmpvar_850 = 1;
    } else {
      tmpvar_850 = -1;
    };
    float tmpvar_851;
    tmpvar_851 = fract((iTime * 4.0));
    highp int tmpvar_852;
    tmpvar_852 = (tmpvar_838 - 1);
    highp int tmpvar_853;
    if ((tmpvar_850 >= 0)) {
      tmpvar_853 = 0;
    } else {
      tmpvar_853 = 1;
    };
    _uidx1_849 = tmpvar_853;
    if ((tmpvar_852 < 0)) {
      highp int tmpvar_854;
      if ((tmpvar_850 >= 0)) {
        tmpvar_854 = 1;
      } else {
        tmpvar_854 = 0;
      };
      _uidx1_849 = tmpvar_854;
    };
    highp int tmpvar_855;
    if ((tmpvar_852 < 0)) {
      tmpvar_855 = 3;
    } else {
      tmpvar_855 = tmpvar_852;
    };
    vec3 tmpvar_856;
    tmpvar_856.xz = vec2(0.0, 0.0);
    tmpvar_856.y = (-0.5 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[
      int(clamp (float(_uidx1_849), 0.0, 11.0))
    ][
      int(clamp (float(tmpvar_855), 0.0, 3.0))
    ], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[
      int(clamp (float(tmpvar_853), 0.0, 11.0))
    ][
      int(clamp (float(tmpvar_838), 0.0, 3.0))
    ], tmpvar_851));
    highp vec3 tmpvar_857;
    tmpvar_857 = (_up_810 + tmpvar_856);
    _upPelvis_836.z = tmpvar_857.z;
    mat2 tmpvar_858;
    tmpvar_858[uint(0)].x = cos(tmpvar_848);
    tmpvar_858[uint(0)].y = sin(tmpvar_848);
    tmpvar_858[1u].x = -(sin(tmpvar_848));
    tmpvar_858[1u].y = cos(tmpvar_848);
    _upPelvis_836.xy = (tmpvar_857.xy * tmpvar_858);
    highp vec3 tmpvar_859;
    tmpvar_859 = (abs((_upPelvis_836 - vec3(0.0, 0.0, 0.025))) - vec3(0.085, 0.05, 0.05));
    highp vec3 tmpvar_860;
    tmpvar_860 = max (tmpvar_859, 0.0);
    highp vec3 tmpvar_861;
    tmpvar_861 = (_upPelvis_836 + vec3(0.0, -0.05, -0.02));
    _upWaist_835.z = tmpvar_861.z;
    mat2 tmpvar_862;
    tmpvar_862[uint(0)].x = cos(-(tmpvar_848));
    tmpvar_862[uint(0)].y = sin(-(tmpvar_848));
    tmpvar_862[1u].x = -(sin(-(tmpvar_848)));
    tmpvar_862[1u].y = cos(-(tmpvar_848));
    _upWaist_835.xy = (tmpvar_861.xy * tmpvar_862);
    _upWaist_835.yz = (_upWaist_835.yz * mat2(1.0, 0.0, -0.0, 1.0));
    highp vec3 tmpvar_863;
    tmpvar_863 = (abs((_upWaist_835 - vec3(0.0, 0.04, 0.0))) - vec3(0.075, 0.08, 0.03));
    highp vec3 tmpvar_864;
    tmpvar_864 = max (tmpvar_863, 0.0);
    highp vec3 tmpvar_865;
    tmpvar_865 = (_upWaist_835 + vec3(0.0, -0.14, -0.01));
    _upChest_834.x = tmpvar_865.x;
    _upChest_834.yz = (tmpvar_865.yz * mat2(1.0, 0.0, -0.0, 1.0));
    highp vec3 tmpvar_866;
    tmpvar_866 = (abs((_upChest_834 - vec3(0.0, 0.04, 0.0))) - vec3(0.09, 0.08, 0.05));
    highp vec3 tmpvar_867;
    tmpvar_867 = max (tmpvar_866, 0.0);
    highp vec3 tmpvar_868;
    tmpvar_868 = (_upChest_834 + vec3(0.0, -0.15, 0.0));
    _upNeck_833.x = tmpvar_868.x;
    _upNeck_833.yz = (tmpvar_868.yz * mat2(1.0, 0.0, -0.0, 1.0));
    highp vec3 tmpvar_869;
    tmpvar_869 = (abs((_upNeck_833 - vec3(0.0, 0.01, 0.0))) - vec3(0.02, 0.04, 0.02));
    highp vec3 tmpvar_870;
    tmpvar_870 = max (tmpvar_869, 0.0);
    highp vec3 tmpvar_871;
    tmpvar_871 = (_upNeck_833 + vec3(0.0, -0.1, 0.0));
    _upHead_832.x = tmpvar_871.x;
    _upHead_832.yz = (tmpvar_871.yz * mat2(1.0, 0.0, -0.0, 1.0));
    highp vec3 tmpvar_872;
    tmpvar_872 = (abs((_upHead_832 - vec3(0.0, 0.04, -0.025))) - vec3(0.05, 0.08, 0.06));
    highp vec3 tmpvar_873;
    tmpvar_873 = max (tmpvar_872, 0.0);
    highp float tmpvar_874;
    tmpvar_874 = min (min (min (
      min (min (4.5, (sqrt(
        dot (tmpvar_860, tmpvar_860)
      ) + min (
        max (tmpvar_859.x, max (tmpvar_859.y, tmpvar_859.z))
      , 0.0))), (sqrt(dot (tmpvar_864, tmpvar_864)) + min (max (tmpvar_863.x, 
        max (tmpvar_863.y, tmpvar_863.z)
      ), 0.0)))
    , 
      (sqrt(dot (tmpvar_867, tmpvar_867)) + min (max (tmpvar_866.x, max (tmpvar_866.y, tmpvar_866.z)), 0.0))
    ), (
      sqrt(dot (tmpvar_870, tmpvar_870))
     + 
      min (max (tmpvar_869.x, max (tmpvar_869.y, tmpvar_869.z)), 0.0)
    )), (sqrt(
      dot (tmpvar_873, tmpvar_873)
    ) + min (
      max (tmpvar_872.x, max (tmpvar_872.y, tmpvar_872.z))
    , 0.0)));
    highp vec3 tmpvar_875;
    tmpvar_875 = (_upPelvis_836 + vec3(0.06, 0.025, 0.0));
    _upLeg0L_831.z = tmpvar_875.z;
    mat2 tmpvar_876;
    tmpvar_876[uint(0)].x = cos(-(tmpvar_848));
    tmpvar_876[uint(0)].y = sin(-(tmpvar_848));
    tmpvar_876[1u].x = -(sin(-(tmpvar_848)));
    tmpvar_876[1u].y = cos(-(tmpvar_848));
    _upLeg0L_831.xy = (tmpvar_875.xy * tmpvar_876);
    highp int _uidx1_877;
    highp int tmpvar_878;
    if ((tmpvar_839 == 0)) {
      tmpvar_878 = 1;
    } else {
      tmpvar_878 = -1;
    };
    float tmpvar_879;
    tmpvar_879 = fract((iTime * 4.0));
    highp int tmpvar_880;
    tmpvar_880 = (tmpvar_838 - 1);
    highp int tmpvar_881;
    if ((tmpvar_878 >= 0)) {
      tmpvar_881 = 0;
    } else {
      tmpvar_881 = 1;
    };
    highp int tmpvar_882;
    tmpvar_882 = (2 + tmpvar_881);
    _uidx1_877 = tmpvar_882;
    if ((tmpvar_880 < 0)) {
      highp int tmpvar_883;
      if ((tmpvar_878 >= 0)) {
        tmpvar_883 = 1;
      } else {
        tmpvar_883 = 0;
      };
      _uidx1_877 = (2 + tmpvar_883);
    };
    highp int tmpvar_884;
    if ((tmpvar_880 < 0)) {
      tmpvar_884 = 3;
    } else {
      tmpvar_884 = tmpvar_880;
    };
    float tmpvar_885;
    tmpvar_885 = cos(((
      (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(_uidx1_877), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_884), 0.0, 3.0)
      )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(tmpvar_882), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_838), 0.0, 3.0)
      )], tmpvar_879))
     * 3.141593) / 180.0));
    highp int _uidx1_886;
    highp int tmpvar_887;
    if ((tmpvar_839 == 0)) {
      tmpvar_887 = 1;
    } else {
      tmpvar_887 = -1;
    };
    float tmpvar_888;
    tmpvar_888 = fract((iTime * 4.0));
    highp int tmpvar_889;
    tmpvar_889 = (tmpvar_838 - 1);
    highp int tmpvar_890;
    if ((tmpvar_887 >= 0)) {
      tmpvar_890 = 0;
    } else {
      tmpvar_890 = 1;
    };
    highp int tmpvar_891;
    tmpvar_891 = (2 + tmpvar_890);
    _uidx1_886 = tmpvar_891;
    if ((tmpvar_889 < 0)) {
      highp int tmpvar_892;
      if ((tmpvar_887 >= 0)) {
        tmpvar_892 = 1;
      } else {
        tmpvar_892 = 0;
      };
      _uidx1_886 = (2 + tmpvar_892);
    };
    highp int tmpvar_893;
    if ((tmpvar_889 < 0)) {
      tmpvar_893 = 3;
    } else {
      tmpvar_893 = tmpvar_889;
    };
    float tmpvar_894;
    tmpvar_894 = sin(((
      (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(_uidx1_886), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_893), 0.0, 3.0)
      )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(tmpvar_891), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_838), 0.0, 3.0)
      )], tmpvar_888))
     * 3.141593) / 180.0));
    highp int _uidx1_895;
    highp int tmpvar_896;
    if ((tmpvar_839 == 0)) {
      tmpvar_896 = 1;
    } else {
      tmpvar_896 = -1;
    };
    float tmpvar_897;
    tmpvar_897 = fract((iTime * 4.0));
    highp int tmpvar_898;
    tmpvar_898 = (tmpvar_838 - 1);
    highp int tmpvar_899;
    if ((tmpvar_896 >= 0)) {
      tmpvar_899 = 0;
    } else {
      tmpvar_899 = 1;
    };
    highp int tmpvar_900;
    tmpvar_900 = (2 + tmpvar_899);
    _uidx1_895 = tmpvar_900;
    if ((tmpvar_898 < 0)) {
      highp int tmpvar_901;
      if ((tmpvar_896 >= 0)) {
        tmpvar_901 = 1;
      } else {
        tmpvar_901 = 0;
      };
      _uidx1_895 = (2 + tmpvar_901);
    };
    highp int tmpvar_902;
    if ((tmpvar_898 < 0)) {
      tmpvar_902 = 3;
    } else {
      tmpvar_902 = tmpvar_898;
    };
    float tmpvar_903;
    tmpvar_903 = sin(((
      (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(_uidx1_895), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_902), 0.0, 3.0)
      )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(tmpvar_900), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_838), 0.0, 3.0)
      )], tmpvar_897))
     * 3.141593) / 180.0));
    highp int _uidx1_904;
    highp int tmpvar_905;
    if ((tmpvar_839 == 0)) {
      tmpvar_905 = 1;
    } else {
      tmpvar_905 = -1;
    };
    float tmpvar_906;
    tmpvar_906 = fract((iTime * 4.0));
    highp int tmpvar_907;
    tmpvar_907 = (tmpvar_838 - 1);
    highp int tmpvar_908;
    if ((tmpvar_905 >= 0)) {
      tmpvar_908 = 0;
    } else {
      tmpvar_908 = 1;
    };
    highp int tmpvar_909;
    tmpvar_909 = (2 + tmpvar_908);
    _uidx1_904 = tmpvar_909;
    if ((tmpvar_907 < 0)) {
      highp int tmpvar_910;
      if ((tmpvar_905 >= 0)) {
        tmpvar_910 = 1;
      } else {
        tmpvar_910 = 0;
      };
      _uidx1_904 = (2 + tmpvar_910);
    };
    highp int tmpvar_911;
    if ((tmpvar_907 < 0)) {
      tmpvar_911 = 3;
    } else {
      tmpvar_911 = tmpvar_907;
    };
    mat2 tmpvar_912;
    tmpvar_912[uint(0)].x = tmpvar_885;
    tmpvar_912[uint(0)].y = tmpvar_894;
    tmpvar_912[1u].x = -(tmpvar_903);
    tmpvar_912[1u].y = cos(((
      (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(_uidx1_904), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_911), 0.0, 3.0)
      )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(tmpvar_909), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_838), 0.0, 3.0)
      )], tmpvar_906))
     * 3.141593) / 180.0));
    _upLeg0L_831.yz = (_upLeg0L_831.yz * tmpvar_912);
    highp vec3 tmpvar_913;
    tmpvar_913 = (abs((_upLeg0L_831 - vec3(0.0, 0.1, 0.0))) - vec3(0.025, 0.1, 0.025));
    highp vec3 tmpvar_914;
    tmpvar_914 = max (tmpvar_913, 0.0);
    highp float tmpvar_915;
    tmpvar_915 = min (tmpvar_874, (sqrt(
      dot (tmpvar_914, tmpvar_914)
    ) + min (
      max (tmpvar_913.x, max (tmpvar_913.y, tmpvar_913.z))
    , 0.0)));
    highp vec3 tmpvar_916;
    tmpvar_916 = (_upLeg0L_831 + vec3(0.01, -0.18, 0.02));
    _upLeg1L_830 = tmpvar_916;
    highp int _uidx1_917;
    highp int tmpvar_918;
    if ((tmpvar_839 == 0)) {
      tmpvar_918 = 1;
    } else {
      tmpvar_918 = -1;
    };
    float tmpvar_919;
    tmpvar_919 = fract((iTime * 4.0));
    highp int tmpvar_920;
    tmpvar_920 = (tmpvar_838 - 1);
    highp int tmpvar_921;
    if ((tmpvar_918 >= 0)) {
      tmpvar_921 = 0;
    } else {
      tmpvar_921 = 1;
    };
    highp int tmpvar_922;
    tmpvar_922 = (4 + tmpvar_921);
    _uidx1_917 = tmpvar_922;
    if ((tmpvar_920 < 0)) {
      highp int tmpvar_923;
      if ((tmpvar_918 >= 0)) {
        tmpvar_923 = 1;
      } else {
        tmpvar_923 = 0;
      };
      _uidx1_917 = (4 + tmpvar_923);
    };
    highp int tmpvar_924;
    if ((tmpvar_920 < 0)) {
      tmpvar_924 = 3;
    } else {
      tmpvar_924 = tmpvar_920;
    };
    float tmpvar_925;
    tmpvar_925 = cos(((
      mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(_uidx1_917)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_924)
      , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(tmpvar_922)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_838)
      , 0.0, 3.0))], tmpvar_919)
     * 3.141593) / 180.0));
    highp int _uidx1_926;
    highp int tmpvar_927;
    if ((tmpvar_839 == 0)) {
      tmpvar_927 = 1;
    } else {
      tmpvar_927 = -1;
    };
    float tmpvar_928;
    tmpvar_928 = fract((iTime * 4.0));
    highp int tmpvar_929;
    tmpvar_929 = (tmpvar_838 - 1);
    highp int tmpvar_930;
    if ((tmpvar_927 >= 0)) {
      tmpvar_930 = 0;
    } else {
      tmpvar_930 = 1;
    };
    highp int tmpvar_931;
    tmpvar_931 = (4 + tmpvar_930);
    _uidx1_926 = tmpvar_931;
    if ((tmpvar_929 < 0)) {
      highp int tmpvar_932;
      if ((tmpvar_927 >= 0)) {
        tmpvar_932 = 1;
      } else {
        tmpvar_932 = 0;
      };
      _uidx1_926 = (4 + tmpvar_932);
    };
    highp int tmpvar_933;
    if ((tmpvar_929 < 0)) {
      tmpvar_933 = 3;
    } else {
      tmpvar_933 = tmpvar_929;
    };
    float tmpvar_934;
    tmpvar_934 = sin(((
      mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(_uidx1_926)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_933)
      , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(tmpvar_931)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_838)
      , 0.0, 3.0))], tmpvar_928)
     * 3.141593) / 180.0));
    highp int _uidx1_935;
    highp int tmpvar_936;
    if ((tmpvar_839 == 0)) {
      tmpvar_936 = 1;
    } else {
      tmpvar_936 = -1;
    };
    float tmpvar_937;
    tmpvar_937 = fract((iTime * 4.0));
    highp int tmpvar_938;
    tmpvar_938 = (tmpvar_838 - 1);
    highp int tmpvar_939;
    if ((tmpvar_936 >= 0)) {
      tmpvar_939 = 0;
    } else {
      tmpvar_939 = 1;
    };
    highp int tmpvar_940;
    tmpvar_940 = (4 + tmpvar_939);
    _uidx1_935 = tmpvar_940;
    if ((tmpvar_938 < 0)) {
      highp int tmpvar_941;
      if ((tmpvar_936 >= 0)) {
        tmpvar_941 = 1;
      } else {
        tmpvar_941 = 0;
      };
      _uidx1_935 = (4 + tmpvar_941);
    };
    highp int tmpvar_942;
    if ((tmpvar_938 < 0)) {
      tmpvar_942 = 3;
    } else {
      tmpvar_942 = tmpvar_938;
    };
    float tmpvar_943;
    tmpvar_943 = sin(((
      mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(_uidx1_935)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_942)
      , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(tmpvar_940)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_838)
      , 0.0, 3.0))], tmpvar_937)
     * 3.141593) / 180.0));
    highp int _uidx1_944;
    highp int tmpvar_945;
    if ((tmpvar_839 == 0)) {
      tmpvar_945 = 1;
    } else {
      tmpvar_945 = -1;
    };
    float tmpvar_946;
    tmpvar_946 = fract((iTime * 4.0));
    highp int tmpvar_947;
    tmpvar_947 = (tmpvar_838 - 1);
    highp int tmpvar_948;
    if ((tmpvar_945 >= 0)) {
      tmpvar_948 = 0;
    } else {
      tmpvar_948 = 1;
    };
    highp int tmpvar_949;
    tmpvar_949 = (4 + tmpvar_948);
    _uidx1_944 = tmpvar_949;
    if ((tmpvar_947 < 0)) {
      highp int tmpvar_950;
      if ((tmpvar_945 >= 0)) {
        tmpvar_950 = 1;
      } else {
        tmpvar_950 = 0;
      };
      _uidx1_944 = (4 + tmpvar_950);
    };
    highp int tmpvar_951;
    if ((tmpvar_947 < 0)) {
      tmpvar_951 = 3;
    } else {
      tmpvar_951 = tmpvar_947;
    };
    mat2 tmpvar_952;
    tmpvar_952[uint(0)].x = tmpvar_925;
    tmpvar_952[uint(0)].y = tmpvar_934;
    tmpvar_952[1u].x = -(tmpvar_943);
    tmpvar_952[1u].y = cos(((
      mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(_uidx1_944)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_951)
      , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(tmpvar_949)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_838)
      , 0.0, 3.0))], tmpvar_946)
     * 3.141593) / 180.0));
    _upLeg1L_830.yz = (tmpvar_916.yz * tmpvar_952);
    highp vec3 tmpvar_953;
    tmpvar_953 = (abs((_upLeg1L_830 - vec3(0.0, 0.1, 0.0))) - vec3(0.025, 0.1, 0.025));
    highp vec3 tmpvar_954;
    tmpvar_954 = max (tmpvar_953, 0.0);
    highp float tmpvar_955;
    tmpvar_955 = min (tmpvar_915, (sqrt(
      dot (tmpvar_954, tmpvar_954)
    ) + min (
      max (tmpvar_953.x, max (tmpvar_953.y, tmpvar_953.z))
    , 0.0)));
    highp vec3 tmpvar_956;
    tmpvar_956 = (_upPelvis_836 + vec3(-0.06, 0.025, 0.0));
    _upLeg0R_829.z = tmpvar_956.z;
    mat2 tmpvar_957;
    tmpvar_957[uint(0)].x = cos(-(tmpvar_848));
    tmpvar_957[uint(0)].y = sin(-(tmpvar_848));
    tmpvar_957[1u].x = -(sin(-(tmpvar_848)));
    tmpvar_957[1u].y = cos(-(tmpvar_848));
    _upLeg0R_829.xy = (tmpvar_956.xy * tmpvar_957);
    highp int _us_958;
    _us_958 = -1;
    highp int _uidx1_959;
    highp int tmpvar_960;
    if ((tmpvar_839 == 0)) {
      tmpvar_960 = 1;
    } else {
      tmpvar_960 = -1;
    };
    _us_958 = -(tmpvar_960);
    float tmpvar_961;
    tmpvar_961 = fract((iTime * 4.0));
    highp int tmpvar_962;
    tmpvar_962 = (tmpvar_838 - 1);
    highp int tmpvar_963;
    if ((_us_958 >= 0)) {
      tmpvar_963 = 0;
    } else {
      tmpvar_963 = 1;
    };
    highp int tmpvar_964;
    tmpvar_964 = (2 + tmpvar_963);
    _uidx1_959 = tmpvar_964;
    if ((tmpvar_962 < 0)) {
      highp int tmpvar_965;
      if ((_us_958 >= 0)) {
        tmpvar_965 = 1;
      } else {
        tmpvar_965 = 0;
      };
      _uidx1_959 = (2 + tmpvar_965);
    };
    highp int tmpvar_966;
    if ((tmpvar_962 < 0)) {
      tmpvar_966 = 3;
    } else {
      tmpvar_966 = tmpvar_962;
    };
    float tmpvar_967;
    tmpvar_967 = cos(((
      (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(_uidx1_959), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_966), 0.0, 3.0)
      )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(tmpvar_964), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_838), 0.0, 3.0)
      )], tmpvar_961))
     * 3.141593) / 180.0));
    highp int _us_968;
    _us_968 = -1;
    highp int _uidx1_969;
    highp int tmpvar_970;
    if ((tmpvar_839 == 0)) {
      tmpvar_970 = 1;
    } else {
      tmpvar_970 = -1;
    };
    _us_968 = -(tmpvar_970);
    float tmpvar_971;
    tmpvar_971 = fract((iTime * 4.0));
    highp int tmpvar_972;
    tmpvar_972 = (tmpvar_838 - 1);
    highp int tmpvar_973;
    if ((_us_968 >= 0)) {
      tmpvar_973 = 0;
    } else {
      tmpvar_973 = 1;
    };
    highp int tmpvar_974;
    tmpvar_974 = (2 + tmpvar_973);
    _uidx1_969 = tmpvar_974;
    if ((tmpvar_972 < 0)) {
      highp int tmpvar_975;
      if ((_us_968 >= 0)) {
        tmpvar_975 = 1;
      } else {
        tmpvar_975 = 0;
      };
      _uidx1_969 = (2 + tmpvar_975);
    };
    highp int tmpvar_976;
    if ((tmpvar_972 < 0)) {
      tmpvar_976 = 3;
    } else {
      tmpvar_976 = tmpvar_972;
    };
    float tmpvar_977;
    tmpvar_977 = sin(((
      (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(_uidx1_969), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_976), 0.0, 3.0)
      )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(tmpvar_974), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_838), 0.0, 3.0)
      )], tmpvar_971))
     * 3.141593) / 180.0));
    highp int _us_978;
    _us_978 = -1;
    highp int _uidx1_979;
    highp int tmpvar_980;
    if ((tmpvar_839 == 0)) {
      tmpvar_980 = 1;
    } else {
      tmpvar_980 = -1;
    };
    _us_978 = -(tmpvar_980);
    float tmpvar_981;
    tmpvar_981 = fract((iTime * 4.0));
    highp int tmpvar_982;
    tmpvar_982 = (tmpvar_838 - 1);
    highp int tmpvar_983;
    if ((_us_978 >= 0)) {
      tmpvar_983 = 0;
    } else {
      tmpvar_983 = 1;
    };
    highp int tmpvar_984;
    tmpvar_984 = (2 + tmpvar_983);
    _uidx1_979 = tmpvar_984;
    if ((tmpvar_982 < 0)) {
      highp int tmpvar_985;
      if ((_us_978 >= 0)) {
        tmpvar_985 = 1;
      } else {
        tmpvar_985 = 0;
      };
      _uidx1_979 = (2 + tmpvar_985);
    };
    highp int tmpvar_986;
    if ((tmpvar_982 < 0)) {
      tmpvar_986 = 3;
    } else {
      tmpvar_986 = tmpvar_982;
    };
    float tmpvar_987;
    tmpvar_987 = sin(((
      (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(_uidx1_979), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_986), 0.0, 3.0)
      )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(tmpvar_984), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_838), 0.0, 3.0)
      )], tmpvar_981))
     * 3.141593) / 180.0));
    highp int _us_988;
    _us_988 = -1;
    highp int _uidx1_989;
    highp int tmpvar_990;
    if ((tmpvar_839 == 0)) {
      tmpvar_990 = 1;
    } else {
      tmpvar_990 = -1;
    };
    _us_988 = -(tmpvar_990);
    float tmpvar_991;
    tmpvar_991 = fract((iTime * 4.0));
    highp int tmpvar_992;
    tmpvar_992 = (tmpvar_838 - 1);
    highp int tmpvar_993;
    if ((_us_988 >= 0)) {
      tmpvar_993 = 0;
    } else {
      tmpvar_993 = 1;
    };
    highp int tmpvar_994;
    tmpvar_994 = (2 + tmpvar_993);
    _uidx1_989 = tmpvar_994;
    if ((tmpvar_992 < 0)) {
      highp int tmpvar_995;
      if ((_us_988 >= 0)) {
        tmpvar_995 = 1;
      } else {
        tmpvar_995 = 0;
      };
      _uidx1_989 = (2 + tmpvar_995);
    };
    highp int tmpvar_996;
    if ((tmpvar_992 < 0)) {
      tmpvar_996 = 3;
    } else {
      tmpvar_996 = tmpvar_992;
    };
    mat2 tmpvar_997;
    tmpvar_997[uint(0)].x = tmpvar_967;
    tmpvar_997[uint(0)].y = tmpvar_977;
    tmpvar_997[1u].x = -(tmpvar_987);
    tmpvar_997[1u].y = cos(((
      (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(_uidx1_989), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_996), 0.0, 3.0)
      )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(tmpvar_994), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_838), 0.0, 3.0)
      )], tmpvar_991))
     * 3.141593) / 180.0));
    _upLeg0R_829.yz = (_upLeg0R_829.yz * tmpvar_997);
    highp vec3 tmpvar_998;
    tmpvar_998 = (abs((_upLeg0R_829 - vec3(0.0, 0.1, 0.0))) - vec3(0.025, 0.1, 0.025));
    highp vec3 tmpvar_999;
    tmpvar_999 = max (tmpvar_998, 0.0);
    highp float tmpvar_1000;
    tmpvar_1000 = min (tmpvar_955, (sqrt(
      dot (tmpvar_999, tmpvar_999)
    ) + min (
      max (tmpvar_998.x, max (tmpvar_998.y, tmpvar_998.z))
    , 0.0)));
    highp vec3 tmpvar_1001;
    tmpvar_1001 = (_upLeg0R_829 + vec3(-0.01, -0.18, 0.02));
    _upLeg1R_828 = tmpvar_1001;
    highp int _us_1002;
    _us_1002 = -1;
    highp int _uidx1_1003;
    highp int tmpvar_1004;
    if ((tmpvar_839 == 0)) {
      tmpvar_1004 = 1;
    } else {
      tmpvar_1004 = -1;
    };
    _us_1002 = -(tmpvar_1004);
    float tmpvar_1005;
    tmpvar_1005 = fract((iTime * 4.0));
    highp int tmpvar_1006;
    tmpvar_1006 = (tmpvar_838 - 1);
    highp int tmpvar_1007;
    if ((_us_1002 >= 0)) {
      tmpvar_1007 = 0;
    } else {
      tmpvar_1007 = 1;
    };
    highp int tmpvar_1008;
    tmpvar_1008 = (4 + tmpvar_1007);
    _uidx1_1003 = tmpvar_1008;
    if ((tmpvar_1006 < 0)) {
      highp int tmpvar_1009;
      if ((_us_1002 >= 0)) {
        tmpvar_1009 = 1;
      } else {
        tmpvar_1009 = 0;
      };
      _uidx1_1003 = (4 + tmpvar_1009);
    };
    highp int tmpvar_1010;
    if ((tmpvar_1006 < 0)) {
      tmpvar_1010 = 3;
    } else {
      tmpvar_1010 = tmpvar_1006;
    };
    float tmpvar_1011;
    tmpvar_1011 = cos(((
      mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(_uidx1_1003)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_1010)
      , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(tmpvar_1008)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_838)
      , 0.0, 3.0))], tmpvar_1005)
     * 3.141593) / 180.0));
    highp int _us_1012;
    _us_1012 = -1;
    highp int _uidx1_1013;
    highp int tmpvar_1014;
    if ((tmpvar_839 == 0)) {
      tmpvar_1014 = 1;
    } else {
      tmpvar_1014 = -1;
    };
    _us_1012 = -(tmpvar_1014);
    float tmpvar_1015;
    tmpvar_1015 = fract((iTime * 4.0));
    highp int tmpvar_1016;
    tmpvar_1016 = (tmpvar_838 - 1);
    highp int tmpvar_1017;
    if ((_us_1012 >= 0)) {
      tmpvar_1017 = 0;
    } else {
      tmpvar_1017 = 1;
    };
    highp int tmpvar_1018;
    tmpvar_1018 = (4 + tmpvar_1017);
    _uidx1_1013 = tmpvar_1018;
    if ((tmpvar_1016 < 0)) {
      highp int tmpvar_1019;
      if ((_us_1012 >= 0)) {
        tmpvar_1019 = 1;
      } else {
        tmpvar_1019 = 0;
      };
      _uidx1_1013 = (4 + tmpvar_1019);
    };
    highp int tmpvar_1020;
    if ((tmpvar_1016 < 0)) {
      tmpvar_1020 = 3;
    } else {
      tmpvar_1020 = tmpvar_1016;
    };
    float tmpvar_1021;
    tmpvar_1021 = sin(((
      mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(_uidx1_1013)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_1020)
      , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(tmpvar_1018)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_838)
      , 0.0, 3.0))], tmpvar_1015)
     * 3.141593) / 180.0));
    highp int _us_1022;
    _us_1022 = -1;
    highp int _uidx1_1023;
    highp int tmpvar_1024;
    if ((tmpvar_839 == 0)) {
      tmpvar_1024 = 1;
    } else {
      tmpvar_1024 = -1;
    };
    _us_1022 = -(tmpvar_1024);
    float tmpvar_1025;
    tmpvar_1025 = fract((iTime * 4.0));
    highp int tmpvar_1026;
    tmpvar_1026 = (tmpvar_838 - 1);
    highp int tmpvar_1027;
    if ((_us_1022 >= 0)) {
      tmpvar_1027 = 0;
    } else {
      tmpvar_1027 = 1;
    };
    highp int tmpvar_1028;
    tmpvar_1028 = (4 + tmpvar_1027);
    _uidx1_1023 = tmpvar_1028;
    if ((tmpvar_1026 < 0)) {
      highp int tmpvar_1029;
      if ((_us_1022 >= 0)) {
        tmpvar_1029 = 1;
      } else {
        tmpvar_1029 = 0;
      };
      _uidx1_1023 = (4 + tmpvar_1029);
    };
    highp int tmpvar_1030;
    if ((tmpvar_1026 < 0)) {
      tmpvar_1030 = 3;
    } else {
      tmpvar_1030 = tmpvar_1026;
    };
    float tmpvar_1031;
    tmpvar_1031 = sin(((
      mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(_uidx1_1023)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_1030)
      , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(tmpvar_1028)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_838)
      , 0.0, 3.0))], tmpvar_1025)
     * 3.141593) / 180.0));
    highp int _us_1032;
    _us_1032 = -1;
    highp int _uidx1_1033;
    highp int tmpvar_1034;
    if ((tmpvar_839 == 0)) {
      tmpvar_1034 = 1;
    } else {
      tmpvar_1034 = -1;
    };
    _us_1032 = -(tmpvar_1034);
    float tmpvar_1035;
    tmpvar_1035 = fract((iTime * 4.0));
    highp int tmpvar_1036;
    tmpvar_1036 = (tmpvar_838 - 1);
    highp int tmpvar_1037;
    if ((_us_1032 >= 0)) {
      tmpvar_1037 = 0;
    } else {
      tmpvar_1037 = 1;
    };
    highp int tmpvar_1038;
    tmpvar_1038 = (4 + tmpvar_1037);
    _uidx1_1033 = tmpvar_1038;
    if ((tmpvar_1036 < 0)) {
      highp int tmpvar_1039;
      if ((_us_1032 >= 0)) {
        tmpvar_1039 = 1;
      } else {
        tmpvar_1039 = 0;
      };
      _uidx1_1033 = (4 + tmpvar_1039);
    };
    highp int tmpvar_1040;
    if ((tmpvar_1036 < 0)) {
      tmpvar_1040 = 3;
    } else {
      tmpvar_1040 = tmpvar_1036;
    };
    mat2 tmpvar_1041;
    tmpvar_1041[uint(0)].x = tmpvar_1011;
    tmpvar_1041[uint(0)].y = tmpvar_1021;
    tmpvar_1041[1u].x = -(tmpvar_1031);
    tmpvar_1041[1u].y = cos(((
      mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(_uidx1_1033)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_1040)
      , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(tmpvar_1038)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_838)
      , 0.0, 3.0))], tmpvar_1035)
     * 3.141593) / 180.0));
    _upLeg1R_828.yz = (tmpvar_1001.yz * tmpvar_1041);
    highp vec3 tmpvar_1042;
    tmpvar_1042 = (abs((_upLeg1R_828 - vec3(0.0, 0.1, 0.0))) - vec3(0.025, 0.1, 0.025));
    highp vec3 tmpvar_1043;
    tmpvar_1043 = max (tmpvar_1042, 0.0);
    highp float tmpvar_1044;
    tmpvar_1044 = min (tmpvar_1000, (sqrt(
      dot (tmpvar_1043, tmpvar_1043)
    ) + min (
      max (tmpvar_1042.x, max (tmpvar_1042.y, tmpvar_1042.z))
    , 0.0)));
    highp vec3 tmpvar_1045;
    tmpvar_1045 = (_upChest_834 + vec3(0.125, -0.1, 0.0));
    _upArm0L_827 = tmpvar_1045;
    highp int _uidx1_1046;
    highp int tmpvar_1047;
    if ((tmpvar_839 == 0)) {
      tmpvar_1047 = 1;
    } else {
      tmpvar_1047 = -1;
    };
    float tmpvar_1048;
    tmpvar_1048 = fract((iTime * 4.0));
    highp int tmpvar_1049;
    tmpvar_1049 = (tmpvar_838 - 1);
    highp int tmpvar_1050;
    if ((tmpvar_1047 >= 0)) {
      tmpvar_1050 = 0;
    } else {
      tmpvar_1050 = 1;
    };
    highp int tmpvar_1051;
    tmpvar_1051 = (6 + tmpvar_1050);
    _uidx1_1046 = tmpvar_1051;
    if ((tmpvar_1049 < 0)) {
      highp int tmpvar_1052;
      if ((tmpvar_1047 >= 0)) {
        tmpvar_1052 = 1;
      } else {
        tmpvar_1052 = 0;
      };
      _uidx1_1046 = (6 + tmpvar_1052);
    };
    highp int tmpvar_1053;
    if ((tmpvar_1049 < 0)) {
      tmpvar_1053 = 3;
    } else {
      tmpvar_1053 = tmpvar_1049;
    };
    float tmpvar_1054;
    tmpvar_1054 = cos(((
      (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(_uidx1_1046), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_1053), 0.0, 3.0)
      )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(tmpvar_1051), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_838), 0.0, 3.0)
      )], tmpvar_1048))
     * 3.141593) / 180.0));
    highp int _uidx1_1055;
    highp int tmpvar_1056;
    if ((tmpvar_839 == 0)) {
      tmpvar_1056 = 1;
    } else {
      tmpvar_1056 = -1;
    };
    float tmpvar_1057;
    tmpvar_1057 = fract((iTime * 4.0));
    highp int tmpvar_1058;
    tmpvar_1058 = (tmpvar_838 - 1);
    highp int tmpvar_1059;
    if ((tmpvar_1056 >= 0)) {
      tmpvar_1059 = 0;
    } else {
      tmpvar_1059 = 1;
    };
    highp int tmpvar_1060;
    tmpvar_1060 = (6 + tmpvar_1059);
    _uidx1_1055 = tmpvar_1060;
    if ((tmpvar_1058 < 0)) {
      highp int tmpvar_1061;
      if ((tmpvar_1056 >= 0)) {
        tmpvar_1061 = 1;
      } else {
        tmpvar_1061 = 0;
      };
      _uidx1_1055 = (6 + tmpvar_1061);
    };
    highp int tmpvar_1062;
    if ((tmpvar_1058 < 0)) {
      tmpvar_1062 = 3;
    } else {
      tmpvar_1062 = tmpvar_1058;
    };
    float tmpvar_1063;
    tmpvar_1063 = sin(((
      (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(_uidx1_1055), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_1062), 0.0, 3.0)
      )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(tmpvar_1060), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_838), 0.0, 3.0)
      )], tmpvar_1057))
     * 3.141593) / 180.0));
    highp int _uidx1_1064;
    highp int tmpvar_1065;
    if ((tmpvar_839 == 0)) {
      tmpvar_1065 = 1;
    } else {
      tmpvar_1065 = -1;
    };
    float tmpvar_1066;
    tmpvar_1066 = fract((iTime * 4.0));
    highp int tmpvar_1067;
    tmpvar_1067 = (tmpvar_838 - 1);
    highp int tmpvar_1068;
    if ((tmpvar_1065 >= 0)) {
      tmpvar_1068 = 0;
    } else {
      tmpvar_1068 = 1;
    };
    highp int tmpvar_1069;
    tmpvar_1069 = (6 + tmpvar_1068);
    _uidx1_1064 = tmpvar_1069;
    if ((tmpvar_1067 < 0)) {
      highp int tmpvar_1070;
      if ((tmpvar_1065 >= 0)) {
        tmpvar_1070 = 1;
      } else {
        tmpvar_1070 = 0;
      };
      _uidx1_1064 = (6 + tmpvar_1070);
    };
    highp int tmpvar_1071;
    if ((tmpvar_1067 < 0)) {
      tmpvar_1071 = 3;
    } else {
      tmpvar_1071 = tmpvar_1067;
    };
    float tmpvar_1072;
    tmpvar_1072 = sin(((
      (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(_uidx1_1064), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_1071), 0.0, 3.0)
      )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(tmpvar_1069), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_838), 0.0, 3.0)
      )], tmpvar_1066))
     * 3.141593) / 180.0));
    highp int _uidx1_1073;
    highp int tmpvar_1074;
    if ((tmpvar_839 == 0)) {
      tmpvar_1074 = 1;
    } else {
      tmpvar_1074 = -1;
    };
    float tmpvar_1075;
    tmpvar_1075 = fract((iTime * 4.0));
    highp int tmpvar_1076;
    tmpvar_1076 = (tmpvar_838 - 1);
    highp int tmpvar_1077;
    if ((tmpvar_1074 >= 0)) {
      tmpvar_1077 = 0;
    } else {
      tmpvar_1077 = 1;
    };
    highp int tmpvar_1078;
    tmpvar_1078 = (6 + tmpvar_1077);
    _uidx1_1073 = tmpvar_1078;
    if ((tmpvar_1076 < 0)) {
      highp int tmpvar_1079;
      if ((tmpvar_1074 >= 0)) {
        tmpvar_1079 = 1;
      } else {
        tmpvar_1079 = 0;
      };
      _uidx1_1073 = (6 + tmpvar_1079);
    };
    highp int tmpvar_1080;
    if ((tmpvar_1076 < 0)) {
      tmpvar_1080 = 3;
    } else {
      tmpvar_1080 = tmpvar_1076;
    };
    mat2 tmpvar_1081;
    tmpvar_1081[uint(0)].x = tmpvar_1054;
    tmpvar_1081[uint(0)].y = tmpvar_1063;
    tmpvar_1081[1u].x = -(tmpvar_1072);
    tmpvar_1081[1u].y = cos(((
      (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(_uidx1_1073), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_1080), 0.0, 3.0)
      )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(tmpvar_1078), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_838), 0.0, 3.0)
      )], tmpvar_1075))
     * 3.141593) / 180.0));
    _upArm0L_827.yz = (tmpvar_1045.yz * tmpvar_1081);
    highp vec3 tmpvar_1082;
    tmpvar_1082 = (abs((_upArm0L_827 - vec3(0.0, 0.08, 0.0))) - vec3(0.02, 0.08, 0.02));
    highp vec3 tmpvar_1083;
    tmpvar_1083 = max (tmpvar_1082, 0.0);
    highp float tmpvar_1084;
    tmpvar_1084 = min (tmpvar_1044, (sqrt(
      dot (tmpvar_1083, tmpvar_1083)
    ) + min (
      max (tmpvar_1082.x, max (tmpvar_1082.y, tmpvar_1082.z))
    , 0.0)));
    highp vec3 tmpvar_1085;
    tmpvar_1085 = (_upArm0L_827 + vec3(0.0, -0.16, 0.0));
    _upArm1L_826 = tmpvar_1085;
    highp int _uidx1_1086;
    highp int tmpvar_1087;
    if ((tmpvar_839 == 0)) {
      tmpvar_1087 = 1;
    } else {
      tmpvar_1087 = -1;
    };
    float tmpvar_1088;
    tmpvar_1088 = fract((iTime * 4.0));
    highp int tmpvar_1089;
    tmpvar_1089 = (tmpvar_838 - 1);
    highp int tmpvar_1090;
    if ((tmpvar_1087 >= 0)) {
      tmpvar_1090 = 0;
    } else {
      tmpvar_1090 = 1;
    };
    highp int tmpvar_1091;
    tmpvar_1091 = (8 + tmpvar_1090);
    _uidx1_1086 = tmpvar_1091;
    if ((tmpvar_1089 < 0)) {
      highp int tmpvar_1092;
      if ((tmpvar_1087 >= 0)) {
        tmpvar_1092 = 1;
      } else {
        tmpvar_1092 = 0;
      };
      _uidx1_1086 = (8 + tmpvar_1092);
    };
    highp int tmpvar_1093;
    if ((tmpvar_1089 < 0)) {
      tmpvar_1093 = 3;
    } else {
      tmpvar_1093 = tmpvar_1089;
    };
    float tmpvar_1094;
    tmpvar_1094 = cos(((
      mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(_uidx1_1086)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_1093)
      , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(tmpvar_1091)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_838)
      , 0.0, 3.0))], tmpvar_1088)
     * 3.141593) / 180.0));
    highp int _uidx1_1095;
    highp int tmpvar_1096;
    if ((tmpvar_839 == 0)) {
      tmpvar_1096 = 1;
    } else {
      tmpvar_1096 = -1;
    };
    float tmpvar_1097;
    tmpvar_1097 = fract((iTime * 4.0));
    highp int tmpvar_1098;
    tmpvar_1098 = (tmpvar_838 - 1);
    highp int tmpvar_1099;
    if ((tmpvar_1096 >= 0)) {
      tmpvar_1099 = 0;
    } else {
      tmpvar_1099 = 1;
    };
    highp int tmpvar_1100;
    tmpvar_1100 = (8 + tmpvar_1099);
    _uidx1_1095 = tmpvar_1100;
    if ((tmpvar_1098 < 0)) {
      highp int tmpvar_1101;
      if ((tmpvar_1096 >= 0)) {
        tmpvar_1101 = 1;
      } else {
        tmpvar_1101 = 0;
      };
      _uidx1_1095 = (8 + tmpvar_1101);
    };
    highp int tmpvar_1102;
    if ((tmpvar_1098 < 0)) {
      tmpvar_1102 = 3;
    } else {
      tmpvar_1102 = tmpvar_1098;
    };
    float tmpvar_1103;
    tmpvar_1103 = sin(((
      mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(_uidx1_1095)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_1102)
      , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(tmpvar_1100)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_838)
      , 0.0, 3.0))], tmpvar_1097)
     * 3.141593) / 180.0));
    highp int _uidx1_1104;
    highp int tmpvar_1105;
    if ((tmpvar_839 == 0)) {
      tmpvar_1105 = 1;
    } else {
      tmpvar_1105 = -1;
    };
    float tmpvar_1106;
    tmpvar_1106 = fract((iTime * 4.0));
    highp int tmpvar_1107;
    tmpvar_1107 = (tmpvar_838 - 1);
    highp int tmpvar_1108;
    if ((tmpvar_1105 >= 0)) {
      tmpvar_1108 = 0;
    } else {
      tmpvar_1108 = 1;
    };
    highp int tmpvar_1109;
    tmpvar_1109 = (8 + tmpvar_1108);
    _uidx1_1104 = tmpvar_1109;
    if ((tmpvar_1107 < 0)) {
      highp int tmpvar_1110;
      if ((tmpvar_1105 >= 0)) {
        tmpvar_1110 = 1;
      } else {
        tmpvar_1110 = 0;
      };
      _uidx1_1104 = (8 + tmpvar_1110);
    };
    highp int tmpvar_1111;
    if ((tmpvar_1107 < 0)) {
      tmpvar_1111 = 3;
    } else {
      tmpvar_1111 = tmpvar_1107;
    };
    float tmpvar_1112;
    tmpvar_1112 = sin(((
      mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(_uidx1_1104)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_1111)
      , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(tmpvar_1109)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_838)
      , 0.0, 3.0))], tmpvar_1106)
     * 3.141593) / 180.0));
    highp int _uidx1_1113;
    highp int tmpvar_1114;
    if ((tmpvar_839 == 0)) {
      tmpvar_1114 = 1;
    } else {
      tmpvar_1114 = -1;
    };
    float tmpvar_1115;
    tmpvar_1115 = fract((iTime * 4.0));
    highp int tmpvar_1116;
    tmpvar_1116 = (tmpvar_838 - 1);
    highp int tmpvar_1117;
    if ((tmpvar_1114 >= 0)) {
      tmpvar_1117 = 0;
    } else {
      tmpvar_1117 = 1;
    };
    highp int tmpvar_1118;
    tmpvar_1118 = (8 + tmpvar_1117);
    _uidx1_1113 = tmpvar_1118;
    if ((tmpvar_1116 < 0)) {
      highp int tmpvar_1119;
      if ((tmpvar_1114 >= 0)) {
        tmpvar_1119 = 1;
      } else {
        tmpvar_1119 = 0;
      };
      _uidx1_1113 = (8 + tmpvar_1119);
    };
    highp int tmpvar_1120;
    if ((tmpvar_1116 < 0)) {
      tmpvar_1120 = 3;
    } else {
      tmpvar_1120 = tmpvar_1116;
    };
    mat2 tmpvar_1121;
    tmpvar_1121[uint(0)].x = tmpvar_1094;
    tmpvar_1121[uint(0)].y = tmpvar_1103;
    tmpvar_1121[1u].x = -(tmpvar_1112);
    tmpvar_1121[1u].y = cos(((
      mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(_uidx1_1113)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_1120)
      , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(tmpvar_1118)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_838)
      , 0.0, 3.0))], tmpvar_1115)
     * 3.141593) / 180.0));
    _upArm1L_826.yz = (tmpvar_1085.yz * tmpvar_1121);
    highp vec3 tmpvar_1122;
    tmpvar_1122 = (abs((_upArm1L_826 - vec3(0.0, 0.08, 0.0))) - vec3(0.02, 0.08, 0.02));
    highp vec3 tmpvar_1123;
    tmpvar_1123 = max (tmpvar_1122, 0.0);
    highp float tmpvar_1124;
    tmpvar_1124 = min (tmpvar_1084, (sqrt(
      dot (tmpvar_1123, tmpvar_1123)
    ) + min (
      max (tmpvar_1122.x, max (tmpvar_1122.y, tmpvar_1122.z))
    , 0.0)));
    highp vec3 tmpvar_1125;
    tmpvar_1125 = (_upChest_834 + vec3(-0.125, -0.1, 0.0));
    _upArm0R_825 = tmpvar_1125;
    highp int _us_1126;
    _us_1126 = -1;
    highp int _uidx1_1127;
    highp int tmpvar_1128;
    if ((tmpvar_839 == 0)) {
      tmpvar_1128 = 1;
    } else {
      tmpvar_1128 = -1;
    };
    _us_1126 = -(tmpvar_1128);
    float tmpvar_1129;
    tmpvar_1129 = fract((iTime * 4.0));
    highp int tmpvar_1130;
    tmpvar_1130 = (tmpvar_838 - 1);
    highp int tmpvar_1131;
    if ((_us_1126 >= 0)) {
      tmpvar_1131 = 0;
    } else {
      tmpvar_1131 = 1;
    };
    highp int tmpvar_1132;
    tmpvar_1132 = (6 + tmpvar_1131);
    _uidx1_1127 = tmpvar_1132;
    if ((tmpvar_1130 < 0)) {
      highp int tmpvar_1133;
      if ((_us_1126 >= 0)) {
        tmpvar_1133 = 1;
      } else {
        tmpvar_1133 = 0;
      };
      _uidx1_1127 = (6 + tmpvar_1133);
    };
    highp int tmpvar_1134;
    if ((tmpvar_1130 < 0)) {
      tmpvar_1134 = 3;
    } else {
      tmpvar_1134 = tmpvar_1130;
    };
    float tmpvar_1135;
    tmpvar_1135 = cos(((
      (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(_uidx1_1127), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_1134), 0.0, 3.0)
      )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(tmpvar_1132), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_838), 0.0, 3.0)
      )], tmpvar_1129))
     * 3.141593) / 180.0));
    highp int _us_1136;
    _us_1136 = -1;
    highp int _uidx1_1137;
    highp int tmpvar_1138;
    if ((tmpvar_839 == 0)) {
      tmpvar_1138 = 1;
    } else {
      tmpvar_1138 = -1;
    };
    _us_1136 = -(tmpvar_1138);
    float tmpvar_1139;
    tmpvar_1139 = fract((iTime * 4.0));
    highp int tmpvar_1140;
    tmpvar_1140 = (tmpvar_838 - 1);
    highp int tmpvar_1141;
    if ((_us_1136 >= 0)) {
      tmpvar_1141 = 0;
    } else {
      tmpvar_1141 = 1;
    };
    highp int tmpvar_1142;
    tmpvar_1142 = (6 + tmpvar_1141);
    _uidx1_1137 = tmpvar_1142;
    if ((tmpvar_1140 < 0)) {
      highp int tmpvar_1143;
      if ((_us_1136 >= 0)) {
        tmpvar_1143 = 1;
      } else {
        tmpvar_1143 = 0;
      };
      _uidx1_1137 = (6 + tmpvar_1143);
    };
    highp int tmpvar_1144;
    if ((tmpvar_1140 < 0)) {
      tmpvar_1144 = 3;
    } else {
      tmpvar_1144 = tmpvar_1140;
    };
    float tmpvar_1145;
    tmpvar_1145 = sin(((
      (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(_uidx1_1137), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_1144), 0.0, 3.0)
      )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(tmpvar_1142), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_838), 0.0, 3.0)
      )], tmpvar_1139))
     * 3.141593) / 180.0));
    highp int _us_1146;
    _us_1146 = -1;
    highp int _uidx1_1147;
    highp int tmpvar_1148;
    if ((tmpvar_839 == 0)) {
      tmpvar_1148 = 1;
    } else {
      tmpvar_1148 = -1;
    };
    _us_1146 = -(tmpvar_1148);
    float tmpvar_1149;
    tmpvar_1149 = fract((iTime * 4.0));
    highp int tmpvar_1150;
    tmpvar_1150 = (tmpvar_838 - 1);
    highp int tmpvar_1151;
    if ((_us_1146 >= 0)) {
      tmpvar_1151 = 0;
    } else {
      tmpvar_1151 = 1;
    };
    highp int tmpvar_1152;
    tmpvar_1152 = (6 + tmpvar_1151);
    _uidx1_1147 = tmpvar_1152;
    if ((tmpvar_1150 < 0)) {
      highp int tmpvar_1153;
      if ((_us_1146 >= 0)) {
        tmpvar_1153 = 1;
      } else {
        tmpvar_1153 = 0;
      };
      _uidx1_1147 = (6 + tmpvar_1153);
    };
    highp int tmpvar_1154;
    if ((tmpvar_1150 < 0)) {
      tmpvar_1154 = 3;
    } else {
      tmpvar_1154 = tmpvar_1150;
    };
    float tmpvar_1155;
    tmpvar_1155 = sin(((
      (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(_uidx1_1147), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_1154), 0.0, 3.0)
      )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(tmpvar_1152), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_838), 0.0, 3.0)
      )], tmpvar_1149))
     * 3.141593) / 180.0));
    highp int _us_1156;
    _us_1156 = -1;
    highp int _uidx1_1157;
    highp int tmpvar_1158;
    if ((tmpvar_839 == 0)) {
      tmpvar_1158 = 1;
    } else {
      tmpvar_1158 = -1;
    };
    _us_1156 = -(tmpvar_1158);
    float tmpvar_1159;
    tmpvar_1159 = fract((iTime * 4.0));
    highp int tmpvar_1160;
    tmpvar_1160 = (tmpvar_838 - 1);
    highp int tmpvar_1161;
    if ((_us_1156 >= 0)) {
      tmpvar_1161 = 0;
    } else {
      tmpvar_1161 = 1;
    };
    highp int tmpvar_1162;
    tmpvar_1162 = (6 + tmpvar_1161);
    _uidx1_1157 = tmpvar_1162;
    if ((tmpvar_1160 < 0)) {
      highp int tmpvar_1163;
      if ((_us_1156 >= 0)) {
        tmpvar_1163 = 1;
      } else {
        tmpvar_1163 = 0;
      };
      _uidx1_1157 = (6 + tmpvar_1163);
    };
    highp int tmpvar_1164;
    if ((tmpvar_1160 < 0)) {
      tmpvar_1164 = 3;
    } else {
      tmpvar_1164 = tmpvar_1160;
    };
    mat2 tmpvar_1165;
    tmpvar_1165[uint(0)].x = tmpvar_1135;
    tmpvar_1165[uint(0)].y = tmpvar_1145;
    tmpvar_1165[1u].x = -(tmpvar_1155);
    tmpvar_1165[1u].y = cos(((
      (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(_uidx1_1157), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_1164), 0.0, 3.0)
      )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(tmpvar_1162), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_838), 0.0, 3.0)
      )], tmpvar_1159))
     * 3.141593) / 180.0));
    _upArm0R_825.yz = (tmpvar_1125.yz * tmpvar_1165);
    highp vec3 tmpvar_1166;
    tmpvar_1166 = (abs((_upArm0R_825 - vec3(0.0, 0.08, 0.0))) - vec3(0.02, 0.08, 0.02));
    highp vec3 tmpvar_1167;
    tmpvar_1167 = max (tmpvar_1166, 0.0);
    highp float tmpvar_1168;
    tmpvar_1168 = min (tmpvar_1124, (sqrt(
      dot (tmpvar_1167, tmpvar_1167)
    ) + min (
      max (tmpvar_1166.x, max (tmpvar_1166.y, tmpvar_1166.z))
    , 0.0)));
    highp vec3 tmpvar_1169;
    tmpvar_1169 = (_upArm0R_825 + vec3(0.0, -0.16, 0.0));
    _upArm1R_824 = tmpvar_1169;
    highp int _us_1170;
    _us_1170 = -1;
    highp int _uidx1_1171;
    highp int tmpvar_1172;
    if ((tmpvar_839 == 0)) {
      tmpvar_1172 = 1;
    } else {
      tmpvar_1172 = -1;
    };
    _us_1170 = -(tmpvar_1172);
    float tmpvar_1173;
    tmpvar_1173 = fract((iTime * 4.0));
    highp int tmpvar_1174;
    tmpvar_1174 = (tmpvar_838 - 1);
    highp int tmpvar_1175;
    if ((_us_1170 >= 0)) {
      tmpvar_1175 = 0;
    } else {
      tmpvar_1175 = 1;
    };
    highp int tmpvar_1176;
    tmpvar_1176 = (8 + tmpvar_1175);
    _uidx1_1171 = tmpvar_1176;
    if ((tmpvar_1174 < 0)) {
      highp int tmpvar_1177;
      if ((_us_1170 >= 0)) {
        tmpvar_1177 = 1;
      } else {
        tmpvar_1177 = 0;
      };
      _uidx1_1171 = (8 + tmpvar_1177);
    };
    highp int tmpvar_1178;
    if ((tmpvar_1174 < 0)) {
      tmpvar_1178 = 3;
    } else {
      tmpvar_1178 = tmpvar_1174;
    };
    float tmpvar_1179;
    tmpvar_1179 = cos(((
      mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(_uidx1_1171)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_1178)
      , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(tmpvar_1176)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_838)
      , 0.0, 3.0))], tmpvar_1173)
     * 3.141593) / 180.0));
    highp int _us_1180;
    _us_1180 = -1;
    highp int _uidx1_1181;
    highp int tmpvar_1182;
    if ((tmpvar_839 == 0)) {
      tmpvar_1182 = 1;
    } else {
      tmpvar_1182 = -1;
    };
    _us_1180 = -(tmpvar_1182);
    float tmpvar_1183;
    tmpvar_1183 = fract((iTime * 4.0));
    highp int tmpvar_1184;
    tmpvar_1184 = (tmpvar_838 - 1);
    highp int tmpvar_1185;
    if ((_us_1180 >= 0)) {
      tmpvar_1185 = 0;
    } else {
      tmpvar_1185 = 1;
    };
    highp int tmpvar_1186;
    tmpvar_1186 = (8 + tmpvar_1185);
    _uidx1_1181 = tmpvar_1186;
    if ((tmpvar_1184 < 0)) {
      highp int tmpvar_1187;
      if ((_us_1180 >= 0)) {
        tmpvar_1187 = 1;
      } else {
        tmpvar_1187 = 0;
      };
      _uidx1_1181 = (8 + tmpvar_1187);
    };
    highp int tmpvar_1188;
    if ((tmpvar_1184 < 0)) {
      tmpvar_1188 = 3;
    } else {
      tmpvar_1188 = tmpvar_1184;
    };
    float tmpvar_1189;
    tmpvar_1189 = sin(((
      mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(_uidx1_1181)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_1188)
      , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(tmpvar_1186)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_838)
      , 0.0, 3.0))], tmpvar_1183)
     * 3.141593) / 180.0));
    highp int _us_1190;
    _us_1190 = -1;
    highp int _uidx1_1191;
    highp int tmpvar_1192;
    if ((tmpvar_839 == 0)) {
      tmpvar_1192 = 1;
    } else {
      tmpvar_1192 = -1;
    };
    _us_1190 = -(tmpvar_1192);
    float tmpvar_1193;
    tmpvar_1193 = fract((iTime * 4.0));
    highp int tmpvar_1194;
    tmpvar_1194 = (tmpvar_838 - 1);
    highp int tmpvar_1195;
    if ((_us_1190 >= 0)) {
      tmpvar_1195 = 0;
    } else {
      tmpvar_1195 = 1;
    };
    highp int tmpvar_1196;
    tmpvar_1196 = (8 + tmpvar_1195);
    _uidx1_1191 = tmpvar_1196;
    if ((tmpvar_1194 < 0)) {
      highp int tmpvar_1197;
      if ((_us_1190 >= 0)) {
        tmpvar_1197 = 1;
      } else {
        tmpvar_1197 = 0;
      };
      _uidx1_1191 = (8 + tmpvar_1197);
    };
    highp int tmpvar_1198;
    if ((tmpvar_1194 < 0)) {
      tmpvar_1198 = 3;
    } else {
      tmpvar_1198 = tmpvar_1194;
    };
    float tmpvar_1199;
    tmpvar_1199 = sin(((
      mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(_uidx1_1191)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_1198)
      , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(tmpvar_1196)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_838)
      , 0.0, 3.0))], tmpvar_1193)
     * 3.141593) / 180.0));
    highp int _us_1200;
    _us_1200 = -1;
    highp int _uidx1_1201;
    highp int tmpvar_1202;
    if ((tmpvar_839 == 0)) {
      tmpvar_1202 = 1;
    } else {
      tmpvar_1202 = -1;
    };
    _us_1200 = -(tmpvar_1202);
    float tmpvar_1203;
    tmpvar_1203 = fract((iTime * 4.0));
    highp int tmpvar_1204;
    tmpvar_1204 = (tmpvar_838 - 1);
    highp int tmpvar_1205;
    if ((_us_1200 >= 0)) {
      tmpvar_1205 = 0;
    } else {
      tmpvar_1205 = 1;
    };
    highp int tmpvar_1206;
    tmpvar_1206 = (8 + tmpvar_1205);
    _uidx1_1201 = tmpvar_1206;
    if ((tmpvar_1204 < 0)) {
      highp int tmpvar_1207;
      if ((_us_1200 >= 0)) {
        tmpvar_1207 = 1;
      } else {
        tmpvar_1207 = 0;
      };
      _uidx1_1201 = (8 + tmpvar_1207);
    };
    highp int tmpvar_1208;
    if ((tmpvar_1204 < 0)) {
      tmpvar_1208 = 3;
    } else {
      tmpvar_1208 = tmpvar_1204;
    };
    mat2 tmpvar_1209;
    tmpvar_1209[uint(0)].x = tmpvar_1179;
    tmpvar_1209[uint(0)].y = tmpvar_1189;
    tmpvar_1209[1u].x = -(tmpvar_1199);
    tmpvar_1209[1u].y = cos(((
      mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(_uidx1_1201)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_1208)
      , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(tmpvar_1206)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_838)
      , 0.0, 3.0))], tmpvar_1203)
     * 3.141593) / 180.0));
    _upArm1R_824.yz = (tmpvar_1169.yz * tmpvar_1209);
    highp vec3 tmpvar_1210;
    tmpvar_1210 = (abs((_upArm1R_824 - vec3(0.0, 0.08, 0.0))) - vec3(0.02, 0.08, 0.02));
    highp vec3 tmpvar_1211;
    tmpvar_1211 = max (tmpvar_1210, 0.0);
    highp float tmpvar_1212;
    tmpvar_1212 = min (tmpvar_1168, (sqrt(
      dot (tmpvar_1211, tmpvar_1211)
    ) + min (
      max (tmpvar_1210.x, max (tmpvar_1210.y, tmpvar_1210.z))
    , 0.0)));
    highp vec4 tmpvar_1213;
    if ((tmpvar_1212 < tmpvar_814.x)) {
      highp vec3 _upArm1R_1214;
      highp vec3 _upArm0R_1215;
      highp vec3 _upArm1L_1216;
      highp vec3 _upArm0L_1217;
      highp vec3 _upLeg1R_1218;
      highp vec3 _upLeg0R_1219;
      highp vec3 _upLeg1L_1220;
      highp vec3 _upLeg0L_1221;
      highp vec3 _upHead_1222;
      highp vec3 _upNeck_1223;
      highp vec3 _upChest_1224;
      highp vec3 _upWaist_1225;
      highp vec3 _upPelvis_1226;
      float tmpvar_1227;
      tmpvar_1227 = (iTime * 4.0);
      highp int tmpvar_1228;
      tmpvar_1228 = ((int(tmpvar_1227)% 4));
      highp int tmpvar_1229;
      tmpvar_1229 = ((int((tmpvar_1227 / 4.0))% 2));
      highp int _uidx1_1230;
      highp int tmpvar_1231;
      if ((tmpvar_1229 == 0)) {
        tmpvar_1231 = 1;
      } else {
        tmpvar_1231 = -1;
      };
      float tmpvar_1232;
      tmpvar_1232 = fract((iTime * 4.0));
      highp int tmpvar_1233;
      tmpvar_1233 = (tmpvar_1228 - 1);
      highp int tmpvar_1234;
      if ((tmpvar_1231 >= 0)) {
        tmpvar_1234 = 0;
      } else {
        tmpvar_1234 = 1;
      };
      highp int tmpvar_1235;
      tmpvar_1235 = (10 + tmpvar_1234);
      _uidx1_1230 = tmpvar_1235;
      if ((tmpvar_1233 < 0)) {
        highp int tmpvar_1236;
        if ((tmpvar_1231 >= 0)) {
          tmpvar_1236 = 1;
        } else {
          tmpvar_1236 = 0;
        };
        _uidx1_1230 = (10 + tmpvar_1236);
      };
      highp int tmpvar_1237;
      if ((tmpvar_1233 < 0)) {
        tmpvar_1237 = 3;
      } else {
        tmpvar_1237 = tmpvar_1233;
      };
      float tmpvar_1238;
      tmpvar_1238 = ((mix (
        vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (float(_uidx1_1230), 0.0, 11.0))][int(clamp (float(tmpvar_1237), 0.0, 3.0))]
      , 
        vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (float(tmpvar_1235), 0.0, 11.0))][int(clamp (float(tmpvar_1228), 0.0, 3.0))]
      , tmpvar_1232) * 3.141593) / 180.0);
      highp int _uidx1_1239;
      highp int tmpvar_1240;
      if ((tmpvar_1229 == 0)) {
        tmpvar_1240 = 1;
      } else {
        tmpvar_1240 = -1;
      };
      float tmpvar_1241;
      tmpvar_1241 = fract((iTime * 4.0));
      highp int tmpvar_1242;
      tmpvar_1242 = (tmpvar_1228 - 1);
      highp int tmpvar_1243;
      if ((tmpvar_1240 >= 0)) {
        tmpvar_1243 = 0;
      } else {
        tmpvar_1243 = 1;
      };
      _uidx1_1239 = tmpvar_1243;
      if ((tmpvar_1242 < 0)) {
        highp int tmpvar_1244;
        if ((tmpvar_1240 >= 0)) {
          tmpvar_1244 = 1;
        } else {
          tmpvar_1244 = 0;
        };
        _uidx1_1239 = tmpvar_1244;
      };
      highp int tmpvar_1245;
      if ((tmpvar_1242 < 0)) {
        tmpvar_1245 = 3;
      } else {
        tmpvar_1245 = tmpvar_1242;
      };
      vec3 tmpvar_1246;
      tmpvar_1246.xz = vec2(0.0, 0.0);
      tmpvar_1246.y = (-0.5 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[
        int(clamp (float(_uidx1_1239), 0.0, 11.0))
      ][
        int(clamp (float(tmpvar_1245), 0.0, 3.0))
      ], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[
        int(clamp (float(tmpvar_1243), 0.0, 11.0))
      ][
        int(clamp (float(tmpvar_1228), 0.0, 3.0))
      ], tmpvar_1241));
      highp vec3 tmpvar_1247;
      tmpvar_1247 = (_up_810 + tmpvar_1246);
      _upPelvis_1226.z = tmpvar_1247.z;
      mat2 tmpvar_1248;
      tmpvar_1248[uint(0)].x = cos(tmpvar_1238);
      tmpvar_1248[uint(0)].y = sin(tmpvar_1238);
      tmpvar_1248[1u].x = -(sin(tmpvar_1238));
      tmpvar_1248[1u].y = cos(tmpvar_1238);
      _upPelvis_1226.xy = (tmpvar_1247.xy * tmpvar_1248);
      highp vec3 tmpvar_1249;
      tmpvar_1249 = (abs((_upPelvis_1226 - vec3(0.0, 0.0, 0.025))) - vec3(0.085, 0.05, 0.05));
      highp vec3 tmpvar_1250;
      tmpvar_1250 = max (tmpvar_1249, 0.0);
      highp vec3 tmpvar_1251;
      tmpvar_1251 = (_upPelvis_1226 + vec3(0.0, -0.05, -0.02));
      _upWaist_1225.z = tmpvar_1251.z;
      mat2 tmpvar_1252;
      tmpvar_1252[uint(0)].x = cos(-(tmpvar_1238));
      tmpvar_1252[uint(0)].y = sin(-(tmpvar_1238));
      tmpvar_1252[1u].x = -(sin(-(tmpvar_1238)));
      tmpvar_1252[1u].y = cos(-(tmpvar_1238));
      _upWaist_1225.xy = (tmpvar_1251.xy * tmpvar_1252);
      _upWaist_1225.yz = (_upWaist_1225.yz * mat2(1.0, 0.0, -0.0, 1.0));
      highp vec3 tmpvar_1253;
      tmpvar_1253 = (abs((_upWaist_1225 - vec3(0.0, 0.04, 0.0))) - vec3(0.075, 0.08, 0.03));
      highp vec3 tmpvar_1254;
      tmpvar_1254 = max (tmpvar_1253, 0.0);
      highp vec3 tmpvar_1255;
      tmpvar_1255 = (_upWaist_1225 + vec3(0.0, -0.14, -0.01));
      _upChest_1224.x = tmpvar_1255.x;
      _upChest_1224.yz = (tmpvar_1255.yz * mat2(1.0, 0.0, -0.0, 1.0));
      highp vec3 tmpvar_1256;
      tmpvar_1256 = (abs((_upChest_1224 - vec3(0.0, 0.04, 0.0))) - vec3(0.09, 0.08, 0.05));
      highp vec3 tmpvar_1257;
      tmpvar_1257 = max (tmpvar_1256, 0.0);
      highp vec3 tmpvar_1258;
      tmpvar_1258 = (_upChest_1224 + vec3(0.0, -0.15, 0.0));
      _upNeck_1223.x = tmpvar_1258.x;
      _upNeck_1223.yz = (tmpvar_1258.yz * mat2(1.0, 0.0, -0.0, 1.0));
      highp vec3 tmpvar_1259;
      tmpvar_1259 = (abs((_upNeck_1223 - vec3(0.0, 0.01, 0.0))) - vec3(0.02, 0.04, 0.02));
      highp vec3 tmpvar_1260;
      tmpvar_1260 = max (tmpvar_1259, 0.0);
      highp vec3 tmpvar_1261;
      tmpvar_1261 = (_upNeck_1223 + vec3(0.0, -0.1, 0.0));
      _upHead_1222.x = tmpvar_1261.x;
      _upHead_1222.yz = (tmpvar_1261.yz * mat2(1.0, 0.0, -0.0, 1.0));
      highp vec3 tmpvar_1262;
      tmpvar_1262 = (abs((_upHead_1222 - vec3(0.0, 0.04, -0.025))) - vec3(0.05, 0.08, 0.06));
      highp vec3 tmpvar_1263;
      tmpvar_1263 = max (tmpvar_1262, 0.0);
      highp float tmpvar_1264;
      tmpvar_1264 = min (min (min (
        min (min (4.5, (sqrt(
          dot (tmpvar_1250, tmpvar_1250)
        ) + min (
          max (tmpvar_1249.x, max (tmpvar_1249.y, tmpvar_1249.z))
        , 0.0))), (sqrt(dot (tmpvar_1254, tmpvar_1254)) + min (max (tmpvar_1253.x, 
          max (tmpvar_1253.y, tmpvar_1253.z)
        ), 0.0)))
      , 
        (sqrt(dot (tmpvar_1257, tmpvar_1257)) + min (max (tmpvar_1256.x, max (tmpvar_1256.y, tmpvar_1256.z)), 0.0))
      ), (
        sqrt(dot (tmpvar_1260, tmpvar_1260))
       + 
        min (max (tmpvar_1259.x, max (tmpvar_1259.y, tmpvar_1259.z)), 0.0)
      )), (sqrt(
        dot (tmpvar_1263, tmpvar_1263)
      ) + min (
        max (tmpvar_1262.x, max (tmpvar_1262.y, tmpvar_1262.z))
      , 0.0)));
      highp vec3 tmpvar_1265;
      tmpvar_1265 = (_upPelvis_1226 + vec3(0.06, 0.025, 0.0));
      _upLeg0L_1221.z = tmpvar_1265.z;
      mat2 tmpvar_1266;
      tmpvar_1266[uint(0)].x = cos(-(tmpvar_1238));
      tmpvar_1266[uint(0)].y = sin(-(tmpvar_1238));
      tmpvar_1266[1u].x = -(sin(-(tmpvar_1238)));
      tmpvar_1266[1u].y = cos(-(tmpvar_1238));
      _upLeg0L_1221.xy = (tmpvar_1265.xy * tmpvar_1266);
      highp int _uidx1_1267;
      highp int tmpvar_1268;
      if ((tmpvar_1229 == 0)) {
        tmpvar_1268 = 1;
      } else {
        tmpvar_1268 = -1;
      };
      float tmpvar_1269;
      tmpvar_1269 = fract((iTime * 4.0));
      highp int tmpvar_1270;
      tmpvar_1270 = (tmpvar_1228 - 1);
      highp int tmpvar_1271;
      if ((tmpvar_1268 >= 0)) {
        tmpvar_1271 = 0;
      } else {
        tmpvar_1271 = 1;
      };
      highp int tmpvar_1272;
      tmpvar_1272 = (2 + tmpvar_1271);
      _uidx1_1267 = tmpvar_1272;
      if ((tmpvar_1270 < 0)) {
        highp int tmpvar_1273;
        if ((tmpvar_1268 >= 0)) {
          tmpvar_1273 = 1;
        } else {
          tmpvar_1273 = 0;
        };
        _uidx1_1267 = (2 + tmpvar_1273);
      };
      highp int tmpvar_1274;
      if ((tmpvar_1270 < 0)) {
        tmpvar_1274 = 3;
      } else {
        tmpvar_1274 = tmpvar_1270;
      };
      float tmpvar_1275;
      tmpvar_1275 = cos(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_1267), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_1274), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_1272), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_1228), 0.0, 3.0)
        )], tmpvar_1269))
       * 3.141593) / 180.0));
      highp int _uidx1_1276;
      highp int tmpvar_1277;
      if ((tmpvar_1229 == 0)) {
        tmpvar_1277 = 1;
      } else {
        tmpvar_1277 = -1;
      };
      float tmpvar_1278;
      tmpvar_1278 = fract((iTime * 4.0));
      highp int tmpvar_1279;
      tmpvar_1279 = (tmpvar_1228 - 1);
      highp int tmpvar_1280;
      if ((tmpvar_1277 >= 0)) {
        tmpvar_1280 = 0;
      } else {
        tmpvar_1280 = 1;
      };
      highp int tmpvar_1281;
      tmpvar_1281 = (2 + tmpvar_1280);
      _uidx1_1276 = tmpvar_1281;
      if ((tmpvar_1279 < 0)) {
        highp int tmpvar_1282;
        if ((tmpvar_1277 >= 0)) {
          tmpvar_1282 = 1;
        } else {
          tmpvar_1282 = 0;
        };
        _uidx1_1276 = (2 + tmpvar_1282);
      };
      highp int tmpvar_1283;
      if ((tmpvar_1279 < 0)) {
        tmpvar_1283 = 3;
      } else {
        tmpvar_1283 = tmpvar_1279;
      };
      float tmpvar_1284;
      tmpvar_1284 = sin(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_1276), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_1283), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_1281), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_1228), 0.0, 3.0)
        )], tmpvar_1278))
       * 3.141593) / 180.0));
      highp int _uidx1_1285;
      highp int tmpvar_1286;
      if ((tmpvar_1229 == 0)) {
        tmpvar_1286 = 1;
      } else {
        tmpvar_1286 = -1;
      };
      float tmpvar_1287;
      tmpvar_1287 = fract((iTime * 4.0));
      highp int tmpvar_1288;
      tmpvar_1288 = (tmpvar_1228 - 1);
      highp int tmpvar_1289;
      if ((tmpvar_1286 >= 0)) {
        tmpvar_1289 = 0;
      } else {
        tmpvar_1289 = 1;
      };
      highp int tmpvar_1290;
      tmpvar_1290 = (2 + tmpvar_1289);
      _uidx1_1285 = tmpvar_1290;
      if ((tmpvar_1288 < 0)) {
        highp int tmpvar_1291;
        if ((tmpvar_1286 >= 0)) {
          tmpvar_1291 = 1;
        } else {
          tmpvar_1291 = 0;
        };
        _uidx1_1285 = (2 + tmpvar_1291);
      };
      highp int tmpvar_1292;
      if ((tmpvar_1288 < 0)) {
        tmpvar_1292 = 3;
      } else {
        tmpvar_1292 = tmpvar_1288;
      };
      float tmpvar_1293;
      tmpvar_1293 = sin(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_1285), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_1292), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_1290), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_1228), 0.0, 3.0)
        )], tmpvar_1287))
       * 3.141593) / 180.0));
      highp int _uidx1_1294;
      highp int tmpvar_1295;
      if ((tmpvar_1229 == 0)) {
        tmpvar_1295 = 1;
      } else {
        tmpvar_1295 = -1;
      };
      float tmpvar_1296;
      tmpvar_1296 = fract((iTime * 4.0));
      highp int tmpvar_1297;
      tmpvar_1297 = (tmpvar_1228 - 1);
      highp int tmpvar_1298;
      if ((tmpvar_1295 >= 0)) {
        tmpvar_1298 = 0;
      } else {
        tmpvar_1298 = 1;
      };
      highp int tmpvar_1299;
      tmpvar_1299 = (2 + tmpvar_1298);
      _uidx1_1294 = tmpvar_1299;
      if ((tmpvar_1297 < 0)) {
        highp int tmpvar_1300;
        if ((tmpvar_1295 >= 0)) {
          tmpvar_1300 = 1;
        } else {
          tmpvar_1300 = 0;
        };
        _uidx1_1294 = (2 + tmpvar_1300);
      };
      highp int tmpvar_1301;
      if ((tmpvar_1297 < 0)) {
        tmpvar_1301 = 3;
      } else {
        tmpvar_1301 = tmpvar_1297;
      };
      mat2 tmpvar_1302;
      tmpvar_1302[uint(0)].x = tmpvar_1275;
      tmpvar_1302[uint(0)].y = tmpvar_1284;
      tmpvar_1302[1u].x = -(tmpvar_1293);
      tmpvar_1302[1u].y = cos(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_1294), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_1301), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_1299), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_1228), 0.0, 3.0)
        )], tmpvar_1296))
       * 3.141593) / 180.0));
      _upLeg0L_1221.yz = (_upLeg0L_1221.yz * tmpvar_1302);
      highp vec3 tmpvar_1303;
      tmpvar_1303 = (abs((_upLeg0L_1221 - vec3(0.0, 0.1, 0.0))) - vec3(0.025, 0.1, 0.025));
      highp vec3 tmpvar_1304;
      tmpvar_1304 = max (tmpvar_1303, 0.0);
      highp float tmpvar_1305;
      tmpvar_1305 = min (tmpvar_1264, (sqrt(
        dot (tmpvar_1304, tmpvar_1304)
      ) + min (
        max (tmpvar_1303.x, max (tmpvar_1303.y, tmpvar_1303.z))
      , 0.0)));
      highp vec3 tmpvar_1306;
      tmpvar_1306 = (_upLeg0L_1221 + vec3(0.01, -0.18, 0.02));
      _upLeg1L_1220 = tmpvar_1306;
      highp int _uidx1_1307;
      highp int tmpvar_1308;
      if ((tmpvar_1229 == 0)) {
        tmpvar_1308 = 1;
      } else {
        tmpvar_1308 = -1;
      };
      float tmpvar_1309;
      tmpvar_1309 = fract((iTime * 4.0));
      highp int tmpvar_1310;
      tmpvar_1310 = (tmpvar_1228 - 1);
      highp int tmpvar_1311;
      if ((tmpvar_1308 >= 0)) {
        tmpvar_1311 = 0;
      } else {
        tmpvar_1311 = 1;
      };
      highp int tmpvar_1312;
      tmpvar_1312 = (4 + tmpvar_1311);
      _uidx1_1307 = tmpvar_1312;
      if ((tmpvar_1310 < 0)) {
        highp int tmpvar_1313;
        if ((tmpvar_1308 >= 0)) {
          tmpvar_1313 = 1;
        } else {
          tmpvar_1313 = 0;
        };
        _uidx1_1307 = (4 + tmpvar_1313);
      };
      highp int tmpvar_1314;
      if ((tmpvar_1310 < 0)) {
        tmpvar_1314 = 3;
      } else {
        tmpvar_1314 = tmpvar_1310;
      };
      float tmpvar_1315;
      tmpvar_1315 = cos(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_1307)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_1314)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_1312)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_1228)
        , 0.0, 3.0))], tmpvar_1309)
       * 3.141593) / 180.0));
      highp int _uidx1_1316;
      highp int tmpvar_1317;
      if ((tmpvar_1229 == 0)) {
        tmpvar_1317 = 1;
      } else {
        tmpvar_1317 = -1;
      };
      float tmpvar_1318;
      tmpvar_1318 = fract((iTime * 4.0));
      highp int tmpvar_1319;
      tmpvar_1319 = (tmpvar_1228 - 1);
      highp int tmpvar_1320;
      if ((tmpvar_1317 >= 0)) {
        tmpvar_1320 = 0;
      } else {
        tmpvar_1320 = 1;
      };
      highp int tmpvar_1321;
      tmpvar_1321 = (4 + tmpvar_1320);
      _uidx1_1316 = tmpvar_1321;
      if ((tmpvar_1319 < 0)) {
        highp int tmpvar_1322;
        if ((tmpvar_1317 >= 0)) {
          tmpvar_1322 = 1;
        } else {
          tmpvar_1322 = 0;
        };
        _uidx1_1316 = (4 + tmpvar_1322);
      };
      highp int tmpvar_1323;
      if ((tmpvar_1319 < 0)) {
        tmpvar_1323 = 3;
      } else {
        tmpvar_1323 = tmpvar_1319;
      };
      float tmpvar_1324;
      tmpvar_1324 = sin(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_1316)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_1323)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_1321)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_1228)
        , 0.0, 3.0))], tmpvar_1318)
       * 3.141593) / 180.0));
      highp int _uidx1_1325;
      highp int tmpvar_1326;
      if ((tmpvar_1229 == 0)) {
        tmpvar_1326 = 1;
      } else {
        tmpvar_1326 = -1;
      };
      float tmpvar_1327;
      tmpvar_1327 = fract((iTime * 4.0));
      highp int tmpvar_1328;
      tmpvar_1328 = (tmpvar_1228 - 1);
      highp int tmpvar_1329;
      if ((tmpvar_1326 >= 0)) {
        tmpvar_1329 = 0;
      } else {
        tmpvar_1329 = 1;
      };
      highp int tmpvar_1330;
      tmpvar_1330 = (4 + tmpvar_1329);
      _uidx1_1325 = tmpvar_1330;
      if ((tmpvar_1328 < 0)) {
        highp int tmpvar_1331;
        if ((tmpvar_1326 >= 0)) {
          tmpvar_1331 = 1;
        } else {
          tmpvar_1331 = 0;
        };
        _uidx1_1325 = (4 + tmpvar_1331);
      };
      highp int tmpvar_1332;
      if ((tmpvar_1328 < 0)) {
        tmpvar_1332 = 3;
      } else {
        tmpvar_1332 = tmpvar_1328;
      };
      float tmpvar_1333;
      tmpvar_1333 = sin(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_1325)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_1332)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_1330)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_1228)
        , 0.0, 3.0))], tmpvar_1327)
       * 3.141593) / 180.0));
      highp int _uidx1_1334;
      highp int tmpvar_1335;
      if ((tmpvar_1229 == 0)) {
        tmpvar_1335 = 1;
      } else {
        tmpvar_1335 = -1;
      };
      float tmpvar_1336;
      tmpvar_1336 = fract((iTime * 4.0));
      highp int tmpvar_1337;
      tmpvar_1337 = (tmpvar_1228 - 1);
      highp int tmpvar_1338;
      if ((tmpvar_1335 >= 0)) {
        tmpvar_1338 = 0;
      } else {
        tmpvar_1338 = 1;
      };
      highp int tmpvar_1339;
      tmpvar_1339 = (4 + tmpvar_1338);
      _uidx1_1334 = tmpvar_1339;
      if ((tmpvar_1337 < 0)) {
        highp int tmpvar_1340;
        if ((tmpvar_1335 >= 0)) {
          tmpvar_1340 = 1;
        } else {
          tmpvar_1340 = 0;
        };
        _uidx1_1334 = (4 + tmpvar_1340);
      };
      highp int tmpvar_1341;
      if ((tmpvar_1337 < 0)) {
        tmpvar_1341 = 3;
      } else {
        tmpvar_1341 = tmpvar_1337;
      };
      mat2 tmpvar_1342;
      tmpvar_1342[uint(0)].x = tmpvar_1315;
      tmpvar_1342[uint(0)].y = tmpvar_1324;
      tmpvar_1342[1u].x = -(tmpvar_1333);
      tmpvar_1342[1u].y = cos(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_1334)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_1341)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_1339)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_1228)
        , 0.0, 3.0))], tmpvar_1336)
       * 3.141593) / 180.0));
      _upLeg1L_1220.yz = (tmpvar_1306.yz * tmpvar_1342);
      highp vec3 tmpvar_1343;
      tmpvar_1343 = (abs((_upLeg1L_1220 - vec3(0.0, 0.1, 0.0))) - vec3(0.025, 0.1, 0.025));
      highp vec3 tmpvar_1344;
      tmpvar_1344 = max (tmpvar_1343, 0.0);
      highp float tmpvar_1345;
      tmpvar_1345 = min (tmpvar_1305, (sqrt(
        dot (tmpvar_1344, tmpvar_1344)
      ) + min (
        max (tmpvar_1343.x, max (tmpvar_1343.y, tmpvar_1343.z))
      , 0.0)));
      highp vec3 tmpvar_1346;
      tmpvar_1346 = (_upPelvis_1226 + vec3(-0.06, 0.025, 0.0));
      _upLeg0R_1219.z = tmpvar_1346.z;
      mat2 tmpvar_1347;
      tmpvar_1347[uint(0)].x = cos(-(tmpvar_1238));
      tmpvar_1347[uint(0)].y = sin(-(tmpvar_1238));
      tmpvar_1347[1u].x = -(sin(-(tmpvar_1238)));
      tmpvar_1347[1u].y = cos(-(tmpvar_1238));
      _upLeg0R_1219.xy = (tmpvar_1346.xy * tmpvar_1347);
      highp int _us_1348;
      _us_1348 = -1;
      highp int _uidx1_1349;
      highp int tmpvar_1350;
      if ((tmpvar_1229 == 0)) {
        tmpvar_1350 = 1;
      } else {
        tmpvar_1350 = -1;
      };
      _us_1348 = -(tmpvar_1350);
      float tmpvar_1351;
      tmpvar_1351 = fract((iTime * 4.0));
      highp int tmpvar_1352;
      tmpvar_1352 = (tmpvar_1228 - 1);
      highp int tmpvar_1353;
      if ((_us_1348 >= 0)) {
        tmpvar_1353 = 0;
      } else {
        tmpvar_1353 = 1;
      };
      highp int tmpvar_1354;
      tmpvar_1354 = (2 + tmpvar_1353);
      _uidx1_1349 = tmpvar_1354;
      if ((tmpvar_1352 < 0)) {
        highp int tmpvar_1355;
        if ((_us_1348 >= 0)) {
          tmpvar_1355 = 1;
        } else {
          tmpvar_1355 = 0;
        };
        _uidx1_1349 = (2 + tmpvar_1355);
      };
      highp int tmpvar_1356;
      if ((tmpvar_1352 < 0)) {
        tmpvar_1356 = 3;
      } else {
        tmpvar_1356 = tmpvar_1352;
      };
      float tmpvar_1357;
      tmpvar_1357 = cos(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_1349), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_1356), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_1354), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_1228), 0.0, 3.0)
        )], tmpvar_1351))
       * 3.141593) / 180.0));
      highp int _us_1358;
      _us_1358 = -1;
      highp int _uidx1_1359;
      highp int tmpvar_1360;
      if ((tmpvar_1229 == 0)) {
        tmpvar_1360 = 1;
      } else {
        tmpvar_1360 = -1;
      };
      _us_1358 = -(tmpvar_1360);
      float tmpvar_1361;
      tmpvar_1361 = fract((iTime * 4.0));
      highp int tmpvar_1362;
      tmpvar_1362 = (tmpvar_1228 - 1);
      highp int tmpvar_1363;
      if ((_us_1358 >= 0)) {
        tmpvar_1363 = 0;
      } else {
        tmpvar_1363 = 1;
      };
      highp int tmpvar_1364;
      tmpvar_1364 = (2 + tmpvar_1363);
      _uidx1_1359 = tmpvar_1364;
      if ((tmpvar_1362 < 0)) {
        highp int tmpvar_1365;
        if ((_us_1358 >= 0)) {
          tmpvar_1365 = 1;
        } else {
          tmpvar_1365 = 0;
        };
        _uidx1_1359 = (2 + tmpvar_1365);
      };
      highp int tmpvar_1366;
      if ((tmpvar_1362 < 0)) {
        tmpvar_1366 = 3;
      } else {
        tmpvar_1366 = tmpvar_1362;
      };
      float tmpvar_1367;
      tmpvar_1367 = sin(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_1359), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_1366), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_1364), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_1228), 0.0, 3.0)
        )], tmpvar_1361))
       * 3.141593) / 180.0));
      highp int _us_1368;
      _us_1368 = -1;
      highp int _uidx1_1369;
      highp int tmpvar_1370;
      if ((tmpvar_1229 == 0)) {
        tmpvar_1370 = 1;
      } else {
        tmpvar_1370 = -1;
      };
      _us_1368 = -(tmpvar_1370);
      float tmpvar_1371;
      tmpvar_1371 = fract((iTime * 4.0));
      highp int tmpvar_1372;
      tmpvar_1372 = (tmpvar_1228 - 1);
      highp int tmpvar_1373;
      if ((_us_1368 >= 0)) {
        tmpvar_1373 = 0;
      } else {
        tmpvar_1373 = 1;
      };
      highp int tmpvar_1374;
      tmpvar_1374 = (2 + tmpvar_1373);
      _uidx1_1369 = tmpvar_1374;
      if ((tmpvar_1372 < 0)) {
        highp int tmpvar_1375;
        if ((_us_1368 >= 0)) {
          tmpvar_1375 = 1;
        } else {
          tmpvar_1375 = 0;
        };
        _uidx1_1369 = (2 + tmpvar_1375);
      };
      highp int tmpvar_1376;
      if ((tmpvar_1372 < 0)) {
        tmpvar_1376 = 3;
      } else {
        tmpvar_1376 = tmpvar_1372;
      };
      float tmpvar_1377;
      tmpvar_1377 = sin(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_1369), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_1376), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_1374), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_1228), 0.0, 3.0)
        )], tmpvar_1371))
       * 3.141593) / 180.0));
      highp int _us_1378;
      _us_1378 = -1;
      highp int _uidx1_1379;
      highp int tmpvar_1380;
      if ((tmpvar_1229 == 0)) {
        tmpvar_1380 = 1;
      } else {
        tmpvar_1380 = -1;
      };
      _us_1378 = -(tmpvar_1380);
      float tmpvar_1381;
      tmpvar_1381 = fract((iTime * 4.0));
      highp int tmpvar_1382;
      tmpvar_1382 = (tmpvar_1228 - 1);
      highp int tmpvar_1383;
      if ((_us_1378 >= 0)) {
        tmpvar_1383 = 0;
      } else {
        tmpvar_1383 = 1;
      };
      highp int tmpvar_1384;
      tmpvar_1384 = (2 + tmpvar_1383);
      _uidx1_1379 = tmpvar_1384;
      if ((tmpvar_1382 < 0)) {
        highp int tmpvar_1385;
        if ((_us_1378 >= 0)) {
          tmpvar_1385 = 1;
        } else {
          tmpvar_1385 = 0;
        };
        _uidx1_1379 = (2 + tmpvar_1385);
      };
      highp int tmpvar_1386;
      if ((tmpvar_1382 < 0)) {
        tmpvar_1386 = 3;
      } else {
        tmpvar_1386 = tmpvar_1382;
      };
      mat2 tmpvar_1387;
      tmpvar_1387[uint(0)].x = tmpvar_1357;
      tmpvar_1387[uint(0)].y = tmpvar_1367;
      tmpvar_1387[1u].x = -(tmpvar_1377);
      tmpvar_1387[1u].y = cos(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_1379), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_1386), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_1384), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_1228), 0.0, 3.0)
        )], tmpvar_1381))
       * 3.141593) / 180.0));
      _upLeg0R_1219.yz = (_upLeg0R_1219.yz * tmpvar_1387);
      highp vec3 tmpvar_1388;
      tmpvar_1388 = (abs((_upLeg0R_1219 - vec3(0.0, 0.1, 0.0))) - vec3(0.025, 0.1, 0.025));
      highp vec3 tmpvar_1389;
      tmpvar_1389 = max (tmpvar_1388, 0.0);
      highp float tmpvar_1390;
      tmpvar_1390 = min (tmpvar_1345, (sqrt(
        dot (tmpvar_1389, tmpvar_1389)
      ) + min (
        max (tmpvar_1388.x, max (tmpvar_1388.y, tmpvar_1388.z))
      , 0.0)));
      highp vec3 tmpvar_1391;
      tmpvar_1391 = (_upLeg0R_1219 + vec3(-0.01, -0.18, 0.02));
      _upLeg1R_1218 = tmpvar_1391;
      highp int _us_1392;
      _us_1392 = -1;
      highp int _uidx1_1393;
      highp int tmpvar_1394;
      if ((tmpvar_1229 == 0)) {
        tmpvar_1394 = 1;
      } else {
        tmpvar_1394 = -1;
      };
      _us_1392 = -(tmpvar_1394);
      float tmpvar_1395;
      tmpvar_1395 = fract((iTime * 4.0));
      highp int tmpvar_1396;
      tmpvar_1396 = (tmpvar_1228 - 1);
      highp int tmpvar_1397;
      if ((_us_1392 >= 0)) {
        tmpvar_1397 = 0;
      } else {
        tmpvar_1397 = 1;
      };
      highp int tmpvar_1398;
      tmpvar_1398 = (4 + tmpvar_1397);
      _uidx1_1393 = tmpvar_1398;
      if ((tmpvar_1396 < 0)) {
        highp int tmpvar_1399;
        if ((_us_1392 >= 0)) {
          tmpvar_1399 = 1;
        } else {
          tmpvar_1399 = 0;
        };
        _uidx1_1393 = (4 + tmpvar_1399);
      };
      highp int tmpvar_1400;
      if ((tmpvar_1396 < 0)) {
        tmpvar_1400 = 3;
      } else {
        tmpvar_1400 = tmpvar_1396;
      };
      float tmpvar_1401;
      tmpvar_1401 = cos(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_1393)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_1400)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_1398)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_1228)
        , 0.0, 3.0))], tmpvar_1395)
       * 3.141593) / 180.0));
      highp int _us_1402;
      _us_1402 = -1;
      highp int _uidx1_1403;
      highp int tmpvar_1404;
      if ((tmpvar_1229 == 0)) {
        tmpvar_1404 = 1;
      } else {
        tmpvar_1404 = -1;
      };
      _us_1402 = -(tmpvar_1404);
      float tmpvar_1405;
      tmpvar_1405 = fract((iTime * 4.0));
      highp int tmpvar_1406;
      tmpvar_1406 = (tmpvar_1228 - 1);
      highp int tmpvar_1407;
      if ((_us_1402 >= 0)) {
        tmpvar_1407 = 0;
      } else {
        tmpvar_1407 = 1;
      };
      highp int tmpvar_1408;
      tmpvar_1408 = (4 + tmpvar_1407);
      _uidx1_1403 = tmpvar_1408;
      if ((tmpvar_1406 < 0)) {
        highp int tmpvar_1409;
        if ((_us_1402 >= 0)) {
          tmpvar_1409 = 1;
        } else {
          tmpvar_1409 = 0;
        };
        _uidx1_1403 = (4 + tmpvar_1409);
      };
      highp int tmpvar_1410;
      if ((tmpvar_1406 < 0)) {
        tmpvar_1410 = 3;
      } else {
        tmpvar_1410 = tmpvar_1406;
      };
      float tmpvar_1411;
      tmpvar_1411 = sin(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_1403)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_1410)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_1408)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_1228)
        , 0.0, 3.0))], tmpvar_1405)
       * 3.141593) / 180.0));
      highp int _us_1412;
      _us_1412 = -1;
      highp int _uidx1_1413;
      highp int tmpvar_1414;
      if ((tmpvar_1229 == 0)) {
        tmpvar_1414 = 1;
      } else {
        tmpvar_1414 = -1;
      };
      _us_1412 = -(tmpvar_1414);
      float tmpvar_1415;
      tmpvar_1415 = fract((iTime * 4.0));
      highp int tmpvar_1416;
      tmpvar_1416 = (tmpvar_1228 - 1);
      highp int tmpvar_1417;
      if ((_us_1412 >= 0)) {
        tmpvar_1417 = 0;
      } else {
        tmpvar_1417 = 1;
      };
      highp int tmpvar_1418;
      tmpvar_1418 = (4 + tmpvar_1417);
      _uidx1_1413 = tmpvar_1418;
      if ((tmpvar_1416 < 0)) {
        highp int tmpvar_1419;
        if ((_us_1412 >= 0)) {
          tmpvar_1419 = 1;
        } else {
          tmpvar_1419 = 0;
        };
        _uidx1_1413 = (4 + tmpvar_1419);
      };
      highp int tmpvar_1420;
      if ((tmpvar_1416 < 0)) {
        tmpvar_1420 = 3;
      } else {
        tmpvar_1420 = tmpvar_1416;
      };
      float tmpvar_1421;
      tmpvar_1421 = sin(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_1413)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_1420)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_1418)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_1228)
        , 0.0, 3.0))], tmpvar_1415)
       * 3.141593) / 180.0));
      highp int _us_1422;
      _us_1422 = -1;
      highp int _uidx1_1423;
      highp int tmpvar_1424;
      if ((tmpvar_1229 == 0)) {
        tmpvar_1424 = 1;
      } else {
        tmpvar_1424 = -1;
      };
      _us_1422 = -(tmpvar_1424);
      float tmpvar_1425;
      tmpvar_1425 = fract((iTime * 4.0));
      highp int tmpvar_1426;
      tmpvar_1426 = (tmpvar_1228 - 1);
      highp int tmpvar_1427;
      if ((_us_1422 >= 0)) {
        tmpvar_1427 = 0;
      } else {
        tmpvar_1427 = 1;
      };
      highp int tmpvar_1428;
      tmpvar_1428 = (4 + tmpvar_1427);
      _uidx1_1423 = tmpvar_1428;
      if ((tmpvar_1426 < 0)) {
        highp int tmpvar_1429;
        if ((_us_1422 >= 0)) {
          tmpvar_1429 = 1;
        } else {
          tmpvar_1429 = 0;
        };
        _uidx1_1423 = (4 + tmpvar_1429);
      };
      highp int tmpvar_1430;
      if ((tmpvar_1426 < 0)) {
        tmpvar_1430 = 3;
      } else {
        tmpvar_1430 = tmpvar_1426;
      };
      mat2 tmpvar_1431;
      tmpvar_1431[uint(0)].x = tmpvar_1401;
      tmpvar_1431[uint(0)].y = tmpvar_1411;
      tmpvar_1431[1u].x = -(tmpvar_1421);
      tmpvar_1431[1u].y = cos(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_1423)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_1430)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_1428)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_1228)
        , 0.0, 3.0))], tmpvar_1425)
       * 3.141593) / 180.0));
      _upLeg1R_1218.yz = (tmpvar_1391.yz * tmpvar_1431);
      highp vec3 tmpvar_1432;
      tmpvar_1432 = (abs((_upLeg1R_1218 - vec3(0.0, 0.1, 0.0))) - vec3(0.025, 0.1, 0.025));
      highp vec3 tmpvar_1433;
      tmpvar_1433 = max (tmpvar_1432, 0.0);
      highp float tmpvar_1434;
      tmpvar_1434 = min (tmpvar_1390, (sqrt(
        dot (tmpvar_1433, tmpvar_1433)
      ) + min (
        max (tmpvar_1432.x, max (tmpvar_1432.y, tmpvar_1432.z))
      , 0.0)));
      highp vec3 tmpvar_1435;
      tmpvar_1435 = (_upChest_1224 + vec3(0.125, -0.1, 0.0));
      _upArm0L_1217 = tmpvar_1435;
      highp int _uidx1_1436;
      highp int tmpvar_1437;
      if ((tmpvar_1229 == 0)) {
        tmpvar_1437 = 1;
      } else {
        tmpvar_1437 = -1;
      };
      float tmpvar_1438;
      tmpvar_1438 = fract((iTime * 4.0));
      highp int tmpvar_1439;
      tmpvar_1439 = (tmpvar_1228 - 1);
      highp int tmpvar_1440;
      if ((tmpvar_1437 >= 0)) {
        tmpvar_1440 = 0;
      } else {
        tmpvar_1440 = 1;
      };
      highp int tmpvar_1441;
      tmpvar_1441 = (6 + tmpvar_1440);
      _uidx1_1436 = tmpvar_1441;
      if ((tmpvar_1439 < 0)) {
        highp int tmpvar_1442;
        if ((tmpvar_1437 >= 0)) {
          tmpvar_1442 = 1;
        } else {
          tmpvar_1442 = 0;
        };
        _uidx1_1436 = (6 + tmpvar_1442);
      };
      highp int tmpvar_1443;
      if ((tmpvar_1439 < 0)) {
        tmpvar_1443 = 3;
      } else {
        tmpvar_1443 = tmpvar_1439;
      };
      float tmpvar_1444;
      tmpvar_1444 = cos(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_1436), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_1443), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_1441), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_1228), 0.0, 3.0)
        )], tmpvar_1438))
       * 3.141593) / 180.0));
      highp int _uidx1_1445;
      highp int tmpvar_1446;
      if ((tmpvar_1229 == 0)) {
        tmpvar_1446 = 1;
      } else {
        tmpvar_1446 = -1;
      };
      float tmpvar_1447;
      tmpvar_1447 = fract((iTime * 4.0));
      highp int tmpvar_1448;
      tmpvar_1448 = (tmpvar_1228 - 1);
      highp int tmpvar_1449;
      if ((tmpvar_1446 >= 0)) {
        tmpvar_1449 = 0;
      } else {
        tmpvar_1449 = 1;
      };
      highp int tmpvar_1450;
      tmpvar_1450 = (6 + tmpvar_1449);
      _uidx1_1445 = tmpvar_1450;
      if ((tmpvar_1448 < 0)) {
        highp int tmpvar_1451;
        if ((tmpvar_1446 >= 0)) {
          tmpvar_1451 = 1;
        } else {
          tmpvar_1451 = 0;
        };
        _uidx1_1445 = (6 + tmpvar_1451);
      };
      highp int tmpvar_1452;
      if ((tmpvar_1448 < 0)) {
        tmpvar_1452 = 3;
      } else {
        tmpvar_1452 = tmpvar_1448;
      };
      float tmpvar_1453;
      tmpvar_1453 = sin(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_1445), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_1452), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_1450), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_1228), 0.0, 3.0)
        )], tmpvar_1447))
       * 3.141593) / 180.0));
      highp int _uidx1_1454;
      highp int tmpvar_1455;
      if ((tmpvar_1229 == 0)) {
        tmpvar_1455 = 1;
      } else {
        tmpvar_1455 = -1;
      };
      float tmpvar_1456;
      tmpvar_1456 = fract((iTime * 4.0));
      highp int tmpvar_1457;
      tmpvar_1457 = (tmpvar_1228 - 1);
      highp int tmpvar_1458;
      if ((tmpvar_1455 >= 0)) {
        tmpvar_1458 = 0;
      } else {
        tmpvar_1458 = 1;
      };
      highp int tmpvar_1459;
      tmpvar_1459 = (6 + tmpvar_1458);
      _uidx1_1454 = tmpvar_1459;
      if ((tmpvar_1457 < 0)) {
        highp int tmpvar_1460;
        if ((tmpvar_1455 >= 0)) {
          tmpvar_1460 = 1;
        } else {
          tmpvar_1460 = 0;
        };
        _uidx1_1454 = (6 + tmpvar_1460);
      };
      highp int tmpvar_1461;
      if ((tmpvar_1457 < 0)) {
        tmpvar_1461 = 3;
      } else {
        tmpvar_1461 = tmpvar_1457;
      };
      float tmpvar_1462;
      tmpvar_1462 = sin(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_1454), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_1461), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_1459), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_1228), 0.0, 3.0)
        )], tmpvar_1456))
       * 3.141593) / 180.0));
      highp int _uidx1_1463;
      highp int tmpvar_1464;
      if ((tmpvar_1229 == 0)) {
        tmpvar_1464 = 1;
      } else {
        tmpvar_1464 = -1;
      };
      float tmpvar_1465;
      tmpvar_1465 = fract((iTime * 4.0));
      highp int tmpvar_1466;
      tmpvar_1466 = (tmpvar_1228 - 1);
      highp int tmpvar_1467;
      if ((tmpvar_1464 >= 0)) {
        tmpvar_1467 = 0;
      } else {
        tmpvar_1467 = 1;
      };
      highp int tmpvar_1468;
      tmpvar_1468 = (6 + tmpvar_1467);
      _uidx1_1463 = tmpvar_1468;
      if ((tmpvar_1466 < 0)) {
        highp int tmpvar_1469;
        if ((tmpvar_1464 >= 0)) {
          tmpvar_1469 = 1;
        } else {
          tmpvar_1469 = 0;
        };
        _uidx1_1463 = (6 + tmpvar_1469);
      };
      highp int tmpvar_1470;
      if ((tmpvar_1466 < 0)) {
        tmpvar_1470 = 3;
      } else {
        tmpvar_1470 = tmpvar_1466;
      };
      mat2 tmpvar_1471;
      tmpvar_1471[uint(0)].x = tmpvar_1444;
      tmpvar_1471[uint(0)].y = tmpvar_1453;
      tmpvar_1471[1u].x = -(tmpvar_1462);
      tmpvar_1471[1u].y = cos(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_1463), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_1470), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_1468), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_1228), 0.0, 3.0)
        )], tmpvar_1465))
       * 3.141593) / 180.0));
      _upArm0L_1217.yz = (tmpvar_1435.yz * tmpvar_1471);
      highp vec3 tmpvar_1472;
      tmpvar_1472 = (abs((_upArm0L_1217 - vec3(0.0, 0.08, 0.0))) - vec3(0.02, 0.08, 0.02));
      highp vec3 tmpvar_1473;
      tmpvar_1473 = max (tmpvar_1472, 0.0);
      highp float tmpvar_1474;
      tmpvar_1474 = min (tmpvar_1434, (sqrt(
        dot (tmpvar_1473, tmpvar_1473)
      ) + min (
        max (tmpvar_1472.x, max (tmpvar_1472.y, tmpvar_1472.z))
      , 0.0)));
      highp vec3 tmpvar_1475;
      tmpvar_1475 = (_upArm0L_1217 + vec3(0.0, -0.16, 0.0));
      _upArm1L_1216 = tmpvar_1475;
      highp int _uidx1_1476;
      highp int tmpvar_1477;
      if ((tmpvar_1229 == 0)) {
        tmpvar_1477 = 1;
      } else {
        tmpvar_1477 = -1;
      };
      float tmpvar_1478;
      tmpvar_1478 = fract((iTime * 4.0));
      highp int tmpvar_1479;
      tmpvar_1479 = (tmpvar_1228 - 1);
      highp int tmpvar_1480;
      if ((tmpvar_1477 >= 0)) {
        tmpvar_1480 = 0;
      } else {
        tmpvar_1480 = 1;
      };
      highp int tmpvar_1481;
      tmpvar_1481 = (8 + tmpvar_1480);
      _uidx1_1476 = tmpvar_1481;
      if ((tmpvar_1479 < 0)) {
        highp int tmpvar_1482;
        if ((tmpvar_1477 >= 0)) {
          tmpvar_1482 = 1;
        } else {
          tmpvar_1482 = 0;
        };
        _uidx1_1476 = (8 + tmpvar_1482);
      };
      highp int tmpvar_1483;
      if ((tmpvar_1479 < 0)) {
        tmpvar_1483 = 3;
      } else {
        tmpvar_1483 = tmpvar_1479;
      };
      float tmpvar_1484;
      tmpvar_1484 = cos(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_1476)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_1483)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_1481)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_1228)
        , 0.0, 3.0))], tmpvar_1478)
       * 3.141593) / 180.0));
      highp int _uidx1_1485;
      highp int tmpvar_1486;
      if ((tmpvar_1229 == 0)) {
        tmpvar_1486 = 1;
      } else {
        tmpvar_1486 = -1;
      };
      float tmpvar_1487;
      tmpvar_1487 = fract((iTime * 4.0));
      highp int tmpvar_1488;
      tmpvar_1488 = (tmpvar_1228 - 1);
      highp int tmpvar_1489;
      if ((tmpvar_1486 >= 0)) {
        tmpvar_1489 = 0;
      } else {
        tmpvar_1489 = 1;
      };
      highp int tmpvar_1490;
      tmpvar_1490 = (8 + tmpvar_1489);
      _uidx1_1485 = tmpvar_1490;
      if ((tmpvar_1488 < 0)) {
        highp int tmpvar_1491;
        if ((tmpvar_1486 >= 0)) {
          tmpvar_1491 = 1;
        } else {
          tmpvar_1491 = 0;
        };
        _uidx1_1485 = (8 + tmpvar_1491);
      };
      highp int tmpvar_1492;
      if ((tmpvar_1488 < 0)) {
        tmpvar_1492 = 3;
      } else {
        tmpvar_1492 = tmpvar_1488;
      };
      float tmpvar_1493;
      tmpvar_1493 = sin(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_1485)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_1492)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_1490)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_1228)
        , 0.0, 3.0))], tmpvar_1487)
       * 3.141593) / 180.0));
      highp int _uidx1_1494;
      highp int tmpvar_1495;
      if ((tmpvar_1229 == 0)) {
        tmpvar_1495 = 1;
      } else {
        tmpvar_1495 = -1;
      };
      float tmpvar_1496;
      tmpvar_1496 = fract((iTime * 4.0));
      highp int tmpvar_1497;
      tmpvar_1497 = (tmpvar_1228 - 1);
      highp int tmpvar_1498;
      if ((tmpvar_1495 >= 0)) {
        tmpvar_1498 = 0;
      } else {
        tmpvar_1498 = 1;
      };
      highp int tmpvar_1499;
      tmpvar_1499 = (8 + tmpvar_1498);
      _uidx1_1494 = tmpvar_1499;
      if ((tmpvar_1497 < 0)) {
        highp int tmpvar_1500;
        if ((tmpvar_1495 >= 0)) {
          tmpvar_1500 = 1;
        } else {
          tmpvar_1500 = 0;
        };
        _uidx1_1494 = (8 + tmpvar_1500);
      };
      highp int tmpvar_1501;
      if ((tmpvar_1497 < 0)) {
        tmpvar_1501 = 3;
      } else {
        tmpvar_1501 = tmpvar_1497;
      };
      float tmpvar_1502;
      tmpvar_1502 = sin(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_1494)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_1501)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_1499)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_1228)
        , 0.0, 3.0))], tmpvar_1496)
       * 3.141593) / 180.0));
      highp int _uidx1_1503;
      highp int tmpvar_1504;
      if ((tmpvar_1229 == 0)) {
        tmpvar_1504 = 1;
      } else {
        tmpvar_1504 = -1;
      };
      float tmpvar_1505;
      tmpvar_1505 = fract((iTime * 4.0));
      highp int tmpvar_1506;
      tmpvar_1506 = (tmpvar_1228 - 1);
      highp int tmpvar_1507;
      if ((tmpvar_1504 >= 0)) {
        tmpvar_1507 = 0;
      } else {
        tmpvar_1507 = 1;
      };
      highp int tmpvar_1508;
      tmpvar_1508 = (8 + tmpvar_1507);
      _uidx1_1503 = tmpvar_1508;
      if ((tmpvar_1506 < 0)) {
        highp int tmpvar_1509;
        if ((tmpvar_1504 >= 0)) {
          tmpvar_1509 = 1;
        } else {
          tmpvar_1509 = 0;
        };
        _uidx1_1503 = (8 + tmpvar_1509);
      };
      highp int tmpvar_1510;
      if ((tmpvar_1506 < 0)) {
        tmpvar_1510 = 3;
      } else {
        tmpvar_1510 = tmpvar_1506;
      };
      mat2 tmpvar_1511;
      tmpvar_1511[uint(0)].x = tmpvar_1484;
      tmpvar_1511[uint(0)].y = tmpvar_1493;
      tmpvar_1511[1u].x = -(tmpvar_1502);
      tmpvar_1511[1u].y = cos(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_1503)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_1510)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_1508)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_1228)
        , 0.0, 3.0))], tmpvar_1505)
       * 3.141593) / 180.0));
      _upArm1L_1216.yz = (tmpvar_1475.yz * tmpvar_1511);
      highp vec3 tmpvar_1512;
      tmpvar_1512 = (abs((_upArm1L_1216 - vec3(0.0, 0.08, 0.0))) - vec3(0.02, 0.08, 0.02));
      highp vec3 tmpvar_1513;
      tmpvar_1513 = max (tmpvar_1512, 0.0);
      highp float tmpvar_1514;
      tmpvar_1514 = min (tmpvar_1474, (sqrt(
        dot (tmpvar_1513, tmpvar_1513)
      ) + min (
        max (tmpvar_1512.x, max (tmpvar_1512.y, tmpvar_1512.z))
      , 0.0)));
      highp vec3 tmpvar_1515;
      tmpvar_1515 = (_upChest_1224 + vec3(-0.125, -0.1, 0.0));
      _upArm0R_1215 = tmpvar_1515;
      highp int _us_1516;
      _us_1516 = -1;
      highp int _uidx1_1517;
      highp int tmpvar_1518;
      if ((tmpvar_1229 == 0)) {
        tmpvar_1518 = 1;
      } else {
        tmpvar_1518 = -1;
      };
      _us_1516 = -(tmpvar_1518);
      float tmpvar_1519;
      tmpvar_1519 = fract((iTime * 4.0));
      highp int tmpvar_1520;
      tmpvar_1520 = (tmpvar_1228 - 1);
      highp int tmpvar_1521;
      if ((_us_1516 >= 0)) {
        tmpvar_1521 = 0;
      } else {
        tmpvar_1521 = 1;
      };
      highp int tmpvar_1522;
      tmpvar_1522 = (6 + tmpvar_1521);
      _uidx1_1517 = tmpvar_1522;
      if ((tmpvar_1520 < 0)) {
        highp int tmpvar_1523;
        if ((_us_1516 >= 0)) {
          tmpvar_1523 = 1;
        } else {
          tmpvar_1523 = 0;
        };
        _uidx1_1517 = (6 + tmpvar_1523);
      };
      highp int tmpvar_1524;
      if ((tmpvar_1520 < 0)) {
        tmpvar_1524 = 3;
      } else {
        tmpvar_1524 = tmpvar_1520;
      };
      float tmpvar_1525;
      tmpvar_1525 = cos(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_1517), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_1524), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_1522), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_1228), 0.0, 3.0)
        )], tmpvar_1519))
       * 3.141593) / 180.0));
      highp int _us_1526;
      _us_1526 = -1;
      highp int _uidx1_1527;
      highp int tmpvar_1528;
      if ((tmpvar_1229 == 0)) {
        tmpvar_1528 = 1;
      } else {
        tmpvar_1528 = -1;
      };
      _us_1526 = -(tmpvar_1528);
      float tmpvar_1529;
      tmpvar_1529 = fract((iTime * 4.0));
      highp int tmpvar_1530;
      tmpvar_1530 = (tmpvar_1228 - 1);
      highp int tmpvar_1531;
      if ((_us_1526 >= 0)) {
        tmpvar_1531 = 0;
      } else {
        tmpvar_1531 = 1;
      };
      highp int tmpvar_1532;
      tmpvar_1532 = (6 + tmpvar_1531);
      _uidx1_1527 = tmpvar_1532;
      if ((tmpvar_1530 < 0)) {
        highp int tmpvar_1533;
        if ((_us_1526 >= 0)) {
          tmpvar_1533 = 1;
        } else {
          tmpvar_1533 = 0;
        };
        _uidx1_1527 = (6 + tmpvar_1533);
      };
      highp int tmpvar_1534;
      if ((tmpvar_1530 < 0)) {
        tmpvar_1534 = 3;
      } else {
        tmpvar_1534 = tmpvar_1530;
      };
      float tmpvar_1535;
      tmpvar_1535 = sin(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_1527), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_1534), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_1532), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_1228), 0.0, 3.0)
        )], tmpvar_1529))
       * 3.141593) / 180.0));
      highp int _us_1536;
      _us_1536 = -1;
      highp int _uidx1_1537;
      highp int tmpvar_1538;
      if ((tmpvar_1229 == 0)) {
        tmpvar_1538 = 1;
      } else {
        tmpvar_1538 = -1;
      };
      _us_1536 = -(tmpvar_1538);
      float tmpvar_1539;
      tmpvar_1539 = fract((iTime * 4.0));
      highp int tmpvar_1540;
      tmpvar_1540 = (tmpvar_1228 - 1);
      highp int tmpvar_1541;
      if ((_us_1536 >= 0)) {
        tmpvar_1541 = 0;
      } else {
        tmpvar_1541 = 1;
      };
      highp int tmpvar_1542;
      tmpvar_1542 = (6 + tmpvar_1541);
      _uidx1_1537 = tmpvar_1542;
      if ((tmpvar_1540 < 0)) {
        highp int tmpvar_1543;
        if ((_us_1536 >= 0)) {
          tmpvar_1543 = 1;
        } else {
          tmpvar_1543 = 0;
        };
        _uidx1_1537 = (6 + tmpvar_1543);
      };
      highp int tmpvar_1544;
      if ((tmpvar_1540 < 0)) {
        tmpvar_1544 = 3;
      } else {
        tmpvar_1544 = tmpvar_1540;
      };
      float tmpvar_1545;
      tmpvar_1545 = sin(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_1537), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_1544), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_1542), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_1228), 0.0, 3.0)
        )], tmpvar_1539))
       * 3.141593) / 180.0));
      highp int _us_1546;
      _us_1546 = -1;
      highp int _uidx1_1547;
      highp int tmpvar_1548;
      if ((tmpvar_1229 == 0)) {
        tmpvar_1548 = 1;
      } else {
        tmpvar_1548 = -1;
      };
      _us_1546 = -(tmpvar_1548);
      float tmpvar_1549;
      tmpvar_1549 = fract((iTime * 4.0));
      highp int tmpvar_1550;
      tmpvar_1550 = (tmpvar_1228 - 1);
      highp int tmpvar_1551;
      if ((_us_1546 >= 0)) {
        tmpvar_1551 = 0;
      } else {
        tmpvar_1551 = 1;
      };
      highp int tmpvar_1552;
      tmpvar_1552 = (6 + tmpvar_1551);
      _uidx1_1547 = tmpvar_1552;
      if ((tmpvar_1550 < 0)) {
        highp int tmpvar_1553;
        if ((_us_1546 >= 0)) {
          tmpvar_1553 = 1;
        } else {
          tmpvar_1553 = 0;
        };
        _uidx1_1547 = (6 + tmpvar_1553);
      };
      highp int tmpvar_1554;
      if ((tmpvar_1550 < 0)) {
        tmpvar_1554 = 3;
      } else {
        tmpvar_1554 = tmpvar_1550;
      };
      mat2 tmpvar_1555;
      tmpvar_1555[uint(0)].x = tmpvar_1525;
      tmpvar_1555[uint(0)].y = tmpvar_1535;
      tmpvar_1555[1u].x = -(tmpvar_1545);
      tmpvar_1555[1u].y = cos(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_1547), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_1554), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_1552), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_1228), 0.0, 3.0)
        )], tmpvar_1549))
       * 3.141593) / 180.0));
      _upArm0R_1215.yz = (tmpvar_1515.yz * tmpvar_1555);
      highp vec3 tmpvar_1556;
      tmpvar_1556 = (abs((_upArm0R_1215 - vec3(0.0, 0.08, 0.0))) - vec3(0.02, 0.08, 0.02));
      highp vec3 tmpvar_1557;
      tmpvar_1557 = max (tmpvar_1556, 0.0);
      highp float tmpvar_1558;
      tmpvar_1558 = min (tmpvar_1514, (sqrt(
        dot (tmpvar_1557, tmpvar_1557)
      ) + min (
        max (tmpvar_1556.x, max (tmpvar_1556.y, tmpvar_1556.z))
      , 0.0)));
      highp vec3 tmpvar_1559;
      tmpvar_1559 = (_upArm0R_1215 + vec3(0.0, -0.16, 0.0));
      _upArm1R_1214 = tmpvar_1559;
      highp int _us_1560;
      _us_1560 = -1;
      highp int _uidx1_1561;
      highp int tmpvar_1562;
      if ((tmpvar_1229 == 0)) {
        tmpvar_1562 = 1;
      } else {
        tmpvar_1562 = -1;
      };
      _us_1560 = -(tmpvar_1562);
      float tmpvar_1563;
      tmpvar_1563 = fract((iTime * 4.0));
      highp int tmpvar_1564;
      tmpvar_1564 = (tmpvar_1228 - 1);
      highp int tmpvar_1565;
      if ((_us_1560 >= 0)) {
        tmpvar_1565 = 0;
      } else {
        tmpvar_1565 = 1;
      };
      highp int tmpvar_1566;
      tmpvar_1566 = (8 + tmpvar_1565);
      _uidx1_1561 = tmpvar_1566;
      if ((tmpvar_1564 < 0)) {
        highp int tmpvar_1567;
        if ((_us_1560 >= 0)) {
          tmpvar_1567 = 1;
        } else {
          tmpvar_1567 = 0;
        };
        _uidx1_1561 = (8 + tmpvar_1567);
      };
      highp int tmpvar_1568;
      if ((tmpvar_1564 < 0)) {
        tmpvar_1568 = 3;
      } else {
        tmpvar_1568 = tmpvar_1564;
      };
      float tmpvar_1569;
      tmpvar_1569 = cos(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_1561)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_1568)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_1566)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_1228)
        , 0.0, 3.0))], tmpvar_1563)
       * 3.141593) / 180.0));
      highp int _us_1570;
      _us_1570 = -1;
      highp int _uidx1_1571;
      highp int tmpvar_1572;
      if ((tmpvar_1229 == 0)) {
        tmpvar_1572 = 1;
      } else {
        tmpvar_1572 = -1;
      };
      _us_1570 = -(tmpvar_1572);
      float tmpvar_1573;
      tmpvar_1573 = fract((iTime * 4.0));
      highp int tmpvar_1574;
      tmpvar_1574 = (tmpvar_1228 - 1);
      highp int tmpvar_1575;
      if ((_us_1570 >= 0)) {
        tmpvar_1575 = 0;
      } else {
        tmpvar_1575 = 1;
      };
      highp int tmpvar_1576;
      tmpvar_1576 = (8 + tmpvar_1575);
      _uidx1_1571 = tmpvar_1576;
      if ((tmpvar_1574 < 0)) {
        highp int tmpvar_1577;
        if ((_us_1570 >= 0)) {
          tmpvar_1577 = 1;
        } else {
          tmpvar_1577 = 0;
        };
        _uidx1_1571 = (8 + tmpvar_1577);
      };
      highp int tmpvar_1578;
      if ((tmpvar_1574 < 0)) {
        tmpvar_1578 = 3;
      } else {
        tmpvar_1578 = tmpvar_1574;
      };
      float tmpvar_1579;
      tmpvar_1579 = sin(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_1571)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_1578)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_1576)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_1228)
        , 0.0, 3.0))], tmpvar_1573)
       * 3.141593) / 180.0));
      highp int _us_1580;
      _us_1580 = -1;
      highp int _uidx1_1581;
      highp int tmpvar_1582;
      if ((tmpvar_1229 == 0)) {
        tmpvar_1582 = 1;
      } else {
        tmpvar_1582 = -1;
      };
      _us_1580 = -(tmpvar_1582);
      float tmpvar_1583;
      tmpvar_1583 = fract((iTime * 4.0));
      highp int tmpvar_1584;
      tmpvar_1584 = (tmpvar_1228 - 1);
      highp int tmpvar_1585;
      if ((_us_1580 >= 0)) {
        tmpvar_1585 = 0;
      } else {
        tmpvar_1585 = 1;
      };
      highp int tmpvar_1586;
      tmpvar_1586 = (8 + tmpvar_1585);
      _uidx1_1581 = tmpvar_1586;
      if ((tmpvar_1584 < 0)) {
        highp int tmpvar_1587;
        if ((_us_1580 >= 0)) {
          tmpvar_1587 = 1;
        } else {
          tmpvar_1587 = 0;
        };
        _uidx1_1581 = (8 + tmpvar_1587);
      };
      highp int tmpvar_1588;
      if ((tmpvar_1584 < 0)) {
        tmpvar_1588 = 3;
      } else {
        tmpvar_1588 = tmpvar_1584;
      };
      float tmpvar_1589;
      tmpvar_1589 = sin(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_1581)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_1588)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_1586)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_1228)
        , 0.0, 3.0))], tmpvar_1583)
       * 3.141593) / 180.0));
      highp int _us_1590;
      _us_1590 = -1;
      highp int _uidx1_1591;
      highp int tmpvar_1592;
      if ((tmpvar_1229 == 0)) {
        tmpvar_1592 = 1;
      } else {
        tmpvar_1592 = -1;
      };
      _us_1590 = -(tmpvar_1592);
      float tmpvar_1593;
      tmpvar_1593 = fract((iTime * 4.0));
      highp int tmpvar_1594;
      tmpvar_1594 = (tmpvar_1228 - 1);
      highp int tmpvar_1595;
      if ((_us_1590 >= 0)) {
        tmpvar_1595 = 0;
      } else {
        tmpvar_1595 = 1;
      };
      highp int tmpvar_1596;
      tmpvar_1596 = (8 + tmpvar_1595);
      _uidx1_1591 = tmpvar_1596;
      if ((tmpvar_1594 < 0)) {
        highp int tmpvar_1597;
        if ((_us_1590 >= 0)) {
          tmpvar_1597 = 1;
        } else {
          tmpvar_1597 = 0;
        };
        _uidx1_1591 = (8 + tmpvar_1597);
      };
      highp int tmpvar_1598;
      if ((tmpvar_1594 < 0)) {
        tmpvar_1598 = 3;
      } else {
        tmpvar_1598 = tmpvar_1594;
      };
      mat2 tmpvar_1599;
      tmpvar_1599[uint(0)].x = tmpvar_1569;
      tmpvar_1599[uint(0)].y = tmpvar_1579;
      tmpvar_1599[1u].x = -(tmpvar_1589);
      tmpvar_1599[1u].y = cos(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_1591)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_1598)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_1596)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_1228)
        , 0.0, 3.0))], tmpvar_1593)
       * 3.141593) / 180.0));
      _upArm1R_1214.yz = (tmpvar_1559.yz * tmpvar_1599);
      highp vec3 tmpvar_1600;
      tmpvar_1600 = (abs((_upArm1R_1214 - vec3(0.0, 0.08, 0.0))) - vec3(0.02, 0.08, 0.02));
      highp vec3 tmpvar_1601;
      tmpvar_1601 = max (tmpvar_1600, 0.0);
      highp vec4 tmpvar_1602;
      tmpvar_1602.yzw = vec3(0.2, 0.0, 0.0);
      tmpvar_1602.x = min (tmpvar_1558, (sqrt(
        dot (tmpvar_1601, tmpvar_1601)
      ) + min (
        max (tmpvar_1600.x, max (tmpvar_1600.y, tmpvar_1600.z))
      , 0.0)));
      tmpvar_1213 = tmpvar_1602;
    } else {
      tmpvar_1213 = tmpvar_814;
    };
    _uhit_811 = tmpvar_1213;
  };
  highp vec3 _up_1603;
  _up_1603 = (tmpvar_809 + vec3(-1e-05, 1e-05, -1e-05));
  highp vec4 _uhit_1604;
  _uhit_1604 = vec4(4.5, 0.0, 0.0, 0.0);
  highp float tmpvar_1605;
  highp vec3 _up_1606;
  _up_1606 = (_up_1603 - vec3(0.0, -2.0, 0.0));
  tmpvar_1605 = (sqrt(dot (_up_1606, _up_1606)) - 2.0);
  highp vec4 tmpvar_1607;
  if ((tmpvar_1605 < 4.5)) {
    highp vec3 _up_1608;
    _up_1608 = (_up_1603 - vec3(0.0, -2.0, 0.0));
    highp vec4 tmpvar_1609;
    tmpvar_1609.yzw = vec3(0.1, 0.0, 0.0);
    tmpvar_1609.x = (sqrt(dot (_up_1608, _up_1608)) - 2.0);
    tmpvar_1607 = tmpvar_1609;
  } else {
    tmpvar_1607 = vec4(4.5, 0.0, 0.0, 0.0);
  };
  _uhit_1604 = tmpvar_1607;
  highp float tmpvar_1610;
  highp vec3 tmpvar_1611;
  tmpvar_1611 = (abs((_up_1603 - vec3(0.0, 0.5, 0.0))) - vec3(0.3, 0.5, 0.3));
  highp vec3 tmpvar_1612;
  tmpvar_1612 = max (tmpvar_1611, 0.0);
  tmpvar_1610 = (sqrt(dot (tmpvar_1612, tmpvar_1612)) + min (max (tmpvar_1611.x, 
    max (tmpvar_1611.y, tmpvar_1611.z)
  ), 0.0));
  highp vec4 tmpvar_1613;
  if ((tmpvar_1610 < tmpvar_1607.x)) {
    highp vec3 tmpvar_1614;
    tmpvar_1614 = (abs((_up_1603 - vec3(0.0, 0.5, 0.0))) - vec3(0.3, 0.5, 0.3));
    highp vec3 tmpvar_1615;
    tmpvar_1615 = max (tmpvar_1614, 0.0);
    highp vec4 tmpvar_1616;
    tmpvar_1616.yzw = vec3(-0.1, 0.0, 0.0);
    tmpvar_1616.x = (sqrt(dot (tmpvar_1615, tmpvar_1615)) + min (max (tmpvar_1614.x, 
      max (tmpvar_1614.y, tmpvar_1614.z)
    ), 0.0));
    tmpvar_1613 = tmpvar_1616;
  } else {
    tmpvar_1613 = tmpvar_1607;
  };
  if ((tmpvar_1613.y < 0.0)) {
    highp vec3 _upArm1R_1617;
    highp vec3 _upArm0R_1618;
    highp vec3 _upArm1L_1619;
    highp vec3 _upArm0L_1620;
    highp vec3 _upLeg1R_1621;
    highp vec3 _upLeg0R_1622;
    highp vec3 _upLeg1L_1623;
    highp vec3 _upLeg0L_1624;
    highp vec3 _upHead_1625;
    highp vec3 _upNeck_1626;
    highp vec3 _upChest_1627;
    highp vec3 _upWaist_1628;
    highp vec3 _upPelvis_1629;
    float tmpvar_1630;
    tmpvar_1630 = (iTime * 4.0);
    highp int tmpvar_1631;
    tmpvar_1631 = ((int(tmpvar_1630)% 4));
    highp int tmpvar_1632;
    tmpvar_1632 = ((int((tmpvar_1630 / 4.0))% 2));
    highp int _uidx1_1633;
    highp int tmpvar_1634;
    if ((tmpvar_1632 == 0)) {
      tmpvar_1634 = 1;
    } else {
      tmpvar_1634 = -1;
    };
    float tmpvar_1635;
    tmpvar_1635 = fract((iTime * 4.0));
    highp int tmpvar_1636;
    tmpvar_1636 = (tmpvar_1631 - 1);
    highp int tmpvar_1637;
    if ((tmpvar_1634 >= 0)) {
      tmpvar_1637 = 0;
    } else {
      tmpvar_1637 = 1;
    };
    highp int tmpvar_1638;
    tmpvar_1638 = (10 + tmpvar_1637);
    _uidx1_1633 = tmpvar_1638;
    if ((tmpvar_1636 < 0)) {
      highp int tmpvar_1639;
      if ((tmpvar_1634 >= 0)) {
        tmpvar_1639 = 1;
      } else {
        tmpvar_1639 = 0;
      };
      _uidx1_1633 = (10 + tmpvar_1639);
    };
    highp int tmpvar_1640;
    if ((tmpvar_1636 < 0)) {
      tmpvar_1640 = 3;
    } else {
      tmpvar_1640 = tmpvar_1636;
    };
    float tmpvar_1641;
    tmpvar_1641 = ((mix (
      vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (float(_uidx1_1633), 0.0, 11.0))][int(clamp (float(tmpvar_1640), 0.0, 3.0))]
    , 
      vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (float(tmpvar_1638), 0.0, 11.0))][int(clamp (float(tmpvar_1631), 0.0, 3.0))]
    , tmpvar_1635) * 3.141593) / 180.0);
    highp int _uidx1_1642;
    highp int tmpvar_1643;
    if ((tmpvar_1632 == 0)) {
      tmpvar_1643 = 1;
    } else {
      tmpvar_1643 = -1;
    };
    float tmpvar_1644;
    tmpvar_1644 = fract((iTime * 4.0));
    highp int tmpvar_1645;
    tmpvar_1645 = (tmpvar_1631 - 1);
    highp int tmpvar_1646;
    if ((tmpvar_1643 >= 0)) {
      tmpvar_1646 = 0;
    } else {
      tmpvar_1646 = 1;
    };
    _uidx1_1642 = tmpvar_1646;
    if ((tmpvar_1645 < 0)) {
      highp int tmpvar_1647;
      if ((tmpvar_1643 >= 0)) {
        tmpvar_1647 = 1;
      } else {
        tmpvar_1647 = 0;
      };
      _uidx1_1642 = tmpvar_1647;
    };
    highp int tmpvar_1648;
    if ((tmpvar_1645 < 0)) {
      tmpvar_1648 = 3;
    } else {
      tmpvar_1648 = tmpvar_1645;
    };
    vec3 tmpvar_1649;
    tmpvar_1649.xz = vec2(0.0, 0.0);
    tmpvar_1649.y = (-0.5 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[
      int(clamp (float(_uidx1_1642), 0.0, 11.0))
    ][
      int(clamp (float(tmpvar_1648), 0.0, 3.0))
    ], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[
      int(clamp (float(tmpvar_1646), 0.0, 11.0))
    ][
      int(clamp (float(tmpvar_1631), 0.0, 3.0))
    ], tmpvar_1644));
    highp vec3 tmpvar_1650;
    tmpvar_1650 = (_up_1603 + tmpvar_1649);
    _upPelvis_1629.z = tmpvar_1650.z;
    mat2 tmpvar_1651;
    tmpvar_1651[uint(0)].x = cos(tmpvar_1641);
    tmpvar_1651[uint(0)].y = sin(tmpvar_1641);
    tmpvar_1651[1u].x = -(sin(tmpvar_1641));
    tmpvar_1651[1u].y = cos(tmpvar_1641);
    _upPelvis_1629.xy = (tmpvar_1650.xy * tmpvar_1651);
    highp vec3 tmpvar_1652;
    tmpvar_1652 = (abs((_upPelvis_1629 - vec3(0.0, 0.0, 0.025))) - vec3(0.085, 0.05, 0.05));
    highp vec3 tmpvar_1653;
    tmpvar_1653 = max (tmpvar_1652, 0.0);
    highp vec3 tmpvar_1654;
    tmpvar_1654 = (_upPelvis_1629 + vec3(0.0, -0.05, -0.02));
    _upWaist_1628.z = tmpvar_1654.z;
    mat2 tmpvar_1655;
    tmpvar_1655[uint(0)].x = cos(-(tmpvar_1641));
    tmpvar_1655[uint(0)].y = sin(-(tmpvar_1641));
    tmpvar_1655[1u].x = -(sin(-(tmpvar_1641)));
    tmpvar_1655[1u].y = cos(-(tmpvar_1641));
    _upWaist_1628.xy = (tmpvar_1654.xy * tmpvar_1655);
    _upWaist_1628.yz = (_upWaist_1628.yz * mat2(1.0, 0.0, -0.0, 1.0));
    highp vec3 tmpvar_1656;
    tmpvar_1656 = (abs((_upWaist_1628 - vec3(0.0, 0.04, 0.0))) - vec3(0.075, 0.08, 0.03));
    highp vec3 tmpvar_1657;
    tmpvar_1657 = max (tmpvar_1656, 0.0);
    highp vec3 tmpvar_1658;
    tmpvar_1658 = (_upWaist_1628 + vec3(0.0, -0.14, -0.01));
    _upChest_1627.x = tmpvar_1658.x;
    _upChest_1627.yz = (tmpvar_1658.yz * mat2(1.0, 0.0, -0.0, 1.0));
    highp vec3 tmpvar_1659;
    tmpvar_1659 = (abs((_upChest_1627 - vec3(0.0, 0.04, 0.0))) - vec3(0.09, 0.08, 0.05));
    highp vec3 tmpvar_1660;
    tmpvar_1660 = max (tmpvar_1659, 0.0);
    highp vec3 tmpvar_1661;
    tmpvar_1661 = (_upChest_1627 + vec3(0.0, -0.15, 0.0));
    _upNeck_1626.x = tmpvar_1661.x;
    _upNeck_1626.yz = (tmpvar_1661.yz * mat2(1.0, 0.0, -0.0, 1.0));
    highp vec3 tmpvar_1662;
    tmpvar_1662 = (abs((_upNeck_1626 - vec3(0.0, 0.01, 0.0))) - vec3(0.02, 0.04, 0.02));
    highp vec3 tmpvar_1663;
    tmpvar_1663 = max (tmpvar_1662, 0.0);
    highp vec3 tmpvar_1664;
    tmpvar_1664 = (_upNeck_1626 + vec3(0.0, -0.1, 0.0));
    _upHead_1625.x = tmpvar_1664.x;
    _upHead_1625.yz = (tmpvar_1664.yz * mat2(1.0, 0.0, -0.0, 1.0));
    highp vec3 tmpvar_1665;
    tmpvar_1665 = (abs((_upHead_1625 - vec3(0.0, 0.04, -0.025))) - vec3(0.05, 0.08, 0.06));
    highp vec3 tmpvar_1666;
    tmpvar_1666 = max (tmpvar_1665, 0.0);
    highp float tmpvar_1667;
    tmpvar_1667 = min (min (min (
      min (min (4.5, (sqrt(
        dot (tmpvar_1653, tmpvar_1653)
      ) + min (
        max (tmpvar_1652.x, max (tmpvar_1652.y, tmpvar_1652.z))
      , 0.0))), (sqrt(dot (tmpvar_1657, tmpvar_1657)) + min (max (tmpvar_1656.x, 
        max (tmpvar_1656.y, tmpvar_1656.z)
      ), 0.0)))
    , 
      (sqrt(dot (tmpvar_1660, tmpvar_1660)) + min (max (tmpvar_1659.x, max (tmpvar_1659.y, tmpvar_1659.z)), 0.0))
    ), (
      sqrt(dot (tmpvar_1663, tmpvar_1663))
     + 
      min (max (tmpvar_1662.x, max (tmpvar_1662.y, tmpvar_1662.z)), 0.0)
    )), (sqrt(
      dot (tmpvar_1666, tmpvar_1666)
    ) + min (
      max (tmpvar_1665.x, max (tmpvar_1665.y, tmpvar_1665.z))
    , 0.0)));
    highp vec3 tmpvar_1668;
    tmpvar_1668 = (_upPelvis_1629 + vec3(0.06, 0.025, 0.0));
    _upLeg0L_1624.z = tmpvar_1668.z;
    mat2 tmpvar_1669;
    tmpvar_1669[uint(0)].x = cos(-(tmpvar_1641));
    tmpvar_1669[uint(0)].y = sin(-(tmpvar_1641));
    tmpvar_1669[1u].x = -(sin(-(tmpvar_1641)));
    tmpvar_1669[1u].y = cos(-(tmpvar_1641));
    _upLeg0L_1624.xy = (tmpvar_1668.xy * tmpvar_1669);
    highp int _uidx1_1670;
    highp int tmpvar_1671;
    if ((tmpvar_1632 == 0)) {
      tmpvar_1671 = 1;
    } else {
      tmpvar_1671 = -1;
    };
    float tmpvar_1672;
    tmpvar_1672 = fract((iTime * 4.0));
    highp int tmpvar_1673;
    tmpvar_1673 = (tmpvar_1631 - 1);
    highp int tmpvar_1674;
    if ((tmpvar_1671 >= 0)) {
      tmpvar_1674 = 0;
    } else {
      tmpvar_1674 = 1;
    };
    highp int tmpvar_1675;
    tmpvar_1675 = (2 + tmpvar_1674);
    _uidx1_1670 = tmpvar_1675;
    if ((tmpvar_1673 < 0)) {
      highp int tmpvar_1676;
      if ((tmpvar_1671 >= 0)) {
        tmpvar_1676 = 1;
      } else {
        tmpvar_1676 = 0;
      };
      _uidx1_1670 = (2 + tmpvar_1676);
    };
    highp int tmpvar_1677;
    if ((tmpvar_1673 < 0)) {
      tmpvar_1677 = 3;
    } else {
      tmpvar_1677 = tmpvar_1673;
    };
    float tmpvar_1678;
    tmpvar_1678 = cos(((
      (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(_uidx1_1670), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_1677), 0.0, 3.0)
      )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(tmpvar_1675), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_1631), 0.0, 3.0)
      )], tmpvar_1672))
     * 3.141593) / 180.0));
    highp int _uidx1_1679;
    highp int tmpvar_1680;
    if ((tmpvar_1632 == 0)) {
      tmpvar_1680 = 1;
    } else {
      tmpvar_1680 = -1;
    };
    float tmpvar_1681;
    tmpvar_1681 = fract((iTime * 4.0));
    highp int tmpvar_1682;
    tmpvar_1682 = (tmpvar_1631 - 1);
    highp int tmpvar_1683;
    if ((tmpvar_1680 >= 0)) {
      tmpvar_1683 = 0;
    } else {
      tmpvar_1683 = 1;
    };
    highp int tmpvar_1684;
    tmpvar_1684 = (2 + tmpvar_1683);
    _uidx1_1679 = tmpvar_1684;
    if ((tmpvar_1682 < 0)) {
      highp int tmpvar_1685;
      if ((tmpvar_1680 >= 0)) {
        tmpvar_1685 = 1;
      } else {
        tmpvar_1685 = 0;
      };
      _uidx1_1679 = (2 + tmpvar_1685);
    };
    highp int tmpvar_1686;
    if ((tmpvar_1682 < 0)) {
      tmpvar_1686 = 3;
    } else {
      tmpvar_1686 = tmpvar_1682;
    };
    float tmpvar_1687;
    tmpvar_1687 = sin(((
      (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(_uidx1_1679), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_1686), 0.0, 3.0)
      )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(tmpvar_1684), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_1631), 0.0, 3.0)
      )], tmpvar_1681))
     * 3.141593) / 180.0));
    highp int _uidx1_1688;
    highp int tmpvar_1689;
    if ((tmpvar_1632 == 0)) {
      tmpvar_1689 = 1;
    } else {
      tmpvar_1689 = -1;
    };
    float tmpvar_1690;
    tmpvar_1690 = fract((iTime * 4.0));
    highp int tmpvar_1691;
    tmpvar_1691 = (tmpvar_1631 - 1);
    highp int tmpvar_1692;
    if ((tmpvar_1689 >= 0)) {
      tmpvar_1692 = 0;
    } else {
      tmpvar_1692 = 1;
    };
    highp int tmpvar_1693;
    tmpvar_1693 = (2 + tmpvar_1692);
    _uidx1_1688 = tmpvar_1693;
    if ((tmpvar_1691 < 0)) {
      highp int tmpvar_1694;
      if ((tmpvar_1689 >= 0)) {
        tmpvar_1694 = 1;
      } else {
        tmpvar_1694 = 0;
      };
      _uidx1_1688 = (2 + tmpvar_1694);
    };
    highp int tmpvar_1695;
    if ((tmpvar_1691 < 0)) {
      tmpvar_1695 = 3;
    } else {
      tmpvar_1695 = tmpvar_1691;
    };
    float tmpvar_1696;
    tmpvar_1696 = sin(((
      (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(_uidx1_1688), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_1695), 0.0, 3.0)
      )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(tmpvar_1693), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_1631), 0.0, 3.0)
      )], tmpvar_1690))
     * 3.141593) / 180.0));
    highp int _uidx1_1697;
    highp int tmpvar_1698;
    if ((tmpvar_1632 == 0)) {
      tmpvar_1698 = 1;
    } else {
      tmpvar_1698 = -1;
    };
    float tmpvar_1699;
    tmpvar_1699 = fract((iTime * 4.0));
    highp int tmpvar_1700;
    tmpvar_1700 = (tmpvar_1631 - 1);
    highp int tmpvar_1701;
    if ((tmpvar_1698 >= 0)) {
      tmpvar_1701 = 0;
    } else {
      tmpvar_1701 = 1;
    };
    highp int tmpvar_1702;
    tmpvar_1702 = (2 + tmpvar_1701);
    _uidx1_1697 = tmpvar_1702;
    if ((tmpvar_1700 < 0)) {
      highp int tmpvar_1703;
      if ((tmpvar_1698 >= 0)) {
        tmpvar_1703 = 1;
      } else {
        tmpvar_1703 = 0;
      };
      _uidx1_1697 = (2 + tmpvar_1703);
    };
    highp int tmpvar_1704;
    if ((tmpvar_1700 < 0)) {
      tmpvar_1704 = 3;
    } else {
      tmpvar_1704 = tmpvar_1700;
    };
    mat2 tmpvar_1705;
    tmpvar_1705[uint(0)].x = tmpvar_1678;
    tmpvar_1705[uint(0)].y = tmpvar_1687;
    tmpvar_1705[1u].x = -(tmpvar_1696);
    tmpvar_1705[1u].y = cos(((
      (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(_uidx1_1697), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_1704), 0.0, 3.0)
      )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(tmpvar_1702), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_1631), 0.0, 3.0)
      )], tmpvar_1699))
     * 3.141593) / 180.0));
    _upLeg0L_1624.yz = (_upLeg0L_1624.yz * tmpvar_1705);
    highp vec3 tmpvar_1706;
    tmpvar_1706 = (abs((_upLeg0L_1624 - vec3(0.0, 0.1, 0.0))) - vec3(0.025, 0.1, 0.025));
    highp vec3 tmpvar_1707;
    tmpvar_1707 = max (tmpvar_1706, 0.0);
    highp float tmpvar_1708;
    tmpvar_1708 = min (tmpvar_1667, (sqrt(
      dot (tmpvar_1707, tmpvar_1707)
    ) + min (
      max (tmpvar_1706.x, max (tmpvar_1706.y, tmpvar_1706.z))
    , 0.0)));
    highp vec3 tmpvar_1709;
    tmpvar_1709 = (_upLeg0L_1624 + vec3(0.01, -0.18, 0.02));
    _upLeg1L_1623 = tmpvar_1709;
    highp int _uidx1_1710;
    highp int tmpvar_1711;
    if ((tmpvar_1632 == 0)) {
      tmpvar_1711 = 1;
    } else {
      tmpvar_1711 = -1;
    };
    float tmpvar_1712;
    tmpvar_1712 = fract((iTime * 4.0));
    highp int tmpvar_1713;
    tmpvar_1713 = (tmpvar_1631 - 1);
    highp int tmpvar_1714;
    if ((tmpvar_1711 >= 0)) {
      tmpvar_1714 = 0;
    } else {
      tmpvar_1714 = 1;
    };
    highp int tmpvar_1715;
    tmpvar_1715 = (4 + tmpvar_1714);
    _uidx1_1710 = tmpvar_1715;
    if ((tmpvar_1713 < 0)) {
      highp int tmpvar_1716;
      if ((tmpvar_1711 >= 0)) {
        tmpvar_1716 = 1;
      } else {
        tmpvar_1716 = 0;
      };
      _uidx1_1710 = (4 + tmpvar_1716);
    };
    highp int tmpvar_1717;
    if ((tmpvar_1713 < 0)) {
      tmpvar_1717 = 3;
    } else {
      tmpvar_1717 = tmpvar_1713;
    };
    float tmpvar_1718;
    tmpvar_1718 = cos(((
      mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(_uidx1_1710)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_1717)
      , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(tmpvar_1715)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_1631)
      , 0.0, 3.0))], tmpvar_1712)
     * 3.141593) / 180.0));
    highp int _uidx1_1719;
    highp int tmpvar_1720;
    if ((tmpvar_1632 == 0)) {
      tmpvar_1720 = 1;
    } else {
      tmpvar_1720 = -1;
    };
    float tmpvar_1721;
    tmpvar_1721 = fract((iTime * 4.0));
    highp int tmpvar_1722;
    tmpvar_1722 = (tmpvar_1631 - 1);
    highp int tmpvar_1723;
    if ((tmpvar_1720 >= 0)) {
      tmpvar_1723 = 0;
    } else {
      tmpvar_1723 = 1;
    };
    highp int tmpvar_1724;
    tmpvar_1724 = (4 + tmpvar_1723);
    _uidx1_1719 = tmpvar_1724;
    if ((tmpvar_1722 < 0)) {
      highp int tmpvar_1725;
      if ((tmpvar_1720 >= 0)) {
        tmpvar_1725 = 1;
      } else {
        tmpvar_1725 = 0;
      };
      _uidx1_1719 = (4 + tmpvar_1725);
    };
    highp int tmpvar_1726;
    if ((tmpvar_1722 < 0)) {
      tmpvar_1726 = 3;
    } else {
      tmpvar_1726 = tmpvar_1722;
    };
    float tmpvar_1727;
    tmpvar_1727 = sin(((
      mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(_uidx1_1719)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_1726)
      , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(tmpvar_1724)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_1631)
      , 0.0, 3.0))], tmpvar_1721)
     * 3.141593) / 180.0));
    highp int _uidx1_1728;
    highp int tmpvar_1729;
    if ((tmpvar_1632 == 0)) {
      tmpvar_1729 = 1;
    } else {
      tmpvar_1729 = -1;
    };
    float tmpvar_1730;
    tmpvar_1730 = fract((iTime * 4.0));
    highp int tmpvar_1731;
    tmpvar_1731 = (tmpvar_1631 - 1);
    highp int tmpvar_1732;
    if ((tmpvar_1729 >= 0)) {
      tmpvar_1732 = 0;
    } else {
      tmpvar_1732 = 1;
    };
    highp int tmpvar_1733;
    tmpvar_1733 = (4 + tmpvar_1732);
    _uidx1_1728 = tmpvar_1733;
    if ((tmpvar_1731 < 0)) {
      highp int tmpvar_1734;
      if ((tmpvar_1729 >= 0)) {
        tmpvar_1734 = 1;
      } else {
        tmpvar_1734 = 0;
      };
      _uidx1_1728 = (4 + tmpvar_1734);
    };
    highp int tmpvar_1735;
    if ((tmpvar_1731 < 0)) {
      tmpvar_1735 = 3;
    } else {
      tmpvar_1735 = tmpvar_1731;
    };
    float tmpvar_1736;
    tmpvar_1736 = sin(((
      mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(_uidx1_1728)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_1735)
      , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(tmpvar_1733)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_1631)
      , 0.0, 3.0))], tmpvar_1730)
     * 3.141593) / 180.0));
    highp int _uidx1_1737;
    highp int tmpvar_1738;
    if ((tmpvar_1632 == 0)) {
      tmpvar_1738 = 1;
    } else {
      tmpvar_1738 = -1;
    };
    float tmpvar_1739;
    tmpvar_1739 = fract((iTime * 4.0));
    highp int tmpvar_1740;
    tmpvar_1740 = (tmpvar_1631 - 1);
    highp int tmpvar_1741;
    if ((tmpvar_1738 >= 0)) {
      tmpvar_1741 = 0;
    } else {
      tmpvar_1741 = 1;
    };
    highp int tmpvar_1742;
    tmpvar_1742 = (4 + tmpvar_1741);
    _uidx1_1737 = tmpvar_1742;
    if ((tmpvar_1740 < 0)) {
      highp int tmpvar_1743;
      if ((tmpvar_1738 >= 0)) {
        tmpvar_1743 = 1;
      } else {
        tmpvar_1743 = 0;
      };
      _uidx1_1737 = (4 + tmpvar_1743);
    };
    highp int tmpvar_1744;
    if ((tmpvar_1740 < 0)) {
      tmpvar_1744 = 3;
    } else {
      tmpvar_1744 = tmpvar_1740;
    };
    mat2 tmpvar_1745;
    tmpvar_1745[uint(0)].x = tmpvar_1718;
    tmpvar_1745[uint(0)].y = tmpvar_1727;
    tmpvar_1745[1u].x = -(tmpvar_1736);
    tmpvar_1745[1u].y = cos(((
      mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(_uidx1_1737)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_1744)
      , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(tmpvar_1742)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_1631)
      , 0.0, 3.0))], tmpvar_1739)
     * 3.141593) / 180.0));
    _upLeg1L_1623.yz = (tmpvar_1709.yz * tmpvar_1745);
    highp vec3 tmpvar_1746;
    tmpvar_1746 = (abs((_upLeg1L_1623 - vec3(0.0, 0.1, 0.0))) - vec3(0.025, 0.1, 0.025));
    highp vec3 tmpvar_1747;
    tmpvar_1747 = max (tmpvar_1746, 0.0);
    highp float tmpvar_1748;
    tmpvar_1748 = min (tmpvar_1708, (sqrt(
      dot (tmpvar_1747, tmpvar_1747)
    ) + min (
      max (tmpvar_1746.x, max (tmpvar_1746.y, tmpvar_1746.z))
    , 0.0)));
    highp vec3 tmpvar_1749;
    tmpvar_1749 = (_upPelvis_1629 + vec3(-0.06, 0.025, 0.0));
    _upLeg0R_1622.z = tmpvar_1749.z;
    mat2 tmpvar_1750;
    tmpvar_1750[uint(0)].x = cos(-(tmpvar_1641));
    tmpvar_1750[uint(0)].y = sin(-(tmpvar_1641));
    tmpvar_1750[1u].x = -(sin(-(tmpvar_1641)));
    tmpvar_1750[1u].y = cos(-(tmpvar_1641));
    _upLeg0R_1622.xy = (tmpvar_1749.xy * tmpvar_1750);
    highp int _us_1751;
    _us_1751 = -1;
    highp int _uidx1_1752;
    highp int tmpvar_1753;
    if ((tmpvar_1632 == 0)) {
      tmpvar_1753 = 1;
    } else {
      tmpvar_1753 = -1;
    };
    _us_1751 = -(tmpvar_1753);
    float tmpvar_1754;
    tmpvar_1754 = fract((iTime * 4.0));
    highp int tmpvar_1755;
    tmpvar_1755 = (tmpvar_1631 - 1);
    highp int tmpvar_1756;
    if ((_us_1751 >= 0)) {
      tmpvar_1756 = 0;
    } else {
      tmpvar_1756 = 1;
    };
    highp int tmpvar_1757;
    tmpvar_1757 = (2 + tmpvar_1756);
    _uidx1_1752 = tmpvar_1757;
    if ((tmpvar_1755 < 0)) {
      highp int tmpvar_1758;
      if ((_us_1751 >= 0)) {
        tmpvar_1758 = 1;
      } else {
        tmpvar_1758 = 0;
      };
      _uidx1_1752 = (2 + tmpvar_1758);
    };
    highp int tmpvar_1759;
    if ((tmpvar_1755 < 0)) {
      tmpvar_1759 = 3;
    } else {
      tmpvar_1759 = tmpvar_1755;
    };
    float tmpvar_1760;
    tmpvar_1760 = cos(((
      (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(_uidx1_1752), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_1759), 0.0, 3.0)
      )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(tmpvar_1757), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_1631), 0.0, 3.0)
      )], tmpvar_1754))
     * 3.141593) / 180.0));
    highp int _us_1761;
    _us_1761 = -1;
    highp int _uidx1_1762;
    highp int tmpvar_1763;
    if ((tmpvar_1632 == 0)) {
      tmpvar_1763 = 1;
    } else {
      tmpvar_1763 = -1;
    };
    _us_1761 = -(tmpvar_1763);
    float tmpvar_1764;
    tmpvar_1764 = fract((iTime * 4.0));
    highp int tmpvar_1765;
    tmpvar_1765 = (tmpvar_1631 - 1);
    highp int tmpvar_1766;
    if ((_us_1761 >= 0)) {
      tmpvar_1766 = 0;
    } else {
      tmpvar_1766 = 1;
    };
    highp int tmpvar_1767;
    tmpvar_1767 = (2 + tmpvar_1766);
    _uidx1_1762 = tmpvar_1767;
    if ((tmpvar_1765 < 0)) {
      highp int tmpvar_1768;
      if ((_us_1761 >= 0)) {
        tmpvar_1768 = 1;
      } else {
        tmpvar_1768 = 0;
      };
      _uidx1_1762 = (2 + tmpvar_1768);
    };
    highp int tmpvar_1769;
    if ((tmpvar_1765 < 0)) {
      tmpvar_1769 = 3;
    } else {
      tmpvar_1769 = tmpvar_1765;
    };
    float tmpvar_1770;
    tmpvar_1770 = sin(((
      (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(_uidx1_1762), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_1769), 0.0, 3.0)
      )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(tmpvar_1767), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_1631), 0.0, 3.0)
      )], tmpvar_1764))
     * 3.141593) / 180.0));
    highp int _us_1771;
    _us_1771 = -1;
    highp int _uidx1_1772;
    highp int tmpvar_1773;
    if ((tmpvar_1632 == 0)) {
      tmpvar_1773 = 1;
    } else {
      tmpvar_1773 = -1;
    };
    _us_1771 = -(tmpvar_1773);
    float tmpvar_1774;
    tmpvar_1774 = fract((iTime * 4.0));
    highp int tmpvar_1775;
    tmpvar_1775 = (tmpvar_1631 - 1);
    highp int tmpvar_1776;
    if ((_us_1771 >= 0)) {
      tmpvar_1776 = 0;
    } else {
      tmpvar_1776 = 1;
    };
    highp int tmpvar_1777;
    tmpvar_1777 = (2 + tmpvar_1776);
    _uidx1_1772 = tmpvar_1777;
    if ((tmpvar_1775 < 0)) {
      highp int tmpvar_1778;
      if ((_us_1771 >= 0)) {
        tmpvar_1778 = 1;
      } else {
        tmpvar_1778 = 0;
      };
      _uidx1_1772 = (2 + tmpvar_1778);
    };
    highp int tmpvar_1779;
    if ((tmpvar_1775 < 0)) {
      tmpvar_1779 = 3;
    } else {
      tmpvar_1779 = tmpvar_1775;
    };
    float tmpvar_1780;
    tmpvar_1780 = sin(((
      (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(_uidx1_1772), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_1779), 0.0, 3.0)
      )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(tmpvar_1777), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_1631), 0.0, 3.0)
      )], tmpvar_1774))
     * 3.141593) / 180.0));
    highp int _us_1781;
    _us_1781 = -1;
    highp int _uidx1_1782;
    highp int tmpvar_1783;
    if ((tmpvar_1632 == 0)) {
      tmpvar_1783 = 1;
    } else {
      tmpvar_1783 = -1;
    };
    _us_1781 = -(tmpvar_1783);
    float tmpvar_1784;
    tmpvar_1784 = fract((iTime * 4.0));
    highp int tmpvar_1785;
    tmpvar_1785 = (tmpvar_1631 - 1);
    highp int tmpvar_1786;
    if ((_us_1781 >= 0)) {
      tmpvar_1786 = 0;
    } else {
      tmpvar_1786 = 1;
    };
    highp int tmpvar_1787;
    tmpvar_1787 = (2 + tmpvar_1786);
    _uidx1_1782 = tmpvar_1787;
    if ((tmpvar_1785 < 0)) {
      highp int tmpvar_1788;
      if ((_us_1781 >= 0)) {
        tmpvar_1788 = 1;
      } else {
        tmpvar_1788 = 0;
      };
      _uidx1_1782 = (2 + tmpvar_1788);
    };
    highp int tmpvar_1789;
    if ((tmpvar_1785 < 0)) {
      tmpvar_1789 = 3;
    } else {
      tmpvar_1789 = tmpvar_1785;
    };
    mat2 tmpvar_1790;
    tmpvar_1790[uint(0)].x = tmpvar_1760;
    tmpvar_1790[uint(0)].y = tmpvar_1770;
    tmpvar_1790[1u].x = -(tmpvar_1780);
    tmpvar_1790[1u].y = cos(((
      (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(_uidx1_1782), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_1789), 0.0, 3.0)
      )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(tmpvar_1787), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_1631), 0.0, 3.0)
      )], tmpvar_1784))
     * 3.141593) / 180.0));
    _upLeg0R_1622.yz = (_upLeg0R_1622.yz * tmpvar_1790);
    highp vec3 tmpvar_1791;
    tmpvar_1791 = (abs((_upLeg0R_1622 - vec3(0.0, 0.1, 0.0))) - vec3(0.025, 0.1, 0.025));
    highp vec3 tmpvar_1792;
    tmpvar_1792 = max (tmpvar_1791, 0.0);
    highp float tmpvar_1793;
    tmpvar_1793 = min (tmpvar_1748, (sqrt(
      dot (tmpvar_1792, tmpvar_1792)
    ) + min (
      max (tmpvar_1791.x, max (tmpvar_1791.y, tmpvar_1791.z))
    , 0.0)));
    highp vec3 tmpvar_1794;
    tmpvar_1794 = (_upLeg0R_1622 + vec3(-0.01, -0.18, 0.02));
    _upLeg1R_1621 = tmpvar_1794;
    highp int _us_1795;
    _us_1795 = -1;
    highp int _uidx1_1796;
    highp int tmpvar_1797;
    if ((tmpvar_1632 == 0)) {
      tmpvar_1797 = 1;
    } else {
      tmpvar_1797 = -1;
    };
    _us_1795 = -(tmpvar_1797);
    float tmpvar_1798;
    tmpvar_1798 = fract((iTime * 4.0));
    highp int tmpvar_1799;
    tmpvar_1799 = (tmpvar_1631 - 1);
    highp int tmpvar_1800;
    if ((_us_1795 >= 0)) {
      tmpvar_1800 = 0;
    } else {
      tmpvar_1800 = 1;
    };
    highp int tmpvar_1801;
    tmpvar_1801 = (4 + tmpvar_1800);
    _uidx1_1796 = tmpvar_1801;
    if ((tmpvar_1799 < 0)) {
      highp int tmpvar_1802;
      if ((_us_1795 >= 0)) {
        tmpvar_1802 = 1;
      } else {
        tmpvar_1802 = 0;
      };
      _uidx1_1796 = (4 + tmpvar_1802);
    };
    highp int tmpvar_1803;
    if ((tmpvar_1799 < 0)) {
      tmpvar_1803 = 3;
    } else {
      tmpvar_1803 = tmpvar_1799;
    };
    float tmpvar_1804;
    tmpvar_1804 = cos(((
      mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(_uidx1_1796)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_1803)
      , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(tmpvar_1801)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_1631)
      , 0.0, 3.0))], tmpvar_1798)
     * 3.141593) / 180.0));
    highp int _us_1805;
    _us_1805 = -1;
    highp int _uidx1_1806;
    highp int tmpvar_1807;
    if ((tmpvar_1632 == 0)) {
      tmpvar_1807 = 1;
    } else {
      tmpvar_1807 = -1;
    };
    _us_1805 = -(tmpvar_1807);
    float tmpvar_1808;
    tmpvar_1808 = fract((iTime * 4.0));
    highp int tmpvar_1809;
    tmpvar_1809 = (tmpvar_1631 - 1);
    highp int tmpvar_1810;
    if ((_us_1805 >= 0)) {
      tmpvar_1810 = 0;
    } else {
      tmpvar_1810 = 1;
    };
    highp int tmpvar_1811;
    tmpvar_1811 = (4 + tmpvar_1810);
    _uidx1_1806 = tmpvar_1811;
    if ((tmpvar_1809 < 0)) {
      highp int tmpvar_1812;
      if ((_us_1805 >= 0)) {
        tmpvar_1812 = 1;
      } else {
        tmpvar_1812 = 0;
      };
      _uidx1_1806 = (4 + tmpvar_1812);
    };
    highp int tmpvar_1813;
    if ((tmpvar_1809 < 0)) {
      tmpvar_1813 = 3;
    } else {
      tmpvar_1813 = tmpvar_1809;
    };
    float tmpvar_1814;
    tmpvar_1814 = sin(((
      mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(_uidx1_1806)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_1813)
      , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(tmpvar_1811)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_1631)
      , 0.0, 3.0))], tmpvar_1808)
     * 3.141593) / 180.0));
    highp int _us_1815;
    _us_1815 = -1;
    highp int _uidx1_1816;
    highp int tmpvar_1817;
    if ((tmpvar_1632 == 0)) {
      tmpvar_1817 = 1;
    } else {
      tmpvar_1817 = -1;
    };
    _us_1815 = -(tmpvar_1817);
    float tmpvar_1818;
    tmpvar_1818 = fract((iTime * 4.0));
    highp int tmpvar_1819;
    tmpvar_1819 = (tmpvar_1631 - 1);
    highp int tmpvar_1820;
    if ((_us_1815 >= 0)) {
      tmpvar_1820 = 0;
    } else {
      tmpvar_1820 = 1;
    };
    highp int tmpvar_1821;
    tmpvar_1821 = (4 + tmpvar_1820);
    _uidx1_1816 = tmpvar_1821;
    if ((tmpvar_1819 < 0)) {
      highp int tmpvar_1822;
      if ((_us_1815 >= 0)) {
        tmpvar_1822 = 1;
      } else {
        tmpvar_1822 = 0;
      };
      _uidx1_1816 = (4 + tmpvar_1822);
    };
    highp int tmpvar_1823;
    if ((tmpvar_1819 < 0)) {
      tmpvar_1823 = 3;
    } else {
      tmpvar_1823 = tmpvar_1819;
    };
    float tmpvar_1824;
    tmpvar_1824 = sin(((
      mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(_uidx1_1816)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_1823)
      , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(tmpvar_1821)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_1631)
      , 0.0, 3.0))], tmpvar_1818)
     * 3.141593) / 180.0));
    highp int _us_1825;
    _us_1825 = -1;
    highp int _uidx1_1826;
    highp int tmpvar_1827;
    if ((tmpvar_1632 == 0)) {
      tmpvar_1827 = 1;
    } else {
      tmpvar_1827 = -1;
    };
    _us_1825 = -(tmpvar_1827);
    float tmpvar_1828;
    tmpvar_1828 = fract((iTime * 4.0));
    highp int tmpvar_1829;
    tmpvar_1829 = (tmpvar_1631 - 1);
    highp int tmpvar_1830;
    if ((_us_1825 >= 0)) {
      tmpvar_1830 = 0;
    } else {
      tmpvar_1830 = 1;
    };
    highp int tmpvar_1831;
    tmpvar_1831 = (4 + tmpvar_1830);
    _uidx1_1826 = tmpvar_1831;
    if ((tmpvar_1829 < 0)) {
      highp int tmpvar_1832;
      if ((_us_1825 >= 0)) {
        tmpvar_1832 = 1;
      } else {
        tmpvar_1832 = 0;
      };
      _uidx1_1826 = (4 + tmpvar_1832);
    };
    highp int tmpvar_1833;
    if ((tmpvar_1829 < 0)) {
      tmpvar_1833 = 3;
    } else {
      tmpvar_1833 = tmpvar_1829;
    };
    mat2 tmpvar_1834;
    tmpvar_1834[uint(0)].x = tmpvar_1804;
    tmpvar_1834[uint(0)].y = tmpvar_1814;
    tmpvar_1834[1u].x = -(tmpvar_1824);
    tmpvar_1834[1u].y = cos(((
      mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(_uidx1_1826)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_1833)
      , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(tmpvar_1831)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_1631)
      , 0.0, 3.0))], tmpvar_1828)
     * 3.141593) / 180.0));
    _upLeg1R_1621.yz = (tmpvar_1794.yz * tmpvar_1834);
    highp vec3 tmpvar_1835;
    tmpvar_1835 = (abs((_upLeg1R_1621 - vec3(0.0, 0.1, 0.0))) - vec3(0.025, 0.1, 0.025));
    highp vec3 tmpvar_1836;
    tmpvar_1836 = max (tmpvar_1835, 0.0);
    highp float tmpvar_1837;
    tmpvar_1837 = min (tmpvar_1793, (sqrt(
      dot (tmpvar_1836, tmpvar_1836)
    ) + min (
      max (tmpvar_1835.x, max (tmpvar_1835.y, tmpvar_1835.z))
    , 0.0)));
    highp vec3 tmpvar_1838;
    tmpvar_1838 = (_upChest_1627 + vec3(0.125, -0.1, 0.0));
    _upArm0L_1620 = tmpvar_1838;
    highp int _uidx1_1839;
    highp int tmpvar_1840;
    if ((tmpvar_1632 == 0)) {
      tmpvar_1840 = 1;
    } else {
      tmpvar_1840 = -1;
    };
    float tmpvar_1841;
    tmpvar_1841 = fract((iTime * 4.0));
    highp int tmpvar_1842;
    tmpvar_1842 = (tmpvar_1631 - 1);
    highp int tmpvar_1843;
    if ((tmpvar_1840 >= 0)) {
      tmpvar_1843 = 0;
    } else {
      tmpvar_1843 = 1;
    };
    highp int tmpvar_1844;
    tmpvar_1844 = (6 + tmpvar_1843);
    _uidx1_1839 = tmpvar_1844;
    if ((tmpvar_1842 < 0)) {
      highp int tmpvar_1845;
      if ((tmpvar_1840 >= 0)) {
        tmpvar_1845 = 1;
      } else {
        tmpvar_1845 = 0;
      };
      _uidx1_1839 = (6 + tmpvar_1845);
    };
    highp int tmpvar_1846;
    if ((tmpvar_1842 < 0)) {
      tmpvar_1846 = 3;
    } else {
      tmpvar_1846 = tmpvar_1842;
    };
    float tmpvar_1847;
    tmpvar_1847 = cos(((
      (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(_uidx1_1839), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_1846), 0.0, 3.0)
      )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(tmpvar_1844), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_1631), 0.0, 3.0)
      )], tmpvar_1841))
     * 3.141593) / 180.0));
    highp int _uidx1_1848;
    highp int tmpvar_1849;
    if ((tmpvar_1632 == 0)) {
      tmpvar_1849 = 1;
    } else {
      tmpvar_1849 = -1;
    };
    float tmpvar_1850;
    tmpvar_1850 = fract((iTime * 4.0));
    highp int tmpvar_1851;
    tmpvar_1851 = (tmpvar_1631 - 1);
    highp int tmpvar_1852;
    if ((tmpvar_1849 >= 0)) {
      tmpvar_1852 = 0;
    } else {
      tmpvar_1852 = 1;
    };
    highp int tmpvar_1853;
    tmpvar_1853 = (6 + tmpvar_1852);
    _uidx1_1848 = tmpvar_1853;
    if ((tmpvar_1851 < 0)) {
      highp int tmpvar_1854;
      if ((tmpvar_1849 >= 0)) {
        tmpvar_1854 = 1;
      } else {
        tmpvar_1854 = 0;
      };
      _uidx1_1848 = (6 + tmpvar_1854);
    };
    highp int tmpvar_1855;
    if ((tmpvar_1851 < 0)) {
      tmpvar_1855 = 3;
    } else {
      tmpvar_1855 = tmpvar_1851;
    };
    float tmpvar_1856;
    tmpvar_1856 = sin(((
      (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(_uidx1_1848), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_1855), 0.0, 3.0)
      )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(tmpvar_1853), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_1631), 0.0, 3.0)
      )], tmpvar_1850))
     * 3.141593) / 180.0));
    highp int _uidx1_1857;
    highp int tmpvar_1858;
    if ((tmpvar_1632 == 0)) {
      tmpvar_1858 = 1;
    } else {
      tmpvar_1858 = -1;
    };
    float tmpvar_1859;
    tmpvar_1859 = fract((iTime * 4.0));
    highp int tmpvar_1860;
    tmpvar_1860 = (tmpvar_1631 - 1);
    highp int tmpvar_1861;
    if ((tmpvar_1858 >= 0)) {
      tmpvar_1861 = 0;
    } else {
      tmpvar_1861 = 1;
    };
    highp int tmpvar_1862;
    tmpvar_1862 = (6 + tmpvar_1861);
    _uidx1_1857 = tmpvar_1862;
    if ((tmpvar_1860 < 0)) {
      highp int tmpvar_1863;
      if ((tmpvar_1858 >= 0)) {
        tmpvar_1863 = 1;
      } else {
        tmpvar_1863 = 0;
      };
      _uidx1_1857 = (6 + tmpvar_1863);
    };
    highp int tmpvar_1864;
    if ((tmpvar_1860 < 0)) {
      tmpvar_1864 = 3;
    } else {
      tmpvar_1864 = tmpvar_1860;
    };
    float tmpvar_1865;
    tmpvar_1865 = sin(((
      (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(_uidx1_1857), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_1864), 0.0, 3.0)
      )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(tmpvar_1862), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_1631), 0.0, 3.0)
      )], tmpvar_1859))
     * 3.141593) / 180.0));
    highp int _uidx1_1866;
    highp int tmpvar_1867;
    if ((tmpvar_1632 == 0)) {
      tmpvar_1867 = 1;
    } else {
      tmpvar_1867 = -1;
    };
    float tmpvar_1868;
    tmpvar_1868 = fract((iTime * 4.0));
    highp int tmpvar_1869;
    tmpvar_1869 = (tmpvar_1631 - 1);
    highp int tmpvar_1870;
    if ((tmpvar_1867 >= 0)) {
      tmpvar_1870 = 0;
    } else {
      tmpvar_1870 = 1;
    };
    highp int tmpvar_1871;
    tmpvar_1871 = (6 + tmpvar_1870);
    _uidx1_1866 = tmpvar_1871;
    if ((tmpvar_1869 < 0)) {
      highp int tmpvar_1872;
      if ((tmpvar_1867 >= 0)) {
        tmpvar_1872 = 1;
      } else {
        tmpvar_1872 = 0;
      };
      _uidx1_1866 = (6 + tmpvar_1872);
    };
    highp int tmpvar_1873;
    if ((tmpvar_1869 < 0)) {
      tmpvar_1873 = 3;
    } else {
      tmpvar_1873 = tmpvar_1869;
    };
    mat2 tmpvar_1874;
    tmpvar_1874[uint(0)].x = tmpvar_1847;
    tmpvar_1874[uint(0)].y = tmpvar_1856;
    tmpvar_1874[1u].x = -(tmpvar_1865);
    tmpvar_1874[1u].y = cos(((
      (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(_uidx1_1866), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_1873), 0.0, 3.0)
      )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(tmpvar_1871), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_1631), 0.0, 3.0)
      )], tmpvar_1868))
     * 3.141593) / 180.0));
    _upArm0L_1620.yz = (tmpvar_1838.yz * tmpvar_1874);
    highp vec3 tmpvar_1875;
    tmpvar_1875 = (abs((_upArm0L_1620 - vec3(0.0, 0.08, 0.0))) - vec3(0.02, 0.08, 0.02));
    highp vec3 tmpvar_1876;
    tmpvar_1876 = max (tmpvar_1875, 0.0);
    highp float tmpvar_1877;
    tmpvar_1877 = min (tmpvar_1837, (sqrt(
      dot (tmpvar_1876, tmpvar_1876)
    ) + min (
      max (tmpvar_1875.x, max (tmpvar_1875.y, tmpvar_1875.z))
    , 0.0)));
    highp vec3 tmpvar_1878;
    tmpvar_1878 = (_upArm0L_1620 + vec3(0.0, -0.16, 0.0));
    _upArm1L_1619 = tmpvar_1878;
    highp int _uidx1_1879;
    highp int tmpvar_1880;
    if ((tmpvar_1632 == 0)) {
      tmpvar_1880 = 1;
    } else {
      tmpvar_1880 = -1;
    };
    float tmpvar_1881;
    tmpvar_1881 = fract((iTime * 4.0));
    highp int tmpvar_1882;
    tmpvar_1882 = (tmpvar_1631 - 1);
    highp int tmpvar_1883;
    if ((tmpvar_1880 >= 0)) {
      tmpvar_1883 = 0;
    } else {
      tmpvar_1883 = 1;
    };
    highp int tmpvar_1884;
    tmpvar_1884 = (8 + tmpvar_1883);
    _uidx1_1879 = tmpvar_1884;
    if ((tmpvar_1882 < 0)) {
      highp int tmpvar_1885;
      if ((tmpvar_1880 >= 0)) {
        tmpvar_1885 = 1;
      } else {
        tmpvar_1885 = 0;
      };
      _uidx1_1879 = (8 + tmpvar_1885);
    };
    highp int tmpvar_1886;
    if ((tmpvar_1882 < 0)) {
      tmpvar_1886 = 3;
    } else {
      tmpvar_1886 = tmpvar_1882;
    };
    float tmpvar_1887;
    tmpvar_1887 = cos(((
      mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(_uidx1_1879)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_1886)
      , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(tmpvar_1884)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_1631)
      , 0.0, 3.0))], tmpvar_1881)
     * 3.141593) / 180.0));
    highp int _uidx1_1888;
    highp int tmpvar_1889;
    if ((tmpvar_1632 == 0)) {
      tmpvar_1889 = 1;
    } else {
      tmpvar_1889 = -1;
    };
    float tmpvar_1890;
    tmpvar_1890 = fract((iTime * 4.0));
    highp int tmpvar_1891;
    tmpvar_1891 = (tmpvar_1631 - 1);
    highp int tmpvar_1892;
    if ((tmpvar_1889 >= 0)) {
      tmpvar_1892 = 0;
    } else {
      tmpvar_1892 = 1;
    };
    highp int tmpvar_1893;
    tmpvar_1893 = (8 + tmpvar_1892);
    _uidx1_1888 = tmpvar_1893;
    if ((tmpvar_1891 < 0)) {
      highp int tmpvar_1894;
      if ((tmpvar_1889 >= 0)) {
        tmpvar_1894 = 1;
      } else {
        tmpvar_1894 = 0;
      };
      _uidx1_1888 = (8 + tmpvar_1894);
    };
    highp int tmpvar_1895;
    if ((tmpvar_1891 < 0)) {
      tmpvar_1895 = 3;
    } else {
      tmpvar_1895 = tmpvar_1891;
    };
    float tmpvar_1896;
    tmpvar_1896 = sin(((
      mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(_uidx1_1888)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_1895)
      , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(tmpvar_1893)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_1631)
      , 0.0, 3.0))], tmpvar_1890)
     * 3.141593) / 180.0));
    highp int _uidx1_1897;
    highp int tmpvar_1898;
    if ((tmpvar_1632 == 0)) {
      tmpvar_1898 = 1;
    } else {
      tmpvar_1898 = -1;
    };
    float tmpvar_1899;
    tmpvar_1899 = fract((iTime * 4.0));
    highp int tmpvar_1900;
    tmpvar_1900 = (tmpvar_1631 - 1);
    highp int tmpvar_1901;
    if ((tmpvar_1898 >= 0)) {
      tmpvar_1901 = 0;
    } else {
      tmpvar_1901 = 1;
    };
    highp int tmpvar_1902;
    tmpvar_1902 = (8 + tmpvar_1901);
    _uidx1_1897 = tmpvar_1902;
    if ((tmpvar_1900 < 0)) {
      highp int tmpvar_1903;
      if ((tmpvar_1898 >= 0)) {
        tmpvar_1903 = 1;
      } else {
        tmpvar_1903 = 0;
      };
      _uidx1_1897 = (8 + tmpvar_1903);
    };
    highp int tmpvar_1904;
    if ((tmpvar_1900 < 0)) {
      tmpvar_1904 = 3;
    } else {
      tmpvar_1904 = tmpvar_1900;
    };
    float tmpvar_1905;
    tmpvar_1905 = sin(((
      mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(_uidx1_1897)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_1904)
      , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(tmpvar_1902)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_1631)
      , 0.0, 3.0))], tmpvar_1899)
     * 3.141593) / 180.0));
    highp int _uidx1_1906;
    highp int tmpvar_1907;
    if ((tmpvar_1632 == 0)) {
      tmpvar_1907 = 1;
    } else {
      tmpvar_1907 = -1;
    };
    float tmpvar_1908;
    tmpvar_1908 = fract((iTime * 4.0));
    highp int tmpvar_1909;
    tmpvar_1909 = (tmpvar_1631 - 1);
    highp int tmpvar_1910;
    if ((tmpvar_1907 >= 0)) {
      tmpvar_1910 = 0;
    } else {
      tmpvar_1910 = 1;
    };
    highp int tmpvar_1911;
    tmpvar_1911 = (8 + tmpvar_1910);
    _uidx1_1906 = tmpvar_1911;
    if ((tmpvar_1909 < 0)) {
      highp int tmpvar_1912;
      if ((tmpvar_1907 >= 0)) {
        tmpvar_1912 = 1;
      } else {
        tmpvar_1912 = 0;
      };
      _uidx1_1906 = (8 + tmpvar_1912);
    };
    highp int tmpvar_1913;
    if ((tmpvar_1909 < 0)) {
      tmpvar_1913 = 3;
    } else {
      tmpvar_1913 = tmpvar_1909;
    };
    mat2 tmpvar_1914;
    tmpvar_1914[uint(0)].x = tmpvar_1887;
    tmpvar_1914[uint(0)].y = tmpvar_1896;
    tmpvar_1914[1u].x = -(tmpvar_1905);
    tmpvar_1914[1u].y = cos(((
      mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(_uidx1_1906)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_1913)
      , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(tmpvar_1911)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_1631)
      , 0.0, 3.0))], tmpvar_1908)
     * 3.141593) / 180.0));
    _upArm1L_1619.yz = (tmpvar_1878.yz * tmpvar_1914);
    highp vec3 tmpvar_1915;
    tmpvar_1915 = (abs((_upArm1L_1619 - vec3(0.0, 0.08, 0.0))) - vec3(0.02, 0.08, 0.02));
    highp vec3 tmpvar_1916;
    tmpvar_1916 = max (tmpvar_1915, 0.0);
    highp float tmpvar_1917;
    tmpvar_1917 = min (tmpvar_1877, (sqrt(
      dot (tmpvar_1916, tmpvar_1916)
    ) + min (
      max (tmpvar_1915.x, max (tmpvar_1915.y, tmpvar_1915.z))
    , 0.0)));
    highp vec3 tmpvar_1918;
    tmpvar_1918 = (_upChest_1627 + vec3(-0.125, -0.1, 0.0));
    _upArm0R_1618 = tmpvar_1918;
    highp int _us_1919;
    _us_1919 = -1;
    highp int _uidx1_1920;
    highp int tmpvar_1921;
    if ((tmpvar_1632 == 0)) {
      tmpvar_1921 = 1;
    } else {
      tmpvar_1921 = -1;
    };
    _us_1919 = -(tmpvar_1921);
    float tmpvar_1922;
    tmpvar_1922 = fract((iTime * 4.0));
    highp int tmpvar_1923;
    tmpvar_1923 = (tmpvar_1631 - 1);
    highp int tmpvar_1924;
    if ((_us_1919 >= 0)) {
      tmpvar_1924 = 0;
    } else {
      tmpvar_1924 = 1;
    };
    highp int tmpvar_1925;
    tmpvar_1925 = (6 + tmpvar_1924);
    _uidx1_1920 = tmpvar_1925;
    if ((tmpvar_1923 < 0)) {
      highp int tmpvar_1926;
      if ((_us_1919 >= 0)) {
        tmpvar_1926 = 1;
      } else {
        tmpvar_1926 = 0;
      };
      _uidx1_1920 = (6 + tmpvar_1926);
    };
    highp int tmpvar_1927;
    if ((tmpvar_1923 < 0)) {
      tmpvar_1927 = 3;
    } else {
      tmpvar_1927 = tmpvar_1923;
    };
    float tmpvar_1928;
    tmpvar_1928 = cos(((
      (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(_uidx1_1920), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_1927), 0.0, 3.0)
      )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(tmpvar_1925), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_1631), 0.0, 3.0)
      )], tmpvar_1922))
     * 3.141593) / 180.0));
    highp int _us_1929;
    _us_1929 = -1;
    highp int _uidx1_1930;
    highp int tmpvar_1931;
    if ((tmpvar_1632 == 0)) {
      tmpvar_1931 = 1;
    } else {
      tmpvar_1931 = -1;
    };
    _us_1929 = -(tmpvar_1931);
    float tmpvar_1932;
    tmpvar_1932 = fract((iTime * 4.0));
    highp int tmpvar_1933;
    tmpvar_1933 = (tmpvar_1631 - 1);
    highp int tmpvar_1934;
    if ((_us_1929 >= 0)) {
      tmpvar_1934 = 0;
    } else {
      tmpvar_1934 = 1;
    };
    highp int tmpvar_1935;
    tmpvar_1935 = (6 + tmpvar_1934);
    _uidx1_1930 = tmpvar_1935;
    if ((tmpvar_1933 < 0)) {
      highp int tmpvar_1936;
      if ((_us_1929 >= 0)) {
        tmpvar_1936 = 1;
      } else {
        tmpvar_1936 = 0;
      };
      _uidx1_1930 = (6 + tmpvar_1936);
    };
    highp int tmpvar_1937;
    if ((tmpvar_1933 < 0)) {
      tmpvar_1937 = 3;
    } else {
      tmpvar_1937 = tmpvar_1933;
    };
    float tmpvar_1938;
    tmpvar_1938 = sin(((
      (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(_uidx1_1930), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_1937), 0.0, 3.0)
      )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(tmpvar_1935), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_1631), 0.0, 3.0)
      )], tmpvar_1932))
     * 3.141593) / 180.0));
    highp int _us_1939;
    _us_1939 = -1;
    highp int _uidx1_1940;
    highp int tmpvar_1941;
    if ((tmpvar_1632 == 0)) {
      tmpvar_1941 = 1;
    } else {
      tmpvar_1941 = -1;
    };
    _us_1939 = -(tmpvar_1941);
    float tmpvar_1942;
    tmpvar_1942 = fract((iTime * 4.0));
    highp int tmpvar_1943;
    tmpvar_1943 = (tmpvar_1631 - 1);
    highp int tmpvar_1944;
    if ((_us_1939 >= 0)) {
      tmpvar_1944 = 0;
    } else {
      tmpvar_1944 = 1;
    };
    highp int tmpvar_1945;
    tmpvar_1945 = (6 + tmpvar_1944);
    _uidx1_1940 = tmpvar_1945;
    if ((tmpvar_1943 < 0)) {
      highp int tmpvar_1946;
      if ((_us_1939 >= 0)) {
        tmpvar_1946 = 1;
      } else {
        tmpvar_1946 = 0;
      };
      _uidx1_1940 = (6 + tmpvar_1946);
    };
    highp int tmpvar_1947;
    if ((tmpvar_1943 < 0)) {
      tmpvar_1947 = 3;
    } else {
      tmpvar_1947 = tmpvar_1943;
    };
    float tmpvar_1948;
    tmpvar_1948 = sin(((
      (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(_uidx1_1940), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_1947), 0.0, 3.0)
      )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(tmpvar_1945), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_1631), 0.0, 3.0)
      )], tmpvar_1942))
     * 3.141593) / 180.0));
    highp int _us_1949;
    _us_1949 = -1;
    highp int _uidx1_1950;
    highp int tmpvar_1951;
    if ((tmpvar_1632 == 0)) {
      tmpvar_1951 = 1;
    } else {
      tmpvar_1951 = -1;
    };
    _us_1949 = -(tmpvar_1951);
    float tmpvar_1952;
    tmpvar_1952 = fract((iTime * 4.0));
    highp int tmpvar_1953;
    tmpvar_1953 = (tmpvar_1631 - 1);
    highp int tmpvar_1954;
    if ((_us_1949 >= 0)) {
      tmpvar_1954 = 0;
    } else {
      tmpvar_1954 = 1;
    };
    highp int tmpvar_1955;
    tmpvar_1955 = (6 + tmpvar_1954);
    _uidx1_1950 = tmpvar_1955;
    if ((tmpvar_1953 < 0)) {
      highp int tmpvar_1956;
      if ((_us_1949 >= 0)) {
        tmpvar_1956 = 1;
      } else {
        tmpvar_1956 = 0;
      };
      _uidx1_1950 = (6 + tmpvar_1956);
    };
    highp int tmpvar_1957;
    if ((tmpvar_1953 < 0)) {
      tmpvar_1957 = 3;
    } else {
      tmpvar_1957 = tmpvar_1953;
    };
    mat2 tmpvar_1958;
    tmpvar_1958[uint(0)].x = tmpvar_1928;
    tmpvar_1958[uint(0)].y = tmpvar_1938;
    tmpvar_1958[1u].x = -(tmpvar_1948);
    tmpvar_1958[1u].y = cos(((
      (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(_uidx1_1950), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_1957), 0.0, 3.0)
      )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(tmpvar_1955), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_1631), 0.0, 3.0)
      )], tmpvar_1952))
     * 3.141593) / 180.0));
    _upArm0R_1618.yz = (tmpvar_1918.yz * tmpvar_1958);
    highp vec3 tmpvar_1959;
    tmpvar_1959 = (abs((_upArm0R_1618 - vec3(0.0, 0.08, 0.0))) - vec3(0.02, 0.08, 0.02));
    highp vec3 tmpvar_1960;
    tmpvar_1960 = max (tmpvar_1959, 0.0);
    highp float tmpvar_1961;
    tmpvar_1961 = min (tmpvar_1917, (sqrt(
      dot (tmpvar_1960, tmpvar_1960)
    ) + min (
      max (tmpvar_1959.x, max (tmpvar_1959.y, tmpvar_1959.z))
    , 0.0)));
    highp vec3 tmpvar_1962;
    tmpvar_1962 = (_upArm0R_1618 + vec3(0.0, -0.16, 0.0));
    _upArm1R_1617 = tmpvar_1962;
    highp int _us_1963;
    _us_1963 = -1;
    highp int _uidx1_1964;
    highp int tmpvar_1965;
    if ((tmpvar_1632 == 0)) {
      tmpvar_1965 = 1;
    } else {
      tmpvar_1965 = -1;
    };
    _us_1963 = -(tmpvar_1965);
    float tmpvar_1966;
    tmpvar_1966 = fract((iTime * 4.0));
    highp int tmpvar_1967;
    tmpvar_1967 = (tmpvar_1631 - 1);
    highp int tmpvar_1968;
    if ((_us_1963 >= 0)) {
      tmpvar_1968 = 0;
    } else {
      tmpvar_1968 = 1;
    };
    highp int tmpvar_1969;
    tmpvar_1969 = (8 + tmpvar_1968);
    _uidx1_1964 = tmpvar_1969;
    if ((tmpvar_1967 < 0)) {
      highp int tmpvar_1970;
      if ((_us_1963 >= 0)) {
        tmpvar_1970 = 1;
      } else {
        tmpvar_1970 = 0;
      };
      _uidx1_1964 = (8 + tmpvar_1970);
    };
    highp int tmpvar_1971;
    if ((tmpvar_1967 < 0)) {
      tmpvar_1971 = 3;
    } else {
      tmpvar_1971 = tmpvar_1967;
    };
    float tmpvar_1972;
    tmpvar_1972 = cos(((
      mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(_uidx1_1964)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_1971)
      , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(tmpvar_1969)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_1631)
      , 0.0, 3.0))], tmpvar_1966)
     * 3.141593) / 180.0));
    highp int _us_1973;
    _us_1973 = -1;
    highp int _uidx1_1974;
    highp int tmpvar_1975;
    if ((tmpvar_1632 == 0)) {
      tmpvar_1975 = 1;
    } else {
      tmpvar_1975 = -1;
    };
    _us_1973 = -(tmpvar_1975);
    float tmpvar_1976;
    tmpvar_1976 = fract((iTime * 4.0));
    highp int tmpvar_1977;
    tmpvar_1977 = (tmpvar_1631 - 1);
    highp int tmpvar_1978;
    if ((_us_1973 >= 0)) {
      tmpvar_1978 = 0;
    } else {
      tmpvar_1978 = 1;
    };
    highp int tmpvar_1979;
    tmpvar_1979 = (8 + tmpvar_1978);
    _uidx1_1974 = tmpvar_1979;
    if ((tmpvar_1977 < 0)) {
      highp int tmpvar_1980;
      if ((_us_1973 >= 0)) {
        tmpvar_1980 = 1;
      } else {
        tmpvar_1980 = 0;
      };
      _uidx1_1974 = (8 + tmpvar_1980);
    };
    highp int tmpvar_1981;
    if ((tmpvar_1977 < 0)) {
      tmpvar_1981 = 3;
    } else {
      tmpvar_1981 = tmpvar_1977;
    };
    float tmpvar_1982;
    tmpvar_1982 = sin(((
      mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(_uidx1_1974)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_1981)
      , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(tmpvar_1979)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_1631)
      , 0.0, 3.0))], tmpvar_1976)
     * 3.141593) / 180.0));
    highp int _us_1983;
    _us_1983 = -1;
    highp int _uidx1_1984;
    highp int tmpvar_1985;
    if ((tmpvar_1632 == 0)) {
      tmpvar_1985 = 1;
    } else {
      tmpvar_1985 = -1;
    };
    _us_1983 = -(tmpvar_1985);
    float tmpvar_1986;
    tmpvar_1986 = fract((iTime * 4.0));
    highp int tmpvar_1987;
    tmpvar_1987 = (tmpvar_1631 - 1);
    highp int tmpvar_1988;
    if ((_us_1983 >= 0)) {
      tmpvar_1988 = 0;
    } else {
      tmpvar_1988 = 1;
    };
    highp int tmpvar_1989;
    tmpvar_1989 = (8 + tmpvar_1988);
    _uidx1_1984 = tmpvar_1989;
    if ((tmpvar_1987 < 0)) {
      highp int tmpvar_1990;
      if ((_us_1983 >= 0)) {
        tmpvar_1990 = 1;
      } else {
        tmpvar_1990 = 0;
      };
      _uidx1_1984 = (8 + tmpvar_1990);
    };
    highp int tmpvar_1991;
    if ((tmpvar_1987 < 0)) {
      tmpvar_1991 = 3;
    } else {
      tmpvar_1991 = tmpvar_1987;
    };
    float tmpvar_1992;
    tmpvar_1992 = sin(((
      mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(_uidx1_1984)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_1991)
      , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(tmpvar_1989)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_1631)
      , 0.0, 3.0))], tmpvar_1986)
     * 3.141593) / 180.0));
    highp int _us_1993;
    _us_1993 = -1;
    highp int _uidx1_1994;
    highp int tmpvar_1995;
    if ((tmpvar_1632 == 0)) {
      tmpvar_1995 = 1;
    } else {
      tmpvar_1995 = -1;
    };
    _us_1993 = -(tmpvar_1995);
    float tmpvar_1996;
    tmpvar_1996 = fract((iTime * 4.0));
    highp int tmpvar_1997;
    tmpvar_1997 = (tmpvar_1631 - 1);
    highp int tmpvar_1998;
    if ((_us_1993 >= 0)) {
      tmpvar_1998 = 0;
    } else {
      tmpvar_1998 = 1;
    };
    highp int tmpvar_1999;
    tmpvar_1999 = (8 + tmpvar_1998);
    _uidx1_1994 = tmpvar_1999;
    if ((tmpvar_1997 < 0)) {
      highp int tmpvar_2000;
      if ((_us_1993 >= 0)) {
        tmpvar_2000 = 1;
      } else {
        tmpvar_2000 = 0;
      };
      _uidx1_1994 = (8 + tmpvar_2000);
    };
    highp int tmpvar_2001;
    if ((tmpvar_1997 < 0)) {
      tmpvar_2001 = 3;
    } else {
      tmpvar_2001 = tmpvar_1997;
    };
    mat2 tmpvar_2002;
    tmpvar_2002[uint(0)].x = tmpvar_1972;
    tmpvar_2002[uint(0)].y = tmpvar_1982;
    tmpvar_2002[1u].x = -(tmpvar_1992);
    tmpvar_2002[1u].y = cos(((
      mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(_uidx1_1994)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_2001)
      , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(tmpvar_1999)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_1631)
      , 0.0, 3.0))], tmpvar_1996)
     * 3.141593) / 180.0));
    _upArm1R_1617.yz = (tmpvar_1962.yz * tmpvar_2002);
    highp vec3 tmpvar_2003;
    tmpvar_2003 = (abs((_upArm1R_1617 - vec3(0.0, 0.08, 0.0))) - vec3(0.02, 0.08, 0.02));
    highp vec3 tmpvar_2004;
    tmpvar_2004 = max (tmpvar_2003, 0.0);
    highp float tmpvar_2005;
    tmpvar_2005 = min (tmpvar_1961, (sqrt(
      dot (tmpvar_2004, tmpvar_2004)
    ) + min (
      max (tmpvar_2003.x, max (tmpvar_2003.y, tmpvar_2003.z))
    , 0.0)));
    highp vec4 tmpvar_2006;
    if ((tmpvar_2005 < tmpvar_1607.x)) {
      highp vec3 _upArm1R_2007;
      highp vec3 _upArm0R_2008;
      highp vec3 _upArm1L_2009;
      highp vec3 _upArm0L_2010;
      highp vec3 _upLeg1R_2011;
      highp vec3 _upLeg0R_2012;
      highp vec3 _upLeg1L_2013;
      highp vec3 _upLeg0L_2014;
      highp vec3 _upHead_2015;
      highp vec3 _upNeck_2016;
      highp vec3 _upChest_2017;
      highp vec3 _upWaist_2018;
      highp vec3 _upPelvis_2019;
      float tmpvar_2020;
      tmpvar_2020 = (iTime * 4.0);
      highp int tmpvar_2021;
      tmpvar_2021 = ((int(tmpvar_2020)% 4));
      highp int tmpvar_2022;
      tmpvar_2022 = ((int((tmpvar_2020 / 4.0))% 2));
      highp int _uidx1_2023;
      highp int tmpvar_2024;
      if ((tmpvar_2022 == 0)) {
        tmpvar_2024 = 1;
      } else {
        tmpvar_2024 = -1;
      };
      float tmpvar_2025;
      tmpvar_2025 = fract((iTime * 4.0));
      highp int tmpvar_2026;
      tmpvar_2026 = (tmpvar_2021 - 1);
      highp int tmpvar_2027;
      if ((tmpvar_2024 >= 0)) {
        tmpvar_2027 = 0;
      } else {
        tmpvar_2027 = 1;
      };
      highp int tmpvar_2028;
      tmpvar_2028 = (10 + tmpvar_2027);
      _uidx1_2023 = tmpvar_2028;
      if ((tmpvar_2026 < 0)) {
        highp int tmpvar_2029;
        if ((tmpvar_2024 >= 0)) {
          tmpvar_2029 = 1;
        } else {
          tmpvar_2029 = 0;
        };
        _uidx1_2023 = (10 + tmpvar_2029);
      };
      highp int tmpvar_2030;
      if ((tmpvar_2026 < 0)) {
        tmpvar_2030 = 3;
      } else {
        tmpvar_2030 = tmpvar_2026;
      };
      float tmpvar_2031;
      tmpvar_2031 = ((mix (
        vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (float(_uidx1_2023), 0.0, 11.0))][int(clamp (float(tmpvar_2030), 0.0, 3.0))]
      , 
        vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (float(tmpvar_2028), 0.0, 11.0))][int(clamp (float(tmpvar_2021), 0.0, 3.0))]
      , tmpvar_2025) * 3.141593) / 180.0);
      highp int _uidx1_2032;
      highp int tmpvar_2033;
      if ((tmpvar_2022 == 0)) {
        tmpvar_2033 = 1;
      } else {
        tmpvar_2033 = -1;
      };
      float tmpvar_2034;
      tmpvar_2034 = fract((iTime * 4.0));
      highp int tmpvar_2035;
      tmpvar_2035 = (tmpvar_2021 - 1);
      highp int tmpvar_2036;
      if ((tmpvar_2033 >= 0)) {
        tmpvar_2036 = 0;
      } else {
        tmpvar_2036 = 1;
      };
      _uidx1_2032 = tmpvar_2036;
      if ((tmpvar_2035 < 0)) {
        highp int tmpvar_2037;
        if ((tmpvar_2033 >= 0)) {
          tmpvar_2037 = 1;
        } else {
          tmpvar_2037 = 0;
        };
        _uidx1_2032 = tmpvar_2037;
      };
      highp int tmpvar_2038;
      if ((tmpvar_2035 < 0)) {
        tmpvar_2038 = 3;
      } else {
        tmpvar_2038 = tmpvar_2035;
      };
      vec3 tmpvar_2039;
      tmpvar_2039.xz = vec2(0.0, 0.0);
      tmpvar_2039.y = (-0.5 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[
        int(clamp (float(_uidx1_2032), 0.0, 11.0))
      ][
        int(clamp (float(tmpvar_2038), 0.0, 3.0))
      ], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[
        int(clamp (float(tmpvar_2036), 0.0, 11.0))
      ][
        int(clamp (float(tmpvar_2021), 0.0, 3.0))
      ], tmpvar_2034));
      highp vec3 tmpvar_2040;
      tmpvar_2040 = (_up_1603 + tmpvar_2039);
      _upPelvis_2019.z = tmpvar_2040.z;
      mat2 tmpvar_2041;
      tmpvar_2041[uint(0)].x = cos(tmpvar_2031);
      tmpvar_2041[uint(0)].y = sin(tmpvar_2031);
      tmpvar_2041[1u].x = -(sin(tmpvar_2031));
      tmpvar_2041[1u].y = cos(tmpvar_2031);
      _upPelvis_2019.xy = (tmpvar_2040.xy * tmpvar_2041);
      highp vec3 tmpvar_2042;
      tmpvar_2042 = (abs((_upPelvis_2019 - vec3(0.0, 0.0, 0.025))) - vec3(0.085, 0.05, 0.05));
      highp vec3 tmpvar_2043;
      tmpvar_2043 = max (tmpvar_2042, 0.0);
      highp vec3 tmpvar_2044;
      tmpvar_2044 = (_upPelvis_2019 + vec3(0.0, -0.05, -0.02));
      _upWaist_2018.z = tmpvar_2044.z;
      mat2 tmpvar_2045;
      tmpvar_2045[uint(0)].x = cos(-(tmpvar_2031));
      tmpvar_2045[uint(0)].y = sin(-(tmpvar_2031));
      tmpvar_2045[1u].x = -(sin(-(tmpvar_2031)));
      tmpvar_2045[1u].y = cos(-(tmpvar_2031));
      _upWaist_2018.xy = (tmpvar_2044.xy * tmpvar_2045);
      _upWaist_2018.yz = (_upWaist_2018.yz * mat2(1.0, 0.0, -0.0, 1.0));
      highp vec3 tmpvar_2046;
      tmpvar_2046 = (abs((_upWaist_2018 - vec3(0.0, 0.04, 0.0))) - vec3(0.075, 0.08, 0.03));
      highp vec3 tmpvar_2047;
      tmpvar_2047 = max (tmpvar_2046, 0.0);
      highp vec3 tmpvar_2048;
      tmpvar_2048 = (_upWaist_2018 + vec3(0.0, -0.14, -0.01));
      _upChest_2017.x = tmpvar_2048.x;
      _upChest_2017.yz = (tmpvar_2048.yz * mat2(1.0, 0.0, -0.0, 1.0));
      highp vec3 tmpvar_2049;
      tmpvar_2049 = (abs((_upChest_2017 - vec3(0.0, 0.04, 0.0))) - vec3(0.09, 0.08, 0.05));
      highp vec3 tmpvar_2050;
      tmpvar_2050 = max (tmpvar_2049, 0.0);
      highp vec3 tmpvar_2051;
      tmpvar_2051 = (_upChest_2017 + vec3(0.0, -0.15, 0.0));
      _upNeck_2016.x = tmpvar_2051.x;
      _upNeck_2016.yz = (tmpvar_2051.yz * mat2(1.0, 0.0, -0.0, 1.0));
      highp vec3 tmpvar_2052;
      tmpvar_2052 = (abs((_upNeck_2016 - vec3(0.0, 0.01, 0.0))) - vec3(0.02, 0.04, 0.02));
      highp vec3 tmpvar_2053;
      tmpvar_2053 = max (tmpvar_2052, 0.0);
      highp vec3 tmpvar_2054;
      tmpvar_2054 = (_upNeck_2016 + vec3(0.0, -0.1, 0.0));
      _upHead_2015.x = tmpvar_2054.x;
      _upHead_2015.yz = (tmpvar_2054.yz * mat2(1.0, 0.0, -0.0, 1.0));
      highp vec3 tmpvar_2055;
      tmpvar_2055 = (abs((_upHead_2015 - vec3(0.0, 0.04, -0.025))) - vec3(0.05, 0.08, 0.06));
      highp vec3 tmpvar_2056;
      tmpvar_2056 = max (tmpvar_2055, 0.0);
      highp float tmpvar_2057;
      tmpvar_2057 = min (min (min (
        min (min (4.5, (sqrt(
          dot (tmpvar_2043, tmpvar_2043)
        ) + min (
          max (tmpvar_2042.x, max (tmpvar_2042.y, tmpvar_2042.z))
        , 0.0))), (sqrt(dot (tmpvar_2047, tmpvar_2047)) + min (max (tmpvar_2046.x, 
          max (tmpvar_2046.y, tmpvar_2046.z)
        ), 0.0)))
      , 
        (sqrt(dot (tmpvar_2050, tmpvar_2050)) + min (max (tmpvar_2049.x, max (tmpvar_2049.y, tmpvar_2049.z)), 0.0))
      ), (
        sqrt(dot (tmpvar_2053, tmpvar_2053))
       + 
        min (max (tmpvar_2052.x, max (tmpvar_2052.y, tmpvar_2052.z)), 0.0)
      )), (sqrt(
        dot (tmpvar_2056, tmpvar_2056)
      ) + min (
        max (tmpvar_2055.x, max (tmpvar_2055.y, tmpvar_2055.z))
      , 0.0)));
      highp vec3 tmpvar_2058;
      tmpvar_2058 = (_upPelvis_2019 + vec3(0.06, 0.025, 0.0));
      _upLeg0L_2014.z = tmpvar_2058.z;
      mat2 tmpvar_2059;
      tmpvar_2059[uint(0)].x = cos(-(tmpvar_2031));
      tmpvar_2059[uint(0)].y = sin(-(tmpvar_2031));
      tmpvar_2059[1u].x = -(sin(-(tmpvar_2031)));
      tmpvar_2059[1u].y = cos(-(tmpvar_2031));
      _upLeg0L_2014.xy = (tmpvar_2058.xy * tmpvar_2059);
      highp int _uidx1_2060;
      highp int tmpvar_2061;
      if ((tmpvar_2022 == 0)) {
        tmpvar_2061 = 1;
      } else {
        tmpvar_2061 = -1;
      };
      float tmpvar_2062;
      tmpvar_2062 = fract((iTime * 4.0));
      highp int tmpvar_2063;
      tmpvar_2063 = (tmpvar_2021 - 1);
      highp int tmpvar_2064;
      if ((tmpvar_2061 >= 0)) {
        tmpvar_2064 = 0;
      } else {
        tmpvar_2064 = 1;
      };
      highp int tmpvar_2065;
      tmpvar_2065 = (2 + tmpvar_2064);
      _uidx1_2060 = tmpvar_2065;
      if ((tmpvar_2063 < 0)) {
        highp int tmpvar_2066;
        if ((tmpvar_2061 >= 0)) {
          tmpvar_2066 = 1;
        } else {
          tmpvar_2066 = 0;
        };
        _uidx1_2060 = (2 + tmpvar_2066);
      };
      highp int tmpvar_2067;
      if ((tmpvar_2063 < 0)) {
        tmpvar_2067 = 3;
      } else {
        tmpvar_2067 = tmpvar_2063;
      };
      float tmpvar_2068;
      tmpvar_2068 = cos(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_2060), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_2067), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_2065), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_2021), 0.0, 3.0)
        )], tmpvar_2062))
       * 3.141593) / 180.0));
      highp int _uidx1_2069;
      highp int tmpvar_2070;
      if ((tmpvar_2022 == 0)) {
        tmpvar_2070 = 1;
      } else {
        tmpvar_2070 = -1;
      };
      float tmpvar_2071;
      tmpvar_2071 = fract((iTime * 4.0));
      highp int tmpvar_2072;
      tmpvar_2072 = (tmpvar_2021 - 1);
      highp int tmpvar_2073;
      if ((tmpvar_2070 >= 0)) {
        tmpvar_2073 = 0;
      } else {
        tmpvar_2073 = 1;
      };
      highp int tmpvar_2074;
      tmpvar_2074 = (2 + tmpvar_2073);
      _uidx1_2069 = tmpvar_2074;
      if ((tmpvar_2072 < 0)) {
        highp int tmpvar_2075;
        if ((tmpvar_2070 >= 0)) {
          tmpvar_2075 = 1;
        } else {
          tmpvar_2075 = 0;
        };
        _uidx1_2069 = (2 + tmpvar_2075);
      };
      highp int tmpvar_2076;
      if ((tmpvar_2072 < 0)) {
        tmpvar_2076 = 3;
      } else {
        tmpvar_2076 = tmpvar_2072;
      };
      float tmpvar_2077;
      tmpvar_2077 = sin(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_2069), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_2076), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_2074), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_2021), 0.0, 3.0)
        )], tmpvar_2071))
       * 3.141593) / 180.0));
      highp int _uidx1_2078;
      highp int tmpvar_2079;
      if ((tmpvar_2022 == 0)) {
        tmpvar_2079 = 1;
      } else {
        tmpvar_2079 = -1;
      };
      float tmpvar_2080;
      tmpvar_2080 = fract((iTime * 4.0));
      highp int tmpvar_2081;
      tmpvar_2081 = (tmpvar_2021 - 1);
      highp int tmpvar_2082;
      if ((tmpvar_2079 >= 0)) {
        tmpvar_2082 = 0;
      } else {
        tmpvar_2082 = 1;
      };
      highp int tmpvar_2083;
      tmpvar_2083 = (2 + tmpvar_2082);
      _uidx1_2078 = tmpvar_2083;
      if ((tmpvar_2081 < 0)) {
        highp int tmpvar_2084;
        if ((tmpvar_2079 >= 0)) {
          tmpvar_2084 = 1;
        } else {
          tmpvar_2084 = 0;
        };
        _uidx1_2078 = (2 + tmpvar_2084);
      };
      highp int tmpvar_2085;
      if ((tmpvar_2081 < 0)) {
        tmpvar_2085 = 3;
      } else {
        tmpvar_2085 = tmpvar_2081;
      };
      float tmpvar_2086;
      tmpvar_2086 = sin(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_2078), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_2085), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_2083), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_2021), 0.0, 3.0)
        )], tmpvar_2080))
       * 3.141593) / 180.0));
      highp int _uidx1_2087;
      highp int tmpvar_2088;
      if ((tmpvar_2022 == 0)) {
        tmpvar_2088 = 1;
      } else {
        tmpvar_2088 = -1;
      };
      float tmpvar_2089;
      tmpvar_2089 = fract((iTime * 4.0));
      highp int tmpvar_2090;
      tmpvar_2090 = (tmpvar_2021 - 1);
      highp int tmpvar_2091;
      if ((tmpvar_2088 >= 0)) {
        tmpvar_2091 = 0;
      } else {
        tmpvar_2091 = 1;
      };
      highp int tmpvar_2092;
      tmpvar_2092 = (2 + tmpvar_2091);
      _uidx1_2087 = tmpvar_2092;
      if ((tmpvar_2090 < 0)) {
        highp int tmpvar_2093;
        if ((tmpvar_2088 >= 0)) {
          tmpvar_2093 = 1;
        } else {
          tmpvar_2093 = 0;
        };
        _uidx1_2087 = (2 + tmpvar_2093);
      };
      highp int tmpvar_2094;
      if ((tmpvar_2090 < 0)) {
        tmpvar_2094 = 3;
      } else {
        tmpvar_2094 = tmpvar_2090;
      };
      mat2 tmpvar_2095;
      tmpvar_2095[uint(0)].x = tmpvar_2068;
      tmpvar_2095[uint(0)].y = tmpvar_2077;
      tmpvar_2095[1u].x = -(tmpvar_2086);
      tmpvar_2095[1u].y = cos(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_2087), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_2094), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_2092), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_2021), 0.0, 3.0)
        )], tmpvar_2089))
       * 3.141593) / 180.0));
      _upLeg0L_2014.yz = (_upLeg0L_2014.yz * tmpvar_2095);
      highp vec3 tmpvar_2096;
      tmpvar_2096 = (abs((_upLeg0L_2014 - vec3(0.0, 0.1, 0.0))) - vec3(0.025, 0.1, 0.025));
      highp vec3 tmpvar_2097;
      tmpvar_2097 = max (tmpvar_2096, 0.0);
      highp float tmpvar_2098;
      tmpvar_2098 = min (tmpvar_2057, (sqrt(
        dot (tmpvar_2097, tmpvar_2097)
      ) + min (
        max (tmpvar_2096.x, max (tmpvar_2096.y, tmpvar_2096.z))
      , 0.0)));
      highp vec3 tmpvar_2099;
      tmpvar_2099 = (_upLeg0L_2014 + vec3(0.01, -0.18, 0.02));
      _upLeg1L_2013 = tmpvar_2099;
      highp int _uidx1_2100;
      highp int tmpvar_2101;
      if ((tmpvar_2022 == 0)) {
        tmpvar_2101 = 1;
      } else {
        tmpvar_2101 = -1;
      };
      float tmpvar_2102;
      tmpvar_2102 = fract((iTime * 4.0));
      highp int tmpvar_2103;
      tmpvar_2103 = (tmpvar_2021 - 1);
      highp int tmpvar_2104;
      if ((tmpvar_2101 >= 0)) {
        tmpvar_2104 = 0;
      } else {
        tmpvar_2104 = 1;
      };
      highp int tmpvar_2105;
      tmpvar_2105 = (4 + tmpvar_2104);
      _uidx1_2100 = tmpvar_2105;
      if ((tmpvar_2103 < 0)) {
        highp int tmpvar_2106;
        if ((tmpvar_2101 >= 0)) {
          tmpvar_2106 = 1;
        } else {
          tmpvar_2106 = 0;
        };
        _uidx1_2100 = (4 + tmpvar_2106);
      };
      highp int tmpvar_2107;
      if ((tmpvar_2103 < 0)) {
        tmpvar_2107 = 3;
      } else {
        tmpvar_2107 = tmpvar_2103;
      };
      float tmpvar_2108;
      tmpvar_2108 = cos(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_2100)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_2107)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_2105)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_2021)
        , 0.0, 3.0))], tmpvar_2102)
       * 3.141593) / 180.0));
      highp int _uidx1_2109;
      highp int tmpvar_2110;
      if ((tmpvar_2022 == 0)) {
        tmpvar_2110 = 1;
      } else {
        tmpvar_2110 = -1;
      };
      float tmpvar_2111;
      tmpvar_2111 = fract((iTime * 4.0));
      highp int tmpvar_2112;
      tmpvar_2112 = (tmpvar_2021 - 1);
      highp int tmpvar_2113;
      if ((tmpvar_2110 >= 0)) {
        tmpvar_2113 = 0;
      } else {
        tmpvar_2113 = 1;
      };
      highp int tmpvar_2114;
      tmpvar_2114 = (4 + tmpvar_2113);
      _uidx1_2109 = tmpvar_2114;
      if ((tmpvar_2112 < 0)) {
        highp int tmpvar_2115;
        if ((tmpvar_2110 >= 0)) {
          tmpvar_2115 = 1;
        } else {
          tmpvar_2115 = 0;
        };
        _uidx1_2109 = (4 + tmpvar_2115);
      };
      highp int tmpvar_2116;
      if ((tmpvar_2112 < 0)) {
        tmpvar_2116 = 3;
      } else {
        tmpvar_2116 = tmpvar_2112;
      };
      float tmpvar_2117;
      tmpvar_2117 = sin(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_2109)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_2116)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_2114)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_2021)
        , 0.0, 3.0))], tmpvar_2111)
       * 3.141593) / 180.0));
      highp int _uidx1_2118;
      highp int tmpvar_2119;
      if ((tmpvar_2022 == 0)) {
        tmpvar_2119 = 1;
      } else {
        tmpvar_2119 = -1;
      };
      float tmpvar_2120;
      tmpvar_2120 = fract((iTime * 4.0));
      highp int tmpvar_2121;
      tmpvar_2121 = (tmpvar_2021 - 1);
      highp int tmpvar_2122;
      if ((tmpvar_2119 >= 0)) {
        tmpvar_2122 = 0;
      } else {
        tmpvar_2122 = 1;
      };
      highp int tmpvar_2123;
      tmpvar_2123 = (4 + tmpvar_2122);
      _uidx1_2118 = tmpvar_2123;
      if ((tmpvar_2121 < 0)) {
        highp int tmpvar_2124;
        if ((tmpvar_2119 >= 0)) {
          tmpvar_2124 = 1;
        } else {
          tmpvar_2124 = 0;
        };
        _uidx1_2118 = (4 + tmpvar_2124);
      };
      highp int tmpvar_2125;
      if ((tmpvar_2121 < 0)) {
        tmpvar_2125 = 3;
      } else {
        tmpvar_2125 = tmpvar_2121;
      };
      float tmpvar_2126;
      tmpvar_2126 = sin(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_2118)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_2125)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_2123)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_2021)
        , 0.0, 3.0))], tmpvar_2120)
       * 3.141593) / 180.0));
      highp int _uidx1_2127;
      highp int tmpvar_2128;
      if ((tmpvar_2022 == 0)) {
        tmpvar_2128 = 1;
      } else {
        tmpvar_2128 = -1;
      };
      float tmpvar_2129;
      tmpvar_2129 = fract((iTime * 4.0));
      highp int tmpvar_2130;
      tmpvar_2130 = (tmpvar_2021 - 1);
      highp int tmpvar_2131;
      if ((tmpvar_2128 >= 0)) {
        tmpvar_2131 = 0;
      } else {
        tmpvar_2131 = 1;
      };
      highp int tmpvar_2132;
      tmpvar_2132 = (4 + tmpvar_2131);
      _uidx1_2127 = tmpvar_2132;
      if ((tmpvar_2130 < 0)) {
        highp int tmpvar_2133;
        if ((tmpvar_2128 >= 0)) {
          tmpvar_2133 = 1;
        } else {
          tmpvar_2133 = 0;
        };
        _uidx1_2127 = (4 + tmpvar_2133);
      };
      highp int tmpvar_2134;
      if ((tmpvar_2130 < 0)) {
        tmpvar_2134 = 3;
      } else {
        tmpvar_2134 = tmpvar_2130;
      };
      mat2 tmpvar_2135;
      tmpvar_2135[uint(0)].x = tmpvar_2108;
      tmpvar_2135[uint(0)].y = tmpvar_2117;
      tmpvar_2135[1u].x = -(tmpvar_2126);
      tmpvar_2135[1u].y = cos(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_2127)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_2134)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_2132)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_2021)
        , 0.0, 3.0))], tmpvar_2129)
       * 3.141593) / 180.0));
      _upLeg1L_2013.yz = (tmpvar_2099.yz * tmpvar_2135);
      highp vec3 tmpvar_2136;
      tmpvar_2136 = (abs((_upLeg1L_2013 - vec3(0.0, 0.1, 0.0))) - vec3(0.025, 0.1, 0.025));
      highp vec3 tmpvar_2137;
      tmpvar_2137 = max (tmpvar_2136, 0.0);
      highp float tmpvar_2138;
      tmpvar_2138 = min (tmpvar_2098, (sqrt(
        dot (tmpvar_2137, tmpvar_2137)
      ) + min (
        max (tmpvar_2136.x, max (tmpvar_2136.y, tmpvar_2136.z))
      , 0.0)));
      highp vec3 tmpvar_2139;
      tmpvar_2139 = (_upPelvis_2019 + vec3(-0.06, 0.025, 0.0));
      _upLeg0R_2012.z = tmpvar_2139.z;
      mat2 tmpvar_2140;
      tmpvar_2140[uint(0)].x = cos(-(tmpvar_2031));
      tmpvar_2140[uint(0)].y = sin(-(tmpvar_2031));
      tmpvar_2140[1u].x = -(sin(-(tmpvar_2031)));
      tmpvar_2140[1u].y = cos(-(tmpvar_2031));
      _upLeg0R_2012.xy = (tmpvar_2139.xy * tmpvar_2140);
      highp int _us_2141;
      _us_2141 = -1;
      highp int _uidx1_2142;
      highp int tmpvar_2143;
      if ((tmpvar_2022 == 0)) {
        tmpvar_2143 = 1;
      } else {
        tmpvar_2143 = -1;
      };
      _us_2141 = -(tmpvar_2143);
      float tmpvar_2144;
      tmpvar_2144 = fract((iTime * 4.0));
      highp int tmpvar_2145;
      tmpvar_2145 = (tmpvar_2021 - 1);
      highp int tmpvar_2146;
      if ((_us_2141 >= 0)) {
        tmpvar_2146 = 0;
      } else {
        tmpvar_2146 = 1;
      };
      highp int tmpvar_2147;
      tmpvar_2147 = (2 + tmpvar_2146);
      _uidx1_2142 = tmpvar_2147;
      if ((tmpvar_2145 < 0)) {
        highp int tmpvar_2148;
        if ((_us_2141 >= 0)) {
          tmpvar_2148 = 1;
        } else {
          tmpvar_2148 = 0;
        };
        _uidx1_2142 = (2 + tmpvar_2148);
      };
      highp int tmpvar_2149;
      if ((tmpvar_2145 < 0)) {
        tmpvar_2149 = 3;
      } else {
        tmpvar_2149 = tmpvar_2145;
      };
      float tmpvar_2150;
      tmpvar_2150 = cos(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_2142), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_2149), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_2147), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_2021), 0.0, 3.0)
        )], tmpvar_2144))
       * 3.141593) / 180.0));
      highp int _us_2151;
      _us_2151 = -1;
      highp int _uidx1_2152;
      highp int tmpvar_2153;
      if ((tmpvar_2022 == 0)) {
        tmpvar_2153 = 1;
      } else {
        tmpvar_2153 = -1;
      };
      _us_2151 = -(tmpvar_2153);
      float tmpvar_2154;
      tmpvar_2154 = fract((iTime * 4.0));
      highp int tmpvar_2155;
      tmpvar_2155 = (tmpvar_2021 - 1);
      highp int tmpvar_2156;
      if ((_us_2151 >= 0)) {
        tmpvar_2156 = 0;
      } else {
        tmpvar_2156 = 1;
      };
      highp int tmpvar_2157;
      tmpvar_2157 = (2 + tmpvar_2156);
      _uidx1_2152 = tmpvar_2157;
      if ((tmpvar_2155 < 0)) {
        highp int tmpvar_2158;
        if ((_us_2151 >= 0)) {
          tmpvar_2158 = 1;
        } else {
          tmpvar_2158 = 0;
        };
        _uidx1_2152 = (2 + tmpvar_2158);
      };
      highp int tmpvar_2159;
      if ((tmpvar_2155 < 0)) {
        tmpvar_2159 = 3;
      } else {
        tmpvar_2159 = tmpvar_2155;
      };
      float tmpvar_2160;
      tmpvar_2160 = sin(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_2152), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_2159), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_2157), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_2021), 0.0, 3.0)
        )], tmpvar_2154))
       * 3.141593) / 180.0));
      highp int _us_2161;
      _us_2161 = -1;
      highp int _uidx1_2162;
      highp int tmpvar_2163;
      if ((tmpvar_2022 == 0)) {
        tmpvar_2163 = 1;
      } else {
        tmpvar_2163 = -1;
      };
      _us_2161 = -(tmpvar_2163);
      float tmpvar_2164;
      tmpvar_2164 = fract((iTime * 4.0));
      highp int tmpvar_2165;
      tmpvar_2165 = (tmpvar_2021 - 1);
      highp int tmpvar_2166;
      if ((_us_2161 >= 0)) {
        tmpvar_2166 = 0;
      } else {
        tmpvar_2166 = 1;
      };
      highp int tmpvar_2167;
      tmpvar_2167 = (2 + tmpvar_2166);
      _uidx1_2162 = tmpvar_2167;
      if ((tmpvar_2165 < 0)) {
        highp int tmpvar_2168;
        if ((_us_2161 >= 0)) {
          tmpvar_2168 = 1;
        } else {
          tmpvar_2168 = 0;
        };
        _uidx1_2162 = (2 + tmpvar_2168);
      };
      highp int tmpvar_2169;
      if ((tmpvar_2165 < 0)) {
        tmpvar_2169 = 3;
      } else {
        tmpvar_2169 = tmpvar_2165;
      };
      float tmpvar_2170;
      tmpvar_2170 = sin(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_2162), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_2169), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_2167), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_2021), 0.0, 3.0)
        )], tmpvar_2164))
       * 3.141593) / 180.0));
      highp int _us_2171;
      _us_2171 = -1;
      highp int _uidx1_2172;
      highp int tmpvar_2173;
      if ((tmpvar_2022 == 0)) {
        tmpvar_2173 = 1;
      } else {
        tmpvar_2173 = -1;
      };
      _us_2171 = -(tmpvar_2173);
      float tmpvar_2174;
      tmpvar_2174 = fract((iTime * 4.0));
      highp int tmpvar_2175;
      tmpvar_2175 = (tmpvar_2021 - 1);
      highp int tmpvar_2176;
      if ((_us_2171 >= 0)) {
        tmpvar_2176 = 0;
      } else {
        tmpvar_2176 = 1;
      };
      highp int tmpvar_2177;
      tmpvar_2177 = (2 + tmpvar_2176);
      _uidx1_2172 = tmpvar_2177;
      if ((tmpvar_2175 < 0)) {
        highp int tmpvar_2178;
        if ((_us_2171 >= 0)) {
          tmpvar_2178 = 1;
        } else {
          tmpvar_2178 = 0;
        };
        _uidx1_2172 = (2 + tmpvar_2178);
      };
      highp int tmpvar_2179;
      if ((tmpvar_2175 < 0)) {
        tmpvar_2179 = 3;
      } else {
        tmpvar_2179 = tmpvar_2175;
      };
      mat2 tmpvar_2180;
      tmpvar_2180[uint(0)].x = tmpvar_2150;
      tmpvar_2180[uint(0)].y = tmpvar_2160;
      tmpvar_2180[1u].x = -(tmpvar_2170);
      tmpvar_2180[1u].y = cos(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_2172), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_2179), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_2177), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_2021), 0.0, 3.0)
        )], tmpvar_2174))
       * 3.141593) / 180.0));
      _upLeg0R_2012.yz = (_upLeg0R_2012.yz * tmpvar_2180);
      highp vec3 tmpvar_2181;
      tmpvar_2181 = (abs((_upLeg0R_2012 - vec3(0.0, 0.1, 0.0))) - vec3(0.025, 0.1, 0.025));
      highp vec3 tmpvar_2182;
      tmpvar_2182 = max (tmpvar_2181, 0.0);
      highp float tmpvar_2183;
      tmpvar_2183 = min (tmpvar_2138, (sqrt(
        dot (tmpvar_2182, tmpvar_2182)
      ) + min (
        max (tmpvar_2181.x, max (tmpvar_2181.y, tmpvar_2181.z))
      , 0.0)));
      highp vec3 tmpvar_2184;
      tmpvar_2184 = (_upLeg0R_2012 + vec3(-0.01, -0.18, 0.02));
      _upLeg1R_2011 = tmpvar_2184;
      highp int _us_2185;
      _us_2185 = -1;
      highp int _uidx1_2186;
      highp int tmpvar_2187;
      if ((tmpvar_2022 == 0)) {
        tmpvar_2187 = 1;
      } else {
        tmpvar_2187 = -1;
      };
      _us_2185 = -(tmpvar_2187);
      float tmpvar_2188;
      tmpvar_2188 = fract((iTime * 4.0));
      highp int tmpvar_2189;
      tmpvar_2189 = (tmpvar_2021 - 1);
      highp int tmpvar_2190;
      if ((_us_2185 >= 0)) {
        tmpvar_2190 = 0;
      } else {
        tmpvar_2190 = 1;
      };
      highp int tmpvar_2191;
      tmpvar_2191 = (4 + tmpvar_2190);
      _uidx1_2186 = tmpvar_2191;
      if ((tmpvar_2189 < 0)) {
        highp int tmpvar_2192;
        if ((_us_2185 >= 0)) {
          tmpvar_2192 = 1;
        } else {
          tmpvar_2192 = 0;
        };
        _uidx1_2186 = (4 + tmpvar_2192);
      };
      highp int tmpvar_2193;
      if ((tmpvar_2189 < 0)) {
        tmpvar_2193 = 3;
      } else {
        tmpvar_2193 = tmpvar_2189;
      };
      float tmpvar_2194;
      tmpvar_2194 = cos(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_2186)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_2193)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_2191)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_2021)
        , 0.0, 3.0))], tmpvar_2188)
       * 3.141593) / 180.0));
      highp int _us_2195;
      _us_2195 = -1;
      highp int _uidx1_2196;
      highp int tmpvar_2197;
      if ((tmpvar_2022 == 0)) {
        tmpvar_2197 = 1;
      } else {
        tmpvar_2197 = -1;
      };
      _us_2195 = -(tmpvar_2197);
      float tmpvar_2198;
      tmpvar_2198 = fract((iTime * 4.0));
      highp int tmpvar_2199;
      tmpvar_2199 = (tmpvar_2021 - 1);
      highp int tmpvar_2200;
      if ((_us_2195 >= 0)) {
        tmpvar_2200 = 0;
      } else {
        tmpvar_2200 = 1;
      };
      highp int tmpvar_2201;
      tmpvar_2201 = (4 + tmpvar_2200);
      _uidx1_2196 = tmpvar_2201;
      if ((tmpvar_2199 < 0)) {
        highp int tmpvar_2202;
        if ((_us_2195 >= 0)) {
          tmpvar_2202 = 1;
        } else {
          tmpvar_2202 = 0;
        };
        _uidx1_2196 = (4 + tmpvar_2202);
      };
      highp int tmpvar_2203;
      if ((tmpvar_2199 < 0)) {
        tmpvar_2203 = 3;
      } else {
        tmpvar_2203 = tmpvar_2199;
      };
      float tmpvar_2204;
      tmpvar_2204 = sin(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_2196)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_2203)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_2201)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_2021)
        , 0.0, 3.0))], tmpvar_2198)
       * 3.141593) / 180.0));
      highp int _us_2205;
      _us_2205 = -1;
      highp int _uidx1_2206;
      highp int tmpvar_2207;
      if ((tmpvar_2022 == 0)) {
        tmpvar_2207 = 1;
      } else {
        tmpvar_2207 = -1;
      };
      _us_2205 = -(tmpvar_2207);
      float tmpvar_2208;
      tmpvar_2208 = fract((iTime * 4.0));
      highp int tmpvar_2209;
      tmpvar_2209 = (tmpvar_2021 - 1);
      highp int tmpvar_2210;
      if ((_us_2205 >= 0)) {
        tmpvar_2210 = 0;
      } else {
        tmpvar_2210 = 1;
      };
      highp int tmpvar_2211;
      tmpvar_2211 = (4 + tmpvar_2210);
      _uidx1_2206 = tmpvar_2211;
      if ((tmpvar_2209 < 0)) {
        highp int tmpvar_2212;
        if ((_us_2205 >= 0)) {
          tmpvar_2212 = 1;
        } else {
          tmpvar_2212 = 0;
        };
        _uidx1_2206 = (4 + tmpvar_2212);
      };
      highp int tmpvar_2213;
      if ((tmpvar_2209 < 0)) {
        tmpvar_2213 = 3;
      } else {
        tmpvar_2213 = tmpvar_2209;
      };
      float tmpvar_2214;
      tmpvar_2214 = sin(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_2206)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_2213)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_2211)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_2021)
        , 0.0, 3.0))], tmpvar_2208)
       * 3.141593) / 180.0));
      highp int _us_2215;
      _us_2215 = -1;
      highp int _uidx1_2216;
      highp int tmpvar_2217;
      if ((tmpvar_2022 == 0)) {
        tmpvar_2217 = 1;
      } else {
        tmpvar_2217 = -1;
      };
      _us_2215 = -(tmpvar_2217);
      float tmpvar_2218;
      tmpvar_2218 = fract((iTime * 4.0));
      highp int tmpvar_2219;
      tmpvar_2219 = (tmpvar_2021 - 1);
      highp int tmpvar_2220;
      if ((_us_2215 >= 0)) {
        tmpvar_2220 = 0;
      } else {
        tmpvar_2220 = 1;
      };
      highp int tmpvar_2221;
      tmpvar_2221 = (4 + tmpvar_2220);
      _uidx1_2216 = tmpvar_2221;
      if ((tmpvar_2219 < 0)) {
        highp int tmpvar_2222;
        if ((_us_2215 >= 0)) {
          tmpvar_2222 = 1;
        } else {
          tmpvar_2222 = 0;
        };
        _uidx1_2216 = (4 + tmpvar_2222);
      };
      highp int tmpvar_2223;
      if ((tmpvar_2219 < 0)) {
        tmpvar_2223 = 3;
      } else {
        tmpvar_2223 = tmpvar_2219;
      };
      mat2 tmpvar_2224;
      tmpvar_2224[uint(0)].x = tmpvar_2194;
      tmpvar_2224[uint(0)].y = tmpvar_2204;
      tmpvar_2224[1u].x = -(tmpvar_2214);
      tmpvar_2224[1u].y = cos(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_2216)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_2223)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_2221)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_2021)
        , 0.0, 3.0))], tmpvar_2218)
       * 3.141593) / 180.0));
      _upLeg1R_2011.yz = (tmpvar_2184.yz * tmpvar_2224);
      highp vec3 tmpvar_2225;
      tmpvar_2225 = (abs((_upLeg1R_2011 - vec3(0.0, 0.1, 0.0))) - vec3(0.025, 0.1, 0.025));
      highp vec3 tmpvar_2226;
      tmpvar_2226 = max (tmpvar_2225, 0.0);
      highp float tmpvar_2227;
      tmpvar_2227 = min (tmpvar_2183, (sqrt(
        dot (tmpvar_2226, tmpvar_2226)
      ) + min (
        max (tmpvar_2225.x, max (tmpvar_2225.y, tmpvar_2225.z))
      , 0.0)));
      highp vec3 tmpvar_2228;
      tmpvar_2228 = (_upChest_2017 + vec3(0.125, -0.1, 0.0));
      _upArm0L_2010 = tmpvar_2228;
      highp int _uidx1_2229;
      highp int tmpvar_2230;
      if ((tmpvar_2022 == 0)) {
        tmpvar_2230 = 1;
      } else {
        tmpvar_2230 = -1;
      };
      float tmpvar_2231;
      tmpvar_2231 = fract((iTime * 4.0));
      highp int tmpvar_2232;
      tmpvar_2232 = (tmpvar_2021 - 1);
      highp int tmpvar_2233;
      if ((tmpvar_2230 >= 0)) {
        tmpvar_2233 = 0;
      } else {
        tmpvar_2233 = 1;
      };
      highp int tmpvar_2234;
      tmpvar_2234 = (6 + tmpvar_2233);
      _uidx1_2229 = tmpvar_2234;
      if ((tmpvar_2232 < 0)) {
        highp int tmpvar_2235;
        if ((tmpvar_2230 >= 0)) {
          tmpvar_2235 = 1;
        } else {
          tmpvar_2235 = 0;
        };
        _uidx1_2229 = (6 + tmpvar_2235);
      };
      highp int tmpvar_2236;
      if ((tmpvar_2232 < 0)) {
        tmpvar_2236 = 3;
      } else {
        tmpvar_2236 = tmpvar_2232;
      };
      float tmpvar_2237;
      tmpvar_2237 = cos(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_2229), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_2236), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_2234), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_2021), 0.0, 3.0)
        )], tmpvar_2231))
       * 3.141593) / 180.0));
      highp int _uidx1_2238;
      highp int tmpvar_2239;
      if ((tmpvar_2022 == 0)) {
        tmpvar_2239 = 1;
      } else {
        tmpvar_2239 = -1;
      };
      float tmpvar_2240;
      tmpvar_2240 = fract((iTime * 4.0));
      highp int tmpvar_2241;
      tmpvar_2241 = (tmpvar_2021 - 1);
      highp int tmpvar_2242;
      if ((tmpvar_2239 >= 0)) {
        tmpvar_2242 = 0;
      } else {
        tmpvar_2242 = 1;
      };
      highp int tmpvar_2243;
      tmpvar_2243 = (6 + tmpvar_2242);
      _uidx1_2238 = tmpvar_2243;
      if ((tmpvar_2241 < 0)) {
        highp int tmpvar_2244;
        if ((tmpvar_2239 >= 0)) {
          tmpvar_2244 = 1;
        } else {
          tmpvar_2244 = 0;
        };
        _uidx1_2238 = (6 + tmpvar_2244);
      };
      highp int tmpvar_2245;
      if ((tmpvar_2241 < 0)) {
        tmpvar_2245 = 3;
      } else {
        tmpvar_2245 = tmpvar_2241;
      };
      float tmpvar_2246;
      tmpvar_2246 = sin(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_2238), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_2245), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_2243), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_2021), 0.0, 3.0)
        )], tmpvar_2240))
       * 3.141593) / 180.0));
      highp int _uidx1_2247;
      highp int tmpvar_2248;
      if ((tmpvar_2022 == 0)) {
        tmpvar_2248 = 1;
      } else {
        tmpvar_2248 = -1;
      };
      float tmpvar_2249;
      tmpvar_2249 = fract((iTime * 4.0));
      highp int tmpvar_2250;
      tmpvar_2250 = (tmpvar_2021 - 1);
      highp int tmpvar_2251;
      if ((tmpvar_2248 >= 0)) {
        tmpvar_2251 = 0;
      } else {
        tmpvar_2251 = 1;
      };
      highp int tmpvar_2252;
      tmpvar_2252 = (6 + tmpvar_2251);
      _uidx1_2247 = tmpvar_2252;
      if ((tmpvar_2250 < 0)) {
        highp int tmpvar_2253;
        if ((tmpvar_2248 >= 0)) {
          tmpvar_2253 = 1;
        } else {
          tmpvar_2253 = 0;
        };
        _uidx1_2247 = (6 + tmpvar_2253);
      };
      highp int tmpvar_2254;
      if ((tmpvar_2250 < 0)) {
        tmpvar_2254 = 3;
      } else {
        tmpvar_2254 = tmpvar_2250;
      };
      float tmpvar_2255;
      tmpvar_2255 = sin(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_2247), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_2254), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_2252), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_2021), 0.0, 3.0)
        )], tmpvar_2249))
       * 3.141593) / 180.0));
      highp int _uidx1_2256;
      highp int tmpvar_2257;
      if ((tmpvar_2022 == 0)) {
        tmpvar_2257 = 1;
      } else {
        tmpvar_2257 = -1;
      };
      float tmpvar_2258;
      tmpvar_2258 = fract((iTime * 4.0));
      highp int tmpvar_2259;
      tmpvar_2259 = (tmpvar_2021 - 1);
      highp int tmpvar_2260;
      if ((tmpvar_2257 >= 0)) {
        tmpvar_2260 = 0;
      } else {
        tmpvar_2260 = 1;
      };
      highp int tmpvar_2261;
      tmpvar_2261 = (6 + tmpvar_2260);
      _uidx1_2256 = tmpvar_2261;
      if ((tmpvar_2259 < 0)) {
        highp int tmpvar_2262;
        if ((tmpvar_2257 >= 0)) {
          tmpvar_2262 = 1;
        } else {
          tmpvar_2262 = 0;
        };
        _uidx1_2256 = (6 + tmpvar_2262);
      };
      highp int tmpvar_2263;
      if ((tmpvar_2259 < 0)) {
        tmpvar_2263 = 3;
      } else {
        tmpvar_2263 = tmpvar_2259;
      };
      mat2 tmpvar_2264;
      tmpvar_2264[uint(0)].x = tmpvar_2237;
      tmpvar_2264[uint(0)].y = tmpvar_2246;
      tmpvar_2264[1u].x = -(tmpvar_2255);
      tmpvar_2264[1u].y = cos(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_2256), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_2263), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_2261), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_2021), 0.0, 3.0)
        )], tmpvar_2258))
       * 3.141593) / 180.0));
      _upArm0L_2010.yz = (tmpvar_2228.yz * tmpvar_2264);
      highp vec3 tmpvar_2265;
      tmpvar_2265 = (abs((_upArm0L_2010 - vec3(0.0, 0.08, 0.0))) - vec3(0.02, 0.08, 0.02));
      highp vec3 tmpvar_2266;
      tmpvar_2266 = max (tmpvar_2265, 0.0);
      highp float tmpvar_2267;
      tmpvar_2267 = min (tmpvar_2227, (sqrt(
        dot (tmpvar_2266, tmpvar_2266)
      ) + min (
        max (tmpvar_2265.x, max (tmpvar_2265.y, tmpvar_2265.z))
      , 0.0)));
      highp vec3 tmpvar_2268;
      tmpvar_2268 = (_upArm0L_2010 + vec3(0.0, -0.16, 0.0));
      _upArm1L_2009 = tmpvar_2268;
      highp int _uidx1_2269;
      highp int tmpvar_2270;
      if ((tmpvar_2022 == 0)) {
        tmpvar_2270 = 1;
      } else {
        tmpvar_2270 = -1;
      };
      float tmpvar_2271;
      tmpvar_2271 = fract((iTime * 4.0));
      highp int tmpvar_2272;
      tmpvar_2272 = (tmpvar_2021 - 1);
      highp int tmpvar_2273;
      if ((tmpvar_2270 >= 0)) {
        tmpvar_2273 = 0;
      } else {
        tmpvar_2273 = 1;
      };
      highp int tmpvar_2274;
      tmpvar_2274 = (8 + tmpvar_2273);
      _uidx1_2269 = tmpvar_2274;
      if ((tmpvar_2272 < 0)) {
        highp int tmpvar_2275;
        if ((tmpvar_2270 >= 0)) {
          tmpvar_2275 = 1;
        } else {
          tmpvar_2275 = 0;
        };
        _uidx1_2269 = (8 + tmpvar_2275);
      };
      highp int tmpvar_2276;
      if ((tmpvar_2272 < 0)) {
        tmpvar_2276 = 3;
      } else {
        tmpvar_2276 = tmpvar_2272;
      };
      float tmpvar_2277;
      tmpvar_2277 = cos(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_2269)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_2276)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_2274)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_2021)
        , 0.0, 3.0))], tmpvar_2271)
       * 3.141593) / 180.0));
      highp int _uidx1_2278;
      highp int tmpvar_2279;
      if ((tmpvar_2022 == 0)) {
        tmpvar_2279 = 1;
      } else {
        tmpvar_2279 = -1;
      };
      float tmpvar_2280;
      tmpvar_2280 = fract((iTime * 4.0));
      highp int tmpvar_2281;
      tmpvar_2281 = (tmpvar_2021 - 1);
      highp int tmpvar_2282;
      if ((tmpvar_2279 >= 0)) {
        tmpvar_2282 = 0;
      } else {
        tmpvar_2282 = 1;
      };
      highp int tmpvar_2283;
      tmpvar_2283 = (8 + tmpvar_2282);
      _uidx1_2278 = tmpvar_2283;
      if ((tmpvar_2281 < 0)) {
        highp int tmpvar_2284;
        if ((tmpvar_2279 >= 0)) {
          tmpvar_2284 = 1;
        } else {
          tmpvar_2284 = 0;
        };
        _uidx1_2278 = (8 + tmpvar_2284);
      };
      highp int tmpvar_2285;
      if ((tmpvar_2281 < 0)) {
        tmpvar_2285 = 3;
      } else {
        tmpvar_2285 = tmpvar_2281;
      };
      float tmpvar_2286;
      tmpvar_2286 = sin(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_2278)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_2285)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_2283)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_2021)
        , 0.0, 3.0))], tmpvar_2280)
       * 3.141593) / 180.0));
      highp int _uidx1_2287;
      highp int tmpvar_2288;
      if ((tmpvar_2022 == 0)) {
        tmpvar_2288 = 1;
      } else {
        tmpvar_2288 = -1;
      };
      float tmpvar_2289;
      tmpvar_2289 = fract((iTime * 4.0));
      highp int tmpvar_2290;
      tmpvar_2290 = (tmpvar_2021 - 1);
      highp int tmpvar_2291;
      if ((tmpvar_2288 >= 0)) {
        tmpvar_2291 = 0;
      } else {
        tmpvar_2291 = 1;
      };
      highp int tmpvar_2292;
      tmpvar_2292 = (8 + tmpvar_2291);
      _uidx1_2287 = tmpvar_2292;
      if ((tmpvar_2290 < 0)) {
        highp int tmpvar_2293;
        if ((tmpvar_2288 >= 0)) {
          tmpvar_2293 = 1;
        } else {
          tmpvar_2293 = 0;
        };
        _uidx1_2287 = (8 + tmpvar_2293);
      };
      highp int tmpvar_2294;
      if ((tmpvar_2290 < 0)) {
        tmpvar_2294 = 3;
      } else {
        tmpvar_2294 = tmpvar_2290;
      };
      float tmpvar_2295;
      tmpvar_2295 = sin(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_2287)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_2294)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_2292)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_2021)
        , 0.0, 3.0))], tmpvar_2289)
       * 3.141593) / 180.0));
      highp int _uidx1_2296;
      highp int tmpvar_2297;
      if ((tmpvar_2022 == 0)) {
        tmpvar_2297 = 1;
      } else {
        tmpvar_2297 = -1;
      };
      float tmpvar_2298;
      tmpvar_2298 = fract((iTime * 4.0));
      highp int tmpvar_2299;
      tmpvar_2299 = (tmpvar_2021 - 1);
      highp int tmpvar_2300;
      if ((tmpvar_2297 >= 0)) {
        tmpvar_2300 = 0;
      } else {
        tmpvar_2300 = 1;
      };
      highp int tmpvar_2301;
      tmpvar_2301 = (8 + tmpvar_2300);
      _uidx1_2296 = tmpvar_2301;
      if ((tmpvar_2299 < 0)) {
        highp int tmpvar_2302;
        if ((tmpvar_2297 >= 0)) {
          tmpvar_2302 = 1;
        } else {
          tmpvar_2302 = 0;
        };
        _uidx1_2296 = (8 + tmpvar_2302);
      };
      highp int tmpvar_2303;
      if ((tmpvar_2299 < 0)) {
        tmpvar_2303 = 3;
      } else {
        tmpvar_2303 = tmpvar_2299;
      };
      mat2 tmpvar_2304;
      tmpvar_2304[uint(0)].x = tmpvar_2277;
      tmpvar_2304[uint(0)].y = tmpvar_2286;
      tmpvar_2304[1u].x = -(tmpvar_2295);
      tmpvar_2304[1u].y = cos(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_2296)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_2303)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_2301)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_2021)
        , 0.0, 3.0))], tmpvar_2298)
       * 3.141593) / 180.0));
      _upArm1L_2009.yz = (tmpvar_2268.yz * tmpvar_2304);
      highp vec3 tmpvar_2305;
      tmpvar_2305 = (abs((_upArm1L_2009 - vec3(0.0, 0.08, 0.0))) - vec3(0.02, 0.08, 0.02));
      highp vec3 tmpvar_2306;
      tmpvar_2306 = max (tmpvar_2305, 0.0);
      highp float tmpvar_2307;
      tmpvar_2307 = min (tmpvar_2267, (sqrt(
        dot (tmpvar_2306, tmpvar_2306)
      ) + min (
        max (tmpvar_2305.x, max (tmpvar_2305.y, tmpvar_2305.z))
      , 0.0)));
      highp vec3 tmpvar_2308;
      tmpvar_2308 = (_upChest_2017 + vec3(-0.125, -0.1, 0.0));
      _upArm0R_2008 = tmpvar_2308;
      highp int _us_2309;
      _us_2309 = -1;
      highp int _uidx1_2310;
      highp int tmpvar_2311;
      if ((tmpvar_2022 == 0)) {
        tmpvar_2311 = 1;
      } else {
        tmpvar_2311 = -1;
      };
      _us_2309 = -(tmpvar_2311);
      float tmpvar_2312;
      tmpvar_2312 = fract((iTime * 4.0));
      highp int tmpvar_2313;
      tmpvar_2313 = (tmpvar_2021 - 1);
      highp int tmpvar_2314;
      if ((_us_2309 >= 0)) {
        tmpvar_2314 = 0;
      } else {
        tmpvar_2314 = 1;
      };
      highp int tmpvar_2315;
      tmpvar_2315 = (6 + tmpvar_2314);
      _uidx1_2310 = tmpvar_2315;
      if ((tmpvar_2313 < 0)) {
        highp int tmpvar_2316;
        if ((_us_2309 >= 0)) {
          tmpvar_2316 = 1;
        } else {
          tmpvar_2316 = 0;
        };
        _uidx1_2310 = (6 + tmpvar_2316);
      };
      highp int tmpvar_2317;
      if ((tmpvar_2313 < 0)) {
        tmpvar_2317 = 3;
      } else {
        tmpvar_2317 = tmpvar_2313;
      };
      float tmpvar_2318;
      tmpvar_2318 = cos(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_2310), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_2317), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_2315), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_2021), 0.0, 3.0)
        )], tmpvar_2312))
       * 3.141593) / 180.0));
      highp int _us_2319;
      _us_2319 = -1;
      highp int _uidx1_2320;
      highp int tmpvar_2321;
      if ((tmpvar_2022 == 0)) {
        tmpvar_2321 = 1;
      } else {
        tmpvar_2321 = -1;
      };
      _us_2319 = -(tmpvar_2321);
      float tmpvar_2322;
      tmpvar_2322 = fract((iTime * 4.0));
      highp int tmpvar_2323;
      tmpvar_2323 = (tmpvar_2021 - 1);
      highp int tmpvar_2324;
      if ((_us_2319 >= 0)) {
        tmpvar_2324 = 0;
      } else {
        tmpvar_2324 = 1;
      };
      highp int tmpvar_2325;
      tmpvar_2325 = (6 + tmpvar_2324);
      _uidx1_2320 = tmpvar_2325;
      if ((tmpvar_2323 < 0)) {
        highp int tmpvar_2326;
        if ((_us_2319 >= 0)) {
          tmpvar_2326 = 1;
        } else {
          tmpvar_2326 = 0;
        };
        _uidx1_2320 = (6 + tmpvar_2326);
      };
      highp int tmpvar_2327;
      if ((tmpvar_2323 < 0)) {
        tmpvar_2327 = 3;
      } else {
        tmpvar_2327 = tmpvar_2323;
      };
      float tmpvar_2328;
      tmpvar_2328 = sin(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_2320), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_2327), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_2325), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_2021), 0.0, 3.0)
        )], tmpvar_2322))
       * 3.141593) / 180.0));
      highp int _us_2329;
      _us_2329 = -1;
      highp int _uidx1_2330;
      highp int tmpvar_2331;
      if ((tmpvar_2022 == 0)) {
        tmpvar_2331 = 1;
      } else {
        tmpvar_2331 = -1;
      };
      _us_2329 = -(tmpvar_2331);
      float tmpvar_2332;
      tmpvar_2332 = fract((iTime * 4.0));
      highp int tmpvar_2333;
      tmpvar_2333 = (tmpvar_2021 - 1);
      highp int tmpvar_2334;
      if ((_us_2329 >= 0)) {
        tmpvar_2334 = 0;
      } else {
        tmpvar_2334 = 1;
      };
      highp int tmpvar_2335;
      tmpvar_2335 = (6 + tmpvar_2334);
      _uidx1_2330 = tmpvar_2335;
      if ((tmpvar_2333 < 0)) {
        highp int tmpvar_2336;
        if ((_us_2329 >= 0)) {
          tmpvar_2336 = 1;
        } else {
          tmpvar_2336 = 0;
        };
        _uidx1_2330 = (6 + tmpvar_2336);
      };
      highp int tmpvar_2337;
      if ((tmpvar_2333 < 0)) {
        tmpvar_2337 = 3;
      } else {
        tmpvar_2337 = tmpvar_2333;
      };
      float tmpvar_2338;
      tmpvar_2338 = sin(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_2330), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_2337), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_2335), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_2021), 0.0, 3.0)
        )], tmpvar_2332))
       * 3.141593) / 180.0));
      highp int _us_2339;
      _us_2339 = -1;
      highp int _uidx1_2340;
      highp int tmpvar_2341;
      if ((tmpvar_2022 == 0)) {
        tmpvar_2341 = 1;
      } else {
        tmpvar_2341 = -1;
      };
      _us_2339 = -(tmpvar_2341);
      float tmpvar_2342;
      tmpvar_2342 = fract((iTime * 4.0));
      highp int tmpvar_2343;
      tmpvar_2343 = (tmpvar_2021 - 1);
      highp int tmpvar_2344;
      if ((_us_2339 >= 0)) {
        tmpvar_2344 = 0;
      } else {
        tmpvar_2344 = 1;
      };
      highp int tmpvar_2345;
      tmpvar_2345 = (6 + tmpvar_2344);
      _uidx1_2340 = tmpvar_2345;
      if ((tmpvar_2343 < 0)) {
        highp int tmpvar_2346;
        if ((_us_2339 >= 0)) {
          tmpvar_2346 = 1;
        } else {
          tmpvar_2346 = 0;
        };
        _uidx1_2340 = (6 + tmpvar_2346);
      };
      highp int tmpvar_2347;
      if ((tmpvar_2343 < 0)) {
        tmpvar_2347 = 3;
      } else {
        tmpvar_2347 = tmpvar_2343;
      };
      mat2 tmpvar_2348;
      tmpvar_2348[uint(0)].x = tmpvar_2318;
      tmpvar_2348[uint(0)].y = tmpvar_2328;
      tmpvar_2348[1u].x = -(tmpvar_2338);
      tmpvar_2348[1u].y = cos(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_2340), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_2347), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_2345), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_2021), 0.0, 3.0)
        )], tmpvar_2342))
       * 3.141593) / 180.0));
      _upArm0R_2008.yz = (tmpvar_2308.yz * tmpvar_2348);
      highp vec3 tmpvar_2349;
      tmpvar_2349 = (abs((_upArm0R_2008 - vec3(0.0, 0.08, 0.0))) - vec3(0.02, 0.08, 0.02));
      highp vec3 tmpvar_2350;
      tmpvar_2350 = max (tmpvar_2349, 0.0);
      highp float tmpvar_2351;
      tmpvar_2351 = min (tmpvar_2307, (sqrt(
        dot (tmpvar_2350, tmpvar_2350)
      ) + min (
        max (tmpvar_2349.x, max (tmpvar_2349.y, tmpvar_2349.z))
      , 0.0)));
      highp vec3 tmpvar_2352;
      tmpvar_2352 = (_upArm0R_2008 + vec3(0.0, -0.16, 0.0));
      _upArm1R_2007 = tmpvar_2352;
      highp int _us_2353;
      _us_2353 = -1;
      highp int _uidx1_2354;
      highp int tmpvar_2355;
      if ((tmpvar_2022 == 0)) {
        tmpvar_2355 = 1;
      } else {
        tmpvar_2355 = -1;
      };
      _us_2353 = -(tmpvar_2355);
      float tmpvar_2356;
      tmpvar_2356 = fract((iTime * 4.0));
      highp int tmpvar_2357;
      tmpvar_2357 = (tmpvar_2021 - 1);
      highp int tmpvar_2358;
      if ((_us_2353 >= 0)) {
        tmpvar_2358 = 0;
      } else {
        tmpvar_2358 = 1;
      };
      highp int tmpvar_2359;
      tmpvar_2359 = (8 + tmpvar_2358);
      _uidx1_2354 = tmpvar_2359;
      if ((tmpvar_2357 < 0)) {
        highp int tmpvar_2360;
        if ((_us_2353 >= 0)) {
          tmpvar_2360 = 1;
        } else {
          tmpvar_2360 = 0;
        };
        _uidx1_2354 = (8 + tmpvar_2360);
      };
      highp int tmpvar_2361;
      if ((tmpvar_2357 < 0)) {
        tmpvar_2361 = 3;
      } else {
        tmpvar_2361 = tmpvar_2357;
      };
      float tmpvar_2362;
      tmpvar_2362 = cos(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_2354)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_2361)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_2359)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_2021)
        , 0.0, 3.0))], tmpvar_2356)
       * 3.141593) / 180.0));
      highp int _us_2363;
      _us_2363 = -1;
      highp int _uidx1_2364;
      highp int tmpvar_2365;
      if ((tmpvar_2022 == 0)) {
        tmpvar_2365 = 1;
      } else {
        tmpvar_2365 = -1;
      };
      _us_2363 = -(tmpvar_2365);
      float tmpvar_2366;
      tmpvar_2366 = fract((iTime * 4.0));
      highp int tmpvar_2367;
      tmpvar_2367 = (tmpvar_2021 - 1);
      highp int tmpvar_2368;
      if ((_us_2363 >= 0)) {
        tmpvar_2368 = 0;
      } else {
        tmpvar_2368 = 1;
      };
      highp int tmpvar_2369;
      tmpvar_2369 = (8 + tmpvar_2368);
      _uidx1_2364 = tmpvar_2369;
      if ((tmpvar_2367 < 0)) {
        highp int tmpvar_2370;
        if ((_us_2363 >= 0)) {
          tmpvar_2370 = 1;
        } else {
          tmpvar_2370 = 0;
        };
        _uidx1_2364 = (8 + tmpvar_2370);
      };
      highp int tmpvar_2371;
      if ((tmpvar_2367 < 0)) {
        tmpvar_2371 = 3;
      } else {
        tmpvar_2371 = tmpvar_2367;
      };
      float tmpvar_2372;
      tmpvar_2372 = sin(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_2364)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_2371)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_2369)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_2021)
        , 0.0, 3.0))], tmpvar_2366)
       * 3.141593) / 180.0));
      highp int _us_2373;
      _us_2373 = -1;
      highp int _uidx1_2374;
      highp int tmpvar_2375;
      if ((tmpvar_2022 == 0)) {
        tmpvar_2375 = 1;
      } else {
        tmpvar_2375 = -1;
      };
      _us_2373 = -(tmpvar_2375);
      float tmpvar_2376;
      tmpvar_2376 = fract((iTime * 4.0));
      highp int tmpvar_2377;
      tmpvar_2377 = (tmpvar_2021 - 1);
      highp int tmpvar_2378;
      if ((_us_2373 >= 0)) {
        tmpvar_2378 = 0;
      } else {
        tmpvar_2378 = 1;
      };
      highp int tmpvar_2379;
      tmpvar_2379 = (8 + tmpvar_2378);
      _uidx1_2374 = tmpvar_2379;
      if ((tmpvar_2377 < 0)) {
        highp int tmpvar_2380;
        if ((_us_2373 >= 0)) {
          tmpvar_2380 = 1;
        } else {
          tmpvar_2380 = 0;
        };
        _uidx1_2374 = (8 + tmpvar_2380);
      };
      highp int tmpvar_2381;
      if ((tmpvar_2377 < 0)) {
        tmpvar_2381 = 3;
      } else {
        tmpvar_2381 = tmpvar_2377;
      };
      float tmpvar_2382;
      tmpvar_2382 = sin(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_2374)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_2381)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_2379)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_2021)
        , 0.0, 3.0))], tmpvar_2376)
       * 3.141593) / 180.0));
      highp int _us_2383;
      _us_2383 = -1;
      highp int _uidx1_2384;
      highp int tmpvar_2385;
      if ((tmpvar_2022 == 0)) {
        tmpvar_2385 = 1;
      } else {
        tmpvar_2385 = -1;
      };
      _us_2383 = -(tmpvar_2385);
      float tmpvar_2386;
      tmpvar_2386 = fract((iTime * 4.0));
      highp int tmpvar_2387;
      tmpvar_2387 = (tmpvar_2021 - 1);
      highp int tmpvar_2388;
      if ((_us_2383 >= 0)) {
        tmpvar_2388 = 0;
      } else {
        tmpvar_2388 = 1;
      };
      highp int tmpvar_2389;
      tmpvar_2389 = (8 + tmpvar_2388);
      _uidx1_2384 = tmpvar_2389;
      if ((tmpvar_2387 < 0)) {
        highp int tmpvar_2390;
        if ((_us_2383 >= 0)) {
          tmpvar_2390 = 1;
        } else {
          tmpvar_2390 = 0;
        };
        _uidx1_2384 = (8 + tmpvar_2390);
      };
      highp int tmpvar_2391;
      if ((tmpvar_2387 < 0)) {
        tmpvar_2391 = 3;
      } else {
        tmpvar_2391 = tmpvar_2387;
      };
      mat2 tmpvar_2392;
      tmpvar_2392[uint(0)].x = tmpvar_2362;
      tmpvar_2392[uint(0)].y = tmpvar_2372;
      tmpvar_2392[1u].x = -(tmpvar_2382);
      tmpvar_2392[1u].y = cos(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_2384)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_2391)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_2389)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_2021)
        , 0.0, 3.0))], tmpvar_2386)
       * 3.141593) / 180.0));
      _upArm1R_2007.yz = (tmpvar_2352.yz * tmpvar_2392);
      highp vec3 tmpvar_2393;
      tmpvar_2393 = (abs((_upArm1R_2007 - vec3(0.0, 0.08, 0.0))) - vec3(0.02, 0.08, 0.02));
      highp vec3 tmpvar_2394;
      tmpvar_2394 = max (tmpvar_2393, 0.0);
      highp vec4 tmpvar_2395;
      tmpvar_2395.yzw = vec3(0.2, 0.0, 0.0);
      tmpvar_2395.x = min (tmpvar_2351, (sqrt(
        dot (tmpvar_2394, tmpvar_2394)
      ) + min (
        max (tmpvar_2393.x, max (tmpvar_2393.y, tmpvar_2393.z))
      , 0.0)));
      tmpvar_2006 = tmpvar_2395;
    } else {
      tmpvar_2006 = tmpvar_1607;
    };
    _uhit_1604 = tmpvar_2006;
  };
  highp vec3 _up_2396;
  _up_2396 = (tmpvar_809 + vec3(-1e-05, -1e-05, 1e-05));
  highp vec4 _uhit_2397;
  _uhit_2397 = vec4(4.5, 0.0, 0.0, 0.0);
  highp float tmpvar_2398;
  highp vec3 _up_2399;
  _up_2399 = (_up_2396 - vec3(0.0, -2.0, 0.0));
  tmpvar_2398 = (sqrt(dot (_up_2399, _up_2399)) - 2.0);
  highp vec4 tmpvar_2400;
  if ((tmpvar_2398 < 4.5)) {
    highp vec3 _up_2401;
    _up_2401 = (_up_2396 - vec3(0.0, -2.0, 0.0));
    highp vec4 tmpvar_2402;
    tmpvar_2402.yzw = vec3(0.1, 0.0, 0.0);
    tmpvar_2402.x = (sqrt(dot (_up_2401, _up_2401)) - 2.0);
    tmpvar_2400 = tmpvar_2402;
  } else {
    tmpvar_2400 = vec4(4.5, 0.0, 0.0, 0.0);
  };
  _uhit_2397 = tmpvar_2400;
  highp float tmpvar_2403;
  highp vec3 tmpvar_2404;
  tmpvar_2404 = (abs((_up_2396 - vec3(0.0, 0.5, 0.0))) - vec3(0.3, 0.5, 0.3));
  highp vec3 tmpvar_2405;
  tmpvar_2405 = max (tmpvar_2404, 0.0);
  tmpvar_2403 = (sqrt(dot (tmpvar_2405, tmpvar_2405)) + min (max (tmpvar_2404.x, 
    max (tmpvar_2404.y, tmpvar_2404.z)
  ), 0.0));
  highp vec4 tmpvar_2406;
  if ((tmpvar_2403 < tmpvar_2400.x)) {
    highp vec3 tmpvar_2407;
    tmpvar_2407 = (abs((_up_2396 - vec3(0.0, 0.5, 0.0))) - vec3(0.3, 0.5, 0.3));
    highp vec3 tmpvar_2408;
    tmpvar_2408 = max (tmpvar_2407, 0.0);
    highp vec4 tmpvar_2409;
    tmpvar_2409.yzw = vec3(-0.1, 0.0, 0.0);
    tmpvar_2409.x = (sqrt(dot (tmpvar_2408, tmpvar_2408)) + min (max (tmpvar_2407.x, 
      max (tmpvar_2407.y, tmpvar_2407.z)
    ), 0.0));
    tmpvar_2406 = tmpvar_2409;
  } else {
    tmpvar_2406 = tmpvar_2400;
  };
  if ((tmpvar_2406.y < 0.0)) {
    highp vec3 _upArm1R_2410;
    highp vec3 _upArm0R_2411;
    highp vec3 _upArm1L_2412;
    highp vec3 _upArm0L_2413;
    highp vec3 _upLeg1R_2414;
    highp vec3 _upLeg0R_2415;
    highp vec3 _upLeg1L_2416;
    highp vec3 _upLeg0L_2417;
    highp vec3 _upHead_2418;
    highp vec3 _upNeck_2419;
    highp vec3 _upChest_2420;
    highp vec3 _upWaist_2421;
    highp vec3 _upPelvis_2422;
    float tmpvar_2423;
    tmpvar_2423 = (iTime * 4.0);
    highp int tmpvar_2424;
    tmpvar_2424 = ((int(tmpvar_2423)% 4));
    highp int tmpvar_2425;
    tmpvar_2425 = ((int((tmpvar_2423 / 4.0))% 2));
    highp int _uidx1_2426;
    highp int tmpvar_2427;
    if ((tmpvar_2425 == 0)) {
      tmpvar_2427 = 1;
    } else {
      tmpvar_2427 = -1;
    };
    float tmpvar_2428;
    tmpvar_2428 = fract((iTime * 4.0));
    highp int tmpvar_2429;
    tmpvar_2429 = (tmpvar_2424 - 1);
    highp int tmpvar_2430;
    if ((tmpvar_2427 >= 0)) {
      tmpvar_2430 = 0;
    } else {
      tmpvar_2430 = 1;
    };
    highp int tmpvar_2431;
    tmpvar_2431 = (10 + tmpvar_2430);
    _uidx1_2426 = tmpvar_2431;
    if ((tmpvar_2429 < 0)) {
      highp int tmpvar_2432;
      if ((tmpvar_2427 >= 0)) {
        tmpvar_2432 = 1;
      } else {
        tmpvar_2432 = 0;
      };
      _uidx1_2426 = (10 + tmpvar_2432);
    };
    highp int tmpvar_2433;
    if ((tmpvar_2429 < 0)) {
      tmpvar_2433 = 3;
    } else {
      tmpvar_2433 = tmpvar_2429;
    };
    float tmpvar_2434;
    tmpvar_2434 = ((mix (
      vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (float(_uidx1_2426), 0.0, 11.0))][int(clamp (float(tmpvar_2433), 0.0, 3.0))]
    , 
      vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (float(tmpvar_2431), 0.0, 11.0))][int(clamp (float(tmpvar_2424), 0.0, 3.0))]
    , tmpvar_2428) * 3.141593) / 180.0);
    highp int _uidx1_2435;
    highp int tmpvar_2436;
    if ((tmpvar_2425 == 0)) {
      tmpvar_2436 = 1;
    } else {
      tmpvar_2436 = -1;
    };
    float tmpvar_2437;
    tmpvar_2437 = fract((iTime * 4.0));
    highp int tmpvar_2438;
    tmpvar_2438 = (tmpvar_2424 - 1);
    highp int tmpvar_2439;
    if ((tmpvar_2436 >= 0)) {
      tmpvar_2439 = 0;
    } else {
      tmpvar_2439 = 1;
    };
    _uidx1_2435 = tmpvar_2439;
    if ((tmpvar_2438 < 0)) {
      highp int tmpvar_2440;
      if ((tmpvar_2436 >= 0)) {
        tmpvar_2440 = 1;
      } else {
        tmpvar_2440 = 0;
      };
      _uidx1_2435 = tmpvar_2440;
    };
    highp int tmpvar_2441;
    if ((tmpvar_2438 < 0)) {
      tmpvar_2441 = 3;
    } else {
      tmpvar_2441 = tmpvar_2438;
    };
    vec3 tmpvar_2442;
    tmpvar_2442.xz = vec2(0.0, 0.0);
    tmpvar_2442.y = (-0.5 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[
      int(clamp (float(_uidx1_2435), 0.0, 11.0))
    ][
      int(clamp (float(tmpvar_2441), 0.0, 3.0))
    ], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[
      int(clamp (float(tmpvar_2439), 0.0, 11.0))
    ][
      int(clamp (float(tmpvar_2424), 0.0, 3.0))
    ], tmpvar_2437));
    highp vec3 tmpvar_2443;
    tmpvar_2443 = (_up_2396 + tmpvar_2442);
    _upPelvis_2422.z = tmpvar_2443.z;
    mat2 tmpvar_2444;
    tmpvar_2444[uint(0)].x = cos(tmpvar_2434);
    tmpvar_2444[uint(0)].y = sin(tmpvar_2434);
    tmpvar_2444[1u].x = -(sin(tmpvar_2434));
    tmpvar_2444[1u].y = cos(tmpvar_2434);
    _upPelvis_2422.xy = (tmpvar_2443.xy * tmpvar_2444);
    highp vec3 tmpvar_2445;
    tmpvar_2445 = (abs((_upPelvis_2422 - vec3(0.0, 0.0, 0.025))) - vec3(0.085, 0.05, 0.05));
    highp vec3 tmpvar_2446;
    tmpvar_2446 = max (tmpvar_2445, 0.0);
    highp vec3 tmpvar_2447;
    tmpvar_2447 = (_upPelvis_2422 + vec3(0.0, -0.05, -0.02));
    _upWaist_2421.z = tmpvar_2447.z;
    mat2 tmpvar_2448;
    tmpvar_2448[uint(0)].x = cos(-(tmpvar_2434));
    tmpvar_2448[uint(0)].y = sin(-(tmpvar_2434));
    tmpvar_2448[1u].x = -(sin(-(tmpvar_2434)));
    tmpvar_2448[1u].y = cos(-(tmpvar_2434));
    _upWaist_2421.xy = (tmpvar_2447.xy * tmpvar_2448);
    _upWaist_2421.yz = (_upWaist_2421.yz * mat2(1.0, 0.0, -0.0, 1.0));
    highp vec3 tmpvar_2449;
    tmpvar_2449 = (abs((_upWaist_2421 - vec3(0.0, 0.04, 0.0))) - vec3(0.075, 0.08, 0.03));
    highp vec3 tmpvar_2450;
    tmpvar_2450 = max (tmpvar_2449, 0.0);
    highp vec3 tmpvar_2451;
    tmpvar_2451 = (_upWaist_2421 + vec3(0.0, -0.14, -0.01));
    _upChest_2420.x = tmpvar_2451.x;
    _upChest_2420.yz = (tmpvar_2451.yz * mat2(1.0, 0.0, -0.0, 1.0));
    highp vec3 tmpvar_2452;
    tmpvar_2452 = (abs((_upChest_2420 - vec3(0.0, 0.04, 0.0))) - vec3(0.09, 0.08, 0.05));
    highp vec3 tmpvar_2453;
    tmpvar_2453 = max (tmpvar_2452, 0.0);
    highp vec3 tmpvar_2454;
    tmpvar_2454 = (_upChest_2420 + vec3(0.0, -0.15, 0.0));
    _upNeck_2419.x = tmpvar_2454.x;
    _upNeck_2419.yz = (tmpvar_2454.yz * mat2(1.0, 0.0, -0.0, 1.0));
    highp vec3 tmpvar_2455;
    tmpvar_2455 = (abs((_upNeck_2419 - vec3(0.0, 0.01, 0.0))) - vec3(0.02, 0.04, 0.02));
    highp vec3 tmpvar_2456;
    tmpvar_2456 = max (tmpvar_2455, 0.0);
    highp vec3 tmpvar_2457;
    tmpvar_2457 = (_upNeck_2419 + vec3(0.0, -0.1, 0.0));
    _upHead_2418.x = tmpvar_2457.x;
    _upHead_2418.yz = (tmpvar_2457.yz * mat2(1.0, 0.0, -0.0, 1.0));
    highp vec3 tmpvar_2458;
    tmpvar_2458 = (abs((_upHead_2418 - vec3(0.0, 0.04, -0.025))) - vec3(0.05, 0.08, 0.06));
    highp vec3 tmpvar_2459;
    tmpvar_2459 = max (tmpvar_2458, 0.0);
    highp float tmpvar_2460;
    tmpvar_2460 = min (min (min (
      min (min (4.5, (sqrt(
        dot (tmpvar_2446, tmpvar_2446)
      ) + min (
        max (tmpvar_2445.x, max (tmpvar_2445.y, tmpvar_2445.z))
      , 0.0))), (sqrt(dot (tmpvar_2450, tmpvar_2450)) + min (max (tmpvar_2449.x, 
        max (tmpvar_2449.y, tmpvar_2449.z)
      ), 0.0)))
    , 
      (sqrt(dot (tmpvar_2453, tmpvar_2453)) + min (max (tmpvar_2452.x, max (tmpvar_2452.y, tmpvar_2452.z)), 0.0))
    ), (
      sqrt(dot (tmpvar_2456, tmpvar_2456))
     + 
      min (max (tmpvar_2455.x, max (tmpvar_2455.y, tmpvar_2455.z)), 0.0)
    )), (sqrt(
      dot (tmpvar_2459, tmpvar_2459)
    ) + min (
      max (tmpvar_2458.x, max (tmpvar_2458.y, tmpvar_2458.z))
    , 0.0)));
    highp vec3 tmpvar_2461;
    tmpvar_2461 = (_upPelvis_2422 + vec3(0.06, 0.025, 0.0));
    _upLeg0L_2417.z = tmpvar_2461.z;
    mat2 tmpvar_2462;
    tmpvar_2462[uint(0)].x = cos(-(tmpvar_2434));
    tmpvar_2462[uint(0)].y = sin(-(tmpvar_2434));
    tmpvar_2462[1u].x = -(sin(-(tmpvar_2434)));
    tmpvar_2462[1u].y = cos(-(tmpvar_2434));
    _upLeg0L_2417.xy = (tmpvar_2461.xy * tmpvar_2462);
    highp int _uidx1_2463;
    highp int tmpvar_2464;
    if ((tmpvar_2425 == 0)) {
      tmpvar_2464 = 1;
    } else {
      tmpvar_2464 = -1;
    };
    float tmpvar_2465;
    tmpvar_2465 = fract((iTime * 4.0));
    highp int tmpvar_2466;
    tmpvar_2466 = (tmpvar_2424 - 1);
    highp int tmpvar_2467;
    if ((tmpvar_2464 >= 0)) {
      tmpvar_2467 = 0;
    } else {
      tmpvar_2467 = 1;
    };
    highp int tmpvar_2468;
    tmpvar_2468 = (2 + tmpvar_2467);
    _uidx1_2463 = tmpvar_2468;
    if ((tmpvar_2466 < 0)) {
      highp int tmpvar_2469;
      if ((tmpvar_2464 >= 0)) {
        tmpvar_2469 = 1;
      } else {
        tmpvar_2469 = 0;
      };
      _uidx1_2463 = (2 + tmpvar_2469);
    };
    highp int tmpvar_2470;
    if ((tmpvar_2466 < 0)) {
      tmpvar_2470 = 3;
    } else {
      tmpvar_2470 = tmpvar_2466;
    };
    float tmpvar_2471;
    tmpvar_2471 = cos(((
      (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(_uidx1_2463), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_2470), 0.0, 3.0)
      )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(tmpvar_2468), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_2424), 0.0, 3.0)
      )], tmpvar_2465))
     * 3.141593) / 180.0));
    highp int _uidx1_2472;
    highp int tmpvar_2473;
    if ((tmpvar_2425 == 0)) {
      tmpvar_2473 = 1;
    } else {
      tmpvar_2473 = -1;
    };
    float tmpvar_2474;
    tmpvar_2474 = fract((iTime * 4.0));
    highp int tmpvar_2475;
    tmpvar_2475 = (tmpvar_2424 - 1);
    highp int tmpvar_2476;
    if ((tmpvar_2473 >= 0)) {
      tmpvar_2476 = 0;
    } else {
      tmpvar_2476 = 1;
    };
    highp int tmpvar_2477;
    tmpvar_2477 = (2 + tmpvar_2476);
    _uidx1_2472 = tmpvar_2477;
    if ((tmpvar_2475 < 0)) {
      highp int tmpvar_2478;
      if ((tmpvar_2473 >= 0)) {
        tmpvar_2478 = 1;
      } else {
        tmpvar_2478 = 0;
      };
      _uidx1_2472 = (2 + tmpvar_2478);
    };
    highp int tmpvar_2479;
    if ((tmpvar_2475 < 0)) {
      tmpvar_2479 = 3;
    } else {
      tmpvar_2479 = tmpvar_2475;
    };
    float tmpvar_2480;
    tmpvar_2480 = sin(((
      (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(_uidx1_2472), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_2479), 0.0, 3.0)
      )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(tmpvar_2477), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_2424), 0.0, 3.0)
      )], tmpvar_2474))
     * 3.141593) / 180.0));
    highp int _uidx1_2481;
    highp int tmpvar_2482;
    if ((tmpvar_2425 == 0)) {
      tmpvar_2482 = 1;
    } else {
      tmpvar_2482 = -1;
    };
    float tmpvar_2483;
    tmpvar_2483 = fract((iTime * 4.0));
    highp int tmpvar_2484;
    tmpvar_2484 = (tmpvar_2424 - 1);
    highp int tmpvar_2485;
    if ((tmpvar_2482 >= 0)) {
      tmpvar_2485 = 0;
    } else {
      tmpvar_2485 = 1;
    };
    highp int tmpvar_2486;
    tmpvar_2486 = (2 + tmpvar_2485);
    _uidx1_2481 = tmpvar_2486;
    if ((tmpvar_2484 < 0)) {
      highp int tmpvar_2487;
      if ((tmpvar_2482 >= 0)) {
        tmpvar_2487 = 1;
      } else {
        tmpvar_2487 = 0;
      };
      _uidx1_2481 = (2 + tmpvar_2487);
    };
    highp int tmpvar_2488;
    if ((tmpvar_2484 < 0)) {
      tmpvar_2488 = 3;
    } else {
      tmpvar_2488 = tmpvar_2484;
    };
    float tmpvar_2489;
    tmpvar_2489 = sin(((
      (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(_uidx1_2481), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_2488), 0.0, 3.0)
      )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(tmpvar_2486), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_2424), 0.0, 3.0)
      )], tmpvar_2483))
     * 3.141593) / 180.0));
    highp int _uidx1_2490;
    highp int tmpvar_2491;
    if ((tmpvar_2425 == 0)) {
      tmpvar_2491 = 1;
    } else {
      tmpvar_2491 = -1;
    };
    float tmpvar_2492;
    tmpvar_2492 = fract((iTime * 4.0));
    highp int tmpvar_2493;
    tmpvar_2493 = (tmpvar_2424 - 1);
    highp int tmpvar_2494;
    if ((tmpvar_2491 >= 0)) {
      tmpvar_2494 = 0;
    } else {
      tmpvar_2494 = 1;
    };
    highp int tmpvar_2495;
    tmpvar_2495 = (2 + tmpvar_2494);
    _uidx1_2490 = tmpvar_2495;
    if ((tmpvar_2493 < 0)) {
      highp int tmpvar_2496;
      if ((tmpvar_2491 >= 0)) {
        tmpvar_2496 = 1;
      } else {
        tmpvar_2496 = 0;
      };
      _uidx1_2490 = (2 + tmpvar_2496);
    };
    highp int tmpvar_2497;
    if ((tmpvar_2493 < 0)) {
      tmpvar_2497 = 3;
    } else {
      tmpvar_2497 = tmpvar_2493;
    };
    mat2 tmpvar_2498;
    tmpvar_2498[uint(0)].x = tmpvar_2471;
    tmpvar_2498[uint(0)].y = tmpvar_2480;
    tmpvar_2498[1u].x = -(tmpvar_2489);
    tmpvar_2498[1u].y = cos(((
      (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(_uidx1_2490), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_2497), 0.0, 3.0)
      )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(tmpvar_2495), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_2424), 0.0, 3.0)
      )], tmpvar_2492))
     * 3.141593) / 180.0));
    _upLeg0L_2417.yz = (_upLeg0L_2417.yz * tmpvar_2498);
    highp vec3 tmpvar_2499;
    tmpvar_2499 = (abs((_upLeg0L_2417 - vec3(0.0, 0.1, 0.0))) - vec3(0.025, 0.1, 0.025));
    highp vec3 tmpvar_2500;
    tmpvar_2500 = max (tmpvar_2499, 0.0);
    highp float tmpvar_2501;
    tmpvar_2501 = min (tmpvar_2460, (sqrt(
      dot (tmpvar_2500, tmpvar_2500)
    ) + min (
      max (tmpvar_2499.x, max (tmpvar_2499.y, tmpvar_2499.z))
    , 0.0)));
    highp vec3 tmpvar_2502;
    tmpvar_2502 = (_upLeg0L_2417 + vec3(0.01, -0.18, 0.02));
    _upLeg1L_2416 = tmpvar_2502;
    highp int _uidx1_2503;
    highp int tmpvar_2504;
    if ((tmpvar_2425 == 0)) {
      tmpvar_2504 = 1;
    } else {
      tmpvar_2504 = -1;
    };
    float tmpvar_2505;
    tmpvar_2505 = fract((iTime * 4.0));
    highp int tmpvar_2506;
    tmpvar_2506 = (tmpvar_2424 - 1);
    highp int tmpvar_2507;
    if ((tmpvar_2504 >= 0)) {
      tmpvar_2507 = 0;
    } else {
      tmpvar_2507 = 1;
    };
    highp int tmpvar_2508;
    tmpvar_2508 = (4 + tmpvar_2507);
    _uidx1_2503 = tmpvar_2508;
    if ((tmpvar_2506 < 0)) {
      highp int tmpvar_2509;
      if ((tmpvar_2504 >= 0)) {
        tmpvar_2509 = 1;
      } else {
        tmpvar_2509 = 0;
      };
      _uidx1_2503 = (4 + tmpvar_2509);
    };
    highp int tmpvar_2510;
    if ((tmpvar_2506 < 0)) {
      tmpvar_2510 = 3;
    } else {
      tmpvar_2510 = tmpvar_2506;
    };
    float tmpvar_2511;
    tmpvar_2511 = cos(((
      mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(_uidx1_2503)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_2510)
      , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(tmpvar_2508)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_2424)
      , 0.0, 3.0))], tmpvar_2505)
     * 3.141593) / 180.0));
    highp int _uidx1_2512;
    highp int tmpvar_2513;
    if ((tmpvar_2425 == 0)) {
      tmpvar_2513 = 1;
    } else {
      tmpvar_2513 = -1;
    };
    float tmpvar_2514;
    tmpvar_2514 = fract((iTime * 4.0));
    highp int tmpvar_2515;
    tmpvar_2515 = (tmpvar_2424 - 1);
    highp int tmpvar_2516;
    if ((tmpvar_2513 >= 0)) {
      tmpvar_2516 = 0;
    } else {
      tmpvar_2516 = 1;
    };
    highp int tmpvar_2517;
    tmpvar_2517 = (4 + tmpvar_2516);
    _uidx1_2512 = tmpvar_2517;
    if ((tmpvar_2515 < 0)) {
      highp int tmpvar_2518;
      if ((tmpvar_2513 >= 0)) {
        tmpvar_2518 = 1;
      } else {
        tmpvar_2518 = 0;
      };
      _uidx1_2512 = (4 + tmpvar_2518);
    };
    highp int tmpvar_2519;
    if ((tmpvar_2515 < 0)) {
      tmpvar_2519 = 3;
    } else {
      tmpvar_2519 = tmpvar_2515;
    };
    float tmpvar_2520;
    tmpvar_2520 = sin(((
      mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(_uidx1_2512)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_2519)
      , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(tmpvar_2517)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_2424)
      , 0.0, 3.0))], tmpvar_2514)
     * 3.141593) / 180.0));
    highp int _uidx1_2521;
    highp int tmpvar_2522;
    if ((tmpvar_2425 == 0)) {
      tmpvar_2522 = 1;
    } else {
      tmpvar_2522 = -1;
    };
    float tmpvar_2523;
    tmpvar_2523 = fract((iTime * 4.0));
    highp int tmpvar_2524;
    tmpvar_2524 = (tmpvar_2424 - 1);
    highp int tmpvar_2525;
    if ((tmpvar_2522 >= 0)) {
      tmpvar_2525 = 0;
    } else {
      tmpvar_2525 = 1;
    };
    highp int tmpvar_2526;
    tmpvar_2526 = (4 + tmpvar_2525);
    _uidx1_2521 = tmpvar_2526;
    if ((tmpvar_2524 < 0)) {
      highp int tmpvar_2527;
      if ((tmpvar_2522 >= 0)) {
        tmpvar_2527 = 1;
      } else {
        tmpvar_2527 = 0;
      };
      _uidx1_2521 = (4 + tmpvar_2527);
    };
    highp int tmpvar_2528;
    if ((tmpvar_2524 < 0)) {
      tmpvar_2528 = 3;
    } else {
      tmpvar_2528 = tmpvar_2524;
    };
    float tmpvar_2529;
    tmpvar_2529 = sin(((
      mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(_uidx1_2521)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_2528)
      , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(tmpvar_2526)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_2424)
      , 0.0, 3.0))], tmpvar_2523)
     * 3.141593) / 180.0));
    highp int _uidx1_2530;
    highp int tmpvar_2531;
    if ((tmpvar_2425 == 0)) {
      tmpvar_2531 = 1;
    } else {
      tmpvar_2531 = -1;
    };
    float tmpvar_2532;
    tmpvar_2532 = fract((iTime * 4.0));
    highp int tmpvar_2533;
    tmpvar_2533 = (tmpvar_2424 - 1);
    highp int tmpvar_2534;
    if ((tmpvar_2531 >= 0)) {
      tmpvar_2534 = 0;
    } else {
      tmpvar_2534 = 1;
    };
    highp int tmpvar_2535;
    tmpvar_2535 = (4 + tmpvar_2534);
    _uidx1_2530 = tmpvar_2535;
    if ((tmpvar_2533 < 0)) {
      highp int tmpvar_2536;
      if ((tmpvar_2531 >= 0)) {
        tmpvar_2536 = 1;
      } else {
        tmpvar_2536 = 0;
      };
      _uidx1_2530 = (4 + tmpvar_2536);
    };
    highp int tmpvar_2537;
    if ((tmpvar_2533 < 0)) {
      tmpvar_2537 = 3;
    } else {
      tmpvar_2537 = tmpvar_2533;
    };
    mat2 tmpvar_2538;
    tmpvar_2538[uint(0)].x = tmpvar_2511;
    tmpvar_2538[uint(0)].y = tmpvar_2520;
    tmpvar_2538[1u].x = -(tmpvar_2529);
    tmpvar_2538[1u].y = cos(((
      mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(_uidx1_2530)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_2537)
      , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(tmpvar_2535)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_2424)
      , 0.0, 3.0))], tmpvar_2532)
     * 3.141593) / 180.0));
    _upLeg1L_2416.yz = (tmpvar_2502.yz * tmpvar_2538);
    highp vec3 tmpvar_2539;
    tmpvar_2539 = (abs((_upLeg1L_2416 - vec3(0.0, 0.1, 0.0))) - vec3(0.025, 0.1, 0.025));
    highp vec3 tmpvar_2540;
    tmpvar_2540 = max (tmpvar_2539, 0.0);
    highp float tmpvar_2541;
    tmpvar_2541 = min (tmpvar_2501, (sqrt(
      dot (tmpvar_2540, tmpvar_2540)
    ) + min (
      max (tmpvar_2539.x, max (tmpvar_2539.y, tmpvar_2539.z))
    , 0.0)));
    highp vec3 tmpvar_2542;
    tmpvar_2542 = (_upPelvis_2422 + vec3(-0.06, 0.025, 0.0));
    _upLeg0R_2415.z = tmpvar_2542.z;
    mat2 tmpvar_2543;
    tmpvar_2543[uint(0)].x = cos(-(tmpvar_2434));
    tmpvar_2543[uint(0)].y = sin(-(tmpvar_2434));
    tmpvar_2543[1u].x = -(sin(-(tmpvar_2434)));
    tmpvar_2543[1u].y = cos(-(tmpvar_2434));
    _upLeg0R_2415.xy = (tmpvar_2542.xy * tmpvar_2543);
    highp int _us_2544;
    _us_2544 = -1;
    highp int _uidx1_2545;
    highp int tmpvar_2546;
    if ((tmpvar_2425 == 0)) {
      tmpvar_2546 = 1;
    } else {
      tmpvar_2546 = -1;
    };
    _us_2544 = -(tmpvar_2546);
    float tmpvar_2547;
    tmpvar_2547 = fract((iTime * 4.0));
    highp int tmpvar_2548;
    tmpvar_2548 = (tmpvar_2424 - 1);
    highp int tmpvar_2549;
    if ((_us_2544 >= 0)) {
      tmpvar_2549 = 0;
    } else {
      tmpvar_2549 = 1;
    };
    highp int tmpvar_2550;
    tmpvar_2550 = (2 + tmpvar_2549);
    _uidx1_2545 = tmpvar_2550;
    if ((tmpvar_2548 < 0)) {
      highp int tmpvar_2551;
      if ((_us_2544 >= 0)) {
        tmpvar_2551 = 1;
      } else {
        tmpvar_2551 = 0;
      };
      _uidx1_2545 = (2 + tmpvar_2551);
    };
    highp int tmpvar_2552;
    if ((tmpvar_2548 < 0)) {
      tmpvar_2552 = 3;
    } else {
      tmpvar_2552 = tmpvar_2548;
    };
    float tmpvar_2553;
    tmpvar_2553 = cos(((
      (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(_uidx1_2545), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_2552), 0.0, 3.0)
      )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(tmpvar_2550), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_2424), 0.0, 3.0)
      )], tmpvar_2547))
     * 3.141593) / 180.0));
    highp int _us_2554;
    _us_2554 = -1;
    highp int _uidx1_2555;
    highp int tmpvar_2556;
    if ((tmpvar_2425 == 0)) {
      tmpvar_2556 = 1;
    } else {
      tmpvar_2556 = -1;
    };
    _us_2554 = -(tmpvar_2556);
    float tmpvar_2557;
    tmpvar_2557 = fract((iTime * 4.0));
    highp int tmpvar_2558;
    tmpvar_2558 = (tmpvar_2424 - 1);
    highp int tmpvar_2559;
    if ((_us_2554 >= 0)) {
      tmpvar_2559 = 0;
    } else {
      tmpvar_2559 = 1;
    };
    highp int tmpvar_2560;
    tmpvar_2560 = (2 + tmpvar_2559);
    _uidx1_2555 = tmpvar_2560;
    if ((tmpvar_2558 < 0)) {
      highp int tmpvar_2561;
      if ((_us_2554 >= 0)) {
        tmpvar_2561 = 1;
      } else {
        tmpvar_2561 = 0;
      };
      _uidx1_2555 = (2 + tmpvar_2561);
    };
    highp int tmpvar_2562;
    if ((tmpvar_2558 < 0)) {
      tmpvar_2562 = 3;
    } else {
      tmpvar_2562 = tmpvar_2558;
    };
    float tmpvar_2563;
    tmpvar_2563 = sin(((
      (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(_uidx1_2555), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_2562), 0.0, 3.0)
      )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(tmpvar_2560), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_2424), 0.0, 3.0)
      )], tmpvar_2557))
     * 3.141593) / 180.0));
    highp int _us_2564;
    _us_2564 = -1;
    highp int _uidx1_2565;
    highp int tmpvar_2566;
    if ((tmpvar_2425 == 0)) {
      tmpvar_2566 = 1;
    } else {
      tmpvar_2566 = -1;
    };
    _us_2564 = -(tmpvar_2566);
    float tmpvar_2567;
    tmpvar_2567 = fract((iTime * 4.0));
    highp int tmpvar_2568;
    tmpvar_2568 = (tmpvar_2424 - 1);
    highp int tmpvar_2569;
    if ((_us_2564 >= 0)) {
      tmpvar_2569 = 0;
    } else {
      tmpvar_2569 = 1;
    };
    highp int tmpvar_2570;
    tmpvar_2570 = (2 + tmpvar_2569);
    _uidx1_2565 = tmpvar_2570;
    if ((tmpvar_2568 < 0)) {
      highp int tmpvar_2571;
      if ((_us_2564 >= 0)) {
        tmpvar_2571 = 1;
      } else {
        tmpvar_2571 = 0;
      };
      _uidx1_2565 = (2 + tmpvar_2571);
    };
    highp int tmpvar_2572;
    if ((tmpvar_2568 < 0)) {
      tmpvar_2572 = 3;
    } else {
      tmpvar_2572 = tmpvar_2568;
    };
    float tmpvar_2573;
    tmpvar_2573 = sin(((
      (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(_uidx1_2565), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_2572), 0.0, 3.0)
      )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(tmpvar_2570), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_2424), 0.0, 3.0)
      )], tmpvar_2567))
     * 3.141593) / 180.0));
    highp int _us_2574;
    _us_2574 = -1;
    highp int _uidx1_2575;
    highp int tmpvar_2576;
    if ((tmpvar_2425 == 0)) {
      tmpvar_2576 = 1;
    } else {
      tmpvar_2576 = -1;
    };
    _us_2574 = -(tmpvar_2576);
    float tmpvar_2577;
    tmpvar_2577 = fract((iTime * 4.0));
    highp int tmpvar_2578;
    tmpvar_2578 = (tmpvar_2424 - 1);
    highp int tmpvar_2579;
    if ((_us_2574 >= 0)) {
      tmpvar_2579 = 0;
    } else {
      tmpvar_2579 = 1;
    };
    highp int tmpvar_2580;
    tmpvar_2580 = (2 + tmpvar_2579);
    _uidx1_2575 = tmpvar_2580;
    if ((tmpvar_2578 < 0)) {
      highp int tmpvar_2581;
      if ((_us_2574 >= 0)) {
        tmpvar_2581 = 1;
      } else {
        tmpvar_2581 = 0;
      };
      _uidx1_2575 = (2 + tmpvar_2581);
    };
    highp int tmpvar_2582;
    if ((tmpvar_2578 < 0)) {
      tmpvar_2582 = 3;
    } else {
      tmpvar_2582 = tmpvar_2578;
    };
    mat2 tmpvar_2583;
    tmpvar_2583[uint(0)].x = tmpvar_2553;
    tmpvar_2583[uint(0)].y = tmpvar_2563;
    tmpvar_2583[1u].x = -(tmpvar_2573);
    tmpvar_2583[1u].y = cos(((
      (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(_uidx1_2575), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_2582), 0.0, 3.0)
      )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(tmpvar_2580), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_2424), 0.0, 3.0)
      )], tmpvar_2577))
     * 3.141593) / 180.0));
    _upLeg0R_2415.yz = (_upLeg0R_2415.yz * tmpvar_2583);
    highp vec3 tmpvar_2584;
    tmpvar_2584 = (abs((_upLeg0R_2415 - vec3(0.0, 0.1, 0.0))) - vec3(0.025, 0.1, 0.025));
    highp vec3 tmpvar_2585;
    tmpvar_2585 = max (tmpvar_2584, 0.0);
    highp float tmpvar_2586;
    tmpvar_2586 = min (tmpvar_2541, (sqrt(
      dot (tmpvar_2585, tmpvar_2585)
    ) + min (
      max (tmpvar_2584.x, max (tmpvar_2584.y, tmpvar_2584.z))
    , 0.0)));
    highp vec3 tmpvar_2587;
    tmpvar_2587 = (_upLeg0R_2415 + vec3(-0.01, -0.18, 0.02));
    _upLeg1R_2414 = tmpvar_2587;
    highp int _us_2588;
    _us_2588 = -1;
    highp int _uidx1_2589;
    highp int tmpvar_2590;
    if ((tmpvar_2425 == 0)) {
      tmpvar_2590 = 1;
    } else {
      tmpvar_2590 = -1;
    };
    _us_2588 = -(tmpvar_2590);
    float tmpvar_2591;
    tmpvar_2591 = fract((iTime * 4.0));
    highp int tmpvar_2592;
    tmpvar_2592 = (tmpvar_2424 - 1);
    highp int tmpvar_2593;
    if ((_us_2588 >= 0)) {
      tmpvar_2593 = 0;
    } else {
      tmpvar_2593 = 1;
    };
    highp int tmpvar_2594;
    tmpvar_2594 = (4 + tmpvar_2593);
    _uidx1_2589 = tmpvar_2594;
    if ((tmpvar_2592 < 0)) {
      highp int tmpvar_2595;
      if ((_us_2588 >= 0)) {
        tmpvar_2595 = 1;
      } else {
        tmpvar_2595 = 0;
      };
      _uidx1_2589 = (4 + tmpvar_2595);
    };
    highp int tmpvar_2596;
    if ((tmpvar_2592 < 0)) {
      tmpvar_2596 = 3;
    } else {
      tmpvar_2596 = tmpvar_2592;
    };
    float tmpvar_2597;
    tmpvar_2597 = cos(((
      mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(_uidx1_2589)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_2596)
      , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(tmpvar_2594)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_2424)
      , 0.0, 3.0))], tmpvar_2591)
     * 3.141593) / 180.0));
    highp int _us_2598;
    _us_2598 = -1;
    highp int _uidx1_2599;
    highp int tmpvar_2600;
    if ((tmpvar_2425 == 0)) {
      tmpvar_2600 = 1;
    } else {
      tmpvar_2600 = -1;
    };
    _us_2598 = -(tmpvar_2600);
    float tmpvar_2601;
    tmpvar_2601 = fract((iTime * 4.0));
    highp int tmpvar_2602;
    tmpvar_2602 = (tmpvar_2424 - 1);
    highp int tmpvar_2603;
    if ((_us_2598 >= 0)) {
      tmpvar_2603 = 0;
    } else {
      tmpvar_2603 = 1;
    };
    highp int tmpvar_2604;
    tmpvar_2604 = (4 + tmpvar_2603);
    _uidx1_2599 = tmpvar_2604;
    if ((tmpvar_2602 < 0)) {
      highp int tmpvar_2605;
      if ((_us_2598 >= 0)) {
        tmpvar_2605 = 1;
      } else {
        tmpvar_2605 = 0;
      };
      _uidx1_2599 = (4 + tmpvar_2605);
    };
    highp int tmpvar_2606;
    if ((tmpvar_2602 < 0)) {
      tmpvar_2606 = 3;
    } else {
      tmpvar_2606 = tmpvar_2602;
    };
    float tmpvar_2607;
    tmpvar_2607 = sin(((
      mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(_uidx1_2599)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_2606)
      , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(tmpvar_2604)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_2424)
      , 0.0, 3.0))], tmpvar_2601)
     * 3.141593) / 180.0));
    highp int _us_2608;
    _us_2608 = -1;
    highp int _uidx1_2609;
    highp int tmpvar_2610;
    if ((tmpvar_2425 == 0)) {
      tmpvar_2610 = 1;
    } else {
      tmpvar_2610 = -1;
    };
    _us_2608 = -(tmpvar_2610);
    float tmpvar_2611;
    tmpvar_2611 = fract((iTime * 4.0));
    highp int tmpvar_2612;
    tmpvar_2612 = (tmpvar_2424 - 1);
    highp int tmpvar_2613;
    if ((_us_2608 >= 0)) {
      tmpvar_2613 = 0;
    } else {
      tmpvar_2613 = 1;
    };
    highp int tmpvar_2614;
    tmpvar_2614 = (4 + tmpvar_2613);
    _uidx1_2609 = tmpvar_2614;
    if ((tmpvar_2612 < 0)) {
      highp int tmpvar_2615;
      if ((_us_2608 >= 0)) {
        tmpvar_2615 = 1;
      } else {
        tmpvar_2615 = 0;
      };
      _uidx1_2609 = (4 + tmpvar_2615);
    };
    highp int tmpvar_2616;
    if ((tmpvar_2612 < 0)) {
      tmpvar_2616 = 3;
    } else {
      tmpvar_2616 = tmpvar_2612;
    };
    float tmpvar_2617;
    tmpvar_2617 = sin(((
      mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(_uidx1_2609)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_2616)
      , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(tmpvar_2614)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_2424)
      , 0.0, 3.0))], tmpvar_2611)
     * 3.141593) / 180.0));
    highp int _us_2618;
    _us_2618 = -1;
    highp int _uidx1_2619;
    highp int tmpvar_2620;
    if ((tmpvar_2425 == 0)) {
      tmpvar_2620 = 1;
    } else {
      tmpvar_2620 = -1;
    };
    _us_2618 = -(tmpvar_2620);
    float tmpvar_2621;
    tmpvar_2621 = fract((iTime * 4.0));
    highp int tmpvar_2622;
    tmpvar_2622 = (tmpvar_2424 - 1);
    highp int tmpvar_2623;
    if ((_us_2618 >= 0)) {
      tmpvar_2623 = 0;
    } else {
      tmpvar_2623 = 1;
    };
    highp int tmpvar_2624;
    tmpvar_2624 = (4 + tmpvar_2623);
    _uidx1_2619 = tmpvar_2624;
    if ((tmpvar_2622 < 0)) {
      highp int tmpvar_2625;
      if ((_us_2618 >= 0)) {
        tmpvar_2625 = 1;
      } else {
        tmpvar_2625 = 0;
      };
      _uidx1_2619 = (4 + tmpvar_2625);
    };
    highp int tmpvar_2626;
    if ((tmpvar_2622 < 0)) {
      tmpvar_2626 = 3;
    } else {
      tmpvar_2626 = tmpvar_2622;
    };
    mat2 tmpvar_2627;
    tmpvar_2627[uint(0)].x = tmpvar_2597;
    tmpvar_2627[uint(0)].y = tmpvar_2607;
    tmpvar_2627[1u].x = -(tmpvar_2617);
    tmpvar_2627[1u].y = cos(((
      mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(_uidx1_2619)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_2626)
      , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(tmpvar_2624)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_2424)
      , 0.0, 3.0))], tmpvar_2621)
     * 3.141593) / 180.0));
    _upLeg1R_2414.yz = (tmpvar_2587.yz * tmpvar_2627);
    highp vec3 tmpvar_2628;
    tmpvar_2628 = (abs((_upLeg1R_2414 - vec3(0.0, 0.1, 0.0))) - vec3(0.025, 0.1, 0.025));
    highp vec3 tmpvar_2629;
    tmpvar_2629 = max (tmpvar_2628, 0.0);
    highp float tmpvar_2630;
    tmpvar_2630 = min (tmpvar_2586, (sqrt(
      dot (tmpvar_2629, tmpvar_2629)
    ) + min (
      max (tmpvar_2628.x, max (tmpvar_2628.y, tmpvar_2628.z))
    , 0.0)));
    highp vec3 tmpvar_2631;
    tmpvar_2631 = (_upChest_2420 + vec3(0.125, -0.1, 0.0));
    _upArm0L_2413 = tmpvar_2631;
    highp int _uidx1_2632;
    highp int tmpvar_2633;
    if ((tmpvar_2425 == 0)) {
      tmpvar_2633 = 1;
    } else {
      tmpvar_2633 = -1;
    };
    float tmpvar_2634;
    tmpvar_2634 = fract((iTime * 4.0));
    highp int tmpvar_2635;
    tmpvar_2635 = (tmpvar_2424 - 1);
    highp int tmpvar_2636;
    if ((tmpvar_2633 >= 0)) {
      tmpvar_2636 = 0;
    } else {
      tmpvar_2636 = 1;
    };
    highp int tmpvar_2637;
    tmpvar_2637 = (6 + tmpvar_2636);
    _uidx1_2632 = tmpvar_2637;
    if ((tmpvar_2635 < 0)) {
      highp int tmpvar_2638;
      if ((tmpvar_2633 >= 0)) {
        tmpvar_2638 = 1;
      } else {
        tmpvar_2638 = 0;
      };
      _uidx1_2632 = (6 + tmpvar_2638);
    };
    highp int tmpvar_2639;
    if ((tmpvar_2635 < 0)) {
      tmpvar_2639 = 3;
    } else {
      tmpvar_2639 = tmpvar_2635;
    };
    float tmpvar_2640;
    tmpvar_2640 = cos(((
      (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(_uidx1_2632), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_2639), 0.0, 3.0)
      )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(tmpvar_2637), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_2424), 0.0, 3.0)
      )], tmpvar_2634))
     * 3.141593) / 180.0));
    highp int _uidx1_2641;
    highp int tmpvar_2642;
    if ((tmpvar_2425 == 0)) {
      tmpvar_2642 = 1;
    } else {
      tmpvar_2642 = -1;
    };
    float tmpvar_2643;
    tmpvar_2643 = fract((iTime * 4.0));
    highp int tmpvar_2644;
    tmpvar_2644 = (tmpvar_2424 - 1);
    highp int tmpvar_2645;
    if ((tmpvar_2642 >= 0)) {
      tmpvar_2645 = 0;
    } else {
      tmpvar_2645 = 1;
    };
    highp int tmpvar_2646;
    tmpvar_2646 = (6 + tmpvar_2645);
    _uidx1_2641 = tmpvar_2646;
    if ((tmpvar_2644 < 0)) {
      highp int tmpvar_2647;
      if ((tmpvar_2642 >= 0)) {
        tmpvar_2647 = 1;
      } else {
        tmpvar_2647 = 0;
      };
      _uidx1_2641 = (6 + tmpvar_2647);
    };
    highp int tmpvar_2648;
    if ((tmpvar_2644 < 0)) {
      tmpvar_2648 = 3;
    } else {
      tmpvar_2648 = tmpvar_2644;
    };
    float tmpvar_2649;
    tmpvar_2649 = sin(((
      (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(_uidx1_2641), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_2648), 0.0, 3.0)
      )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(tmpvar_2646), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_2424), 0.0, 3.0)
      )], tmpvar_2643))
     * 3.141593) / 180.0));
    highp int _uidx1_2650;
    highp int tmpvar_2651;
    if ((tmpvar_2425 == 0)) {
      tmpvar_2651 = 1;
    } else {
      tmpvar_2651 = -1;
    };
    float tmpvar_2652;
    tmpvar_2652 = fract((iTime * 4.0));
    highp int tmpvar_2653;
    tmpvar_2653 = (tmpvar_2424 - 1);
    highp int tmpvar_2654;
    if ((tmpvar_2651 >= 0)) {
      tmpvar_2654 = 0;
    } else {
      tmpvar_2654 = 1;
    };
    highp int tmpvar_2655;
    tmpvar_2655 = (6 + tmpvar_2654);
    _uidx1_2650 = tmpvar_2655;
    if ((tmpvar_2653 < 0)) {
      highp int tmpvar_2656;
      if ((tmpvar_2651 >= 0)) {
        tmpvar_2656 = 1;
      } else {
        tmpvar_2656 = 0;
      };
      _uidx1_2650 = (6 + tmpvar_2656);
    };
    highp int tmpvar_2657;
    if ((tmpvar_2653 < 0)) {
      tmpvar_2657 = 3;
    } else {
      tmpvar_2657 = tmpvar_2653;
    };
    float tmpvar_2658;
    tmpvar_2658 = sin(((
      (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(_uidx1_2650), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_2657), 0.0, 3.0)
      )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(tmpvar_2655), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_2424), 0.0, 3.0)
      )], tmpvar_2652))
     * 3.141593) / 180.0));
    highp int _uidx1_2659;
    highp int tmpvar_2660;
    if ((tmpvar_2425 == 0)) {
      tmpvar_2660 = 1;
    } else {
      tmpvar_2660 = -1;
    };
    float tmpvar_2661;
    tmpvar_2661 = fract((iTime * 4.0));
    highp int tmpvar_2662;
    tmpvar_2662 = (tmpvar_2424 - 1);
    highp int tmpvar_2663;
    if ((tmpvar_2660 >= 0)) {
      tmpvar_2663 = 0;
    } else {
      tmpvar_2663 = 1;
    };
    highp int tmpvar_2664;
    tmpvar_2664 = (6 + tmpvar_2663);
    _uidx1_2659 = tmpvar_2664;
    if ((tmpvar_2662 < 0)) {
      highp int tmpvar_2665;
      if ((tmpvar_2660 >= 0)) {
        tmpvar_2665 = 1;
      } else {
        tmpvar_2665 = 0;
      };
      _uidx1_2659 = (6 + tmpvar_2665);
    };
    highp int tmpvar_2666;
    if ((tmpvar_2662 < 0)) {
      tmpvar_2666 = 3;
    } else {
      tmpvar_2666 = tmpvar_2662;
    };
    mat2 tmpvar_2667;
    tmpvar_2667[uint(0)].x = tmpvar_2640;
    tmpvar_2667[uint(0)].y = tmpvar_2649;
    tmpvar_2667[1u].x = -(tmpvar_2658);
    tmpvar_2667[1u].y = cos(((
      (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(_uidx1_2659), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_2666), 0.0, 3.0)
      )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(tmpvar_2664), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_2424), 0.0, 3.0)
      )], tmpvar_2661))
     * 3.141593) / 180.0));
    _upArm0L_2413.yz = (tmpvar_2631.yz * tmpvar_2667);
    highp vec3 tmpvar_2668;
    tmpvar_2668 = (abs((_upArm0L_2413 - vec3(0.0, 0.08, 0.0))) - vec3(0.02, 0.08, 0.02));
    highp vec3 tmpvar_2669;
    tmpvar_2669 = max (tmpvar_2668, 0.0);
    highp float tmpvar_2670;
    tmpvar_2670 = min (tmpvar_2630, (sqrt(
      dot (tmpvar_2669, tmpvar_2669)
    ) + min (
      max (tmpvar_2668.x, max (tmpvar_2668.y, tmpvar_2668.z))
    , 0.0)));
    highp vec3 tmpvar_2671;
    tmpvar_2671 = (_upArm0L_2413 + vec3(0.0, -0.16, 0.0));
    _upArm1L_2412 = tmpvar_2671;
    highp int _uidx1_2672;
    highp int tmpvar_2673;
    if ((tmpvar_2425 == 0)) {
      tmpvar_2673 = 1;
    } else {
      tmpvar_2673 = -1;
    };
    float tmpvar_2674;
    tmpvar_2674 = fract((iTime * 4.0));
    highp int tmpvar_2675;
    tmpvar_2675 = (tmpvar_2424 - 1);
    highp int tmpvar_2676;
    if ((tmpvar_2673 >= 0)) {
      tmpvar_2676 = 0;
    } else {
      tmpvar_2676 = 1;
    };
    highp int tmpvar_2677;
    tmpvar_2677 = (8 + tmpvar_2676);
    _uidx1_2672 = tmpvar_2677;
    if ((tmpvar_2675 < 0)) {
      highp int tmpvar_2678;
      if ((tmpvar_2673 >= 0)) {
        tmpvar_2678 = 1;
      } else {
        tmpvar_2678 = 0;
      };
      _uidx1_2672 = (8 + tmpvar_2678);
    };
    highp int tmpvar_2679;
    if ((tmpvar_2675 < 0)) {
      tmpvar_2679 = 3;
    } else {
      tmpvar_2679 = tmpvar_2675;
    };
    float tmpvar_2680;
    tmpvar_2680 = cos(((
      mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(_uidx1_2672)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_2679)
      , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(tmpvar_2677)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_2424)
      , 0.0, 3.0))], tmpvar_2674)
     * 3.141593) / 180.0));
    highp int _uidx1_2681;
    highp int tmpvar_2682;
    if ((tmpvar_2425 == 0)) {
      tmpvar_2682 = 1;
    } else {
      tmpvar_2682 = -1;
    };
    float tmpvar_2683;
    tmpvar_2683 = fract((iTime * 4.0));
    highp int tmpvar_2684;
    tmpvar_2684 = (tmpvar_2424 - 1);
    highp int tmpvar_2685;
    if ((tmpvar_2682 >= 0)) {
      tmpvar_2685 = 0;
    } else {
      tmpvar_2685 = 1;
    };
    highp int tmpvar_2686;
    tmpvar_2686 = (8 + tmpvar_2685);
    _uidx1_2681 = tmpvar_2686;
    if ((tmpvar_2684 < 0)) {
      highp int tmpvar_2687;
      if ((tmpvar_2682 >= 0)) {
        tmpvar_2687 = 1;
      } else {
        tmpvar_2687 = 0;
      };
      _uidx1_2681 = (8 + tmpvar_2687);
    };
    highp int tmpvar_2688;
    if ((tmpvar_2684 < 0)) {
      tmpvar_2688 = 3;
    } else {
      tmpvar_2688 = tmpvar_2684;
    };
    float tmpvar_2689;
    tmpvar_2689 = sin(((
      mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(_uidx1_2681)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_2688)
      , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(tmpvar_2686)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_2424)
      , 0.0, 3.0))], tmpvar_2683)
     * 3.141593) / 180.0));
    highp int _uidx1_2690;
    highp int tmpvar_2691;
    if ((tmpvar_2425 == 0)) {
      tmpvar_2691 = 1;
    } else {
      tmpvar_2691 = -1;
    };
    float tmpvar_2692;
    tmpvar_2692 = fract((iTime * 4.0));
    highp int tmpvar_2693;
    tmpvar_2693 = (tmpvar_2424 - 1);
    highp int tmpvar_2694;
    if ((tmpvar_2691 >= 0)) {
      tmpvar_2694 = 0;
    } else {
      tmpvar_2694 = 1;
    };
    highp int tmpvar_2695;
    tmpvar_2695 = (8 + tmpvar_2694);
    _uidx1_2690 = tmpvar_2695;
    if ((tmpvar_2693 < 0)) {
      highp int tmpvar_2696;
      if ((tmpvar_2691 >= 0)) {
        tmpvar_2696 = 1;
      } else {
        tmpvar_2696 = 0;
      };
      _uidx1_2690 = (8 + tmpvar_2696);
    };
    highp int tmpvar_2697;
    if ((tmpvar_2693 < 0)) {
      tmpvar_2697 = 3;
    } else {
      tmpvar_2697 = tmpvar_2693;
    };
    float tmpvar_2698;
    tmpvar_2698 = sin(((
      mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(_uidx1_2690)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_2697)
      , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(tmpvar_2695)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_2424)
      , 0.0, 3.0))], tmpvar_2692)
     * 3.141593) / 180.0));
    highp int _uidx1_2699;
    highp int tmpvar_2700;
    if ((tmpvar_2425 == 0)) {
      tmpvar_2700 = 1;
    } else {
      tmpvar_2700 = -1;
    };
    float tmpvar_2701;
    tmpvar_2701 = fract((iTime * 4.0));
    highp int tmpvar_2702;
    tmpvar_2702 = (tmpvar_2424 - 1);
    highp int tmpvar_2703;
    if ((tmpvar_2700 >= 0)) {
      tmpvar_2703 = 0;
    } else {
      tmpvar_2703 = 1;
    };
    highp int tmpvar_2704;
    tmpvar_2704 = (8 + tmpvar_2703);
    _uidx1_2699 = tmpvar_2704;
    if ((tmpvar_2702 < 0)) {
      highp int tmpvar_2705;
      if ((tmpvar_2700 >= 0)) {
        tmpvar_2705 = 1;
      } else {
        tmpvar_2705 = 0;
      };
      _uidx1_2699 = (8 + tmpvar_2705);
    };
    highp int tmpvar_2706;
    if ((tmpvar_2702 < 0)) {
      tmpvar_2706 = 3;
    } else {
      tmpvar_2706 = tmpvar_2702;
    };
    mat2 tmpvar_2707;
    tmpvar_2707[uint(0)].x = tmpvar_2680;
    tmpvar_2707[uint(0)].y = tmpvar_2689;
    tmpvar_2707[1u].x = -(tmpvar_2698);
    tmpvar_2707[1u].y = cos(((
      mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(_uidx1_2699)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_2706)
      , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(tmpvar_2704)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_2424)
      , 0.0, 3.0))], tmpvar_2701)
     * 3.141593) / 180.0));
    _upArm1L_2412.yz = (tmpvar_2671.yz * tmpvar_2707);
    highp vec3 tmpvar_2708;
    tmpvar_2708 = (abs((_upArm1L_2412 - vec3(0.0, 0.08, 0.0))) - vec3(0.02, 0.08, 0.02));
    highp vec3 tmpvar_2709;
    tmpvar_2709 = max (tmpvar_2708, 0.0);
    highp float tmpvar_2710;
    tmpvar_2710 = min (tmpvar_2670, (sqrt(
      dot (tmpvar_2709, tmpvar_2709)
    ) + min (
      max (tmpvar_2708.x, max (tmpvar_2708.y, tmpvar_2708.z))
    , 0.0)));
    highp vec3 tmpvar_2711;
    tmpvar_2711 = (_upChest_2420 + vec3(-0.125, -0.1, 0.0));
    _upArm0R_2411 = tmpvar_2711;
    highp int _us_2712;
    _us_2712 = -1;
    highp int _uidx1_2713;
    highp int tmpvar_2714;
    if ((tmpvar_2425 == 0)) {
      tmpvar_2714 = 1;
    } else {
      tmpvar_2714 = -1;
    };
    _us_2712 = -(tmpvar_2714);
    float tmpvar_2715;
    tmpvar_2715 = fract((iTime * 4.0));
    highp int tmpvar_2716;
    tmpvar_2716 = (tmpvar_2424 - 1);
    highp int tmpvar_2717;
    if ((_us_2712 >= 0)) {
      tmpvar_2717 = 0;
    } else {
      tmpvar_2717 = 1;
    };
    highp int tmpvar_2718;
    tmpvar_2718 = (6 + tmpvar_2717);
    _uidx1_2713 = tmpvar_2718;
    if ((tmpvar_2716 < 0)) {
      highp int tmpvar_2719;
      if ((_us_2712 >= 0)) {
        tmpvar_2719 = 1;
      } else {
        tmpvar_2719 = 0;
      };
      _uidx1_2713 = (6 + tmpvar_2719);
    };
    highp int tmpvar_2720;
    if ((tmpvar_2716 < 0)) {
      tmpvar_2720 = 3;
    } else {
      tmpvar_2720 = tmpvar_2716;
    };
    float tmpvar_2721;
    tmpvar_2721 = cos(((
      (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(_uidx1_2713), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_2720), 0.0, 3.0)
      )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(tmpvar_2718), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_2424), 0.0, 3.0)
      )], tmpvar_2715))
     * 3.141593) / 180.0));
    highp int _us_2722;
    _us_2722 = -1;
    highp int _uidx1_2723;
    highp int tmpvar_2724;
    if ((tmpvar_2425 == 0)) {
      tmpvar_2724 = 1;
    } else {
      tmpvar_2724 = -1;
    };
    _us_2722 = -(tmpvar_2724);
    float tmpvar_2725;
    tmpvar_2725 = fract((iTime * 4.0));
    highp int tmpvar_2726;
    tmpvar_2726 = (tmpvar_2424 - 1);
    highp int tmpvar_2727;
    if ((_us_2722 >= 0)) {
      tmpvar_2727 = 0;
    } else {
      tmpvar_2727 = 1;
    };
    highp int tmpvar_2728;
    tmpvar_2728 = (6 + tmpvar_2727);
    _uidx1_2723 = tmpvar_2728;
    if ((tmpvar_2726 < 0)) {
      highp int tmpvar_2729;
      if ((_us_2722 >= 0)) {
        tmpvar_2729 = 1;
      } else {
        tmpvar_2729 = 0;
      };
      _uidx1_2723 = (6 + tmpvar_2729);
    };
    highp int tmpvar_2730;
    if ((tmpvar_2726 < 0)) {
      tmpvar_2730 = 3;
    } else {
      tmpvar_2730 = tmpvar_2726;
    };
    float tmpvar_2731;
    tmpvar_2731 = sin(((
      (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(_uidx1_2723), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_2730), 0.0, 3.0)
      )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(tmpvar_2728), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_2424), 0.0, 3.0)
      )], tmpvar_2725))
     * 3.141593) / 180.0));
    highp int _us_2732;
    _us_2732 = -1;
    highp int _uidx1_2733;
    highp int tmpvar_2734;
    if ((tmpvar_2425 == 0)) {
      tmpvar_2734 = 1;
    } else {
      tmpvar_2734 = -1;
    };
    _us_2732 = -(tmpvar_2734);
    float tmpvar_2735;
    tmpvar_2735 = fract((iTime * 4.0));
    highp int tmpvar_2736;
    tmpvar_2736 = (tmpvar_2424 - 1);
    highp int tmpvar_2737;
    if ((_us_2732 >= 0)) {
      tmpvar_2737 = 0;
    } else {
      tmpvar_2737 = 1;
    };
    highp int tmpvar_2738;
    tmpvar_2738 = (6 + tmpvar_2737);
    _uidx1_2733 = tmpvar_2738;
    if ((tmpvar_2736 < 0)) {
      highp int tmpvar_2739;
      if ((_us_2732 >= 0)) {
        tmpvar_2739 = 1;
      } else {
        tmpvar_2739 = 0;
      };
      _uidx1_2733 = (6 + tmpvar_2739);
    };
    highp int tmpvar_2740;
    if ((tmpvar_2736 < 0)) {
      tmpvar_2740 = 3;
    } else {
      tmpvar_2740 = tmpvar_2736;
    };
    float tmpvar_2741;
    tmpvar_2741 = sin(((
      (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(_uidx1_2733), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_2740), 0.0, 3.0)
      )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(tmpvar_2738), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_2424), 0.0, 3.0)
      )], tmpvar_2735))
     * 3.141593) / 180.0));
    highp int _us_2742;
    _us_2742 = -1;
    highp int _uidx1_2743;
    highp int tmpvar_2744;
    if ((tmpvar_2425 == 0)) {
      tmpvar_2744 = 1;
    } else {
      tmpvar_2744 = -1;
    };
    _us_2742 = -(tmpvar_2744);
    float tmpvar_2745;
    tmpvar_2745 = fract((iTime * 4.0));
    highp int tmpvar_2746;
    tmpvar_2746 = (tmpvar_2424 - 1);
    highp int tmpvar_2747;
    if ((_us_2742 >= 0)) {
      tmpvar_2747 = 0;
    } else {
      tmpvar_2747 = 1;
    };
    highp int tmpvar_2748;
    tmpvar_2748 = (6 + tmpvar_2747);
    _uidx1_2743 = tmpvar_2748;
    if ((tmpvar_2746 < 0)) {
      highp int tmpvar_2749;
      if ((_us_2742 >= 0)) {
        tmpvar_2749 = 1;
      } else {
        tmpvar_2749 = 0;
      };
      _uidx1_2743 = (6 + tmpvar_2749);
    };
    highp int tmpvar_2750;
    if ((tmpvar_2746 < 0)) {
      tmpvar_2750 = 3;
    } else {
      tmpvar_2750 = tmpvar_2746;
    };
    mat2 tmpvar_2751;
    tmpvar_2751[uint(0)].x = tmpvar_2721;
    tmpvar_2751[uint(0)].y = tmpvar_2731;
    tmpvar_2751[1u].x = -(tmpvar_2741);
    tmpvar_2751[1u].y = cos(((
      (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(_uidx1_2743), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_2750), 0.0, 3.0)
      )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(tmpvar_2748), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_2424), 0.0, 3.0)
      )], tmpvar_2745))
     * 3.141593) / 180.0));
    _upArm0R_2411.yz = (tmpvar_2711.yz * tmpvar_2751);
    highp vec3 tmpvar_2752;
    tmpvar_2752 = (abs((_upArm0R_2411 - vec3(0.0, 0.08, 0.0))) - vec3(0.02, 0.08, 0.02));
    highp vec3 tmpvar_2753;
    tmpvar_2753 = max (tmpvar_2752, 0.0);
    highp float tmpvar_2754;
    tmpvar_2754 = min (tmpvar_2710, (sqrt(
      dot (tmpvar_2753, tmpvar_2753)
    ) + min (
      max (tmpvar_2752.x, max (tmpvar_2752.y, tmpvar_2752.z))
    , 0.0)));
    highp vec3 tmpvar_2755;
    tmpvar_2755 = (_upArm0R_2411 + vec3(0.0, -0.16, 0.0));
    _upArm1R_2410 = tmpvar_2755;
    highp int _us_2756;
    _us_2756 = -1;
    highp int _uidx1_2757;
    highp int tmpvar_2758;
    if ((tmpvar_2425 == 0)) {
      tmpvar_2758 = 1;
    } else {
      tmpvar_2758 = -1;
    };
    _us_2756 = -(tmpvar_2758);
    float tmpvar_2759;
    tmpvar_2759 = fract((iTime * 4.0));
    highp int tmpvar_2760;
    tmpvar_2760 = (tmpvar_2424 - 1);
    highp int tmpvar_2761;
    if ((_us_2756 >= 0)) {
      tmpvar_2761 = 0;
    } else {
      tmpvar_2761 = 1;
    };
    highp int tmpvar_2762;
    tmpvar_2762 = (8 + tmpvar_2761);
    _uidx1_2757 = tmpvar_2762;
    if ((tmpvar_2760 < 0)) {
      highp int tmpvar_2763;
      if ((_us_2756 >= 0)) {
        tmpvar_2763 = 1;
      } else {
        tmpvar_2763 = 0;
      };
      _uidx1_2757 = (8 + tmpvar_2763);
    };
    highp int tmpvar_2764;
    if ((tmpvar_2760 < 0)) {
      tmpvar_2764 = 3;
    } else {
      tmpvar_2764 = tmpvar_2760;
    };
    float tmpvar_2765;
    tmpvar_2765 = cos(((
      mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(_uidx1_2757)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_2764)
      , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(tmpvar_2762)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_2424)
      , 0.0, 3.0))], tmpvar_2759)
     * 3.141593) / 180.0));
    highp int _us_2766;
    _us_2766 = -1;
    highp int _uidx1_2767;
    highp int tmpvar_2768;
    if ((tmpvar_2425 == 0)) {
      tmpvar_2768 = 1;
    } else {
      tmpvar_2768 = -1;
    };
    _us_2766 = -(tmpvar_2768);
    float tmpvar_2769;
    tmpvar_2769 = fract((iTime * 4.0));
    highp int tmpvar_2770;
    tmpvar_2770 = (tmpvar_2424 - 1);
    highp int tmpvar_2771;
    if ((_us_2766 >= 0)) {
      tmpvar_2771 = 0;
    } else {
      tmpvar_2771 = 1;
    };
    highp int tmpvar_2772;
    tmpvar_2772 = (8 + tmpvar_2771);
    _uidx1_2767 = tmpvar_2772;
    if ((tmpvar_2770 < 0)) {
      highp int tmpvar_2773;
      if ((_us_2766 >= 0)) {
        tmpvar_2773 = 1;
      } else {
        tmpvar_2773 = 0;
      };
      _uidx1_2767 = (8 + tmpvar_2773);
    };
    highp int tmpvar_2774;
    if ((tmpvar_2770 < 0)) {
      tmpvar_2774 = 3;
    } else {
      tmpvar_2774 = tmpvar_2770;
    };
    float tmpvar_2775;
    tmpvar_2775 = sin(((
      mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(_uidx1_2767)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_2774)
      , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(tmpvar_2772)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_2424)
      , 0.0, 3.0))], tmpvar_2769)
     * 3.141593) / 180.0));
    highp int _us_2776;
    _us_2776 = -1;
    highp int _uidx1_2777;
    highp int tmpvar_2778;
    if ((tmpvar_2425 == 0)) {
      tmpvar_2778 = 1;
    } else {
      tmpvar_2778 = -1;
    };
    _us_2776 = -(tmpvar_2778);
    float tmpvar_2779;
    tmpvar_2779 = fract((iTime * 4.0));
    highp int tmpvar_2780;
    tmpvar_2780 = (tmpvar_2424 - 1);
    highp int tmpvar_2781;
    if ((_us_2776 >= 0)) {
      tmpvar_2781 = 0;
    } else {
      tmpvar_2781 = 1;
    };
    highp int tmpvar_2782;
    tmpvar_2782 = (8 + tmpvar_2781);
    _uidx1_2777 = tmpvar_2782;
    if ((tmpvar_2780 < 0)) {
      highp int tmpvar_2783;
      if ((_us_2776 >= 0)) {
        tmpvar_2783 = 1;
      } else {
        tmpvar_2783 = 0;
      };
      _uidx1_2777 = (8 + tmpvar_2783);
    };
    highp int tmpvar_2784;
    if ((tmpvar_2780 < 0)) {
      tmpvar_2784 = 3;
    } else {
      tmpvar_2784 = tmpvar_2780;
    };
    float tmpvar_2785;
    tmpvar_2785 = sin(((
      mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(_uidx1_2777)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_2784)
      , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(tmpvar_2782)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_2424)
      , 0.0, 3.0))], tmpvar_2779)
     * 3.141593) / 180.0));
    highp int _us_2786;
    _us_2786 = -1;
    highp int _uidx1_2787;
    highp int tmpvar_2788;
    if ((tmpvar_2425 == 0)) {
      tmpvar_2788 = 1;
    } else {
      tmpvar_2788 = -1;
    };
    _us_2786 = -(tmpvar_2788);
    float tmpvar_2789;
    tmpvar_2789 = fract((iTime * 4.0));
    highp int tmpvar_2790;
    tmpvar_2790 = (tmpvar_2424 - 1);
    highp int tmpvar_2791;
    if ((_us_2786 >= 0)) {
      tmpvar_2791 = 0;
    } else {
      tmpvar_2791 = 1;
    };
    highp int tmpvar_2792;
    tmpvar_2792 = (8 + tmpvar_2791);
    _uidx1_2787 = tmpvar_2792;
    if ((tmpvar_2790 < 0)) {
      highp int tmpvar_2793;
      if ((_us_2786 >= 0)) {
        tmpvar_2793 = 1;
      } else {
        tmpvar_2793 = 0;
      };
      _uidx1_2787 = (8 + tmpvar_2793);
    };
    highp int tmpvar_2794;
    if ((tmpvar_2790 < 0)) {
      tmpvar_2794 = 3;
    } else {
      tmpvar_2794 = tmpvar_2790;
    };
    mat2 tmpvar_2795;
    tmpvar_2795[uint(0)].x = tmpvar_2765;
    tmpvar_2795[uint(0)].y = tmpvar_2775;
    tmpvar_2795[1u].x = -(tmpvar_2785);
    tmpvar_2795[1u].y = cos(((
      mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(_uidx1_2787)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_2794)
      , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(tmpvar_2792)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_2424)
      , 0.0, 3.0))], tmpvar_2789)
     * 3.141593) / 180.0));
    _upArm1R_2410.yz = (tmpvar_2755.yz * tmpvar_2795);
    highp vec3 tmpvar_2796;
    tmpvar_2796 = (abs((_upArm1R_2410 - vec3(0.0, 0.08, 0.0))) - vec3(0.02, 0.08, 0.02));
    highp vec3 tmpvar_2797;
    tmpvar_2797 = max (tmpvar_2796, 0.0);
    highp float tmpvar_2798;
    tmpvar_2798 = min (tmpvar_2754, (sqrt(
      dot (tmpvar_2797, tmpvar_2797)
    ) + min (
      max (tmpvar_2796.x, max (tmpvar_2796.y, tmpvar_2796.z))
    , 0.0)));
    highp vec4 tmpvar_2799;
    if ((tmpvar_2798 < tmpvar_2400.x)) {
      highp vec3 _upArm1R_2800;
      highp vec3 _upArm0R_2801;
      highp vec3 _upArm1L_2802;
      highp vec3 _upArm0L_2803;
      highp vec3 _upLeg1R_2804;
      highp vec3 _upLeg0R_2805;
      highp vec3 _upLeg1L_2806;
      highp vec3 _upLeg0L_2807;
      highp vec3 _upHead_2808;
      highp vec3 _upNeck_2809;
      highp vec3 _upChest_2810;
      highp vec3 _upWaist_2811;
      highp vec3 _upPelvis_2812;
      float tmpvar_2813;
      tmpvar_2813 = (iTime * 4.0);
      highp int tmpvar_2814;
      tmpvar_2814 = ((int(tmpvar_2813)% 4));
      highp int tmpvar_2815;
      tmpvar_2815 = ((int((tmpvar_2813 / 4.0))% 2));
      highp int _uidx1_2816;
      highp int tmpvar_2817;
      if ((tmpvar_2815 == 0)) {
        tmpvar_2817 = 1;
      } else {
        tmpvar_2817 = -1;
      };
      float tmpvar_2818;
      tmpvar_2818 = fract((iTime * 4.0));
      highp int tmpvar_2819;
      tmpvar_2819 = (tmpvar_2814 - 1);
      highp int tmpvar_2820;
      if ((tmpvar_2817 >= 0)) {
        tmpvar_2820 = 0;
      } else {
        tmpvar_2820 = 1;
      };
      highp int tmpvar_2821;
      tmpvar_2821 = (10 + tmpvar_2820);
      _uidx1_2816 = tmpvar_2821;
      if ((tmpvar_2819 < 0)) {
        highp int tmpvar_2822;
        if ((tmpvar_2817 >= 0)) {
          tmpvar_2822 = 1;
        } else {
          tmpvar_2822 = 0;
        };
        _uidx1_2816 = (10 + tmpvar_2822);
      };
      highp int tmpvar_2823;
      if ((tmpvar_2819 < 0)) {
        tmpvar_2823 = 3;
      } else {
        tmpvar_2823 = tmpvar_2819;
      };
      float tmpvar_2824;
      tmpvar_2824 = ((mix (
        vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (float(_uidx1_2816), 0.0, 11.0))][int(clamp (float(tmpvar_2823), 0.0, 3.0))]
      , 
        vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (float(tmpvar_2821), 0.0, 11.0))][int(clamp (float(tmpvar_2814), 0.0, 3.0))]
      , tmpvar_2818) * 3.141593) / 180.0);
      highp int _uidx1_2825;
      highp int tmpvar_2826;
      if ((tmpvar_2815 == 0)) {
        tmpvar_2826 = 1;
      } else {
        tmpvar_2826 = -1;
      };
      float tmpvar_2827;
      tmpvar_2827 = fract((iTime * 4.0));
      highp int tmpvar_2828;
      tmpvar_2828 = (tmpvar_2814 - 1);
      highp int tmpvar_2829;
      if ((tmpvar_2826 >= 0)) {
        tmpvar_2829 = 0;
      } else {
        tmpvar_2829 = 1;
      };
      _uidx1_2825 = tmpvar_2829;
      if ((tmpvar_2828 < 0)) {
        highp int tmpvar_2830;
        if ((tmpvar_2826 >= 0)) {
          tmpvar_2830 = 1;
        } else {
          tmpvar_2830 = 0;
        };
        _uidx1_2825 = tmpvar_2830;
      };
      highp int tmpvar_2831;
      if ((tmpvar_2828 < 0)) {
        tmpvar_2831 = 3;
      } else {
        tmpvar_2831 = tmpvar_2828;
      };
      vec3 tmpvar_2832;
      tmpvar_2832.xz = vec2(0.0, 0.0);
      tmpvar_2832.y = (-0.5 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[
        int(clamp (float(_uidx1_2825), 0.0, 11.0))
      ][
        int(clamp (float(tmpvar_2831), 0.0, 3.0))
      ], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[
        int(clamp (float(tmpvar_2829), 0.0, 11.0))
      ][
        int(clamp (float(tmpvar_2814), 0.0, 3.0))
      ], tmpvar_2827));
      highp vec3 tmpvar_2833;
      tmpvar_2833 = (_up_2396 + tmpvar_2832);
      _upPelvis_2812.z = tmpvar_2833.z;
      mat2 tmpvar_2834;
      tmpvar_2834[uint(0)].x = cos(tmpvar_2824);
      tmpvar_2834[uint(0)].y = sin(tmpvar_2824);
      tmpvar_2834[1u].x = -(sin(tmpvar_2824));
      tmpvar_2834[1u].y = cos(tmpvar_2824);
      _upPelvis_2812.xy = (tmpvar_2833.xy * tmpvar_2834);
      highp vec3 tmpvar_2835;
      tmpvar_2835 = (abs((_upPelvis_2812 - vec3(0.0, 0.0, 0.025))) - vec3(0.085, 0.05, 0.05));
      highp vec3 tmpvar_2836;
      tmpvar_2836 = max (tmpvar_2835, 0.0);
      highp vec3 tmpvar_2837;
      tmpvar_2837 = (_upPelvis_2812 + vec3(0.0, -0.05, -0.02));
      _upWaist_2811.z = tmpvar_2837.z;
      mat2 tmpvar_2838;
      tmpvar_2838[uint(0)].x = cos(-(tmpvar_2824));
      tmpvar_2838[uint(0)].y = sin(-(tmpvar_2824));
      tmpvar_2838[1u].x = -(sin(-(tmpvar_2824)));
      tmpvar_2838[1u].y = cos(-(tmpvar_2824));
      _upWaist_2811.xy = (tmpvar_2837.xy * tmpvar_2838);
      _upWaist_2811.yz = (_upWaist_2811.yz * mat2(1.0, 0.0, -0.0, 1.0));
      highp vec3 tmpvar_2839;
      tmpvar_2839 = (abs((_upWaist_2811 - vec3(0.0, 0.04, 0.0))) - vec3(0.075, 0.08, 0.03));
      highp vec3 tmpvar_2840;
      tmpvar_2840 = max (tmpvar_2839, 0.0);
      highp vec3 tmpvar_2841;
      tmpvar_2841 = (_upWaist_2811 + vec3(0.0, -0.14, -0.01));
      _upChest_2810.x = tmpvar_2841.x;
      _upChest_2810.yz = (tmpvar_2841.yz * mat2(1.0, 0.0, -0.0, 1.0));
      highp vec3 tmpvar_2842;
      tmpvar_2842 = (abs((_upChest_2810 - vec3(0.0, 0.04, 0.0))) - vec3(0.09, 0.08, 0.05));
      highp vec3 tmpvar_2843;
      tmpvar_2843 = max (tmpvar_2842, 0.0);
      highp vec3 tmpvar_2844;
      tmpvar_2844 = (_upChest_2810 + vec3(0.0, -0.15, 0.0));
      _upNeck_2809.x = tmpvar_2844.x;
      _upNeck_2809.yz = (tmpvar_2844.yz * mat2(1.0, 0.0, -0.0, 1.0));
      highp vec3 tmpvar_2845;
      tmpvar_2845 = (abs((_upNeck_2809 - vec3(0.0, 0.01, 0.0))) - vec3(0.02, 0.04, 0.02));
      highp vec3 tmpvar_2846;
      tmpvar_2846 = max (tmpvar_2845, 0.0);
      highp vec3 tmpvar_2847;
      tmpvar_2847 = (_upNeck_2809 + vec3(0.0, -0.1, 0.0));
      _upHead_2808.x = tmpvar_2847.x;
      _upHead_2808.yz = (tmpvar_2847.yz * mat2(1.0, 0.0, -0.0, 1.0));
      highp vec3 tmpvar_2848;
      tmpvar_2848 = (abs((_upHead_2808 - vec3(0.0, 0.04, -0.025))) - vec3(0.05, 0.08, 0.06));
      highp vec3 tmpvar_2849;
      tmpvar_2849 = max (tmpvar_2848, 0.0);
      highp float tmpvar_2850;
      tmpvar_2850 = min (min (min (
        min (min (4.5, (sqrt(
          dot (tmpvar_2836, tmpvar_2836)
        ) + min (
          max (tmpvar_2835.x, max (tmpvar_2835.y, tmpvar_2835.z))
        , 0.0))), (sqrt(dot (tmpvar_2840, tmpvar_2840)) + min (max (tmpvar_2839.x, 
          max (tmpvar_2839.y, tmpvar_2839.z)
        ), 0.0)))
      , 
        (sqrt(dot (tmpvar_2843, tmpvar_2843)) + min (max (tmpvar_2842.x, max (tmpvar_2842.y, tmpvar_2842.z)), 0.0))
      ), (
        sqrt(dot (tmpvar_2846, tmpvar_2846))
       + 
        min (max (tmpvar_2845.x, max (tmpvar_2845.y, tmpvar_2845.z)), 0.0)
      )), (sqrt(
        dot (tmpvar_2849, tmpvar_2849)
      ) + min (
        max (tmpvar_2848.x, max (tmpvar_2848.y, tmpvar_2848.z))
      , 0.0)));
      highp vec3 tmpvar_2851;
      tmpvar_2851 = (_upPelvis_2812 + vec3(0.06, 0.025, 0.0));
      _upLeg0L_2807.z = tmpvar_2851.z;
      mat2 tmpvar_2852;
      tmpvar_2852[uint(0)].x = cos(-(tmpvar_2824));
      tmpvar_2852[uint(0)].y = sin(-(tmpvar_2824));
      tmpvar_2852[1u].x = -(sin(-(tmpvar_2824)));
      tmpvar_2852[1u].y = cos(-(tmpvar_2824));
      _upLeg0L_2807.xy = (tmpvar_2851.xy * tmpvar_2852);
      highp int _uidx1_2853;
      highp int tmpvar_2854;
      if ((tmpvar_2815 == 0)) {
        tmpvar_2854 = 1;
      } else {
        tmpvar_2854 = -1;
      };
      float tmpvar_2855;
      tmpvar_2855 = fract((iTime * 4.0));
      highp int tmpvar_2856;
      tmpvar_2856 = (tmpvar_2814 - 1);
      highp int tmpvar_2857;
      if ((tmpvar_2854 >= 0)) {
        tmpvar_2857 = 0;
      } else {
        tmpvar_2857 = 1;
      };
      highp int tmpvar_2858;
      tmpvar_2858 = (2 + tmpvar_2857);
      _uidx1_2853 = tmpvar_2858;
      if ((tmpvar_2856 < 0)) {
        highp int tmpvar_2859;
        if ((tmpvar_2854 >= 0)) {
          tmpvar_2859 = 1;
        } else {
          tmpvar_2859 = 0;
        };
        _uidx1_2853 = (2 + tmpvar_2859);
      };
      highp int tmpvar_2860;
      if ((tmpvar_2856 < 0)) {
        tmpvar_2860 = 3;
      } else {
        tmpvar_2860 = tmpvar_2856;
      };
      float tmpvar_2861;
      tmpvar_2861 = cos(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_2853), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_2860), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_2858), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_2814), 0.0, 3.0)
        )], tmpvar_2855))
       * 3.141593) / 180.0));
      highp int _uidx1_2862;
      highp int tmpvar_2863;
      if ((tmpvar_2815 == 0)) {
        tmpvar_2863 = 1;
      } else {
        tmpvar_2863 = -1;
      };
      float tmpvar_2864;
      tmpvar_2864 = fract((iTime * 4.0));
      highp int tmpvar_2865;
      tmpvar_2865 = (tmpvar_2814 - 1);
      highp int tmpvar_2866;
      if ((tmpvar_2863 >= 0)) {
        tmpvar_2866 = 0;
      } else {
        tmpvar_2866 = 1;
      };
      highp int tmpvar_2867;
      tmpvar_2867 = (2 + tmpvar_2866);
      _uidx1_2862 = tmpvar_2867;
      if ((tmpvar_2865 < 0)) {
        highp int tmpvar_2868;
        if ((tmpvar_2863 >= 0)) {
          tmpvar_2868 = 1;
        } else {
          tmpvar_2868 = 0;
        };
        _uidx1_2862 = (2 + tmpvar_2868);
      };
      highp int tmpvar_2869;
      if ((tmpvar_2865 < 0)) {
        tmpvar_2869 = 3;
      } else {
        tmpvar_2869 = tmpvar_2865;
      };
      float tmpvar_2870;
      tmpvar_2870 = sin(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_2862), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_2869), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_2867), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_2814), 0.0, 3.0)
        )], tmpvar_2864))
       * 3.141593) / 180.0));
      highp int _uidx1_2871;
      highp int tmpvar_2872;
      if ((tmpvar_2815 == 0)) {
        tmpvar_2872 = 1;
      } else {
        tmpvar_2872 = -1;
      };
      float tmpvar_2873;
      tmpvar_2873 = fract((iTime * 4.0));
      highp int tmpvar_2874;
      tmpvar_2874 = (tmpvar_2814 - 1);
      highp int tmpvar_2875;
      if ((tmpvar_2872 >= 0)) {
        tmpvar_2875 = 0;
      } else {
        tmpvar_2875 = 1;
      };
      highp int tmpvar_2876;
      tmpvar_2876 = (2 + tmpvar_2875);
      _uidx1_2871 = tmpvar_2876;
      if ((tmpvar_2874 < 0)) {
        highp int tmpvar_2877;
        if ((tmpvar_2872 >= 0)) {
          tmpvar_2877 = 1;
        } else {
          tmpvar_2877 = 0;
        };
        _uidx1_2871 = (2 + tmpvar_2877);
      };
      highp int tmpvar_2878;
      if ((tmpvar_2874 < 0)) {
        tmpvar_2878 = 3;
      } else {
        tmpvar_2878 = tmpvar_2874;
      };
      float tmpvar_2879;
      tmpvar_2879 = sin(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_2871), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_2878), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_2876), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_2814), 0.0, 3.0)
        )], tmpvar_2873))
       * 3.141593) / 180.0));
      highp int _uidx1_2880;
      highp int tmpvar_2881;
      if ((tmpvar_2815 == 0)) {
        tmpvar_2881 = 1;
      } else {
        tmpvar_2881 = -1;
      };
      float tmpvar_2882;
      tmpvar_2882 = fract((iTime * 4.0));
      highp int tmpvar_2883;
      tmpvar_2883 = (tmpvar_2814 - 1);
      highp int tmpvar_2884;
      if ((tmpvar_2881 >= 0)) {
        tmpvar_2884 = 0;
      } else {
        tmpvar_2884 = 1;
      };
      highp int tmpvar_2885;
      tmpvar_2885 = (2 + tmpvar_2884);
      _uidx1_2880 = tmpvar_2885;
      if ((tmpvar_2883 < 0)) {
        highp int tmpvar_2886;
        if ((tmpvar_2881 >= 0)) {
          tmpvar_2886 = 1;
        } else {
          tmpvar_2886 = 0;
        };
        _uidx1_2880 = (2 + tmpvar_2886);
      };
      highp int tmpvar_2887;
      if ((tmpvar_2883 < 0)) {
        tmpvar_2887 = 3;
      } else {
        tmpvar_2887 = tmpvar_2883;
      };
      mat2 tmpvar_2888;
      tmpvar_2888[uint(0)].x = tmpvar_2861;
      tmpvar_2888[uint(0)].y = tmpvar_2870;
      tmpvar_2888[1u].x = -(tmpvar_2879);
      tmpvar_2888[1u].y = cos(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_2880), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_2887), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_2885), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_2814), 0.0, 3.0)
        )], tmpvar_2882))
       * 3.141593) / 180.0));
      _upLeg0L_2807.yz = (_upLeg0L_2807.yz * tmpvar_2888);
      highp vec3 tmpvar_2889;
      tmpvar_2889 = (abs((_upLeg0L_2807 - vec3(0.0, 0.1, 0.0))) - vec3(0.025, 0.1, 0.025));
      highp vec3 tmpvar_2890;
      tmpvar_2890 = max (tmpvar_2889, 0.0);
      highp float tmpvar_2891;
      tmpvar_2891 = min (tmpvar_2850, (sqrt(
        dot (tmpvar_2890, tmpvar_2890)
      ) + min (
        max (tmpvar_2889.x, max (tmpvar_2889.y, tmpvar_2889.z))
      , 0.0)));
      highp vec3 tmpvar_2892;
      tmpvar_2892 = (_upLeg0L_2807 + vec3(0.01, -0.18, 0.02));
      _upLeg1L_2806 = tmpvar_2892;
      highp int _uidx1_2893;
      highp int tmpvar_2894;
      if ((tmpvar_2815 == 0)) {
        tmpvar_2894 = 1;
      } else {
        tmpvar_2894 = -1;
      };
      float tmpvar_2895;
      tmpvar_2895 = fract((iTime * 4.0));
      highp int tmpvar_2896;
      tmpvar_2896 = (tmpvar_2814 - 1);
      highp int tmpvar_2897;
      if ((tmpvar_2894 >= 0)) {
        tmpvar_2897 = 0;
      } else {
        tmpvar_2897 = 1;
      };
      highp int tmpvar_2898;
      tmpvar_2898 = (4 + tmpvar_2897);
      _uidx1_2893 = tmpvar_2898;
      if ((tmpvar_2896 < 0)) {
        highp int tmpvar_2899;
        if ((tmpvar_2894 >= 0)) {
          tmpvar_2899 = 1;
        } else {
          tmpvar_2899 = 0;
        };
        _uidx1_2893 = (4 + tmpvar_2899);
      };
      highp int tmpvar_2900;
      if ((tmpvar_2896 < 0)) {
        tmpvar_2900 = 3;
      } else {
        tmpvar_2900 = tmpvar_2896;
      };
      float tmpvar_2901;
      tmpvar_2901 = cos(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_2893)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_2900)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_2898)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_2814)
        , 0.0, 3.0))], tmpvar_2895)
       * 3.141593) / 180.0));
      highp int _uidx1_2902;
      highp int tmpvar_2903;
      if ((tmpvar_2815 == 0)) {
        tmpvar_2903 = 1;
      } else {
        tmpvar_2903 = -1;
      };
      float tmpvar_2904;
      tmpvar_2904 = fract((iTime * 4.0));
      highp int tmpvar_2905;
      tmpvar_2905 = (tmpvar_2814 - 1);
      highp int tmpvar_2906;
      if ((tmpvar_2903 >= 0)) {
        tmpvar_2906 = 0;
      } else {
        tmpvar_2906 = 1;
      };
      highp int tmpvar_2907;
      tmpvar_2907 = (4 + tmpvar_2906);
      _uidx1_2902 = tmpvar_2907;
      if ((tmpvar_2905 < 0)) {
        highp int tmpvar_2908;
        if ((tmpvar_2903 >= 0)) {
          tmpvar_2908 = 1;
        } else {
          tmpvar_2908 = 0;
        };
        _uidx1_2902 = (4 + tmpvar_2908);
      };
      highp int tmpvar_2909;
      if ((tmpvar_2905 < 0)) {
        tmpvar_2909 = 3;
      } else {
        tmpvar_2909 = tmpvar_2905;
      };
      float tmpvar_2910;
      tmpvar_2910 = sin(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_2902)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_2909)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_2907)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_2814)
        , 0.0, 3.0))], tmpvar_2904)
       * 3.141593) / 180.0));
      highp int _uidx1_2911;
      highp int tmpvar_2912;
      if ((tmpvar_2815 == 0)) {
        tmpvar_2912 = 1;
      } else {
        tmpvar_2912 = -1;
      };
      float tmpvar_2913;
      tmpvar_2913 = fract((iTime * 4.0));
      highp int tmpvar_2914;
      tmpvar_2914 = (tmpvar_2814 - 1);
      highp int tmpvar_2915;
      if ((tmpvar_2912 >= 0)) {
        tmpvar_2915 = 0;
      } else {
        tmpvar_2915 = 1;
      };
      highp int tmpvar_2916;
      tmpvar_2916 = (4 + tmpvar_2915);
      _uidx1_2911 = tmpvar_2916;
      if ((tmpvar_2914 < 0)) {
        highp int tmpvar_2917;
        if ((tmpvar_2912 >= 0)) {
          tmpvar_2917 = 1;
        } else {
          tmpvar_2917 = 0;
        };
        _uidx1_2911 = (4 + tmpvar_2917);
      };
      highp int tmpvar_2918;
      if ((tmpvar_2914 < 0)) {
        tmpvar_2918 = 3;
      } else {
        tmpvar_2918 = tmpvar_2914;
      };
      float tmpvar_2919;
      tmpvar_2919 = sin(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_2911)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_2918)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_2916)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_2814)
        , 0.0, 3.0))], tmpvar_2913)
       * 3.141593) / 180.0));
      highp int _uidx1_2920;
      highp int tmpvar_2921;
      if ((tmpvar_2815 == 0)) {
        tmpvar_2921 = 1;
      } else {
        tmpvar_2921 = -1;
      };
      float tmpvar_2922;
      tmpvar_2922 = fract((iTime * 4.0));
      highp int tmpvar_2923;
      tmpvar_2923 = (tmpvar_2814 - 1);
      highp int tmpvar_2924;
      if ((tmpvar_2921 >= 0)) {
        tmpvar_2924 = 0;
      } else {
        tmpvar_2924 = 1;
      };
      highp int tmpvar_2925;
      tmpvar_2925 = (4 + tmpvar_2924);
      _uidx1_2920 = tmpvar_2925;
      if ((tmpvar_2923 < 0)) {
        highp int tmpvar_2926;
        if ((tmpvar_2921 >= 0)) {
          tmpvar_2926 = 1;
        } else {
          tmpvar_2926 = 0;
        };
        _uidx1_2920 = (4 + tmpvar_2926);
      };
      highp int tmpvar_2927;
      if ((tmpvar_2923 < 0)) {
        tmpvar_2927 = 3;
      } else {
        tmpvar_2927 = tmpvar_2923;
      };
      mat2 tmpvar_2928;
      tmpvar_2928[uint(0)].x = tmpvar_2901;
      tmpvar_2928[uint(0)].y = tmpvar_2910;
      tmpvar_2928[1u].x = -(tmpvar_2919);
      tmpvar_2928[1u].y = cos(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_2920)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_2927)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_2925)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_2814)
        , 0.0, 3.0))], tmpvar_2922)
       * 3.141593) / 180.0));
      _upLeg1L_2806.yz = (tmpvar_2892.yz * tmpvar_2928);
      highp vec3 tmpvar_2929;
      tmpvar_2929 = (abs((_upLeg1L_2806 - vec3(0.0, 0.1, 0.0))) - vec3(0.025, 0.1, 0.025));
      highp vec3 tmpvar_2930;
      tmpvar_2930 = max (tmpvar_2929, 0.0);
      highp float tmpvar_2931;
      tmpvar_2931 = min (tmpvar_2891, (sqrt(
        dot (tmpvar_2930, tmpvar_2930)
      ) + min (
        max (tmpvar_2929.x, max (tmpvar_2929.y, tmpvar_2929.z))
      , 0.0)));
      highp vec3 tmpvar_2932;
      tmpvar_2932 = (_upPelvis_2812 + vec3(-0.06, 0.025, 0.0));
      _upLeg0R_2805.z = tmpvar_2932.z;
      mat2 tmpvar_2933;
      tmpvar_2933[uint(0)].x = cos(-(tmpvar_2824));
      tmpvar_2933[uint(0)].y = sin(-(tmpvar_2824));
      tmpvar_2933[1u].x = -(sin(-(tmpvar_2824)));
      tmpvar_2933[1u].y = cos(-(tmpvar_2824));
      _upLeg0R_2805.xy = (tmpvar_2932.xy * tmpvar_2933);
      highp int _us_2934;
      _us_2934 = -1;
      highp int _uidx1_2935;
      highp int tmpvar_2936;
      if ((tmpvar_2815 == 0)) {
        tmpvar_2936 = 1;
      } else {
        tmpvar_2936 = -1;
      };
      _us_2934 = -(tmpvar_2936);
      float tmpvar_2937;
      tmpvar_2937 = fract((iTime * 4.0));
      highp int tmpvar_2938;
      tmpvar_2938 = (tmpvar_2814 - 1);
      highp int tmpvar_2939;
      if ((_us_2934 >= 0)) {
        tmpvar_2939 = 0;
      } else {
        tmpvar_2939 = 1;
      };
      highp int tmpvar_2940;
      tmpvar_2940 = (2 + tmpvar_2939);
      _uidx1_2935 = tmpvar_2940;
      if ((tmpvar_2938 < 0)) {
        highp int tmpvar_2941;
        if ((_us_2934 >= 0)) {
          tmpvar_2941 = 1;
        } else {
          tmpvar_2941 = 0;
        };
        _uidx1_2935 = (2 + tmpvar_2941);
      };
      highp int tmpvar_2942;
      if ((tmpvar_2938 < 0)) {
        tmpvar_2942 = 3;
      } else {
        tmpvar_2942 = tmpvar_2938;
      };
      float tmpvar_2943;
      tmpvar_2943 = cos(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_2935), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_2942), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_2940), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_2814), 0.0, 3.0)
        )], tmpvar_2937))
       * 3.141593) / 180.0));
      highp int _us_2944;
      _us_2944 = -1;
      highp int _uidx1_2945;
      highp int tmpvar_2946;
      if ((tmpvar_2815 == 0)) {
        tmpvar_2946 = 1;
      } else {
        tmpvar_2946 = -1;
      };
      _us_2944 = -(tmpvar_2946);
      float tmpvar_2947;
      tmpvar_2947 = fract((iTime * 4.0));
      highp int tmpvar_2948;
      tmpvar_2948 = (tmpvar_2814 - 1);
      highp int tmpvar_2949;
      if ((_us_2944 >= 0)) {
        tmpvar_2949 = 0;
      } else {
        tmpvar_2949 = 1;
      };
      highp int tmpvar_2950;
      tmpvar_2950 = (2 + tmpvar_2949);
      _uidx1_2945 = tmpvar_2950;
      if ((tmpvar_2948 < 0)) {
        highp int tmpvar_2951;
        if ((_us_2944 >= 0)) {
          tmpvar_2951 = 1;
        } else {
          tmpvar_2951 = 0;
        };
        _uidx1_2945 = (2 + tmpvar_2951);
      };
      highp int tmpvar_2952;
      if ((tmpvar_2948 < 0)) {
        tmpvar_2952 = 3;
      } else {
        tmpvar_2952 = tmpvar_2948;
      };
      float tmpvar_2953;
      tmpvar_2953 = sin(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_2945), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_2952), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_2950), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_2814), 0.0, 3.0)
        )], tmpvar_2947))
       * 3.141593) / 180.0));
      highp int _us_2954;
      _us_2954 = -1;
      highp int _uidx1_2955;
      highp int tmpvar_2956;
      if ((tmpvar_2815 == 0)) {
        tmpvar_2956 = 1;
      } else {
        tmpvar_2956 = -1;
      };
      _us_2954 = -(tmpvar_2956);
      float tmpvar_2957;
      tmpvar_2957 = fract((iTime * 4.0));
      highp int tmpvar_2958;
      tmpvar_2958 = (tmpvar_2814 - 1);
      highp int tmpvar_2959;
      if ((_us_2954 >= 0)) {
        tmpvar_2959 = 0;
      } else {
        tmpvar_2959 = 1;
      };
      highp int tmpvar_2960;
      tmpvar_2960 = (2 + tmpvar_2959);
      _uidx1_2955 = tmpvar_2960;
      if ((tmpvar_2958 < 0)) {
        highp int tmpvar_2961;
        if ((_us_2954 >= 0)) {
          tmpvar_2961 = 1;
        } else {
          tmpvar_2961 = 0;
        };
        _uidx1_2955 = (2 + tmpvar_2961);
      };
      highp int tmpvar_2962;
      if ((tmpvar_2958 < 0)) {
        tmpvar_2962 = 3;
      } else {
        tmpvar_2962 = tmpvar_2958;
      };
      float tmpvar_2963;
      tmpvar_2963 = sin(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_2955), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_2962), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_2960), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_2814), 0.0, 3.0)
        )], tmpvar_2957))
       * 3.141593) / 180.0));
      highp int _us_2964;
      _us_2964 = -1;
      highp int _uidx1_2965;
      highp int tmpvar_2966;
      if ((tmpvar_2815 == 0)) {
        tmpvar_2966 = 1;
      } else {
        tmpvar_2966 = -1;
      };
      _us_2964 = -(tmpvar_2966);
      float tmpvar_2967;
      tmpvar_2967 = fract((iTime * 4.0));
      highp int tmpvar_2968;
      tmpvar_2968 = (tmpvar_2814 - 1);
      highp int tmpvar_2969;
      if ((_us_2964 >= 0)) {
        tmpvar_2969 = 0;
      } else {
        tmpvar_2969 = 1;
      };
      highp int tmpvar_2970;
      tmpvar_2970 = (2 + tmpvar_2969);
      _uidx1_2965 = tmpvar_2970;
      if ((tmpvar_2968 < 0)) {
        highp int tmpvar_2971;
        if ((_us_2964 >= 0)) {
          tmpvar_2971 = 1;
        } else {
          tmpvar_2971 = 0;
        };
        _uidx1_2965 = (2 + tmpvar_2971);
      };
      highp int tmpvar_2972;
      if ((tmpvar_2968 < 0)) {
        tmpvar_2972 = 3;
      } else {
        tmpvar_2972 = tmpvar_2968;
      };
      mat2 tmpvar_2973;
      tmpvar_2973[uint(0)].x = tmpvar_2943;
      tmpvar_2973[uint(0)].y = tmpvar_2953;
      tmpvar_2973[1u].x = -(tmpvar_2963);
      tmpvar_2973[1u].y = cos(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_2965), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_2972), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_2970), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_2814), 0.0, 3.0)
        )], tmpvar_2967))
       * 3.141593) / 180.0));
      _upLeg0R_2805.yz = (_upLeg0R_2805.yz * tmpvar_2973);
      highp vec3 tmpvar_2974;
      tmpvar_2974 = (abs((_upLeg0R_2805 - vec3(0.0, 0.1, 0.0))) - vec3(0.025, 0.1, 0.025));
      highp vec3 tmpvar_2975;
      tmpvar_2975 = max (tmpvar_2974, 0.0);
      highp float tmpvar_2976;
      tmpvar_2976 = min (tmpvar_2931, (sqrt(
        dot (tmpvar_2975, tmpvar_2975)
      ) + min (
        max (tmpvar_2974.x, max (tmpvar_2974.y, tmpvar_2974.z))
      , 0.0)));
      highp vec3 tmpvar_2977;
      tmpvar_2977 = (_upLeg0R_2805 + vec3(-0.01, -0.18, 0.02));
      _upLeg1R_2804 = tmpvar_2977;
      highp int _us_2978;
      _us_2978 = -1;
      highp int _uidx1_2979;
      highp int tmpvar_2980;
      if ((tmpvar_2815 == 0)) {
        tmpvar_2980 = 1;
      } else {
        tmpvar_2980 = -1;
      };
      _us_2978 = -(tmpvar_2980);
      float tmpvar_2981;
      tmpvar_2981 = fract((iTime * 4.0));
      highp int tmpvar_2982;
      tmpvar_2982 = (tmpvar_2814 - 1);
      highp int tmpvar_2983;
      if ((_us_2978 >= 0)) {
        tmpvar_2983 = 0;
      } else {
        tmpvar_2983 = 1;
      };
      highp int tmpvar_2984;
      tmpvar_2984 = (4 + tmpvar_2983);
      _uidx1_2979 = tmpvar_2984;
      if ((tmpvar_2982 < 0)) {
        highp int tmpvar_2985;
        if ((_us_2978 >= 0)) {
          tmpvar_2985 = 1;
        } else {
          tmpvar_2985 = 0;
        };
        _uidx1_2979 = (4 + tmpvar_2985);
      };
      highp int tmpvar_2986;
      if ((tmpvar_2982 < 0)) {
        tmpvar_2986 = 3;
      } else {
        tmpvar_2986 = tmpvar_2982;
      };
      float tmpvar_2987;
      tmpvar_2987 = cos(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_2979)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_2986)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_2984)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_2814)
        , 0.0, 3.0))], tmpvar_2981)
       * 3.141593) / 180.0));
      highp int _us_2988;
      _us_2988 = -1;
      highp int _uidx1_2989;
      highp int tmpvar_2990;
      if ((tmpvar_2815 == 0)) {
        tmpvar_2990 = 1;
      } else {
        tmpvar_2990 = -1;
      };
      _us_2988 = -(tmpvar_2990);
      float tmpvar_2991;
      tmpvar_2991 = fract((iTime * 4.0));
      highp int tmpvar_2992;
      tmpvar_2992 = (tmpvar_2814 - 1);
      highp int tmpvar_2993;
      if ((_us_2988 >= 0)) {
        tmpvar_2993 = 0;
      } else {
        tmpvar_2993 = 1;
      };
      highp int tmpvar_2994;
      tmpvar_2994 = (4 + tmpvar_2993);
      _uidx1_2989 = tmpvar_2994;
      if ((tmpvar_2992 < 0)) {
        highp int tmpvar_2995;
        if ((_us_2988 >= 0)) {
          tmpvar_2995 = 1;
        } else {
          tmpvar_2995 = 0;
        };
        _uidx1_2989 = (4 + tmpvar_2995);
      };
      highp int tmpvar_2996;
      if ((tmpvar_2992 < 0)) {
        tmpvar_2996 = 3;
      } else {
        tmpvar_2996 = tmpvar_2992;
      };
      float tmpvar_2997;
      tmpvar_2997 = sin(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_2989)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_2996)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_2994)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_2814)
        , 0.0, 3.0))], tmpvar_2991)
       * 3.141593) / 180.0));
      highp int _us_2998;
      _us_2998 = -1;
      highp int _uidx1_2999;
      highp int tmpvar_3000;
      if ((tmpvar_2815 == 0)) {
        tmpvar_3000 = 1;
      } else {
        tmpvar_3000 = -1;
      };
      _us_2998 = -(tmpvar_3000);
      float tmpvar_3001;
      tmpvar_3001 = fract((iTime * 4.0));
      highp int tmpvar_3002;
      tmpvar_3002 = (tmpvar_2814 - 1);
      highp int tmpvar_3003;
      if ((_us_2998 >= 0)) {
        tmpvar_3003 = 0;
      } else {
        tmpvar_3003 = 1;
      };
      highp int tmpvar_3004;
      tmpvar_3004 = (4 + tmpvar_3003);
      _uidx1_2999 = tmpvar_3004;
      if ((tmpvar_3002 < 0)) {
        highp int tmpvar_3005;
        if ((_us_2998 >= 0)) {
          tmpvar_3005 = 1;
        } else {
          tmpvar_3005 = 0;
        };
        _uidx1_2999 = (4 + tmpvar_3005);
      };
      highp int tmpvar_3006;
      if ((tmpvar_3002 < 0)) {
        tmpvar_3006 = 3;
      } else {
        tmpvar_3006 = tmpvar_3002;
      };
      float tmpvar_3007;
      tmpvar_3007 = sin(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_2999)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_3006)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_3004)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_2814)
        , 0.0, 3.0))], tmpvar_3001)
       * 3.141593) / 180.0));
      highp int _us_3008;
      _us_3008 = -1;
      highp int _uidx1_3009;
      highp int tmpvar_3010;
      if ((tmpvar_2815 == 0)) {
        tmpvar_3010 = 1;
      } else {
        tmpvar_3010 = -1;
      };
      _us_3008 = -(tmpvar_3010);
      float tmpvar_3011;
      tmpvar_3011 = fract((iTime * 4.0));
      highp int tmpvar_3012;
      tmpvar_3012 = (tmpvar_2814 - 1);
      highp int tmpvar_3013;
      if ((_us_3008 >= 0)) {
        tmpvar_3013 = 0;
      } else {
        tmpvar_3013 = 1;
      };
      highp int tmpvar_3014;
      tmpvar_3014 = (4 + tmpvar_3013);
      _uidx1_3009 = tmpvar_3014;
      if ((tmpvar_3012 < 0)) {
        highp int tmpvar_3015;
        if ((_us_3008 >= 0)) {
          tmpvar_3015 = 1;
        } else {
          tmpvar_3015 = 0;
        };
        _uidx1_3009 = (4 + tmpvar_3015);
      };
      highp int tmpvar_3016;
      if ((tmpvar_3012 < 0)) {
        tmpvar_3016 = 3;
      } else {
        tmpvar_3016 = tmpvar_3012;
      };
      mat2 tmpvar_3017;
      tmpvar_3017[uint(0)].x = tmpvar_2987;
      tmpvar_3017[uint(0)].y = tmpvar_2997;
      tmpvar_3017[1u].x = -(tmpvar_3007);
      tmpvar_3017[1u].y = cos(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_3009)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_3016)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_3014)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_2814)
        , 0.0, 3.0))], tmpvar_3011)
       * 3.141593) / 180.0));
      _upLeg1R_2804.yz = (tmpvar_2977.yz * tmpvar_3017);
      highp vec3 tmpvar_3018;
      tmpvar_3018 = (abs((_upLeg1R_2804 - vec3(0.0, 0.1, 0.0))) - vec3(0.025, 0.1, 0.025));
      highp vec3 tmpvar_3019;
      tmpvar_3019 = max (tmpvar_3018, 0.0);
      highp float tmpvar_3020;
      tmpvar_3020 = min (tmpvar_2976, (sqrt(
        dot (tmpvar_3019, tmpvar_3019)
      ) + min (
        max (tmpvar_3018.x, max (tmpvar_3018.y, tmpvar_3018.z))
      , 0.0)));
      highp vec3 tmpvar_3021;
      tmpvar_3021 = (_upChest_2810 + vec3(0.125, -0.1, 0.0));
      _upArm0L_2803 = tmpvar_3021;
      highp int _uidx1_3022;
      highp int tmpvar_3023;
      if ((tmpvar_2815 == 0)) {
        tmpvar_3023 = 1;
      } else {
        tmpvar_3023 = -1;
      };
      float tmpvar_3024;
      tmpvar_3024 = fract((iTime * 4.0));
      highp int tmpvar_3025;
      tmpvar_3025 = (tmpvar_2814 - 1);
      highp int tmpvar_3026;
      if ((tmpvar_3023 >= 0)) {
        tmpvar_3026 = 0;
      } else {
        tmpvar_3026 = 1;
      };
      highp int tmpvar_3027;
      tmpvar_3027 = (6 + tmpvar_3026);
      _uidx1_3022 = tmpvar_3027;
      if ((tmpvar_3025 < 0)) {
        highp int tmpvar_3028;
        if ((tmpvar_3023 >= 0)) {
          tmpvar_3028 = 1;
        } else {
          tmpvar_3028 = 0;
        };
        _uidx1_3022 = (6 + tmpvar_3028);
      };
      highp int tmpvar_3029;
      if ((tmpvar_3025 < 0)) {
        tmpvar_3029 = 3;
      } else {
        tmpvar_3029 = tmpvar_3025;
      };
      float tmpvar_3030;
      tmpvar_3030 = cos(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_3022), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_3029), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_3027), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_2814), 0.0, 3.0)
        )], tmpvar_3024))
       * 3.141593) / 180.0));
      highp int _uidx1_3031;
      highp int tmpvar_3032;
      if ((tmpvar_2815 == 0)) {
        tmpvar_3032 = 1;
      } else {
        tmpvar_3032 = -1;
      };
      float tmpvar_3033;
      tmpvar_3033 = fract((iTime * 4.0));
      highp int tmpvar_3034;
      tmpvar_3034 = (tmpvar_2814 - 1);
      highp int tmpvar_3035;
      if ((tmpvar_3032 >= 0)) {
        tmpvar_3035 = 0;
      } else {
        tmpvar_3035 = 1;
      };
      highp int tmpvar_3036;
      tmpvar_3036 = (6 + tmpvar_3035);
      _uidx1_3031 = tmpvar_3036;
      if ((tmpvar_3034 < 0)) {
        highp int tmpvar_3037;
        if ((tmpvar_3032 >= 0)) {
          tmpvar_3037 = 1;
        } else {
          tmpvar_3037 = 0;
        };
        _uidx1_3031 = (6 + tmpvar_3037);
      };
      highp int tmpvar_3038;
      if ((tmpvar_3034 < 0)) {
        tmpvar_3038 = 3;
      } else {
        tmpvar_3038 = tmpvar_3034;
      };
      float tmpvar_3039;
      tmpvar_3039 = sin(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_3031), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_3038), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_3036), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_2814), 0.0, 3.0)
        )], tmpvar_3033))
       * 3.141593) / 180.0));
      highp int _uidx1_3040;
      highp int tmpvar_3041;
      if ((tmpvar_2815 == 0)) {
        tmpvar_3041 = 1;
      } else {
        tmpvar_3041 = -1;
      };
      float tmpvar_3042;
      tmpvar_3042 = fract((iTime * 4.0));
      highp int tmpvar_3043;
      tmpvar_3043 = (tmpvar_2814 - 1);
      highp int tmpvar_3044;
      if ((tmpvar_3041 >= 0)) {
        tmpvar_3044 = 0;
      } else {
        tmpvar_3044 = 1;
      };
      highp int tmpvar_3045;
      tmpvar_3045 = (6 + tmpvar_3044);
      _uidx1_3040 = tmpvar_3045;
      if ((tmpvar_3043 < 0)) {
        highp int tmpvar_3046;
        if ((tmpvar_3041 >= 0)) {
          tmpvar_3046 = 1;
        } else {
          tmpvar_3046 = 0;
        };
        _uidx1_3040 = (6 + tmpvar_3046);
      };
      highp int tmpvar_3047;
      if ((tmpvar_3043 < 0)) {
        tmpvar_3047 = 3;
      } else {
        tmpvar_3047 = tmpvar_3043;
      };
      float tmpvar_3048;
      tmpvar_3048 = sin(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_3040), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_3047), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_3045), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_2814), 0.0, 3.0)
        )], tmpvar_3042))
       * 3.141593) / 180.0));
      highp int _uidx1_3049;
      highp int tmpvar_3050;
      if ((tmpvar_2815 == 0)) {
        tmpvar_3050 = 1;
      } else {
        tmpvar_3050 = -1;
      };
      float tmpvar_3051;
      tmpvar_3051 = fract((iTime * 4.0));
      highp int tmpvar_3052;
      tmpvar_3052 = (tmpvar_2814 - 1);
      highp int tmpvar_3053;
      if ((tmpvar_3050 >= 0)) {
        tmpvar_3053 = 0;
      } else {
        tmpvar_3053 = 1;
      };
      highp int tmpvar_3054;
      tmpvar_3054 = (6 + tmpvar_3053);
      _uidx1_3049 = tmpvar_3054;
      if ((tmpvar_3052 < 0)) {
        highp int tmpvar_3055;
        if ((tmpvar_3050 >= 0)) {
          tmpvar_3055 = 1;
        } else {
          tmpvar_3055 = 0;
        };
        _uidx1_3049 = (6 + tmpvar_3055);
      };
      highp int tmpvar_3056;
      if ((tmpvar_3052 < 0)) {
        tmpvar_3056 = 3;
      } else {
        tmpvar_3056 = tmpvar_3052;
      };
      mat2 tmpvar_3057;
      tmpvar_3057[uint(0)].x = tmpvar_3030;
      tmpvar_3057[uint(0)].y = tmpvar_3039;
      tmpvar_3057[1u].x = -(tmpvar_3048);
      tmpvar_3057[1u].y = cos(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_3049), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_3056), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_3054), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_2814), 0.0, 3.0)
        )], tmpvar_3051))
       * 3.141593) / 180.0));
      _upArm0L_2803.yz = (tmpvar_3021.yz * tmpvar_3057);
      highp vec3 tmpvar_3058;
      tmpvar_3058 = (abs((_upArm0L_2803 - vec3(0.0, 0.08, 0.0))) - vec3(0.02, 0.08, 0.02));
      highp vec3 tmpvar_3059;
      tmpvar_3059 = max (tmpvar_3058, 0.0);
      highp float tmpvar_3060;
      tmpvar_3060 = min (tmpvar_3020, (sqrt(
        dot (tmpvar_3059, tmpvar_3059)
      ) + min (
        max (tmpvar_3058.x, max (tmpvar_3058.y, tmpvar_3058.z))
      , 0.0)));
      highp vec3 tmpvar_3061;
      tmpvar_3061 = (_upArm0L_2803 + vec3(0.0, -0.16, 0.0));
      _upArm1L_2802 = tmpvar_3061;
      highp int _uidx1_3062;
      highp int tmpvar_3063;
      if ((tmpvar_2815 == 0)) {
        tmpvar_3063 = 1;
      } else {
        tmpvar_3063 = -1;
      };
      float tmpvar_3064;
      tmpvar_3064 = fract((iTime * 4.0));
      highp int tmpvar_3065;
      tmpvar_3065 = (tmpvar_2814 - 1);
      highp int tmpvar_3066;
      if ((tmpvar_3063 >= 0)) {
        tmpvar_3066 = 0;
      } else {
        tmpvar_3066 = 1;
      };
      highp int tmpvar_3067;
      tmpvar_3067 = (8 + tmpvar_3066);
      _uidx1_3062 = tmpvar_3067;
      if ((tmpvar_3065 < 0)) {
        highp int tmpvar_3068;
        if ((tmpvar_3063 >= 0)) {
          tmpvar_3068 = 1;
        } else {
          tmpvar_3068 = 0;
        };
        _uidx1_3062 = (8 + tmpvar_3068);
      };
      highp int tmpvar_3069;
      if ((tmpvar_3065 < 0)) {
        tmpvar_3069 = 3;
      } else {
        tmpvar_3069 = tmpvar_3065;
      };
      float tmpvar_3070;
      tmpvar_3070 = cos(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_3062)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_3069)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_3067)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_2814)
        , 0.0, 3.0))], tmpvar_3064)
       * 3.141593) / 180.0));
      highp int _uidx1_3071;
      highp int tmpvar_3072;
      if ((tmpvar_2815 == 0)) {
        tmpvar_3072 = 1;
      } else {
        tmpvar_3072 = -1;
      };
      float tmpvar_3073;
      tmpvar_3073 = fract((iTime * 4.0));
      highp int tmpvar_3074;
      tmpvar_3074 = (tmpvar_2814 - 1);
      highp int tmpvar_3075;
      if ((tmpvar_3072 >= 0)) {
        tmpvar_3075 = 0;
      } else {
        tmpvar_3075 = 1;
      };
      highp int tmpvar_3076;
      tmpvar_3076 = (8 + tmpvar_3075);
      _uidx1_3071 = tmpvar_3076;
      if ((tmpvar_3074 < 0)) {
        highp int tmpvar_3077;
        if ((tmpvar_3072 >= 0)) {
          tmpvar_3077 = 1;
        } else {
          tmpvar_3077 = 0;
        };
        _uidx1_3071 = (8 + tmpvar_3077);
      };
      highp int tmpvar_3078;
      if ((tmpvar_3074 < 0)) {
        tmpvar_3078 = 3;
      } else {
        tmpvar_3078 = tmpvar_3074;
      };
      float tmpvar_3079;
      tmpvar_3079 = sin(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_3071)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_3078)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_3076)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_2814)
        , 0.0, 3.0))], tmpvar_3073)
       * 3.141593) / 180.0));
      highp int _uidx1_3080;
      highp int tmpvar_3081;
      if ((tmpvar_2815 == 0)) {
        tmpvar_3081 = 1;
      } else {
        tmpvar_3081 = -1;
      };
      float tmpvar_3082;
      tmpvar_3082 = fract((iTime * 4.0));
      highp int tmpvar_3083;
      tmpvar_3083 = (tmpvar_2814 - 1);
      highp int tmpvar_3084;
      if ((tmpvar_3081 >= 0)) {
        tmpvar_3084 = 0;
      } else {
        tmpvar_3084 = 1;
      };
      highp int tmpvar_3085;
      tmpvar_3085 = (8 + tmpvar_3084);
      _uidx1_3080 = tmpvar_3085;
      if ((tmpvar_3083 < 0)) {
        highp int tmpvar_3086;
        if ((tmpvar_3081 >= 0)) {
          tmpvar_3086 = 1;
        } else {
          tmpvar_3086 = 0;
        };
        _uidx1_3080 = (8 + tmpvar_3086);
      };
      highp int tmpvar_3087;
      if ((tmpvar_3083 < 0)) {
        tmpvar_3087 = 3;
      } else {
        tmpvar_3087 = tmpvar_3083;
      };
      float tmpvar_3088;
      tmpvar_3088 = sin(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_3080)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_3087)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_3085)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_2814)
        , 0.0, 3.0))], tmpvar_3082)
       * 3.141593) / 180.0));
      highp int _uidx1_3089;
      highp int tmpvar_3090;
      if ((tmpvar_2815 == 0)) {
        tmpvar_3090 = 1;
      } else {
        tmpvar_3090 = -1;
      };
      float tmpvar_3091;
      tmpvar_3091 = fract((iTime * 4.0));
      highp int tmpvar_3092;
      tmpvar_3092 = (tmpvar_2814 - 1);
      highp int tmpvar_3093;
      if ((tmpvar_3090 >= 0)) {
        tmpvar_3093 = 0;
      } else {
        tmpvar_3093 = 1;
      };
      highp int tmpvar_3094;
      tmpvar_3094 = (8 + tmpvar_3093);
      _uidx1_3089 = tmpvar_3094;
      if ((tmpvar_3092 < 0)) {
        highp int tmpvar_3095;
        if ((tmpvar_3090 >= 0)) {
          tmpvar_3095 = 1;
        } else {
          tmpvar_3095 = 0;
        };
        _uidx1_3089 = (8 + tmpvar_3095);
      };
      highp int tmpvar_3096;
      if ((tmpvar_3092 < 0)) {
        tmpvar_3096 = 3;
      } else {
        tmpvar_3096 = tmpvar_3092;
      };
      mat2 tmpvar_3097;
      tmpvar_3097[uint(0)].x = tmpvar_3070;
      tmpvar_3097[uint(0)].y = tmpvar_3079;
      tmpvar_3097[1u].x = -(tmpvar_3088);
      tmpvar_3097[1u].y = cos(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_3089)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_3096)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_3094)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_2814)
        , 0.0, 3.0))], tmpvar_3091)
       * 3.141593) / 180.0));
      _upArm1L_2802.yz = (tmpvar_3061.yz * tmpvar_3097);
      highp vec3 tmpvar_3098;
      tmpvar_3098 = (abs((_upArm1L_2802 - vec3(0.0, 0.08, 0.0))) - vec3(0.02, 0.08, 0.02));
      highp vec3 tmpvar_3099;
      tmpvar_3099 = max (tmpvar_3098, 0.0);
      highp float tmpvar_3100;
      tmpvar_3100 = min (tmpvar_3060, (sqrt(
        dot (tmpvar_3099, tmpvar_3099)
      ) + min (
        max (tmpvar_3098.x, max (tmpvar_3098.y, tmpvar_3098.z))
      , 0.0)));
      highp vec3 tmpvar_3101;
      tmpvar_3101 = (_upChest_2810 + vec3(-0.125, -0.1, 0.0));
      _upArm0R_2801 = tmpvar_3101;
      highp int _us_3102;
      _us_3102 = -1;
      highp int _uidx1_3103;
      highp int tmpvar_3104;
      if ((tmpvar_2815 == 0)) {
        tmpvar_3104 = 1;
      } else {
        tmpvar_3104 = -1;
      };
      _us_3102 = -(tmpvar_3104);
      float tmpvar_3105;
      tmpvar_3105 = fract((iTime * 4.0));
      highp int tmpvar_3106;
      tmpvar_3106 = (tmpvar_2814 - 1);
      highp int tmpvar_3107;
      if ((_us_3102 >= 0)) {
        tmpvar_3107 = 0;
      } else {
        tmpvar_3107 = 1;
      };
      highp int tmpvar_3108;
      tmpvar_3108 = (6 + tmpvar_3107);
      _uidx1_3103 = tmpvar_3108;
      if ((tmpvar_3106 < 0)) {
        highp int tmpvar_3109;
        if ((_us_3102 >= 0)) {
          tmpvar_3109 = 1;
        } else {
          tmpvar_3109 = 0;
        };
        _uidx1_3103 = (6 + tmpvar_3109);
      };
      highp int tmpvar_3110;
      if ((tmpvar_3106 < 0)) {
        tmpvar_3110 = 3;
      } else {
        tmpvar_3110 = tmpvar_3106;
      };
      float tmpvar_3111;
      tmpvar_3111 = cos(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_3103), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_3110), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_3108), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_2814), 0.0, 3.0)
        )], tmpvar_3105))
       * 3.141593) / 180.0));
      highp int _us_3112;
      _us_3112 = -1;
      highp int _uidx1_3113;
      highp int tmpvar_3114;
      if ((tmpvar_2815 == 0)) {
        tmpvar_3114 = 1;
      } else {
        tmpvar_3114 = -1;
      };
      _us_3112 = -(tmpvar_3114);
      float tmpvar_3115;
      tmpvar_3115 = fract((iTime * 4.0));
      highp int tmpvar_3116;
      tmpvar_3116 = (tmpvar_2814 - 1);
      highp int tmpvar_3117;
      if ((_us_3112 >= 0)) {
        tmpvar_3117 = 0;
      } else {
        tmpvar_3117 = 1;
      };
      highp int tmpvar_3118;
      tmpvar_3118 = (6 + tmpvar_3117);
      _uidx1_3113 = tmpvar_3118;
      if ((tmpvar_3116 < 0)) {
        highp int tmpvar_3119;
        if ((_us_3112 >= 0)) {
          tmpvar_3119 = 1;
        } else {
          tmpvar_3119 = 0;
        };
        _uidx1_3113 = (6 + tmpvar_3119);
      };
      highp int tmpvar_3120;
      if ((tmpvar_3116 < 0)) {
        tmpvar_3120 = 3;
      } else {
        tmpvar_3120 = tmpvar_3116;
      };
      float tmpvar_3121;
      tmpvar_3121 = sin(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_3113), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_3120), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_3118), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_2814), 0.0, 3.0)
        )], tmpvar_3115))
       * 3.141593) / 180.0));
      highp int _us_3122;
      _us_3122 = -1;
      highp int _uidx1_3123;
      highp int tmpvar_3124;
      if ((tmpvar_2815 == 0)) {
        tmpvar_3124 = 1;
      } else {
        tmpvar_3124 = -1;
      };
      _us_3122 = -(tmpvar_3124);
      float tmpvar_3125;
      tmpvar_3125 = fract((iTime * 4.0));
      highp int tmpvar_3126;
      tmpvar_3126 = (tmpvar_2814 - 1);
      highp int tmpvar_3127;
      if ((_us_3122 >= 0)) {
        tmpvar_3127 = 0;
      } else {
        tmpvar_3127 = 1;
      };
      highp int tmpvar_3128;
      tmpvar_3128 = (6 + tmpvar_3127);
      _uidx1_3123 = tmpvar_3128;
      if ((tmpvar_3126 < 0)) {
        highp int tmpvar_3129;
        if ((_us_3122 >= 0)) {
          tmpvar_3129 = 1;
        } else {
          tmpvar_3129 = 0;
        };
        _uidx1_3123 = (6 + tmpvar_3129);
      };
      highp int tmpvar_3130;
      if ((tmpvar_3126 < 0)) {
        tmpvar_3130 = 3;
      } else {
        tmpvar_3130 = tmpvar_3126;
      };
      float tmpvar_3131;
      tmpvar_3131 = sin(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_3123), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_3130), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_3128), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_2814), 0.0, 3.0)
        )], tmpvar_3125))
       * 3.141593) / 180.0));
      highp int _us_3132;
      _us_3132 = -1;
      highp int _uidx1_3133;
      highp int tmpvar_3134;
      if ((tmpvar_2815 == 0)) {
        tmpvar_3134 = 1;
      } else {
        tmpvar_3134 = -1;
      };
      _us_3132 = -(tmpvar_3134);
      float tmpvar_3135;
      tmpvar_3135 = fract((iTime * 4.0));
      highp int tmpvar_3136;
      tmpvar_3136 = (tmpvar_2814 - 1);
      highp int tmpvar_3137;
      if ((_us_3132 >= 0)) {
        tmpvar_3137 = 0;
      } else {
        tmpvar_3137 = 1;
      };
      highp int tmpvar_3138;
      tmpvar_3138 = (6 + tmpvar_3137);
      _uidx1_3133 = tmpvar_3138;
      if ((tmpvar_3136 < 0)) {
        highp int tmpvar_3139;
        if ((_us_3132 >= 0)) {
          tmpvar_3139 = 1;
        } else {
          tmpvar_3139 = 0;
        };
        _uidx1_3133 = (6 + tmpvar_3139);
      };
      highp int tmpvar_3140;
      if ((tmpvar_3136 < 0)) {
        tmpvar_3140 = 3;
      } else {
        tmpvar_3140 = tmpvar_3136;
      };
      mat2 tmpvar_3141;
      tmpvar_3141[uint(0)].x = tmpvar_3111;
      tmpvar_3141[uint(0)].y = tmpvar_3121;
      tmpvar_3141[1u].x = -(tmpvar_3131);
      tmpvar_3141[1u].y = cos(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_3133), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_3140), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_3138), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_2814), 0.0, 3.0)
        )], tmpvar_3135))
       * 3.141593) / 180.0));
      _upArm0R_2801.yz = (tmpvar_3101.yz * tmpvar_3141);
      highp vec3 tmpvar_3142;
      tmpvar_3142 = (abs((_upArm0R_2801 - vec3(0.0, 0.08, 0.0))) - vec3(0.02, 0.08, 0.02));
      highp vec3 tmpvar_3143;
      tmpvar_3143 = max (tmpvar_3142, 0.0);
      highp float tmpvar_3144;
      tmpvar_3144 = min (tmpvar_3100, (sqrt(
        dot (tmpvar_3143, tmpvar_3143)
      ) + min (
        max (tmpvar_3142.x, max (tmpvar_3142.y, tmpvar_3142.z))
      , 0.0)));
      highp vec3 tmpvar_3145;
      tmpvar_3145 = (_upArm0R_2801 + vec3(0.0, -0.16, 0.0));
      _upArm1R_2800 = tmpvar_3145;
      highp int _us_3146;
      _us_3146 = -1;
      highp int _uidx1_3147;
      highp int tmpvar_3148;
      if ((tmpvar_2815 == 0)) {
        tmpvar_3148 = 1;
      } else {
        tmpvar_3148 = -1;
      };
      _us_3146 = -(tmpvar_3148);
      float tmpvar_3149;
      tmpvar_3149 = fract((iTime * 4.0));
      highp int tmpvar_3150;
      tmpvar_3150 = (tmpvar_2814 - 1);
      highp int tmpvar_3151;
      if ((_us_3146 >= 0)) {
        tmpvar_3151 = 0;
      } else {
        tmpvar_3151 = 1;
      };
      highp int tmpvar_3152;
      tmpvar_3152 = (8 + tmpvar_3151);
      _uidx1_3147 = tmpvar_3152;
      if ((tmpvar_3150 < 0)) {
        highp int tmpvar_3153;
        if ((_us_3146 >= 0)) {
          tmpvar_3153 = 1;
        } else {
          tmpvar_3153 = 0;
        };
        _uidx1_3147 = (8 + tmpvar_3153);
      };
      highp int tmpvar_3154;
      if ((tmpvar_3150 < 0)) {
        tmpvar_3154 = 3;
      } else {
        tmpvar_3154 = tmpvar_3150;
      };
      float tmpvar_3155;
      tmpvar_3155 = cos(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_3147)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_3154)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_3152)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_2814)
        , 0.0, 3.0))], tmpvar_3149)
       * 3.141593) / 180.0));
      highp int _us_3156;
      _us_3156 = -1;
      highp int _uidx1_3157;
      highp int tmpvar_3158;
      if ((tmpvar_2815 == 0)) {
        tmpvar_3158 = 1;
      } else {
        tmpvar_3158 = -1;
      };
      _us_3156 = -(tmpvar_3158);
      float tmpvar_3159;
      tmpvar_3159 = fract((iTime * 4.0));
      highp int tmpvar_3160;
      tmpvar_3160 = (tmpvar_2814 - 1);
      highp int tmpvar_3161;
      if ((_us_3156 >= 0)) {
        tmpvar_3161 = 0;
      } else {
        tmpvar_3161 = 1;
      };
      highp int tmpvar_3162;
      tmpvar_3162 = (8 + tmpvar_3161);
      _uidx1_3157 = tmpvar_3162;
      if ((tmpvar_3160 < 0)) {
        highp int tmpvar_3163;
        if ((_us_3156 >= 0)) {
          tmpvar_3163 = 1;
        } else {
          tmpvar_3163 = 0;
        };
        _uidx1_3157 = (8 + tmpvar_3163);
      };
      highp int tmpvar_3164;
      if ((tmpvar_3160 < 0)) {
        tmpvar_3164 = 3;
      } else {
        tmpvar_3164 = tmpvar_3160;
      };
      float tmpvar_3165;
      tmpvar_3165 = sin(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_3157)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_3164)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_3162)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_2814)
        , 0.0, 3.0))], tmpvar_3159)
       * 3.141593) / 180.0));
      highp int _us_3166;
      _us_3166 = -1;
      highp int _uidx1_3167;
      highp int tmpvar_3168;
      if ((tmpvar_2815 == 0)) {
        tmpvar_3168 = 1;
      } else {
        tmpvar_3168 = -1;
      };
      _us_3166 = -(tmpvar_3168);
      float tmpvar_3169;
      tmpvar_3169 = fract((iTime * 4.0));
      highp int tmpvar_3170;
      tmpvar_3170 = (tmpvar_2814 - 1);
      highp int tmpvar_3171;
      if ((_us_3166 >= 0)) {
        tmpvar_3171 = 0;
      } else {
        tmpvar_3171 = 1;
      };
      highp int tmpvar_3172;
      tmpvar_3172 = (8 + tmpvar_3171);
      _uidx1_3167 = tmpvar_3172;
      if ((tmpvar_3170 < 0)) {
        highp int tmpvar_3173;
        if ((_us_3166 >= 0)) {
          tmpvar_3173 = 1;
        } else {
          tmpvar_3173 = 0;
        };
        _uidx1_3167 = (8 + tmpvar_3173);
      };
      highp int tmpvar_3174;
      if ((tmpvar_3170 < 0)) {
        tmpvar_3174 = 3;
      } else {
        tmpvar_3174 = tmpvar_3170;
      };
      float tmpvar_3175;
      tmpvar_3175 = sin(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_3167)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_3174)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_3172)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_2814)
        , 0.0, 3.0))], tmpvar_3169)
       * 3.141593) / 180.0));
      highp int _us_3176;
      _us_3176 = -1;
      highp int _uidx1_3177;
      highp int tmpvar_3178;
      if ((tmpvar_2815 == 0)) {
        tmpvar_3178 = 1;
      } else {
        tmpvar_3178 = -1;
      };
      _us_3176 = -(tmpvar_3178);
      float tmpvar_3179;
      tmpvar_3179 = fract((iTime * 4.0));
      highp int tmpvar_3180;
      tmpvar_3180 = (tmpvar_2814 - 1);
      highp int tmpvar_3181;
      if ((_us_3176 >= 0)) {
        tmpvar_3181 = 0;
      } else {
        tmpvar_3181 = 1;
      };
      highp int tmpvar_3182;
      tmpvar_3182 = (8 + tmpvar_3181);
      _uidx1_3177 = tmpvar_3182;
      if ((tmpvar_3180 < 0)) {
        highp int tmpvar_3183;
        if ((_us_3176 >= 0)) {
          tmpvar_3183 = 1;
        } else {
          tmpvar_3183 = 0;
        };
        _uidx1_3177 = (8 + tmpvar_3183);
      };
      highp int tmpvar_3184;
      if ((tmpvar_3180 < 0)) {
        tmpvar_3184 = 3;
      } else {
        tmpvar_3184 = tmpvar_3180;
      };
      mat2 tmpvar_3185;
      tmpvar_3185[uint(0)].x = tmpvar_3155;
      tmpvar_3185[uint(0)].y = tmpvar_3165;
      tmpvar_3185[1u].x = -(tmpvar_3175);
      tmpvar_3185[1u].y = cos(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_3177)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_3184)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_3182)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_2814)
        , 0.0, 3.0))], tmpvar_3179)
       * 3.141593) / 180.0));
      _upArm1R_2800.yz = (tmpvar_3145.yz * tmpvar_3185);
      highp vec3 tmpvar_3186;
      tmpvar_3186 = (abs((_upArm1R_2800 - vec3(0.0, 0.08, 0.0))) - vec3(0.02, 0.08, 0.02));
      highp vec3 tmpvar_3187;
      tmpvar_3187 = max (tmpvar_3186, 0.0);
      highp vec4 tmpvar_3188;
      tmpvar_3188.yzw = vec3(0.2, 0.0, 0.0);
      tmpvar_3188.x = min (tmpvar_3144, (sqrt(
        dot (tmpvar_3187, tmpvar_3187)
      ) + min (
        max (tmpvar_3186.x, max (tmpvar_3186.y, tmpvar_3186.z))
      , 0.0)));
      tmpvar_2799 = tmpvar_3188;
    } else {
      tmpvar_2799 = tmpvar_2400;
    };
    _uhit_2397 = tmpvar_2799;
  };
  highp vec3 _up_3189;
  _up_3189 = (tmpvar_809 + vec3(1e-05, 1e-05, 1e-05));
  highp vec4 _uhit_3190;
  _uhit_3190 = vec4(4.5, 0.0, 0.0, 0.0);
  highp float tmpvar_3191;
  highp vec3 _up_3192;
  _up_3192 = (_up_3189 - vec3(0.0, -2.0, 0.0));
  tmpvar_3191 = (sqrt(dot (_up_3192, _up_3192)) - 2.0);
  highp vec4 tmpvar_3193;
  if ((tmpvar_3191 < 4.5)) {
    highp vec3 _up_3194;
    _up_3194 = (_up_3189 - vec3(0.0, -2.0, 0.0));
    highp vec4 tmpvar_3195;
    tmpvar_3195.yzw = vec3(0.1, 0.0, 0.0);
    tmpvar_3195.x = (sqrt(dot (_up_3194, _up_3194)) - 2.0);
    tmpvar_3193 = tmpvar_3195;
  } else {
    tmpvar_3193 = vec4(4.5, 0.0, 0.0, 0.0);
  };
  _uhit_3190 = tmpvar_3193;
  highp float tmpvar_3196;
  highp vec3 tmpvar_3197;
  tmpvar_3197 = (abs((_up_3189 - vec3(0.0, 0.5, 0.0))) - vec3(0.3, 0.5, 0.3));
  highp vec3 tmpvar_3198;
  tmpvar_3198 = max (tmpvar_3197, 0.0);
  tmpvar_3196 = (sqrt(dot (tmpvar_3198, tmpvar_3198)) + min (max (tmpvar_3197.x, 
    max (tmpvar_3197.y, tmpvar_3197.z)
  ), 0.0));
  highp vec4 tmpvar_3199;
  if ((tmpvar_3196 < tmpvar_3193.x)) {
    highp vec3 tmpvar_3200;
    tmpvar_3200 = (abs((_up_3189 - vec3(0.0, 0.5, 0.0))) - vec3(0.3, 0.5, 0.3));
    highp vec3 tmpvar_3201;
    tmpvar_3201 = max (tmpvar_3200, 0.0);
    highp vec4 tmpvar_3202;
    tmpvar_3202.yzw = vec3(-0.1, 0.0, 0.0);
    tmpvar_3202.x = (sqrt(dot (tmpvar_3201, tmpvar_3201)) + min (max (tmpvar_3200.x, 
      max (tmpvar_3200.y, tmpvar_3200.z)
    ), 0.0));
    tmpvar_3199 = tmpvar_3202;
  } else {
    tmpvar_3199 = tmpvar_3193;
  };
  if ((tmpvar_3199.y < 0.0)) {
    highp vec3 _upArm1R_3203;
    highp vec3 _upArm0R_3204;
    highp vec3 _upArm1L_3205;
    highp vec3 _upArm0L_3206;
    highp vec3 _upLeg1R_3207;
    highp vec3 _upLeg0R_3208;
    highp vec3 _upLeg1L_3209;
    highp vec3 _upLeg0L_3210;
    highp vec3 _upHead_3211;
    highp vec3 _upNeck_3212;
    highp vec3 _upChest_3213;
    highp vec3 _upWaist_3214;
    highp vec3 _upPelvis_3215;
    float tmpvar_3216;
    tmpvar_3216 = (iTime * 4.0);
    highp int tmpvar_3217;
    tmpvar_3217 = ((int(tmpvar_3216)% 4));
    highp int tmpvar_3218;
    tmpvar_3218 = ((int((tmpvar_3216 / 4.0))% 2));
    highp int _uidx1_3219;
    highp int tmpvar_3220;
    if ((tmpvar_3218 == 0)) {
      tmpvar_3220 = 1;
    } else {
      tmpvar_3220 = -1;
    };
    float tmpvar_3221;
    tmpvar_3221 = fract((iTime * 4.0));
    highp int tmpvar_3222;
    tmpvar_3222 = (tmpvar_3217 - 1);
    highp int tmpvar_3223;
    if ((tmpvar_3220 >= 0)) {
      tmpvar_3223 = 0;
    } else {
      tmpvar_3223 = 1;
    };
    highp int tmpvar_3224;
    tmpvar_3224 = (10 + tmpvar_3223);
    _uidx1_3219 = tmpvar_3224;
    if ((tmpvar_3222 < 0)) {
      highp int tmpvar_3225;
      if ((tmpvar_3220 >= 0)) {
        tmpvar_3225 = 1;
      } else {
        tmpvar_3225 = 0;
      };
      _uidx1_3219 = (10 + tmpvar_3225);
    };
    highp int tmpvar_3226;
    if ((tmpvar_3222 < 0)) {
      tmpvar_3226 = 3;
    } else {
      tmpvar_3226 = tmpvar_3222;
    };
    float tmpvar_3227;
    tmpvar_3227 = ((mix (
      vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (float(_uidx1_3219), 0.0, 11.0))][int(clamp (float(tmpvar_3226), 0.0, 3.0))]
    , 
      vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (float(tmpvar_3224), 0.0, 11.0))][int(clamp (float(tmpvar_3217), 0.0, 3.0))]
    , tmpvar_3221) * 3.141593) / 180.0);
    highp int _uidx1_3228;
    highp int tmpvar_3229;
    if ((tmpvar_3218 == 0)) {
      tmpvar_3229 = 1;
    } else {
      tmpvar_3229 = -1;
    };
    float tmpvar_3230;
    tmpvar_3230 = fract((iTime * 4.0));
    highp int tmpvar_3231;
    tmpvar_3231 = (tmpvar_3217 - 1);
    highp int tmpvar_3232;
    if ((tmpvar_3229 >= 0)) {
      tmpvar_3232 = 0;
    } else {
      tmpvar_3232 = 1;
    };
    _uidx1_3228 = tmpvar_3232;
    if ((tmpvar_3231 < 0)) {
      highp int tmpvar_3233;
      if ((tmpvar_3229 >= 0)) {
        tmpvar_3233 = 1;
      } else {
        tmpvar_3233 = 0;
      };
      _uidx1_3228 = tmpvar_3233;
    };
    highp int tmpvar_3234;
    if ((tmpvar_3231 < 0)) {
      tmpvar_3234 = 3;
    } else {
      tmpvar_3234 = tmpvar_3231;
    };
    vec3 tmpvar_3235;
    tmpvar_3235.xz = vec2(0.0, 0.0);
    tmpvar_3235.y = (-0.5 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[
      int(clamp (float(_uidx1_3228), 0.0, 11.0))
    ][
      int(clamp (float(tmpvar_3234), 0.0, 3.0))
    ], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[
      int(clamp (float(tmpvar_3232), 0.0, 11.0))
    ][
      int(clamp (float(tmpvar_3217), 0.0, 3.0))
    ], tmpvar_3230));
    highp vec3 tmpvar_3236;
    tmpvar_3236 = (_up_3189 + tmpvar_3235);
    _upPelvis_3215.z = tmpvar_3236.z;
    mat2 tmpvar_3237;
    tmpvar_3237[uint(0)].x = cos(tmpvar_3227);
    tmpvar_3237[uint(0)].y = sin(tmpvar_3227);
    tmpvar_3237[1u].x = -(sin(tmpvar_3227));
    tmpvar_3237[1u].y = cos(tmpvar_3227);
    _upPelvis_3215.xy = (tmpvar_3236.xy * tmpvar_3237);
    highp vec3 tmpvar_3238;
    tmpvar_3238 = (abs((_upPelvis_3215 - vec3(0.0, 0.0, 0.025))) - vec3(0.085, 0.05, 0.05));
    highp vec3 tmpvar_3239;
    tmpvar_3239 = max (tmpvar_3238, 0.0);
    highp vec3 tmpvar_3240;
    tmpvar_3240 = (_upPelvis_3215 + vec3(0.0, -0.05, -0.02));
    _upWaist_3214.z = tmpvar_3240.z;
    mat2 tmpvar_3241;
    tmpvar_3241[uint(0)].x = cos(-(tmpvar_3227));
    tmpvar_3241[uint(0)].y = sin(-(tmpvar_3227));
    tmpvar_3241[1u].x = -(sin(-(tmpvar_3227)));
    tmpvar_3241[1u].y = cos(-(tmpvar_3227));
    _upWaist_3214.xy = (tmpvar_3240.xy * tmpvar_3241);
    _upWaist_3214.yz = (_upWaist_3214.yz * mat2(1.0, 0.0, -0.0, 1.0));
    highp vec3 tmpvar_3242;
    tmpvar_3242 = (abs((_upWaist_3214 - vec3(0.0, 0.04, 0.0))) - vec3(0.075, 0.08, 0.03));
    highp vec3 tmpvar_3243;
    tmpvar_3243 = max (tmpvar_3242, 0.0);
    highp vec3 tmpvar_3244;
    tmpvar_3244 = (_upWaist_3214 + vec3(0.0, -0.14, -0.01));
    _upChest_3213.x = tmpvar_3244.x;
    _upChest_3213.yz = (tmpvar_3244.yz * mat2(1.0, 0.0, -0.0, 1.0));
    highp vec3 tmpvar_3245;
    tmpvar_3245 = (abs((_upChest_3213 - vec3(0.0, 0.04, 0.0))) - vec3(0.09, 0.08, 0.05));
    highp vec3 tmpvar_3246;
    tmpvar_3246 = max (tmpvar_3245, 0.0);
    highp vec3 tmpvar_3247;
    tmpvar_3247 = (_upChest_3213 + vec3(0.0, -0.15, 0.0));
    _upNeck_3212.x = tmpvar_3247.x;
    _upNeck_3212.yz = (tmpvar_3247.yz * mat2(1.0, 0.0, -0.0, 1.0));
    highp vec3 tmpvar_3248;
    tmpvar_3248 = (abs((_upNeck_3212 - vec3(0.0, 0.01, 0.0))) - vec3(0.02, 0.04, 0.02));
    highp vec3 tmpvar_3249;
    tmpvar_3249 = max (tmpvar_3248, 0.0);
    highp vec3 tmpvar_3250;
    tmpvar_3250 = (_upNeck_3212 + vec3(0.0, -0.1, 0.0));
    _upHead_3211.x = tmpvar_3250.x;
    _upHead_3211.yz = (tmpvar_3250.yz * mat2(1.0, 0.0, -0.0, 1.0));
    highp vec3 tmpvar_3251;
    tmpvar_3251 = (abs((_upHead_3211 - vec3(0.0, 0.04, -0.025))) - vec3(0.05, 0.08, 0.06));
    highp vec3 tmpvar_3252;
    tmpvar_3252 = max (tmpvar_3251, 0.0);
    highp float tmpvar_3253;
    tmpvar_3253 = min (min (min (
      min (min (4.5, (sqrt(
        dot (tmpvar_3239, tmpvar_3239)
      ) + min (
        max (tmpvar_3238.x, max (tmpvar_3238.y, tmpvar_3238.z))
      , 0.0))), (sqrt(dot (tmpvar_3243, tmpvar_3243)) + min (max (tmpvar_3242.x, 
        max (tmpvar_3242.y, tmpvar_3242.z)
      ), 0.0)))
    , 
      (sqrt(dot (tmpvar_3246, tmpvar_3246)) + min (max (tmpvar_3245.x, max (tmpvar_3245.y, tmpvar_3245.z)), 0.0))
    ), (
      sqrt(dot (tmpvar_3249, tmpvar_3249))
     + 
      min (max (tmpvar_3248.x, max (tmpvar_3248.y, tmpvar_3248.z)), 0.0)
    )), (sqrt(
      dot (tmpvar_3252, tmpvar_3252)
    ) + min (
      max (tmpvar_3251.x, max (tmpvar_3251.y, tmpvar_3251.z))
    , 0.0)));
    highp vec3 tmpvar_3254;
    tmpvar_3254 = (_upPelvis_3215 + vec3(0.06, 0.025, 0.0));
    _upLeg0L_3210.z = tmpvar_3254.z;
    mat2 tmpvar_3255;
    tmpvar_3255[uint(0)].x = cos(-(tmpvar_3227));
    tmpvar_3255[uint(0)].y = sin(-(tmpvar_3227));
    tmpvar_3255[1u].x = -(sin(-(tmpvar_3227)));
    tmpvar_3255[1u].y = cos(-(tmpvar_3227));
    _upLeg0L_3210.xy = (tmpvar_3254.xy * tmpvar_3255);
    highp int _uidx1_3256;
    highp int tmpvar_3257;
    if ((tmpvar_3218 == 0)) {
      tmpvar_3257 = 1;
    } else {
      tmpvar_3257 = -1;
    };
    float tmpvar_3258;
    tmpvar_3258 = fract((iTime * 4.0));
    highp int tmpvar_3259;
    tmpvar_3259 = (tmpvar_3217 - 1);
    highp int tmpvar_3260;
    if ((tmpvar_3257 >= 0)) {
      tmpvar_3260 = 0;
    } else {
      tmpvar_3260 = 1;
    };
    highp int tmpvar_3261;
    tmpvar_3261 = (2 + tmpvar_3260);
    _uidx1_3256 = tmpvar_3261;
    if ((tmpvar_3259 < 0)) {
      highp int tmpvar_3262;
      if ((tmpvar_3257 >= 0)) {
        tmpvar_3262 = 1;
      } else {
        tmpvar_3262 = 0;
      };
      _uidx1_3256 = (2 + tmpvar_3262);
    };
    highp int tmpvar_3263;
    if ((tmpvar_3259 < 0)) {
      tmpvar_3263 = 3;
    } else {
      tmpvar_3263 = tmpvar_3259;
    };
    float tmpvar_3264;
    tmpvar_3264 = cos(((
      (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(_uidx1_3256), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_3263), 0.0, 3.0)
      )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(tmpvar_3261), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_3217), 0.0, 3.0)
      )], tmpvar_3258))
     * 3.141593) / 180.0));
    highp int _uidx1_3265;
    highp int tmpvar_3266;
    if ((tmpvar_3218 == 0)) {
      tmpvar_3266 = 1;
    } else {
      tmpvar_3266 = -1;
    };
    float tmpvar_3267;
    tmpvar_3267 = fract((iTime * 4.0));
    highp int tmpvar_3268;
    tmpvar_3268 = (tmpvar_3217 - 1);
    highp int tmpvar_3269;
    if ((tmpvar_3266 >= 0)) {
      tmpvar_3269 = 0;
    } else {
      tmpvar_3269 = 1;
    };
    highp int tmpvar_3270;
    tmpvar_3270 = (2 + tmpvar_3269);
    _uidx1_3265 = tmpvar_3270;
    if ((tmpvar_3268 < 0)) {
      highp int tmpvar_3271;
      if ((tmpvar_3266 >= 0)) {
        tmpvar_3271 = 1;
      } else {
        tmpvar_3271 = 0;
      };
      _uidx1_3265 = (2 + tmpvar_3271);
    };
    highp int tmpvar_3272;
    if ((tmpvar_3268 < 0)) {
      tmpvar_3272 = 3;
    } else {
      tmpvar_3272 = tmpvar_3268;
    };
    float tmpvar_3273;
    tmpvar_3273 = sin(((
      (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(_uidx1_3265), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_3272), 0.0, 3.0)
      )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(tmpvar_3270), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_3217), 0.0, 3.0)
      )], tmpvar_3267))
     * 3.141593) / 180.0));
    highp int _uidx1_3274;
    highp int tmpvar_3275;
    if ((tmpvar_3218 == 0)) {
      tmpvar_3275 = 1;
    } else {
      tmpvar_3275 = -1;
    };
    float tmpvar_3276;
    tmpvar_3276 = fract((iTime * 4.0));
    highp int tmpvar_3277;
    tmpvar_3277 = (tmpvar_3217 - 1);
    highp int tmpvar_3278;
    if ((tmpvar_3275 >= 0)) {
      tmpvar_3278 = 0;
    } else {
      tmpvar_3278 = 1;
    };
    highp int tmpvar_3279;
    tmpvar_3279 = (2 + tmpvar_3278);
    _uidx1_3274 = tmpvar_3279;
    if ((tmpvar_3277 < 0)) {
      highp int tmpvar_3280;
      if ((tmpvar_3275 >= 0)) {
        tmpvar_3280 = 1;
      } else {
        tmpvar_3280 = 0;
      };
      _uidx1_3274 = (2 + tmpvar_3280);
    };
    highp int tmpvar_3281;
    if ((tmpvar_3277 < 0)) {
      tmpvar_3281 = 3;
    } else {
      tmpvar_3281 = tmpvar_3277;
    };
    float tmpvar_3282;
    tmpvar_3282 = sin(((
      (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(_uidx1_3274), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_3281), 0.0, 3.0)
      )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(tmpvar_3279), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_3217), 0.0, 3.0)
      )], tmpvar_3276))
     * 3.141593) / 180.0));
    highp int _uidx1_3283;
    highp int tmpvar_3284;
    if ((tmpvar_3218 == 0)) {
      tmpvar_3284 = 1;
    } else {
      tmpvar_3284 = -1;
    };
    float tmpvar_3285;
    tmpvar_3285 = fract((iTime * 4.0));
    highp int tmpvar_3286;
    tmpvar_3286 = (tmpvar_3217 - 1);
    highp int tmpvar_3287;
    if ((tmpvar_3284 >= 0)) {
      tmpvar_3287 = 0;
    } else {
      tmpvar_3287 = 1;
    };
    highp int tmpvar_3288;
    tmpvar_3288 = (2 + tmpvar_3287);
    _uidx1_3283 = tmpvar_3288;
    if ((tmpvar_3286 < 0)) {
      highp int tmpvar_3289;
      if ((tmpvar_3284 >= 0)) {
        tmpvar_3289 = 1;
      } else {
        tmpvar_3289 = 0;
      };
      _uidx1_3283 = (2 + tmpvar_3289);
    };
    highp int tmpvar_3290;
    if ((tmpvar_3286 < 0)) {
      tmpvar_3290 = 3;
    } else {
      tmpvar_3290 = tmpvar_3286;
    };
    mat2 tmpvar_3291;
    tmpvar_3291[uint(0)].x = tmpvar_3264;
    tmpvar_3291[uint(0)].y = tmpvar_3273;
    tmpvar_3291[1u].x = -(tmpvar_3282);
    tmpvar_3291[1u].y = cos(((
      (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(_uidx1_3283), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_3290), 0.0, 3.0)
      )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(tmpvar_3288), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_3217), 0.0, 3.0)
      )], tmpvar_3285))
     * 3.141593) / 180.0));
    _upLeg0L_3210.yz = (_upLeg0L_3210.yz * tmpvar_3291);
    highp vec3 tmpvar_3292;
    tmpvar_3292 = (abs((_upLeg0L_3210 - vec3(0.0, 0.1, 0.0))) - vec3(0.025, 0.1, 0.025));
    highp vec3 tmpvar_3293;
    tmpvar_3293 = max (tmpvar_3292, 0.0);
    highp float tmpvar_3294;
    tmpvar_3294 = min (tmpvar_3253, (sqrt(
      dot (tmpvar_3293, tmpvar_3293)
    ) + min (
      max (tmpvar_3292.x, max (tmpvar_3292.y, tmpvar_3292.z))
    , 0.0)));
    highp vec3 tmpvar_3295;
    tmpvar_3295 = (_upLeg0L_3210 + vec3(0.01, -0.18, 0.02));
    _upLeg1L_3209 = tmpvar_3295;
    highp int _uidx1_3296;
    highp int tmpvar_3297;
    if ((tmpvar_3218 == 0)) {
      tmpvar_3297 = 1;
    } else {
      tmpvar_3297 = -1;
    };
    float tmpvar_3298;
    tmpvar_3298 = fract((iTime * 4.0));
    highp int tmpvar_3299;
    tmpvar_3299 = (tmpvar_3217 - 1);
    highp int tmpvar_3300;
    if ((tmpvar_3297 >= 0)) {
      tmpvar_3300 = 0;
    } else {
      tmpvar_3300 = 1;
    };
    highp int tmpvar_3301;
    tmpvar_3301 = (4 + tmpvar_3300);
    _uidx1_3296 = tmpvar_3301;
    if ((tmpvar_3299 < 0)) {
      highp int tmpvar_3302;
      if ((tmpvar_3297 >= 0)) {
        tmpvar_3302 = 1;
      } else {
        tmpvar_3302 = 0;
      };
      _uidx1_3296 = (4 + tmpvar_3302);
    };
    highp int tmpvar_3303;
    if ((tmpvar_3299 < 0)) {
      tmpvar_3303 = 3;
    } else {
      tmpvar_3303 = tmpvar_3299;
    };
    float tmpvar_3304;
    tmpvar_3304 = cos(((
      mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(_uidx1_3296)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_3303)
      , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(tmpvar_3301)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_3217)
      , 0.0, 3.0))], tmpvar_3298)
     * 3.141593) / 180.0));
    highp int _uidx1_3305;
    highp int tmpvar_3306;
    if ((tmpvar_3218 == 0)) {
      tmpvar_3306 = 1;
    } else {
      tmpvar_3306 = -1;
    };
    float tmpvar_3307;
    tmpvar_3307 = fract((iTime * 4.0));
    highp int tmpvar_3308;
    tmpvar_3308 = (tmpvar_3217 - 1);
    highp int tmpvar_3309;
    if ((tmpvar_3306 >= 0)) {
      tmpvar_3309 = 0;
    } else {
      tmpvar_3309 = 1;
    };
    highp int tmpvar_3310;
    tmpvar_3310 = (4 + tmpvar_3309);
    _uidx1_3305 = tmpvar_3310;
    if ((tmpvar_3308 < 0)) {
      highp int tmpvar_3311;
      if ((tmpvar_3306 >= 0)) {
        tmpvar_3311 = 1;
      } else {
        tmpvar_3311 = 0;
      };
      _uidx1_3305 = (4 + tmpvar_3311);
    };
    highp int tmpvar_3312;
    if ((tmpvar_3308 < 0)) {
      tmpvar_3312 = 3;
    } else {
      tmpvar_3312 = tmpvar_3308;
    };
    float tmpvar_3313;
    tmpvar_3313 = sin(((
      mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(_uidx1_3305)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_3312)
      , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(tmpvar_3310)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_3217)
      , 0.0, 3.0))], tmpvar_3307)
     * 3.141593) / 180.0));
    highp int _uidx1_3314;
    highp int tmpvar_3315;
    if ((tmpvar_3218 == 0)) {
      tmpvar_3315 = 1;
    } else {
      tmpvar_3315 = -1;
    };
    float tmpvar_3316;
    tmpvar_3316 = fract((iTime * 4.0));
    highp int tmpvar_3317;
    tmpvar_3317 = (tmpvar_3217 - 1);
    highp int tmpvar_3318;
    if ((tmpvar_3315 >= 0)) {
      tmpvar_3318 = 0;
    } else {
      tmpvar_3318 = 1;
    };
    highp int tmpvar_3319;
    tmpvar_3319 = (4 + tmpvar_3318);
    _uidx1_3314 = tmpvar_3319;
    if ((tmpvar_3317 < 0)) {
      highp int tmpvar_3320;
      if ((tmpvar_3315 >= 0)) {
        tmpvar_3320 = 1;
      } else {
        tmpvar_3320 = 0;
      };
      _uidx1_3314 = (4 + tmpvar_3320);
    };
    highp int tmpvar_3321;
    if ((tmpvar_3317 < 0)) {
      tmpvar_3321 = 3;
    } else {
      tmpvar_3321 = tmpvar_3317;
    };
    float tmpvar_3322;
    tmpvar_3322 = sin(((
      mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(_uidx1_3314)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_3321)
      , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(tmpvar_3319)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_3217)
      , 0.0, 3.0))], tmpvar_3316)
     * 3.141593) / 180.0));
    highp int _uidx1_3323;
    highp int tmpvar_3324;
    if ((tmpvar_3218 == 0)) {
      tmpvar_3324 = 1;
    } else {
      tmpvar_3324 = -1;
    };
    float tmpvar_3325;
    tmpvar_3325 = fract((iTime * 4.0));
    highp int tmpvar_3326;
    tmpvar_3326 = (tmpvar_3217 - 1);
    highp int tmpvar_3327;
    if ((tmpvar_3324 >= 0)) {
      tmpvar_3327 = 0;
    } else {
      tmpvar_3327 = 1;
    };
    highp int tmpvar_3328;
    tmpvar_3328 = (4 + tmpvar_3327);
    _uidx1_3323 = tmpvar_3328;
    if ((tmpvar_3326 < 0)) {
      highp int tmpvar_3329;
      if ((tmpvar_3324 >= 0)) {
        tmpvar_3329 = 1;
      } else {
        tmpvar_3329 = 0;
      };
      _uidx1_3323 = (4 + tmpvar_3329);
    };
    highp int tmpvar_3330;
    if ((tmpvar_3326 < 0)) {
      tmpvar_3330 = 3;
    } else {
      tmpvar_3330 = tmpvar_3326;
    };
    mat2 tmpvar_3331;
    tmpvar_3331[uint(0)].x = tmpvar_3304;
    tmpvar_3331[uint(0)].y = tmpvar_3313;
    tmpvar_3331[1u].x = -(tmpvar_3322);
    tmpvar_3331[1u].y = cos(((
      mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(_uidx1_3323)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_3330)
      , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(tmpvar_3328)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_3217)
      , 0.0, 3.0))], tmpvar_3325)
     * 3.141593) / 180.0));
    _upLeg1L_3209.yz = (tmpvar_3295.yz * tmpvar_3331);
    highp vec3 tmpvar_3332;
    tmpvar_3332 = (abs((_upLeg1L_3209 - vec3(0.0, 0.1, 0.0))) - vec3(0.025, 0.1, 0.025));
    highp vec3 tmpvar_3333;
    tmpvar_3333 = max (tmpvar_3332, 0.0);
    highp float tmpvar_3334;
    tmpvar_3334 = min (tmpvar_3294, (sqrt(
      dot (tmpvar_3333, tmpvar_3333)
    ) + min (
      max (tmpvar_3332.x, max (tmpvar_3332.y, tmpvar_3332.z))
    , 0.0)));
    highp vec3 tmpvar_3335;
    tmpvar_3335 = (_upPelvis_3215 + vec3(-0.06, 0.025, 0.0));
    _upLeg0R_3208.z = tmpvar_3335.z;
    mat2 tmpvar_3336;
    tmpvar_3336[uint(0)].x = cos(-(tmpvar_3227));
    tmpvar_3336[uint(0)].y = sin(-(tmpvar_3227));
    tmpvar_3336[1u].x = -(sin(-(tmpvar_3227)));
    tmpvar_3336[1u].y = cos(-(tmpvar_3227));
    _upLeg0R_3208.xy = (tmpvar_3335.xy * tmpvar_3336);
    highp int _us_3337;
    _us_3337 = -1;
    highp int _uidx1_3338;
    highp int tmpvar_3339;
    if ((tmpvar_3218 == 0)) {
      tmpvar_3339 = 1;
    } else {
      tmpvar_3339 = -1;
    };
    _us_3337 = -(tmpvar_3339);
    float tmpvar_3340;
    tmpvar_3340 = fract((iTime * 4.0));
    highp int tmpvar_3341;
    tmpvar_3341 = (tmpvar_3217 - 1);
    highp int tmpvar_3342;
    if ((_us_3337 >= 0)) {
      tmpvar_3342 = 0;
    } else {
      tmpvar_3342 = 1;
    };
    highp int tmpvar_3343;
    tmpvar_3343 = (2 + tmpvar_3342);
    _uidx1_3338 = tmpvar_3343;
    if ((tmpvar_3341 < 0)) {
      highp int tmpvar_3344;
      if ((_us_3337 >= 0)) {
        tmpvar_3344 = 1;
      } else {
        tmpvar_3344 = 0;
      };
      _uidx1_3338 = (2 + tmpvar_3344);
    };
    highp int tmpvar_3345;
    if ((tmpvar_3341 < 0)) {
      tmpvar_3345 = 3;
    } else {
      tmpvar_3345 = tmpvar_3341;
    };
    float tmpvar_3346;
    tmpvar_3346 = cos(((
      (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(_uidx1_3338), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_3345), 0.0, 3.0)
      )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(tmpvar_3343), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_3217), 0.0, 3.0)
      )], tmpvar_3340))
     * 3.141593) / 180.0));
    highp int _us_3347;
    _us_3347 = -1;
    highp int _uidx1_3348;
    highp int tmpvar_3349;
    if ((tmpvar_3218 == 0)) {
      tmpvar_3349 = 1;
    } else {
      tmpvar_3349 = -1;
    };
    _us_3347 = -(tmpvar_3349);
    float tmpvar_3350;
    tmpvar_3350 = fract((iTime * 4.0));
    highp int tmpvar_3351;
    tmpvar_3351 = (tmpvar_3217 - 1);
    highp int tmpvar_3352;
    if ((_us_3347 >= 0)) {
      tmpvar_3352 = 0;
    } else {
      tmpvar_3352 = 1;
    };
    highp int tmpvar_3353;
    tmpvar_3353 = (2 + tmpvar_3352);
    _uidx1_3348 = tmpvar_3353;
    if ((tmpvar_3351 < 0)) {
      highp int tmpvar_3354;
      if ((_us_3347 >= 0)) {
        tmpvar_3354 = 1;
      } else {
        tmpvar_3354 = 0;
      };
      _uidx1_3348 = (2 + tmpvar_3354);
    };
    highp int tmpvar_3355;
    if ((tmpvar_3351 < 0)) {
      tmpvar_3355 = 3;
    } else {
      tmpvar_3355 = tmpvar_3351;
    };
    float tmpvar_3356;
    tmpvar_3356 = sin(((
      (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(_uidx1_3348), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_3355), 0.0, 3.0)
      )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(tmpvar_3353), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_3217), 0.0, 3.0)
      )], tmpvar_3350))
     * 3.141593) / 180.0));
    highp int _us_3357;
    _us_3357 = -1;
    highp int _uidx1_3358;
    highp int tmpvar_3359;
    if ((tmpvar_3218 == 0)) {
      tmpvar_3359 = 1;
    } else {
      tmpvar_3359 = -1;
    };
    _us_3357 = -(tmpvar_3359);
    float tmpvar_3360;
    tmpvar_3360 = fract((iTime * 4.0));
    highp int tmpvar_3361;
    tmpvar_3361 = (tmpvar_3217 - 1);
    highp int tmpvar_3362;
    if ((_us_3357 >= 0)) {
      tmpvar_3362 = 0;
    } else {
      tmpvar_3362 = 1;
    };
    highp int tmpvar_3363;
    tmpvar_3363 = (2 + tmpvar_3362);
    _uidx1_3358 = tmpvar_3363;
    if ((tmpvar_3361 < 0)) {
      highp int tmpvar_3364;
      if ((_us_3357 >= 0)) {
        tmpvar_3364 = 1;
      } else {
        tmpvar_3364 = 0;
      };
      _uidx1_3358 = (2 + tmpvar_3364);
    };
    highp int tmpvar_3365;
    if ((tmpvar_3361 < 0)) {
      tmpvar_3365 = 3;
    } else {
      tmpvar_3365 = tmpvar_3361;
    };
    float tmpvar_3366;
    tmpvar_3366 = sin(((
      (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(_uidx1_3358), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_3365), 0.0, 3.0)
      )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(tmpvar_3363), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_3217), 0.0, 3.0)
      )], tmpvar_3360))
     * 3.141593) / 180.0));
    highp int _us_3367;
    _us_3367 = -1;
    highp int _uidx1_3368;
    highp int tmpvar_3369;
    if ((tmpvar_3218 == 0)) {
      tmpvar_3369 = 1;
    } else {
      tmpvar_3369 = -1;
    };
    _us_3367 = -(tmpvar_3369);
    float tmpvar_3370;
    tmpvar_3370 = fract((iTime * 4.0));
    highp int tmpvar_3371;
    tmpvar_3371 = (tmpvar_3217 - 1);
    highp int tmpvar_3372;
    if ((_us_3367 >= 0)) {
      tmpvar_3372 = 0;
    } else {
      tmpvar_3372 = 1;
    };
    highp int tmpvar_3373;
    tmpvar_3373 = (2 + tmpvar_3372);
    _uidx1_3368 = tmpvar_3373;
    if ((tmpvar_3371 < 0)) {
      highp int tmpvar_3374;
      if ((_us_3367 >= 0)) {
        tmpvar_3374 = 1;
      } else {
        tmpvar_3374 = 0;
      };
      _uidx1_3368 = (2 + tmpvar_3374);
    };
    highp int tmpvar_3375;
    if ((tmpvar_3371 < 0)) {
      tmpvar_3375 = 3;
    } else {
      tmpvar_3375 = tmpvar_3371;
    };
    mat2 tmpvar_3376;
    tmpvar_3376[uint(0)].x = tmpvar_3346;
    tmpvar_3376[uint(0)].y = tmpvar_3356;
    tmpvar_3376[1u].x = -(tmpvar_3366);
    tmpvar_3376[1u].y = cos(((
      (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(_uidx1_3368), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_3375), 0.0, 3.0)
      )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(tmpvar_3373), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_3217), 0.0, 3.0)
      )], tmpvar_3370))
     * 3.141593) / 180.0));
    _upLeg0R_3208.yz = (_upLeg0R_3208.yz * tmpvar_3376);
    highp vec3 tmpvar_3377;
    tmpvar_3377 = (abs((_upLeg0R_3208 - vec3(0.0, 0.1, 0.0))) - vec3(0.025, 0.1, 0.025));
    highp vec3 tmpvar_3378;
    tmpvar_3378 = max (tmpvar_3377, 0.0);
    highp float tmpvar_3379;
    tmpvar_3379 = min (tmpvar_3334, (sqrt(
      dot (tmpvar_3378, tmpvar_3378)
    ) + min (
      max (tmpvar_3377.x, max (tmpvar_3377.y, tmpvar_3377.z))
    , 0.0)));
    highp vec3 tmpvar_3380;
    tmpvar_3380 = (_upLeg0R_3208 + vec3(-0.01, -0.18, 0.02));
    _upLeg1R_3207 = tmpvar_3380;
    highp int _us_3381;
    _us_3381 = -1;
    highp int _uidx1_3382;
    highp int tmpvar_3383;
    if ((tmpvar_3218 == 0)) {
      tmpvar_3383 = 1;
    } else {
      tmpvar_3383 = -1;
    };
    _us_3381 = -(tmpvar_3383);
    float tmpvar_3384;
    tmpvar_3384 = fract((iTime * 4.0));
    highp int tmpvar_3385;
    tmpvar_3385 = (tmpvar_3217 - 1);
    highp int tmpvar_3386;
    if ((_us_3381 >= 0)) {
      tmpvar_3386 = 0;
    } else {
      tmpvar_3386 = 1;
    };
    highp int tmpvar_3387;
    tmpvar_3387 = (4 + tmpvar_3386);
    _uidx1_3382 = tmpvar_3387;
    if ((tmpvar_3385 < 0)) {
      highp int tmpvar_3388;
      if ((_us_3381 >= 0)) {
        tmpvar_3388 = 1;
      } else {
        tmpvar_3388 = 0;
      };
      _uidx1_3382 = (4 + tmpvar_3388);
    };
    highp int tmpvar_3389;
    if ((tmpvar_3385 < 0)) {
      tmpvar_3389 = 3;
    } else {
      tmpvar_3389 = tmpvar_3385;
    };
    float tmpvar_3390;
    tmpvar_3390 = cos(((
      mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(_uidx1_3382)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_3389)
      , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(tmpvar_3387)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_3217)
      , 0.0, 3.0))], tmpvar_3384)
     * 3.141593) / 180.0));
    highp int _us_3391;
    _us_3391 = -1;
    highp int _uidx1_3392;
    highp int tmpvar_3393;
    if ((tmpvar_3218 == 0)) {
      tmpvar_3393 = 1;
    } else {
      tmpvar_3393 = -1;
    };
    _us_3391 = -(tmpvar_3393);
    float tmpvar_3394;
    tmpvar_3394 = fract((iTime * 4.0));
    highp int tmpvar_3395;
    tmpvar_3395 = (tmpvar_3217 - 1);
    highp int tmpvar_3396;
    if ((_us_3391 >= 0)) {
      tmpvar_3396 = 0;
    } else {
      tmpvar_3396 = 1;
    };
    highp int tmpvar_3397;
    tmpvar_3397 = (4 + tmpvar_3396);
    _uidx1_3392 = tmpvar_3397;
    if ((tmpvar_3395 < 0)) {
      highp int tmpvar_3398;
      if ((_us_3391 >= 0)) {
        tmpvar_3398 = 1;
      } else {
        tmpvar_3398 = 0;
      };
      _uidx1_3392 = (4 + tmpvar_3398);
    };
    highp int tmpvar_3399;
    if ((tmpvar_3395 < 0)) {
      tmpvar_3399 = 3;
    } else {
      tmpvar_3399 = tmpvar_3395;
    };
    float tmpvar_3400;
    tmpvar_3400 = sin(((
      mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(_uidx1_3392)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_3399)
      , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(tmpvar_3397)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_3217)
      , 0.0, 3.0))], tmpvar_3394)
     * 3.141593) / 180.0));
    highp int _us_3401;
    _us_3401 = -1;
    highp int _uidx1_3402;
    highp int tmpvar_3403;
    if ((tmpvar_3218 == 0)) {
      tmpvar_3403 = 1;
    } else {
      tmpvar_3403 = -1;
    };
    _us_3401 = -(tmpvar_3403);
    float tmpvar_3404;
    tmpvar_3404 = fract((iTime * 4.0));
    highp int tmpvar_3405;
    tmpvar_3405 = (tmpvar_3217 - 1);
    highp int tmpvar_3406;
    if ((_us_3401 >= 0)) {
      tmpvar_3406 = 0;
    } else {
      tmpvar_3406 = 1;
    };
    highp int tmpvar_3407;
    tmpvar_3407 = (4 + tmpvar_3406);
    _uidx1_3402 = tmpvar_3407;
    if ((tmpvar_3405 < 0)) {
      highp int tmpvar_3408;
      if ((_us_3401 >= 0)) {
        tmpvar_3408 = 1;
      } else {
        tmpvar_3408 = 0;
      };
      _uidx1_3402 = (4 + tmpvar_3408);
    };
    highp int tmpvar_3409;
    if ((tmpvar_3405 < 0)) {
      tmpvar_3409 = 3;
    } else {
      tmpvar_3409 = tmpvar_3405;
    };
    float tmpvar_3410;
    tmpvar_3410 = sin(((
      mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(_uidx1_3402)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_3409)
      , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(tmpvar_3407)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_3217)
      , 0.0, 3.0))], tmpvar_3404)
     * 3.141593) / 180.0));
    highp int _us_3411;
    _us_3411 = -1;
    highp int _uidx1_3412;
    highp int tmpvar_3413;
    if ((tmpvar_3218 == 0)) {
      tmpvar_3413 = 1;
    } else {
      tmpvar_3413 = -1;
    };
    _us_3411 = -(tmpvar_3413);
    float tmpvar_3414;
    tmpvar_3414 = fract((iTime * 4.0));
    highp int tmpvar_3415;
    tmpvar_3415 = (tmpvar_3217 - 1);
    highp int tmpvar_3416;
    if ((_us_3411 >= 0)) {
      tmpvar_3416 = 0;
    } else {
      tmpvar_3416 = 1;
    };
    highp int tmpvar_3417;
    tmpvar_3417 = (4 + tmpvar_3416);
    _uidx1_3412 = tmpvar_3417;
    if ((tmpvar_3415 < 0)) {
      highp int tmpvar_3418;
      if ((_us_3411 >= 0)) {
        tmpvar_3418 = 1;
      } else {
        tmpvar_3418 = 0;
      };
      _uidx1_3412 = (4 + tmpvar_3418);
    };
    highp int tmpvar_3419;
    if ((tmpvar_3415 < 0)) {
      tmpvar_3419 = 3;
    } else {
      tmpvar_3419 = tmpvar_3415;
    };
    mat2 tmpvar_3420;
    tmpvar_3420[uint(0)].x = tmpvar_3390;
    tmpvar_3420[uint(0)].y = tmpvar_3400;
    tmpvar_3420[1u].x = -(tmpvar_3410);
    tmpvar_3420[1u].y = cos(((
      mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(_uidx1_3412)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_3419)
      , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(tmpvar_3417)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_3217)
      , 0.0, 3.0))], tmpvar_3414)
     * 3.141593) / 180.0));
    _upLeg1R_3207.yz = (tmpvar_3380.yz * tmpvar_3420);
    highp vec3 tmpvar_3421;
    tmpvar_3421 = (abs((_upLeg1R_3207 - vec3(0.0, 0.1, 0.0))) - vec3(0.025, 0.1, 0.025));
    highp vec3 tmpvar_3422;
    tmpvar_3422 = max (tmpvar_3421, 0.0);
    highp float tmpvar_3423;
    tmpvar_3423 = min (tmpvar_3379, (sqrt(
      dot (tmpvar_3422, tmpvar_3422)
    ) + min (
      max (tmpvar_3421.x, max (tmpvar_3421.y, tmpvar_3421.z))
    , 0.0)));
    highp vec3 tmpvar_3424;
    tmpvar_3424 = (_upChest_3213 + vec3(0.125, -0.1, 0.0));
    _upArm0L_3206 = tmpvar_3424;
    highp int _uidx1_3425;
    highp int tmpvar_3426;
    if ((tmpvar_3218 == 0)) {
      tmpvar_3426 = 1;
    } else {
      tmpvar_3426 = -1;
    };
    float tmpvar_3427;
    tmpvar_3427 = fract((iTime * 4.0));
    highp int tmpvar_3428;
    tmpvar_3428 = (tmpvar_3217 - 1);
    highp int tmpvar_3429;
    if ((tmpvar_3426 >= 0)) {
      tmpvar_3429 = 0;
    } else {
      tmpvar_3429 = 1;
    };
    highp int tmpvar_3430;
    tmpvar_3430 = (6 + tmpvar_3429);
    _uidx1_3425 = tmpvar_3430;
    if ((tmpvar_3428 < 0)) {
      highp int tmpvar_3431;
      if ((tmpvar_3426 >= 0)) {
        tmpvar_3431 = 1;
      } else {
        tmpvar_3431 = 0;
      };
      _uidx1_3425 = (6 + tmpvar_3431);
    };
    highp int tmpvar_3432;
    if ((tmpvar_3428 < 0)) {
      tmpvar_3432 = 3;
    } else {
      tmpvar_3432 = tmpvar_3428;
    };
    float tmpvar_3433;
    tmpvar_3433 = cos(((
      (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(_uidx1_3425), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_3432), 0.0, 3.0)
      )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(tmpvar_3430), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_3217), 0.0, 3.0)
      )], tmpvar_3427))
     * 3.141593) / 180.0));
    highp int _uidx1_3434;
    highp int tmpvar_3435;
    if ((tmpvar_3218 == 0)) {
      tmpvar_3435 = 1;
    } else {
      tmpvar_3435 = -1;
    };
    float tmpvar_3436;
    tmpvar_3436 = fract((iTime * 4.0));
    highp int tmpvar_3437;
    tmpvar_3437 = (tmpvar_3217 - 1);
    highp int tmpvar_3438;
    if ((tmpvar_3435 >= 0)) {
      tmpvar_3438 = 0;
    } else {
      tmpvar_3438 = 1;
    };
    highp int tmpvar_3439;
    tmpvar_3439 = (6 + tmpvar_3438);
    _uidx1_3434 = tmpvar_3439;
    if ((tmpvar_3437 < 0)) {
      highp int tmpvar_3440;
      if ((tmpvar_3435 >= 0)) {
        tmpvar_3440 = 1;
      } else {
        tmpvar_3440 = 0;
      };
      _uidx1_3434 = (6 + tmpvar_3440);
    };
    highp int tmpvar_3441;
    if ((tmpvar_3437 < 0)) {
      tmpvar_3441 = 3;
    } else {
      tmpvar_3441 = tmpvar_3437;
    };
    float tmpvar_3442;
    tmpvar_3442 = sin(((
      (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(_uidx1_3434), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_3441), 0.0, 3.0)
      )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(tmpvar_3439), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_3217), 0.0, 3.0)
      )], tmpvar_3436))
     * 3.141593) / 180.0));
    highp int _uidx1_3443;
    highp int tmpvar_3444;
    if ((tmpvar_3218 == 0)) {
      tmpvar_3444 = 1;
    } else {
      tmpvar_3444 = -1;
    };
    float tmpvar_3445;
    tmpvar_3445 = fract((iTime * 4.0));
    highp int tmpvar_3446;
    tmpvar_3446 = (tmpvar_3217 - 1);
    highp int tmpvar_3447;
    if ((tmpvar_3444 >= 0)) {
      tmpvar_3447 = 0;
    } else {
      tmpvar_3447 = 1;
    };
    highp int tmpvar_3448;
    tmpvar_3448 = (6 + tmpvar_3447);
    _uidx1_3443 = tmpvar_3448;
    if ((tmpvar_3446 < 0)) {
      highp int tmpvar_3449;
      if ((tmpvar_3444 >= 0)) {
        tmpvar_3449 = 1;
      } else {
        tmpvar_3449 = 0;
      };
      _uidx1_3443 = (6 + tmpvar_3449);
    };
    highp int tmpvar_3450;
    if ((tmpvar_3446 < 0)) {
      tmpvar_3450 = 3;
    } else {
      tmpvar_3450 = tmpvar_3446;
    };
    float tmpvar_3451;
    tmpvar_3451 = sin(((
      (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(_uidx1_3443), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_3450), 0.0, 3.0)
      )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(tmpvar_3448), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_3217), 0.0, 3.0)
      )], tmpvar_3445))
     * 3.141593) / 180.0));
    highp int _uidx1_3452;
    highp int tmpvar_3453;
    if ((tmpvar_3218 == 0)) {
      tmpvar_3453 = 1;
    } else {
      tmpvar_3453 = -1;
    };
    float tmpvar_3454;
    tmpvar_3454 = fract((iTime * 4.0));
    highp int tmpvar_3455;
    tmpvar_3455 = (tmpvar_3217 - 1);
    highp int tmpvar_3456;
    if ((tmpvar_3453 >= 0)) {
      tmpvar_3456 = 0;
    } else {
      tmpvar_3456 = 1;
    };
    highp int tmpvar_3457;
    tmpvar_3457 = (6 + tmpvar_3456);
    _uidx1_3452 = tmpvar_3457;
    if ((tmpvar_3455 < 0)) {
      highp int tmpvar_3458;
      if ((tmpvar_3453 >= 0)) {
        tmpvar_3458 = 1;
      } else {
        tmpvar_3458 = 0;
      };
      _uidx1_3452 = (6 + tmpvar_3458);
    };
    highp int tmpvar_3459;
    if ((tmpvar_3455 < 0)) {
      tmpvar_3459 = 3;
    } else {
      tmpvar_3459 = tmpvar_3455;
    };
    mat2 tmpvar_3460;
    tmpvar_3460[uint(0)].x = tmpvar_3433;
    tmpvar_3460[uint(0)].y = tmpvar_3442;
    tmpvar_3460[1u].x = -(tmpvar_3451);
    tmpvar_3460[1u].y = cos(((
      (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(_uidx1_3452), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_3459), 0.0, 3.0)
      )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(tmpvar_3457), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_3217), 0.0, 3.0)
      )], tmpvar_3454))
     * 3.141593) / 180.0));
    _upArm0L_3206.yz = (tmpvar_3424.yz * tmpvar_3460);
    highp vec3 tmpvar_3461;
    tmpvar_3461 = (abs((_upArm0L_3206 - vec3(0.0, 0.08, 0.0))) - vec3(0.02, 0.08, 0.02));
    highp vec3 tmpvar_3462;
    tmpvar_3462 = max (tmpvar_3461, 0.0);
    highp float tmpvar_3463;
    tmpvar_3463 = min (tmpvar_3423, (sqrt(
      dot (tmpvar_3462, tmpvar_3462)
    ) + min (
      max (tmpvar_3461.x, max (tmpvar_3461.y, tmpvar_3461.z))
    , 0.0)));
    highp vec3 tmpvar_3464;
    tmpvar_3464 = (_upArm0L_3206 + vec3(0.0, -0.16, 0.0));
    _upArm1L_3205 = tmpvar_3464;
    highp int _uidx1_3465;
    highp int tmpvar_3466;
    if ((tmpvar_3218 == 0)) {
      tmpvar_3466 = 1;
    } else {
      tmpvar_3466 = -1;
    };
    float tmpvar_3467;
    tmpvar_3467 = fract((iTime * 4.0));
    highp int tmpvar_3468;
    tmpvar_3468 = (tmpvar_3217 - 1);
    highp int tmpvar_3469;
    if ((tmpvar_3466 >= 0)) {
      tmpvar_3469 = 0;
    } else {
      tmpvar_3469 = 1;
    };
    highp int tmpvar_3470;
    tmpvar_3470 = (8 + tmpvar_3469);
    _uidx1_3465 = tmpvar_3470;
    if ((tmpvar_3468 < 0)) {
      highp int tmpvar_3471;
      if ((tmpvar_3466 >= 0)) {
        tmpvar_3471 = 1;
      } else {
        tmpvar_3471 = 0;
      };
      _uidx1_3465 = (8 + tmpvar_3471);
    };
    highp int tmpvar_3472;
    if ((tmpvar_3468 < 0)) {
      tmpvar_3472 = 3;
    } else {
      tmpvar_3472 = tmpvar_3468;
    };
    float tmpvar_3473;
    tmpvar_3473 = cos(((
      mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(_uidx1_3465)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_3472)
      , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(tmpvar_3470)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_3217)
      , 0.0, 3.0))], tmpvar_3467)
     * 3.141593) / 180.0));
    highp int _uidx1_3474;
    highp int tmpvar_3475;
    if ((tmpvar_3218 == 0)) {
      tmpvar_3475 = 1;
    } else {
      tmpvar_3475 = -1;
    };
    float tmpvar_3476;
    tmpvar_3476 = fract((iTime * 4.0));
    highp int tmpvar_3477;
    tmpvar_3477 = (tmpvar_3217 - 1);
    highp int tmpvar_3478;
    if ((tmpvar_3475 >= 0)) {
      tmpvar_3478 = 0;
    } else {
      tmpvar_3478 = 1;
    };
    highp int tmpvar_3479;
    tmpvar_3479 = (8 + tmpvar_3478);
    _uidx1_3474 = tmpvar_3479;
    if ((tmpvar_3477 < 0)) {
      highp int tmpvar_3480;
      if ((tmpvar_3475 >= 0)) {
        tmpvar_3480 = 1;
      } else {
        tmpvar_3480 = 0;
      };
      _uidx1_3474 = (8 + tmpvar_3480);
    };
    highp int tmpvar_3481;
    if ((tmpvar_3477 < 0)) {
      tmpvar_3481 = 3;
    } else {
      tmpvar_3481 = tmpvar_3477;
    };
    float tmpvar_3482;
    tmpvar_3482 = sin(((
      mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(_uidx1_3474)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_3481)
      , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(tmpvar_3479)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_3217)
      , 0.0, 3.0))], tmpvar_3476)
     * 3.141593) / 180.0));
    highp int _uidx1_3483;
    highp int tmpvar_3484;
    if ((tmpvar_3218 == 0)) {
      tmpvar_3484 = 1;
    } else {
      tmpvar_3484 = -1;
    };
    float tmpvar_3485;
    tmpvar_3485 = fract((iTime * 4.0));
    highp int tmpvar_3486;
    tmpvar_3486 = (tmpvar_3217 - 1);
    highp int tmpvar_3487;
    if ((tmpvar_3484 >= 0)) {
      tmpvar_3487 = 0;
    } else {
      tmpvar_3487 = 1;
    };
    highp int tmpvar_3488;
    tmpvar_3488 = (8 + tmpvar_3487);
    _uidx1_3483 = tmpvar_3488;
    if ((tmpvar_3486 < 0)) {
      highp int tmpvar_3489;
      if ((tmpvar_3484 >= 0)) {
        tmpvar_3489 = 1;
      } else {
        tmpvar_3489 = 0;
      };
      _uidx1_3483 = (8 + tmpvar_3489);
    };
    highp int tmpvar_3490;
    if ((tmpvar_3486 < 0)) {
      tmpvar_3490 = 3;
    } else {
      tmpvar_3490 = tmpvar_3486;
    };
    float tmpvar_3491;
    tmpvar_3491 = sin(((
      mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(_uidx1_3483)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_3490)
      , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(tmpvar_3488)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_3217)
      , 0.0, 3.0))], tmpvar_3485)
     * 3.141593) / 180.0));
    highp int _uidx1_3492;
    highp int tmpvar_3493;
    if ((tmpvar_3218 == 0)) {
      tmpvar_3493 = 1;
    } else {
      tmpvar_3493 = -1;
    };
    float tmpvar_3494;
    tmpvar_3494 = fract((iTime * 4.0));
    highp int tmpvar_3495;
    tmpvar_3495 = (tmpvar_3217 - 1);
    highp int tmpvar_3496;
    if ((tmpvar_3493 >= 0)) {
      tmpvar_3496 = 0;
    } else {
      tmpvar_3496 = 1;
    };
    highp int tmpvar_3497;
    tmpvar_3497 = (8 + tmpvar_3496);
    _uidx1_3492 = tmpvar_3497;
    if ((tmpvar_3495 < 0)) {
      highp int tmpvar_3498;
      if ((tmpvar_3493 >= 0)) {
        tmpvar_3498 = 1;
      } else {
        tmpvar_3498 = 0;
      };
      _uidx1_3492 = (8 + tmpvar_3498);
    };
    highp int tmpvar_3499;
    if ((tmpvar_3495 < 0)) {
      tmpvar_3499 = 3;
    } else {
      tmpvar_3499 = tmpvar_3495;
    };
    mat2 tmpvar_3500;
    tmpvar_3500[uint(0)].x = tmpvar_3473;
    tmpvar_3500[uint(0)].y = tmpvar_3482;
    tmpvar_3500[1u].x = -(tmpvar_3491);
    tmpvar_3500[1u].y = cos(((
      mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(_uidx1_3492)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_3499)
      , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(tmpvar_3497)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_3217)
      , 0.0, 3.0))], tmpvar_3494)
     * 3.141593) / 180.0));
    _upArm1L_3205.yz = (tmpvar_3464.yz * tmpvar_3500);
    highp vec3 tmpvar_3501;
    tmpvar_3501 = (abs((_upArm1L_3205 - vec3(0.0, 0.08, 0.0))) - vec3(0.02, 0.08, 0.02));
    highp vec3 tmpvar_3502;
    tmpvar_3502 = max (tmpvar_3501, 0.0);
    highp float tmpvar_3503;
    tmpvar_3503 = min (tmpvar_3463, (sqrt(
      dot (tmpvar_3502, tmpvar_3502)
    ) + min (
      max (tmpvar_3501.x, max (tmpvar_3501.y, tmpvar_3501.z))
    , 0.0)));
    highp vec3 tmpvar_3504;
    tmpvar_3504 = (_upChest_3213 + vec3(-0.125, -0.1, 0.0));
    _upArm0R_3204 = tmpvar_3504;
    highp int _us_3505;
    _us_3505 = -1;
    highp int _uidx1_3506;
    highp int tmpvar_3507;
    if ((tmpvar_3218 == 0)) {
      tmpvar_3507 = 1;
    } else {
      tmpvar_3507 = -1;
    };
    _us_3505 = -(tmpvar_3507);
    float tmpvar_3508;
    tmpvar_3508 = fract((iTime * 4.0));
    highp int tmpvar_3509;
    tmpvar_3509 = (tmpvar_3217 - 1);
    highp int tmpvar_3510;
    if ((_us_3505 >= 0)) {
      tmpvar_3510 = 0;
    } else {
      tmpvar_3510 = 1;
    };
    highp int tmpvar_3511;
    tmpvar_3511 = (6 + tmpvar_3510);
    _uidx1_3506 = tmpvar_3511;
    if ((tmpvar_3509 < 0)) {
      highp int tmpvar_3512;
      if ((_us_3505 >= 0)) {
        tmpvar_3512 = 1;
      } else {
        tmpvar_3512 = 0;
      };
      _uidx1_3506 = (6 + tmpvar_3512);
    };
    highp int tmpvar_3513;
    if ((tmpvar_3509 < 0)) {
      tmpvar_3513 = 3;
    } else {
      tmpvar_3513 = tmpvar_3509;
    };
    float tmpvar_3514;
    tmpvar_3514 = cos(((
      (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(_uidx1_3506), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_3513), 0.0, 3.0)
      )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(tmpvar_3511), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_3217), 0.0, 3.0)
      )], tmpvar_3508))
     * 3.141593) / 180.0));
    highp int _us_3515;
    _us_3515 = -1;
    highp int _uidx1_3516;
    highp int tmpvar_3517;
    if ((tmpvar_3218 == 0)) {
      tmpvar_3517 = 1;
    } else {
      tmpvar_3517 = -1;
    };
    _us_3515 = -(tmpvar_3517);
    float tmpvar_3518;
    tmpvar_3518 = fract((iTime * 4.0));
    highp int tmpvar_3519;
    tmpvar_3519 = (tmpvar_3217 - 1);
    highp int tmpvar_3520;
    if ((_us_3515 >= 0)) {
      tmpvar_3520 = 0;
    } else {
      tmpvar_3520 = 1;
    };
    highp int tmpvar_3521;
    tmpvar_3521 = (6 + tmpvar_3520);
    _uidx1_3516 = tmpvar_3521;
    if ((tmpvar_3519 < 0)) {
      highp int tmpvar_3522;
      if ((_us_3515 >= 0)) {
        tmpvar_3522 = 1;
      } else {
        tmpvar_3522 = 0;
      };
      _uidx1_3516 = (6 + tmpvar_3522);
    };
    highp int tmpvar_3523;
    if ((tmpvar_3519 < 0)) {
      tmpvar_3523 = 3;
    } else {
      tmpvar_3523 = tmpvar_3519;
    };
    float tmpvar_3524;
    tmpvar_3524 = sin(((
      (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(_uidx1_3516), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_3523), 0.0, 3.0)
      )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(tmpvar_3521), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_3217), 0.0, 3.0)
      )], tmpvar_3518))
     * 3.141593) / 180.0));
    highp int _us_3525;
    _us_3525 = -1;
    highp int _uidx1_3526;
    highp int tmpvar_3527;
    if ((tmpvar_3218 == 0)) {
      tmpvar_3527 = 1;
    } else {
      tmpvar_3527 = -1;
    };
    _us_3525 = -(tmpvar_3527);
    float tmpvar_3528;
    tmpvar_3528 = fract((iTime * 4.0));
    highp int tmpvar_3529;
    tmpvar_3529 = (tmpvar_3217 - 1);
    highp int tmpvar_3530;
    if ((_us_3525 >= 0)) {
      tmpvar_3530 = 0;
    } else {
      tmpvar_3530 = 1;
    };
    highp int tmpvar_3531;
    tmpvar_3531 = (6 + tmpvar_3530);
    _uidx1_3526 = tmpvar_3531;
    if ((tmpvar_3529 < 0)) {
      highp int tmpvar_3532;
      if ((_us_3525 >= 0)) {
        tmpvar_3532 = 1;
      } else {
        tmpvar_3532 = 0;
      };
      _uidx1_3526 = (6 + tmpvar_3532);
    };
    highp int tmpvar_3533;
    if ((tmpvar_3529 < 0)) {
      tmpvar_3533 = 3;
    } else {
      tmpvar_3533 = tmpvar_3529;
    };
    float tmpvar_3534;
    tmpvar_3534 = sin(((
      (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(_uidx1_3526), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_3533), 0.0, 3.0)
      )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(tmpvar_3531), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_3217), 0.0, 3.0)
      )], tmpvar_3528))
     * 3.141593) / 180.0));
    highp int _us_3535;
    _us_3535 = -1;
    highp int _uidx1_3536;
    highp int tmpvar_3537;
    if ((tmpvar_3218 == 0)) {
      tmpvar_3537 = 1;
    } else {
      tmpvar_3537 = -1;
    };
    _us_3535 = -(tmpvar_3537);
    float tmpvar_3538;
    tmpvar_3538 = fract((iTime * 4.0));
    highp int tmpvar_3539;
    tmpvar_3539 = (tmpvar_3217 - 1);
    highp int tmpvar_3540;
    if ((_us_3535 >= 0)) {
      tmpvar_3540 = 0;
    } else {
      tmpvar_3540 = 1;
    };
    highp int tmpvar_3541;
    tmpvar_3541 = (6 + tmpvar_3540);
    _uidx1_3536 = tmpvar_3541;
    if ((tmpvar_3539 < 0)) {
      highp int tmpvar_3542;
      if ((_us_3535 >= 0)) {
        tmpvar_3542 = 1;
      } else {
        tmpvar_3542 = 0;
      };
      _uidx1_3536 = (6 + tmpvar_3542);
    };
    highp int tmpvar_3543;
    if ((tmpvar_3539 < 0)) {
      tmpvar_3543 = 3;
    } else {
      tmpvar_3543 = tmpvar_3539;
    };
    mat2 tmpvar_3544;
    tmpvar_3544[uint(0)].x = tmpvar_3514;
    tmpvar_3544[uint(0)].y = tmpvar_3524;
    tmpvar_3544[1u].x = -(tmpvar_3534);
    tmpvar_3544[1u].y = cos(((
      (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(_uidx1_3536), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_3543), 0.0, 3.0)
      )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
        clamp (float(tmpvar_3541), 0.0, 11.0)
      )][int(
        clamp (float(tmpvar_3217), 0.0, 3.0)
      )], tmpvar_3538))
     * 3.141593) / 180.0));
    _upArm0R_3204.yz = (tmpvar_3504.yz * tmpvar_3544);
    highp vec3 tmpvar_3545;
    tmpvar_3545 = (abs((_upArm0R_3204 - vec3(0.0, 0.08, 0.0))) - vec3(0.02, 0.08, 0.02));
    highp vec3 tmpvar_3546;
    tmpvar_3546 = max (tmpvar_3545, 0.0);
    highp float tmpvar_3547;
    tmpvar_3547 = min (tmpvar_3503, (sqrt(
      dot (tmpvar_3546, tmpvar_3546)
    ) + min (
      max (tmpvar_3545.x, max (tmpvar_3545.y, tmpvar_3545.z))
    , 0.0)));
    highp vec3 tmpvar_3548;
    tmpvar_3548 = (_upArm0R_3204 + vec3(0.0, -0.16, 0.0));
    _upArm1R_3203 = tmpvar_3548;
    highp int _us_3549;
    _us_3549 = -1;
    highp int _uidx1_3550;
    highp int tmpvar_3551;
    if ((tmpvar_3218 == 0)) {
      tmpvar_3551 = 1;
    } else {
      tmpvar_3551 = -1;
    };
    _us_3549 = -(tmpvar_3551);
    float tmpvar_3552;
    tmpvar_3552 = fract((iTime * 4.0));
    highp int tmpvar_3553;
    tmpvar_3553 = (tmpvar_3217 - 1);
    highp int tmpvar_3554;
    if ((_us_3549 >= 0)) {
      tmpvar_3554 = 0;
    } else {
      tmpvar_3554 = 1;
    };
    highp int tmpvar_3555;
    tmpvar_3555 = (8 + tmpvar_3554);
    _uidx1_3550 = tmpvar_3555;
    if ((tmpvar_3553 < 0)) {
      highp int tmpvar_3556;
      if ((_us_3549 >= 0)) {
        tmpvar_3556 = 1;
      } else {
        tmpvar_3556 = 0;
      };
      _uidx1_3550 = (8 + tmpvar_3556);
    };
    highp int tmpvar_3557;
    if ((tmpvar_3553 < 0)) {
      tmpvar_3557 = 3;
    } else {
      tmpvar_3557 = tmpvar_3553;
    };
    float tmpvar_3558;
    tmpvar_3558 = cos(((
      mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(_uidx1_3550)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_3557)
      , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(tmpvar_3555)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_3217)
      , 0.0, 3.0))], tmpvar_3552)
     * 3.141593) / 180.0));
    highp int _us_3559;
    _us_3559 = -1;
    highp int _uidx1_3560;
    highp int tmpvar_3561;
    if ((tmpvar_3218 == 0)) {
      tmpvar_3561 = 1;
    } else {
      tmpvar_3561 = -1;
    };
    _us_3559 = -(tmpvar_3561);
    float tmpvar_3562;
    tmpvar_3562 = fract((iTime * 4.0));
    highp int tmpvar_3563;
    tmpvar_3563 = (tmpvar_3217 - 1);
    highp int tmpvar_3564;
    if ((_us_3559 >= 0)) {
      tmpvar_3564 = 0;
    } else {
      tmpvar_3564 = 1;
    };
    highp int tmpvar_3565;
    tmpvar_3565 = (8 + tmpvar_3564);
    _uidx1_3560 = tmpvar_3565;
    if ((tmpvar_3563 < 0)) {
      highp int tmpvar_3566;
      if ((_us_3559 >= 0)) {
        tmpvar_3566 = 1;
      } else {
        tmpvar_3566 = 0;
      };
      _uidx1_3560 = (8 + tmpvar_3566);
    };
    highp int tmpvar_3567;
    if ((tmpvar_3563 < 0)) {
      tmpvar_3567 = 3;
    } else {
      tmpvar_3567 = tmpvar_3563;
    };
    float tmpvar_3568;
    tmpvar_3568 = sin(((
      mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(_uidx1_3560)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_3567)
      , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(tmpvar_3565)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_3217)
      , 0.0, 3.0))], tmpvar_3562)
     * 3.141593) / 180.0));
    highp int _us_3569;
    _us_3569 = -1;
    highp int _uidx1_3570;
    highp int tmpvar_3571;
    if ((tmpvar_3218 == 0)) {
      tmpvar_3571 = 1;
    } else {
      tmpvar_3571 = -1;
    };
    _us_3569 = -(tmpvar_3571);
    float tmpvar_3572;
    tmpvar_3572 = fract((iTime * 4.0));
    highp int tmpvar_3573;
    tmpvar_3573 = (tmpvar_3217 - 1);
    highp int tmpvar_3574;
    if ((_us_3569 >= 0)) {
      tmpvar_3574 = 0;
    } else {
      tmpvar_3574 = 1;
    };
    highp int tmpvar_3575;
    tmpvar_3575 = (8 + tmpvar_3574);
    _uidx1_3570 = tmpvar_3575;
    if ((tmpvar_3573 < 0)) {
      highp int tmpvar_3576;
      if ((_us_3569 >= 0)) {
        tmpvar_3576 = 1;
      } else {
        tmpvar_3576 = 0;
      };
      _uidx1_3570 = (8 + tmpvar_3576);
    };
    highp int tmpvar_3577;
    if ((tmpvar_3573 < 0)) {
      tmpvar_3577 = 3;
    } else {
      tmpvar_3577 = tmpvar_3573;
    };
    float tmpvar_3578;
    tmpvar_3578 = sin(((
      mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(_uidx1_3570)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_3577)
      , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(tmpvar_3575)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_3217)
      , 0.0, 3.0))], tmpvar_3572)
     * 3.141593) / 180.0));
    highp int _us_3579;
    _us_3579 = -1;
    highp int _uidx1_3580;
    highp int tmpvar_3581;
    if ((tmpvar_3218 == 0)) {
      tmpvar_3581 = 1;
    } else {
      tmpvar_3581 = -1;
    };
    _us_3579 = -(tmpvar_3581);
    float tmpvar_3582;
    tmpvar_3582 = fract((iTime * 4.0));
    highp int tmpvar_3583;
    tmpvar_3583 = (tmpvar_3217 - 1);
    highp int tmpvar_3584;
    if ((_us_3579 >= 0)) {
      tmpvar_3584 = 0;
    } else {
      tmpvar_3584 = 1;
    };
    highp int tmpvar_3585;
    tmpvar_3585 = (8 + tmpvar_3584);
    _uidx1_3580 = tmpvar_3585;
    if ((tmpvar_3583 < 0)) {
      highp int tmpvar_3586;
      if ((_us_3579 >= 0)) {
        tmpvar_3586 = 1;
      } else {
        tmpvar_3586 = 0;
      };
      _uidx1_3580 = (8 + tmpvar_3586);
    };
    highp int tmpvar_3587;
    if ((tmpvar_3583 < 0)) {
      tmpvar_3587 = 3;
    } else {
      tmpvar_3587 = tmpvar_3583;
    };
    mat2 tmpvar_3588;
    tmpvar_3588[uint(0)].x = tmpvar_3558;
    tmpvar_3588[uint(0)].y = tmpvar_3568;
    tmpvar_3588[1u].x = -(tmpvar_3578);
    tmpvar_3588[1u].y = cos(((
      mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(_uidx1_3580)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_3587)
      , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
        float(tmpvar_3585)
      , 0.0, 11.0))][int(clamp (
        float(tmpvar_3217)
      , 0.0, 3.0))], tmpvar_3582)
     * 3.141593) / 180.0));
    _upArm1R_3203.yz = (tmpvar_3548.yz * tmpvar_3588);
    highp vec3 tmpvar_3589;
    tmpvar_3589 = (abs((_upArm1R_3203 - vec3(0.0, 0.08, 0.0))) - vec3(0.02, 0.08, 0.02));
    highp vec3 tmpvar_3590;
    tmpvar_3590 = max (tmpvar_3589, 0.0);
    highp float tmpvar_3591;
    tmpvar_3591 = min (tmpvar_3547, (sqrt(
      dot (tmpvar_3590, tmpvar_3590)
    ) + min (
      max (tmpvar_3589.x, max (tmpvar_3589.y, tmpvar_3589.z))
    , 0.0)));
    highp vec4 tmpvar_3592;
    if ((tmpvar_3591 < tmpvar_3193.x)) {
      highp vec3 _upArm1R_3593;
      highp vec3 _upArm0R_3594;
      highp vec3 _upArm1L_3595;
      highp vec3 _upArm0L_3596;
      highp vec3 _upLeg1R_3597;
      highp vec3 _upLeg0R_3598;
      highp vec3 _upLeg1L_3599;
      highp vec3 _upLeg0L_3600;
      highp vec3 _upHead_3601;
      highp vec3 _upNeck_3602;
      highp vec3 _upChest_3603;
      highp vec3 _upWaist_3604;
      highp vec3 _upPelvis_3605;
      float tmpvar_3606;
      tmpvar_3606 = (iTime * 4.0);
      highp int tmpvar_3607;
      tmpvar_3607 = ((int(tmpvar_3606)% 4));
      highp int tmpvar_3608;
      tmpvar_3608 = ((int((tmpvar_3606 / 4.0))% 2));
      highp int _uidx1_3609;
      highp int tmpvar_3610;
      if ((tmpvar_3608 == 0)) {
        tmpvar_3610 = 1;
      } else {
        tmpvar_3610 = -1;
      };
      float tmpvar_3611;
      tmpvar_3611 = fract((iTime * 4.0));
      highp int tmpvar_3612;
      tmpvar_3612 = (tmpvar_3607 - 1);
      highp int tmpvar_3613;
      if ((tmpvar_3610 >= 0)) {
        tmpvar_3613 = 0;
      } else {
        tmpvar_3613 = 1;
      };
      highp int tmpvar_3614;
      tmpvar_3614 = (10 + tmpvar_3613);
      _uidx1_3609 = tmpvar_3614;
      if ((tmpvar_3612 < 0)) {
        highp int tmpvar_3615;
        if ((tmpvar_3610 >= 0)) {
          tmpvar_3615 = 1;
        } else {
          tmpvar_3615 = 0;
        };
        _uidx1_3609 = (10 + tmpvar_3615);
      };
      highp int tmpvar_3616;
      if ((tmpvar_3612 < 0)) {
        tmpvar_3616 = 3;
      } else {
        tmpvar_3616 = tmpvar_3612;
      };
      float tmpvar_3617;
      tmpvar_3617 = ((mix (
        vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (float(_uidx1_3609), 0.0, 11.0))][int(clamp (float(tmpvar_3616), 0.0, 3.0))]
      , 
        vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (float(tmpvar_3614), 0.0, 11.0))][int(clamp (float(tmpvar_3607), 0.0, 3.0))]
      , tmpvar_3611) * 3.141593) / 180.0);
      highp int _uidx1_3618;
      highp int tmpvar_3619;
      if ((tmpvar_3608 == 0)) {
        tmpvar_3619 = 1;
      } else {
        tmpvar_3619 = -1;
      };
      float tmpvar_3620;
      tmpvar_3620 = fract((iTime * 4.0));
      highp int tmpvar_3621;
      tmpvar_3621 = (tmpvar_3607 - 1);
      highp int tmpvar_3622;
      if ((tmpvar_3619 >= 0)) {
        tmpvar_3622 = 0;
      } else {
        tmpvar_3622 = 1;
      };
      _uidx1_3618 = tmpvar_3622;
      if ((tmpvar_3621 < 0)) {
        highp int tmpvar_3623;
        if ((tmpvar_3619 >= 0)) {
          tmpvar_3623 = 1;
        } else {
          tmpvar_3623 = 0;
        };
        _uidx1_3618 = tmpvar_3623;
      };
      highp int tmpvar_3624;
      if ((tmpvar_3621 < 0)) {
        tmpvar_3624 = 3;
      } else {
        tmpvar_3624 = tmpvar_3621;
      };
      vec3 tmpvar_3625;
      tmpvar_3625.xz = vec2(0.0, 0.0);
      tmpvar_3625.y = (-0.5 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[
        int(clamp (float(_uidx1_3618), 0.0, 11.0))
      ][
        int(clamp (float(tmpvar_3624), 0.0, 3.0))
      ], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[
        int(clamp (float(tmpvar_3622), 0.0, 11.0))
      ][
        int(clamp (float(tmpvar_3607), 0.0, 3.0))
      ], tmpvar_3620));
      highp vec3 tmpvar_3626;
      tmpvar_3626 = (_up_3189 + tmpvar_3625);
      _upPelvis_3605.z = tmpvar_3626.z;
      mat2 tmpvar_3627;
      tmpvar_3627[uint(0)].x = cos(tmpvar_3617);
      tmpvar_3627[uint(0)].y = sin(tmpvar_3617);
      tmpvar_3627[1u].x = -(sin(tmpvar_3617));
      tmpvar_3627[1u].y = cos(tmpvar_3617);
      _upPelvis_3605.xy = (tmpvar_3626.xy * tmpvar_3627);
      highp vec3 tmpvar_3628;
      tmpvar_3628 = (abs((_upPelvis_3605 - vec3(0.0, 0.0, 0.025))) - vec3(0.085, 0.05, 0.05));
      highp vec3 tmpvar_3629;
      tmpvar_3629 = max (tmpvar_3628, 0.0);
      highp vec3 tmpvar_3630;
      tmpvar_3630 = (_upPelvis_3605 + vec3(0.0, -0.05, -0.02));
      _upWaist_3604.z = tmpvar_3630.z;
      mat2 tmpvar_3631;
      tmpvar_3631[uint(0)].x = cos(-(tmpvar_3617));
      tmpvar_3631[uint(0)].y = sin(-(tmpvar_3617));
      tmpvar_3631[1u].x = -(sin(-(tmpvar_3617)));
      tmpvar_3631[1u].y = cos(-(tmpvar_3617));
      _upWaist_3604.xy = (tmpvar_3630.xy * tmpvar_3631);
      _upWaist_3604.yz = (_upWaist_3604.yz * mat2(1.0, 0.0, -0.0, 1.0));
      highp vec3 tmpvar_3632;
      tmpvar_3632 = (abs((_upWaist_3604 - vec3(0.0, 0.04, 0.0))) - vec3(0.075, 0.08, 0.03));
      highp vec3 tmpvar_3633;
      tmpvar_3633 = max (tmpvar_3632, 0.0);
      highp vec3 tmpvar_3634;
      tmpvar_3634 = (_upWaist_3604 + vec3(0.0, -0.14, -0.01));
      _upChest_3603.x = tmpvar_3634.x;
      _upChest_3603.yz = (tmpvar_3634.yz * mat2(1.0, 0.0, -0.0, 1.0));
      highp vec3 tmpvar_3635;
      tmpvar_3635 = (abs((_upChest_3603 - vec3(0.0, 0.04, 0.0))) - vec3(0.09, 0.08, 0.05));
      highp vec3 tmpvar_3636;
      tmpvar_3636 = max (tmpvar_3635, 0.0);
      highp vec3 tmpvar_3637;
      tmpvar_3637 = (_upChest_3603 + vec3(0.0, -0.15, 0.0));
      _upNeck_3602.x = tmpvar_3637.x;
      _upNeck_3602.yz = (tmpvar_3637.yz * mat2(1.0, 0.0, -0.0, 1.0));
      highp vec3 tmpvar_3638;
      tmpvar_3638 = (abs((_upNeck_3602 - vec3(0.0, 0.01, 0.0))) - vec3(0.02, 0.04, 0.02));
      highp vec3 tmpvar_3639;
      tmpvar_3639 = max (tmpvar_3638, 0.0);
      highp vec3 tmpvar_3640;
      tmpvar_3640 = (_upNeck_3602 + vec3(0.0, -0.1, 0.0));
      _upHead_3601.x = tmpvar_3640.x;
      _upHead_3601.yz = (tmpvar_3640.yz * mat2(1.0, 0.0, -0.0, 1.0));
      highp vec3 tmpvar_3641;
      tmpvar_3641 = (abs((_upHead_3601 - vec3(0.0, 0.04, -0.025))) - vec3(0.05, 0.08, 0.06));
      highp vec3 tmpvar_3642;
      tmpvar_3642 = max (tmpvar_3641, 0.0);
      highp float tmpvar_3643;
      tmpvar_3643 = min (min (min (
        min (min (4.5, (sqrt(
          dot (tmpvar_3629, tmpvar_3629)
        ) + min (
          max (tmpvar_3628.x, max (tmpvar_3628.y, tmpvar_3628.z))
        , 0.0))), (sqrt(dot (tmpvar_3633, tmpvar_3633)) + min (max (tmpvar_3632.x, 
          max (tmpvar_3632.y, tmpvar_3632.z)
        ), 0.0)))
      , 
        (sqrt(dot (tmpvar_3636, tmpvar_3636)) + min (max (tmpvar_3635.x, max (tmpvar_3635.y, tmpvar_3635.z)), 0.0))
      ), (
        sqrt(dot (tmpvar_3639, tmpvar_3639))
       + 
        min (max (tmpvar_3638.x, max (tmpvar_3638.y, tmpvar_3638.z)), 0.0)
      )), (sqrt(
        dot (tmpvar_3642, tmpvar_3642)
      ) + min (
        max (tmpvar_3641.x, max (tmpvar_3641.y, tmpvar_3641.z))
      , 0.0)));
      highp vec3 tmpvar_3644;
      tmpvar_3644 = (_upPelvis_3605 + vec3(0.06, 0.025, 0.0));
      _upLeg0L_3600.z = tmpvar_3644.z;
      mat2 tmpvar_3645;
      tmpvar_3645[uint(0)].x = cos(-(tmpvar_3617));
      tmpvar_3645[uint(0)].y = sin(-(tmpvar_3617));
      tmpvar_3645[1u].x = -(sin(-(tmpvar_3617)));
      tmpvar_3645[1u].y = cos(-(tmpvar_3617));
      _upLeg0L_3600.xy = (tmpvar_3644.xy * tmpvar_3645);
      highp int _uidx1_3646;
      highp int tmpvar_3647;
      if ((tmpvar_3608 == 0)) {
        tmpvar_3647 = 1;
      } else {
        tmpvar_3647 = -1;
      };
      float tmpvar_3648;
      tmpvar_3648 = fract((iTime * 4.0));
      highp int tmpvar_3649;
      tmpvar_3649 = (tmpvar_3607 - 1);
      highp int tmpvar_3650;
      if ((tmpvar_3647 >= 0)) {
        tmpvar_3650 = 0;
      } else {
        tmpvar_3650 = 1;
      };
      highp int tmpvar_3651;
      tmpvar_3651 = (2 + tmpvar_3650);
      _uidx1_3646 = tmpvar_3651;
      if ((tmpvar_3649 < 0)) {
        highp int tmpvar_3652;
        if ((tmpvar_3647 >= 0)) {
          tmpvar_3652 = 1;
        } else {
          tmpvar_3652 = 0;
        };
        _uidx1_3646 = (2 + tmpvar_3652);
      };
      highp int tmpvar_3653;
      if ((tmpvar_3649 < 0)) {
        tmpvar_3653 = 3;
      } else {
        tmpvar_3653 = tmpvar_3649;
      };
      float tmpvar_3654;
      tmpvar_3654 = cos(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_3646), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_3653), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_3651), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_3607), 0.0, 3.0)
        )], tmpvar_3648))
       * 3.141593) / 180.0));
      highp int _uidx1_3655;
      highp int tmpvar_3656;
      if ((tmpvar_3608 == 0)) {
        tmpvar_3656 = 1;
      } else {
        tmpvar_3656 = -1;
      };
      float tmpvar_3657;
      tmpvar_3657 = fract((iTime * 4.0));
      highp int tmpvar_3658;
      tmpvar_3658 = (tmpvar_3607 - 1);
      highp int tmpvar_3659;
      if ((tmpvar_3656 >= 0)) {
        tmpvar_3659 = 0;
      } else {
        tmpvar_3659 = 1;
      };
      highp int tmpvar_3660;
      tmpvar_3660 = (2 + tmpvar_3659);
      _uidx1_3655 = tmpvar_3660;
      if ((tmpvar_3658 < 0)) {
        highp int tmpvar_3661;
        if ((tmpvar_3656 >= 0)) {
          tmpvar_3661 = 1;
        } else {
          tmpvar_3661 = 0;
        };
        _uidx1_3655 = (2 + tmpvar_3661);
      };
      highp int tmpvar_3662;
      if ((tmpvar_3658 < 0)) {
        tmpvar_3662 = 3;
      } else {
        tmpvar_3662 = tmpvar_3658;
      };
      float tmpvar_3663;
      tmpvar_3663 = sin(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_3655), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_3662), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_3660), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_3607), 0.0, 3.0)
        )], tmpvar_3657))
       * 3.141593) / 180.0));
      highp int _uidx1_3664;
      highp int tmpvar_3665;
      if ((tmpvar_3608 == 0)) {
        tmpvar_3665 = 1;
      } else {
        tmpvar_3665 = -1;
      };
      float tmpvar_3666;
      tmpvar_3666 = fract((iTime * 4.0));
      highp int tmpvar_3667;
      tmpvar_3667 = (tmpvar_3607 - 1);
      highp int tmpvar_3668;
      if ((tmpvar_3665 >= 0)) {
        tmpvar_3668 = 0;
      } else {
        tmpvar_3668 = 1;
      };
      highp int tmpvar_3669;
      tmpvar_3669 = (2 + tmpvar_3668);
      _uidx1_3664 = tmpvar_3669;
      if ((tmpvar_3667 < 0)) {
        highp int tmpvar_3670;
        if ((tmpvar_3665 >= 0)) {
          tmpvar_3670 = 1;
        } else {
          tmpvar_3670 = 0;
        };
        _uidx1_3664 = (2 + tmpvar_3670);
      };
      highp int tmpvar_3671;
      if ((tmpvar_3667 < 0)) {
        tmpvar_3671 = 3;
      } else {
        tmpvar_3671 = tmpvar_3667;
      };
      float tmpvar_3672;
      tmpvar_3672 = sin(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_3664), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_3671), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_3669), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_3607), 0.0, 3.0)
        )], tmpvar_3666))
       * 3.141593) / 180.0));
      highp int _uidx1_3673;
      highp int tmpvar_3674;
      if ((tmpvar_3608 == 0)) {
        tmpvar_3674 = 1;
      } else {
        tmpvar_3674 = -1;
      };
      float tmpvar_3675;
      tmpvar_3675 = fract((iTime * 4.0));
      highp int tmpvar_3676;
      tmpvar_3676 = (tmpvar_3607 - 1);
      highp int tmpvar_3677;
      if ((tmpvar_3674 >= 0)) {
        tmpvar_3677 = 0;
      } else {
        tmpvar_3677 = 1;
      };
      highp int tmpvar_3678;
      tmpvar_3678 = (2 + tmpvar_3677);
      _uidx1_3673 = tmpvar_3678;
      if ((tmpvar_3676 < 0)) {
        highp int tmpvar_3679;
        if ((tmpvar_3674 >= 0)) {
          tmpvar_3679 = 1;
        } else {
          tmpvar_3679 = 0;
        };
        _uidx1_3673 = (2 + tmpvar_3679);
      };
      highp int tmpvar_3680;
      if ((tmpvar_3676 < 0)) {
        tmpvar_3680 = 3;
      } else {
        tmpvar_3680 = tmpvar_3676;
      };
      mat2 tmpvar_3681;
      tmpvar_3681[uint(0)].x = tmpvar_3654;
      tmpvar_3681[uint(0)].y = tmpvar_3663;
      tmpvar_3681[1u].x = -(tmpvar_3672);
      tmpvar_3681[1u].y = cos(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_3673), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_3680), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_3678), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_3607), 0.0, 3.0)
        )], tmpvar_3675))
       * 3.141593) / 180.0));
      _upLeg0L_3600.yz = (_upLeg0L_3600.yz * tmpvar_3681);
      highp vec3 tmpvar_3682;
      tmpvar_3682 = (abs((_upLeg0L_3600 - vec3(0.0, 0.1, 0.0))) - vec3(0.025, 0.1, 0.025));
      highp vec3 tmpvar_3683;
      tmpvar_3683 = max (tmpvar_3682, 0.0);
      highp float tmpvar_3684;
      tmpvar_3684 = min (tmpvar_3643, (sqrt(
        dot (tmpvar_3683, tmpvar_3683)
      ) + min (
        max (tmpvar_3682.x, max (tmpvar_3682.y, tmpvar_3682.z))
      , 0.0)));
      highp vec3 tmpvar_3685;
      tmpvar_3685 = (_upLeg0L_3600 + vec3(0.01, -0.18, 0.02));
      _upLeg1L_3599 = tmpvar_3685;
      highp int _uidx1_3686;
      highp int tmpvar_3687;
      if ((tmpvar_3608 == 0)) {
        tmpvar_3687 = 1;
      } else {
        tmpvar_3687 = -1;
      };
      float tmpvar_3688;
      tmpvar_3688 = fract((iTime * 4.0));
      highp int tmpvar_3689;
      tmpvar_3689 = (tmpvar_3607 - 1);
      highp int tmpvar_3690;
      if ((tmpvar_3687 >= 0)) {
        tmpvar_3690 = 0;
      } else {
        tmpvar_3690 = 1;
      };
      highp int tmpvar_3691;
      tmpvar_3691 = (4 + tmpvar_3690);
      _uidx1_3686 = tmpvar_3691;
      if ((tmpvar_3689 < 0)) {
        highp int tmpvar_3692;
        if ((tmpvar_3687 >= 0)) {
          tmpvar_3692 = 1;
        } else {
          tmpvar_3692 = 0;
        };
        _uidx1_3686 = (4 + tmpvar_3692);
      };
      highp int tmpvar_3693;
      if ((tmpvar_3689 < 0)) {
        tmpvar_3693 = 3;
      } else {
        tmpvar_3693 = tmpvar_3689;
      };
      float tmpvar_3694;
      tmpvar_3694 = cos(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_3686)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_3693)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_3691)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_3607)
        , 0.0, 3.0))], tmpvar_3688)
       * 3.141593) / 180.0));
      highp int _uidx1_3695;
      highp int tmpvar_3696;
      if ((tmpvar_3608 == 0)) {
        tmpvar_3696 = 1;
      } else {
        tmpvar_3696 = -1;
      };
      float tmpvar_3697;
      tmpvar_3697 = fract((iTime * 4.0));
      highp int tmpvar_3698;
      tmpvar_3698 = (tmpvar_3607 - 1);
      highp int tmpvar_3699;
      if ((tmpvar_3696 >= 0)) {
        tmpvar_3699 = 0;
      } else {
        tmpvar_3699 = 1;
      };
      highp int tmpvar_3700;
      tmpvar_3700 = (4 + tmpvar_3699);
      _uidx1_3695 = tmpvar_3700;
      if ((tmpvar_3698 < 0)) {
        highp int tmpvar_3701;
        if ((tmpvar_3696 >= 0)) {
          tmpvar_3701 = 1;
        } else {
          tmpvar_3701 = 0;
        };
        _uidx1_3695 = (4 + tmpvar_3701);
      };
      highp int tmpvar_3702;
      if ((tmpvar_3698 < 0)) {
        tmpvar_3702 = 3;
      } else {
        tmpvar_3702 = tmpvar_3698;
      };
      float tmpvar_3703;
      tmpvar_3703 = sin(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_3695)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_3702)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_3700)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_3607)
        , 0.0, 3.0))], tmpvar_3697)
       * 3.141593) / 180.0));
      highp int _uidx1_3704;
      highp int tmpvar_3705;
      if ((tmpvar_3608 == 0)) {
        tmpvar_3705 = 1;
      } else {
        tmpvar_3705 = -1;
      };
      float tmpvar_3706;
      tmpvar_3706 = fract((iTime * 4.0));
      highp int tmpvar_3707;
      tmpvar_3707 = (tmpvar_3607 - 1);
      highp int tmpvar_3708;
      if ((tmpvar_3705 >= 0)) {
        tmpvar_3708 = 0;
      } else {
        tmpvar_3708 = 1;
      };
      highp int tmpvar_3709;
      tmpvar_3709 = (4 + tmpvar_3708);
      _uidx1_3704 = tmpvar_3709;
      if ((tmpvar_3707 < 0)) {
        highp int tmpvar_3710;
        if ((tmpvar_3705 >= 0)) {
          tmpvar_3710 = 1;
        } else {
          tmpvar_3710 = 0;
        };
        _uidx1_3704 = (4 + tmpvar_3710);
      };
      highp int tmpvar_3711;
      if ((tmpvar_3707 < 0)) {
        tmpvar_3711 = 3;
      } else {
        tmpvar_3711 = tmpvar_3707;
      };
      float tmpvar_3712;
      tmpvar_3712 = sin(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_3704)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_3711)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_3709)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_3607)
        , 0.0, 3.0))], tmpvar_3706)
       * 3.141593) / 180.0));
      highp int _uidx1_3713;
      highp int tmpvar_3714;
      if ((tmpvar_3608 == 0)) {
        tmpvar_3714 = 1;
      } else {
        tmpvar_3714 = -1;
      };
      float tmpvar_3715;
      tmpvar_3715 = fract((iTime * 4.0));
      highp int tmpvar_3716;
      tmpvar_3716 = (tmpvar_3607 - 1);
      highp int tmpvar_3717;
      if ((tmpvar_3714 >= 0)) {
        tmpvar_3717 = 0;
      } else {
        tmpvar_3717 = 1;
      };
      highp int tmpvar_3718;
      tmpvar_3718 = (4 + tmpvar_3717);
      _uidx1_3713 = tmpvar_3718;
      if ((tmpvar_3716 < 0)) {
        highp int tmpvar_3719;
        if ((tmpvar_3714 >= 0)) {
          tmpvar_3719 = 1;
        } else {
          tmpvar_3719 = 0;
        };
        _uidx1_3713 = (4 + tmpvar_3719);
      };
      highp int tmpvar_3720;
      if ((tmpvar_3716 < 0)) {
        tmpvar_3720 = 3;
      } else {
        tmpvar_3720 = tmpvar_3716;
      };
      mat2 tmpvar_3721;
      tmpvar_3721[uint(0)].x = tmpvar_3694;
      tmpvar_3721[uint(0)].y = tmpvar_3703;
      tmpvar_3721[1u].x = -(tmpvar_3712);
      tmpvar_3721[1u].y = cos(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_3713)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_3720)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_3718)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_3607)
        , 0.0, 3.0))], tmpvar_3715)
       * 3.141593) / 180.0));
      _upLeg1L_3599.yz = (tmpvar_3685.yz * tmpvar_3721);
      highp vec3 tmpvar_3722;
      tmpvar_3722 = (abs((_upLeg1L_3599 - vec3(0.0, 0.1, 0.0))) - vec3(0.025, 0.1, 0.025));
      highp vec3 tmpvar_3723;
      tmpvar_3723 = max (tmpvar_3722, 0.0);
      highp float tmpvar_3724;
      tmpvar_3724 = min (tmpvar_3684, (sqrt(
        dot (tmpvar_3723, tmpvar_3723)
      ) + min (
        max (tmpvar_3722.x, max (tmpvar_3722.y, tmpvar_3722.z))
      , 0.0)));
      highp vec3 tmpvar_3725;
      tmpvar_3725 = (_upPelvis_3605 + vec3(-0.06, 0.025, 0.0));
      _upLeg0R_3598.z = tmpvar_3725.z;
      mat2 tmpvar_3726;
      tmpvar_3726[uint(0)].x = cos(-(tmpvar_3617));
      tmpvar_3726[uint(0)].y = sin(-(tmpvar_3617));
      tmpvar_3726[1u].x = -(sin(-(tmpvar_3617)));
      tmpvar_3726[1u].y = cos(-(tmpvar_3617));
      _upLeg0R_3598.xy = (tmpvar_3725.xy * tmpvar_3726);
      highp int _us_3727;
      _us_3727 = -1;
      highp int _uidx1_3728;
      highp int tmpvar_3729;
      if ((tmpvar_3608 == 0)) {
        tmpvar_3729 = 1;
      } else {
        tmpvar_3729 = -1;
      };
      _us_3727 = -(tmpvar_3729);
      float tmpvar_3730;
      tmpvar_3730 = fract((iTime * 4.0));
      highp int tmpvar_3731;
      tmpvar_3731 = (tmpvar_3607 - 1);
      highp int tmpvar_3732;
      if ((_us_3727 >= 0)) {
        tmpvar_3732 = 0;
      } else {
        tmpvar_3732 = 1;
      };
      highp int tmpvar_3733;
      tmpvar_3733 = (2 + tmpvar_3732);
      _uidx1_3728 = tmpvar_3733;
      if ((tmpvar_3731 < 0)) {
        highp int tmpvar_3734;
        if ((_us_3727 >= 0)) {
          tmpvar_3734 = 1;
        } else {
          tmpvar_3734 = 0;
        };
        _uidx1_3728 = (2 + tmpvar_3734);
      };
      highp int tmpvar_3735;
      if ((tmpvar_3731 < 0)) {
        tmpvar_3735 = 3;
      } else {
        tmpvar_3735 = tmpvar_3731;
      };
      float tmpvar_3736;
      tmpvar_3736 = cos(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_3728), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_3735), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_3733), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_3607), 0.0, 3.0)
        )], tmpvar_3730))
       * 3.141593) / 180.0));
      highp int _us_3737;
      _us_3737 = -1;
      highp int _uidx1_3738;
      highp int tmpvar_3739;
      if ((tmpvar_3608 == 0)) {
        tmpvar_3739 = 1;
      } else {
        tmpvar_3739 = -1;
      };
      _us_3737 = -(tmpvar_3739);
      float tmpvar_3740;
      tmpvar_3740 = fract((iTime * 4.0));
      highp int tmpvar_3741;
      tmpvar_3741 = (tmpvar_3607 - 1);
      highp int tmpvar_3742;
      if ((_us_3737 >= 0)) {
        tmpvar_3742 = 0;
      } else {
        tmpvar_3742 = 1;
      };
      highp int tmpvar_3743;
      tmpvar_3743 = (2 + tmpvar_3742);
      _uidx1_3738 = tmpvar_3743;
      if ((tmpvar_3741 < 0)) {
        highp int tmpvar_3744;
        if ((_us_3737 >= 0)) {
          tmpvar_3744 = 1;
        } else {
          tmpvar_3744 = 0;
        };
        _uidx1_3738 = (2 + tmpvar_3744);
      };
      highp int tmpvar_3745;
      if ((tmpvar_3741 < 0)) {
        tmpvar_3745 = 3;
      } else {
        tmpvar_3745 = tmpvar_3741;
      };
      float tmpvar_3746;
      tmpvar_3746 = sin(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_3738), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_3745), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_3743), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_3607), 0.0, 3.0)
        )], tmpvar_3740))
       * 3.141593) / 180.0));
      highp int _us_3747;
      _us_3747 = -1;
      highp int _uidx1_3748;
      highp int tmpvar_3749;
      if ((tmpvar_3608 == 0)) {
        tmpvar_3749 = 1;
      } else {
        tmpvar_3749 = -1;
      };
      _us_3747 = -(tmpvar_3749);
      float tmpvar_3750;
      tmpvar_3750 = fract((iTime * 4.0));
      highp int tmpvar_3751;
      tmpvar_3751 = (tmpvar_3607 - 1);
      highp int tmpvar_3752;
      if ((_us_3747 >= 0)) {
        tmpvar_3752 = 0;
      } else {
        tmpvar_3752 = 1;
      };
      highp int tmpvar_3753;
      tmpvar_3753 = (2 + tmpvar_3752);
      _uidx1_3748 = tmpvar_3753;
      if ((tmpvar_3751 < 0)) {
        highp int tmpvar_3754;
        if ((_us_3747 >= 0)) {
          tmpvar_3754 = 1;
        } else {
          tmpvar_3754 = 0;
        };
        _uidx1_3748 = (2 + tmpvar_3754);
      };
      highp int tmpvar_3755;
      if ((tmpvar_3751 < 0)) {
        tmpvar_3755 = 3;
      } else {
        tmpvar_3755 = tmpvar_3751;
      };
      float tmpvar_3756;
      tmpvar_3756 = sin(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_3748), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_3755), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_3753), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_3607), 0.0, 3.0)
        )], tmpvar_3750))
       * 3.141593) / 180.0));
      highp int _us_3757;
      _us_3757 = -1;
      highp int _uidx1_3758;
      highp int tmpvar_3759;
      if ((tmpvar_3608 == 0)) {
        tmpvar_3759 = 1;
      } else {
        tmpvar_3759 = -1;
      };
      _us_3757 = -(tmpvar_3759);
      float tmpvar_3760;
      tmpvar_3760 = fract((iTime * 4.0));
      highp int tmpvar_3761;
      tmpvar_3761 = (tmpvar_3607 - 1);
      highp int tmpvar_3762;
      if ((_us_3757 >= 0)) {
        tmpvar_3762 = 0;
      } else {
        tmpvar_3762 = 1;
      };
      highp int tmpvar_3763;
      tmpvar_3763 = (2 + tmpvar_3762);
      _uidx1_3758 = tmpvar_3763;
      if ((tmpvar_3761 < 0)) {
        highp int tmpvar_3764;
        if ((_us_3757 >= 0)) {
          tmpvar_3764 = 1;
        } else {
          tmpvar_3764 = 0;
        };
        _uidx1_3758 = (2 + tmpvar_3764);
      };
      highp int tmpvar_3765;
      if ((tmpvar_3761 < 0)) {
        tmpvar_3765 = 3;
      } else {
        tmpvar_3765 = tmpvar_3761;
      };
      mat2 tmpvar_3766;
      tmpvar_3766[uint(0)].x = tmpvar_3736;
      tmpvar_3766[uint(0)].y = tmpvar_3746;
      tmpvar_3766[1u].x = -(tmpvar_3756);
      tmpvar_3766[1u].y = cos(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_3758), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_3765), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_3763), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_3607), 0.0, 3.0)
        )], tmpvar_3760))
       * 3.141593) / 180.0));
      _upLeg0R_3598.yz = (_upLeg0R_3598.yz * tmpvar_3766);
      highp vec3 tmpvar_3767;
      tmpvar_3767 = (abs((_upLeg0R_3598 - vec3(0.0, 0.1, 0.0))) - vec3(0.025, 0.1, 0.025));
      highp vec3 tmpvar_3768;
      tmpvar_3768 = max (tmpvar_3767, 0.0);
      highp float tmpvar_3769;
      tmpvar_3769 = min (tmpvar_3724, (sqrt(
        dot (tmpvar_3768, tmpvar_3768)
      ) + min (
        max (tmpvar_3767.x, max (tmpvar_3767.y, tmpvar_3767.z))
      , 0.0)));
      highp vec3 tmpvar_3770;
      tmpvar_3770 = (_upLeg0R_3598 + vec3(-0.01, -0.18, 0.02));
      _upLeg1R_3597 = tmpvar_3770;
      highp int _us_3771;
      _us_3771 = -1;
      highp int _uidx1_3772;
      highp int tmpvar_3773;
      if ((tmpvar_3608 == 0)) {
        tmpvar_3773 = 1;
      } else {
        tmpvar_3773 = -1;
      };
      _us_3771 = -(tmpvar_3773);
      float tmpvar_3774;
      tmpvar_3774 = fract((iTime * 4.0));
      highp int tmpvar_3775;
      tmpvar_3775 = (tmpvar_3607 - 1);
      highp int tmpvar_3776;
      if ((_us_3771 >= 0)) {
        tmpvar_3776 = 0;
      } else {
        tmpvar_3776 = 1;
      };
      highp int tmpvar_3777;
      tmpvar_3777 = (4 + tmpvar_3776);
      _uidx1_3772 = tmpvar_3777;
      if ((tmpvar_3775 < 0)) {
        highp int tmpvar_3778;
        if ((_us_3771 >= 0)) {
          tmpvar_3778 = 1;
        } else {
          tmpvar_3778 = 0;
        };
        _uidx1_3772 = (4 + tmpvar_3778);
      };
      highp int tmpvar_3779;
      if ((tmpvar_3775 < 0)) {
        tmpvar_3779 = 3;
      } else {
        tmpvar_3779 = tmpvar_3775;
      };
      float tmpvar_3780;
      tmpvar_3780 = cos(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_3772)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_3779)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_3777)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_3607)
        , 0.0, 3.0))], tmpvar_3774)
       * 3.141593) / 180.0));
      highp int _us_3781;
      _us_3781 = -1;
      highp int _uidx1_3782;
      highp int tmpvar_3783;
      if ((tmpvar_3608 == 0)) {
        tmpvar_3783 = 1;
      } else {
        tmpvar_3783 = -1;
      };
      _us_3781 = -(tmpvar_3783);
      float tmpvar_3784;
      tmpvar_3784 = fract((iTime * 4.0));
      highp int tmpvar_3785;
      tmpvar_3785 = (tmpvar_3607 - 1);
      highp int tmpvar_3786;
      if ((_us_3781 >= 0)) {
        tmpvar_3786 = 0;
      } else {
        tmpvar_3786 = 1;
      };
      highp int tmpvar_3787;
      tmpvar_3787 = (4 + tmpvar_3786);
      _uidx1_3782 = tmpvar_3787;
      if ((tmpvar_3785 < 0)) {
        highp int tmpvar_3788;
        if ((_us_3781 >= 0)) {
          tmpvar_3788 = 1;
        } else {
          tmpvar_3788 = 0;
        };
        _uidx1_3782 = (4 + tmpvar_3788);
      };
      highp int tmpvar_3789;
      if ((tmpvar_3785 < 0)) {
        tmpvar_3789 = 3;
      } else {
        tmpvar_3789 = tmpvar_3785;
      };
      float tmpvar_3790;
      tmpvar_3790 = sin(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_3782)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_3789)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_3787)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_3607)
        , 0.0, 3.0))], tmpvar_3784)
       * 3.141593) / 180.0));
      highp int _us_3791;
      _us_3791 = -1;
      highp int _uidx1_3792;
      highp int tmpvar_3793;
      if ((tmpvar_3608 == 0)) {
        tmpvar_3793 = 1;
      } else {
        tmpvar_3793 = -1;
      };
      _us_3791 = -(tmpvar_3793);
      float tmpvar_3794;
      tmpvar_3794 = fract((iTime * 4.0));
      highp int tmpvar_3795;
      tmpvar_3795 = (tmpvar_3607 - 1);
      highp int tmpvar_3796;
      if ((_us_3791 >= 0)) {
        tmpvar_3796 = 0;
      } else {
        tmpvar_3796 = 1;
      };
      highp int tmpvar_3797;
      tmpvar_3797 = (4 + tmpvar_3796);
      _uidx1_3792 = tmpvar_3797;
      if ((tmpvar_3795 < 0)) {
        highp int tmpvar_3798;
        if ((_us_3791 >= 0)) {
          tmpvar_3798 = 1;
        } else {
          tmpvar_3798 = 0;
        };
        _uidx1_3792 = (4 + tmpvar_3798);
      };
      highp int tmpvar_3799;
      if ((tmpvar_3795 < 0)) {
        tmpvar_3799 = 3;
      } else {
        tmpvar_3799 = tmpvar_3795;
      };
      float tmpvar_3800;
      tmpvar_3800 = sin(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_3792)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_3799)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_3797)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_3607)
        , 0.0, 3.0))], tmpvar_3794)
       * 3.141593) / 180.0));
      highp int _us_3801;
      _us_3801 = -1;
      highp int _uidx1_3802;
      highp int tmpvar_3803;
      if ((tmpvar_3608 == 0)) {
        tmpvar_3803 = 1;
      } else {
        tmpvar_3803 = -1;
      };
      _us_3801 = -(tmpvar_3803);
      float tmpvar_3804;
      tmpvar_3804 = fract((iTime * 4.0));
      highp int tmpvar_3805;
      tmpvar_3805 = (tmpvar_3607 - 1);
      highp int tmpvar_3806;
      if ((_us_3801 >= 0)) {
        tmpvar_3806 = 0;
      } else {
        tmpvar_3806 = 1;
      };
      highp int tmpvar_3807;
      tmpvar_3807 = (4 + tmpvar_3806);
      _uidx1_3802 = tmpvar_3807;
      if ((tmpvar_3805 < 0)) {
        highp int tmpvar_3808;
        if ((_us_3801 >= 0)) {
          tmpvar_3808 = 1;
        } else {
          tmpvar_3808 = 0;
        };
        _uidx1_3802 = (4 + tmpvar_3808);
      };
      highp int tmpvar_3809;
      if ((tmpvar_3805 < 0)) {
        tmpvar_3809 = 3;
      } else {
        tmpvar_3809 = tmpvar_3805;
      };
      mat2 tmpvar_3810;
      tmpvar_3810[uint(0)].x = tmpvar_3780;
      tmpvar_3810[uint(0)].y = tmpvar_3790;
      tmpvar_3810[1u].x = -(tmpvar_3800);
      tmpvar_3810[1u].y = cos(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_3802)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_3809)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_3807)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_3607)
        , 0.0, 3.0))], tmpvar_3804)
       * 3.141593) / 180.0));
      _upLeg1R_3597.yz = (tmpvar_3770.yz * tmpvar_3810);
      highp vec3 tmpvar_3811;
      tmpvar_3811 = (abs((_upLeg1R_3597 - vec3(0.0, 0.1, 0.0))) - vec3(0.025, 0.1, 0.025));
      highp vec3 tmpvar_3812;
      tmpvar_3812 = max (tmpvar_3811, 0.0);
      highp float tmpvar_3813;
      tmpvar_3813 = min (tmpvar_3769, (sqrt(
        dot (tmpvar_3812, tmpvar_3812)
      ) + min (
        max (tmpvar_3811.x, max (tmpvar_3811.y, tmpvar_3811.z))
      , 0.0)));
      highp vec3 tmpvar_3814;
      tmpvar_3814 = (_upChest_3603 + vec3(0.125, -0.1, 0.0));
      _upArm0L_3596 = tmpvar_3814;
      highp int _uidx1_3815;
      highp int tmpvar_3816;
      if ((tmpvar_3608 == 0)) {
        tmpvar_3816 = 1;
      } else {
        tmpvar_3816 = -1;
      };
      float tmpvar_3817;
      tmpvar_3817 = fract((iTime * 4.0));
      highp int tmpvar_3818;
      tmpvar_3818 = (tmpvar_3607 - 1);
      highp int tmpvar_3819;
      if ((tmpvar_3816 >= 0)) {
        tmpvar_3819 = 0;
      } else {
        tmpvar_3819 = 1;
      };
      highp int tmpvar_3820;
      tmpvar_3820 = (6 + tmpvar_3819);
      _uidx1_3815 = tmpvar_3820;
      if ((tmpvar_3818 < 0)) {
        highp int tmpvar_3821;
        if ((tmpvar_3816 >= 0)) {
          tmpvar_3821 = 1;
        } else {
          tmpvar_3821 = 0;
        };
        _uidx1_3815 = (6 + tmpvar_3821);
      };
      highp int tmpvar_3822;
      if ((tmpvar_3818 < 0)) {
        tmpvar_3822 = 3;
      } else {
        tmpvar_3822 = tmpvar_3818;
      };
      float tmpvar_3823;
      tmpvar_3823 = cos(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_3815), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_3822), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_3820), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_3607), 0.0, 3.0)
        )], tmpvar_3817))
       * 3.141593) / 180.0));
      highp int _uidx1_3824;
      highp int tmpvar_3825;
      if ((tmpvar_3608 == 0)) {
        tmpvar_3825 = 1;
      } else {
        tmpvar_3825 = -1;
      };
      float tmpvar_3826;
      tmpvar_3826 = fract((iTime * 4.0));
      highp int tmpvar_3827;
      tmpvar_3827 = (tmpvar_3607 - 1);
      highp int tmpvar_3828;
      if ((tmpvar_3825 >= 0)) {
        tmpvar_3828 = 0;
      } else {
        tmpvar_3828 = 1;
      };
      highp int tmpvar_3829;
      tmpvar_3829 = (6 + tmpvar_3828);
      _uidx1_3824 = tmpvar_3829;
      if ((tmpvar_3827 < 0)) {
        highp int tmpvar_3830;
        if ((tmpvar_3825 >= 0)) {
          tmpvar_3830 = 1;
        } else {
          tmpvar_3830 = 0;
        };
        _uidx1_3824 = (6 + tmpvar_3830);
      };
      highp int tmpvar_3831;
      if ((tmpvar_3827 < 0)) {
        tmpvar_3831 = 3;
      } else {
        tmpvar_3831 = tmpvar_3827;
      };
      float tmpvar_3832;
      tmpvar_3832 = sin(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_3824), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_3831), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_3829), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_3607), 0.0, 3.0)
        )], tmpvar_3826))
       * 3.141593) / 180.0));
      highp int _uidx1_3833;
      highp int tmpvar_3834;
      if ((tmpvar_3608 == 0)) {
        tmpvar_3834 = 1;
      } else {
        tmpvar_3834 = -1;
      };
      float tmpvar_3835;
      tmpvar_3835 = fract((iTime * 4.0));
      highp int tmpvar_3836;
      tmpvar_3836 = (tmpvar_3607 - 1);
      highp int tmpvar_3837;
      if ((tmpvar_3834 >= 0)) {
        tmpvar_3837 = 0;
      } else {
        tmpvar_3837 = 1;
      };
      highp int tmpvar_3838;
      tmpvar_3838 = (6 + tmpvar_3837);
      _uidx1_3833 = tmpvar_3838;
      if ((tmpvar_3836 < 0)) {
        highp int tmpvar_3839;
        if ((tmpvar_3834 >= 0)) {
          tmpvar_3839 = 1;
        } else {
          tmpvar_3839 = 0;
        };
        _uidx1_3833 = (6 + tmpvar_3839);
      };
      highp int tmpvar_3840;
      if ((tmpvar_3836 < 0)) {
        tmpvar_3840 = 3;
      } else {
        tmpvar_3840 = tmpvar_3836;
      };
      float tmpvar_3841;
      tmpvar_3841 = sin(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_3833), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_3840), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_3838), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_3607), 0.0, 3.0)
        )], tmpvar_3835))
       * 3.141593) / 180.0));
      highp int _uidx1_3842;
      highp int tmpvar_3843;
      if ((tmpvar_3608 == 0)) {
        tmpvar_3843 = 1;
      } else {
        tmpvar_3843 = -1;
      };
      float tmpvar_3844;
      tmpvar_3844 = fract((iTime * 4.0));
      highp int tmpvar_3845;
      tmpvar_3845 = (tmpvar_3607 - 1);
      highp int tmpvar_3846;
      if ((tmpvar_3843 >= 0)) {
        tmpvar_3846 = 0;
      } else {
        tmpvar_3846 = 1;
      };
      highp int tmpvar_3847;
      tmpvar_3847 = (6 + tmpvar_3846);
      _uidx1_3842 = tmpvar_3847;
      if ((tmpvar_3845 < 0)) {
        highp int tmpvar_3848;
        if ((tmpvar_3843 >= 0)) {
          tmpvar_3848 = 1;
        } else {
          tmpvar_3848 = 0;
        };
        _uidx1_3842 = (6 + tmpvar_3848);
      };
      highp int tmpvar_3849;
      if ((tmpvar_3845 < 0)) {
        tmpvar_3849 = 3;
      } else {
        tmpvar_3849 = tmpvar_3845;
      };
      mat2 tmpvar_3850;
      tmpvar_3850[uint(0)].x = tmpvar_3823;
      tmpvar_3850[uint(0)].y = tmpvar_3832;
      tmpvar_3850[1u].x = -(tmpvar_3841);
      tmpvar_3850[1u].y = cos(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_3842), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_3849), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_3847), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_3607), 0.0, 3.0)
        )], tmpvar_3844))
       * 3.141593) / 180.0));
      _upArm0L_3596.yz = (tmpvar_3814.yz * tmpvar_3850);
      highp vec3 tmpvar_3851;
      tmpvar_3851 = (abs((_upArm0L_3596 - vec3(0.0, 0.08, 0.0))) - vec3(0.02, 0.08, 0.02));
      highp vec3 tmpvar_3852;
      tmpvar_3852 = max (tmpvar_3851, 0.0);
      highp float tmpvar_3853;
      tmpvar_3853 = min (tmpvar_3813, (sqrt(
        dot (tmpvar_3852, tmpvar_3852)
      ) + min (
        max (tmpvar_3851.x, max (tmpvar_3851.y, tmpvar_3851.z))
      , 0.0)));
      highp vec3 tmpvar_3854;
      tmpvar_3854 = (_upArm0L_3596 + vec3(0.0, -0.16, 0.0));
      _upArm1L_3595 = tmpvar_3854;
      highp int _uidx1_3855;
      highp int tmpvar_3856;
      if ((tmpvar_3608 == 0)) {
        tmpvar_3856 = 1;
      } else {
        tmpvar_3856 = -1;
      };
      float tmpvar_3857;
      tmpvar_3857 = fract((iTime * 4.0));
      highp int tmpvar_3858;
      tmpvar_3858 = (tmpvar_3607 - 1);
      highp int tmpvar_3859;
      if ((tmpvar_3856 >= 0)) {
        tmpvar_3859 = 0;
      } else {
        tmpvar_3859 = 1;
      };
      highp int tmpvar_3860;
      tmpvar_3860 = (8 + tmpvar_3859);
      _uidx1_3855 = tmpvar_3860;
      if ((tmpvar_3858 < 0)) {
        highp int tmpvar_3861;
        if ((tmpvar_3856 >= 0)) {
          tmpvar_3861 = 1;
        } else {
          tmpvar_3861 = 0;
        };
        _uidx1_3855 = (8 + tmpvar_3861);
      };
      highp int tmpvar_3862;
      if ((tmpvar_3858 < 0)) {
        tmpvar_3862 = 3;
      } else {
        tmpvar_3862 = tmpvar_3858;
      };
      float tmpvar_3863;
      tmpvar_3863 = cos(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_3855)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_3862)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_3860)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_3607)
        , 0.0, 3.0))], tmpvar_3857)
       * 3.141593) / 180.0));
      highp int _uidx1_3864;
      highp int tmpvar_3865;
      if ((tmpvar_3608 == 0)) {
        tmpvar_3865 = 1;
      } else {
        tmpvar_3865 = -1;
      };
      float tmpvar_3866;
      tmpvar_3866 = fract((iTime * 4.0));
      highp int tmpvar_3867;
      tmpvar_3867 = (tmpvar_3607 - 1);
      highp int tmpvar_3868;
      if ((tmpvar_3865 >= 0)) {
        tmpvar_3868 = 0;
      } else {
        tmpvar_3868 = 1;
      };
      highp int tmpvar_3869;
      tmpvar_3869 = (8 + tmpvar_3868);
      _uidx1_3864 = tmpvar_3869;
      if ((tmpvar_3867 < 0)) {
        highp int tmpvar_3870;
        if ((tmpvar_3865 >= 0)) {
          tmpvar_3870 = 1;
        } else {
          tmpvar_3870 = 0;
        };
        _uidx1_3864 = (8 + tmpvar_3870);
      };
      highp int tmpvar_3871;
      if ((tmpvar_3867 < 0)) {
        tmpvar_3871 = 3;
      } else {
        tmpvar_3871 = tmpvar_3867;
      };
      float tmpvar_3872;
      tmpvar_3872 = sin(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_3864)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_3871)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_3869)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_3607)
        , 0.0, 3.0))], tmpvar_3866)
       * 3.141593) / 180.0));
      highp int _uidx1_3873;
      highp int tmpvar_3874;
      if ((tmpvar_3608 == 0)) {
        tmpvar_3874 = 1;
      } else {
        tmpvar_3874 = -1;
      };
      float tmpvar_3875;
      tmpvar_3875 = fract((iTime * 4.0));
      highp int tmpvar_3876;
      tmpvar_3876 = (tmpvar_3607 - 1);
      highp int tmpvar_3877;
      if ((tmpvar_3874 >= 0)) {
        tmpvar_3877 = 0;
      } else {
        tmpvar_3877 = 1;
      };
      highp int tmpvar_3878;
      tmpvar_3878 = (8 + tmpvar_3877);
      _uidx1_3873 = tmpvar_3878;
      if ((tmpvar_3876 < 0)) {
        highp int tmpvar_3879;
        if ((tmpvar_3874 >= 0)) {
          tmpvar_3879 = 1;
        } else {
          tmpvar_3879 = 0;
        };
        _uidx1_3873 = (8 + tmpvar_3879);
      };
      highp int tmpvar_3880;
      if ((tmpvar_3876 < 0)) {
        tmpvar_3880 = 3;
      } else {
        tmpvar_3880 = tmpvar_3876;
      };
      float tmpvar_3881;
      tmpvar_3881 = sin(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_3873)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_3880)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_3878)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_3607)
        , 0.0, 3.0))], tmpvar_3875)
       * 3.141593) / 180.0));
      highp int _uidx1_3882;
      highp int tmpvar_3883;
      if ((tmpvar_3608 == 0)) {
        tmpvar_3883 = 1;
      } else {
        tmpvar_3883 = -1;
      };
      float tmpvar_3884;
      tmpvar_3884 = fract((iTime * 4.0));
      highp int tmpvar_3885;
      tmpvar_3885 = (tmpvar_3607 - 1);
      highp int tmpvar_3886;
      if ((tmpvar_3883 >= 0)) {
        tmpvar_3886 = 0;
      } else {
        tmpvar_3886 = 1;
      };
      highp int tmpvar_3887;
      tmpvar_3887 = (8 + tmpvar_3886);
      _uidx1_3882 = tmpvar_3887;
      if ((tmpvar_3885 < 0)) {
        highp int tmpvar_3888;
        if ((tmpvar_3883 >= 0)) {
          tmpvar_3888 = 1;
        } else {
          tmpvar_3888 = 0;
        };
        _uidx1_3882 = (8 + tmpvar_3888);
      };
      highp int tmpvar_3889;
      if ((tmpvar_3885 < 0)) {
        tmpvar_3889 = 3;
      } else {
        tmpvar_3889 = tmpvar_3885;
      };
      mat2 tmpvar_3890;
      tmpvar_3890[uint(0)].x = tmpvar_3863;
      tmpvar_3890[uint(0)].y = tmpvar_3872;
      tmpvar_3890[1u].x = -(tmpvar_3881);
      tmpvar_3890[1u].y = cos(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_3882)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_3889)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_3887)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_3607)
        , 0.0, 3.0))], tmpvar_3884)
       * 3.141593) / 180.0));
      _upArm1L_3595.yz = (tmpvar_3854.yz * tmpvar_3890);
      highp vec3 tmpvar_3891;
      tmpvar_3891 = (abs((_upArm1L_3595 - vec3(0.0, 0.08, 0.0))) - vec3(0.02, 0.08, 0.02));
      highp vec3 tmpvar_3892;
      tmpvar_3892 = max (tmpvar_3891, 0.0);
      highp float tmpvar_3893;
      tmpvar_3893 = min (tmpvar_3853, (sqrt(
        dot (tmpvar_3892, tmpvar_3892)
      ) + min (
        max (tmpvar_3891.x, max (tmpvar_3891.y, tmpvar_3891.z))
      , 0.0)));
      highp vec3 tmpvar_3894;
      tmpvar_3894 = (_upChest_3603 + vec3(-0.125, -0.1, 0.0));
      _upArm0R_3594 = tmpvar_3894;
      highp int _us_3895;
      _us_3895 = -1;
      highp int _uidx1_3896;
      highp int tmpvar_3897;
      if ((tmpvar_3608 == 0)) {
        tmpvar_3897 = 1;
      } else {
        tmpvar_3897 = -1;
      };
      _us_3895 = -(tmpvar_3897);
      float tmpvar_3898;
      tmpvar_3898 = fract((iTime * 4.0));
      highp int tmpvar_3899;
      tmpvar_3899 = (tmpvar_3607 - 1);
      highp int tmpvar_3900;
      if ((_us_3895 >= 0)) {
        tmpvar_3900 = 0;
      } else {
        tmpvar_3900 = 1;
      };
      highp int tmpvar_3901;
      tmpvar_3901 = (6 + tmpvar_3900);
      _uidx1_3896 = tmpvar_3901;
      if ((tmpvar_3899 < 0)) {
        highp int tmpvar_3902;
        if ((_us_3895 >= 0)) {
          tmpvar_3902 = 1;
        } else {
          tmpvar_3902 = 0;
        };
        _uidx1_3896 = (6 + tmpvar_3902);
      };
      highp int tmpvar_3903;
      if ((tmpvar_3899 < 0)) {
        tmpvar_3903 = 3;
      } else {
        tmpvar_3903 = tmpvar_3899;
      };
      float tmpvar_3904;
      tmpvar_3904 = cos(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_3896), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_3903), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_3901), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_3607), 0.0, 3.0)
        )], tmpvar_3898))
       * 3.141593) / 180.0));
      highp int _us_3905;
      _us_3905 = -1;
      highp int _uidx1_3906;
      highp int tmpvar_3907;
      if ((tmpvar_3608 == 0)) {
        tmpvar_3907 = 1;
      } else {
        tmpvar_3907 = -1;
      };
      _us_3905 = -(tmpvar_3907);
      float tmpvar_3908;
      tmpvar_3908 = fract((iTime * 4.0));
      highp int tmpvar_3909;
      tmpvar_3909 = (tmpvar_3607 - 1);
      highp int tmpvar_3910;
      if ((_us_3905 >= 0)) {
        tmpvar_3910 = 0;
      } else {
        tmpvar_3910 = 1;
      };
      highp int tmpvar_3911;
      tmpvar_3911 = (6 + tmpvar_3910);
      _uidx1_3906 = tmpvar_3911;
      if ((tmpvar_3909 < 0)) {
        highp int tmpvar_3912;
        if ((_us_3905 >= 0)) {
          tmpvar_3912 = 1;
        } else {
          tmpvar_3912 = 0;
        };
        _uidx1_3906 = (6 + tmpvar_3912);
      };
      highp int tmpvar_3913;
      if ((tmpvar_3909 < 0)) {
        tmpvar_3913 = 3;
      } else {
        tmpvar_3913 = tmpvar_3909;
      };
      float tmpvar_3914;
      tmpvar_3914 = sin(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_3906), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_3913), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_3911), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_3607), 0.0, 3.0)
        )], tmpvar_3908))
       * 3.141593) / 180.0));
      highp int _us_3915;
      _us_3915 = -1;
      highp int _uidx1_3916;
      highp int tmpvar_3917;
      if ((tmpvar_3608 == 0)) {
        tmpvar_3917 = 1;
      } else {
        tmpvar_3917 = -1;
      };
      _us_3915 = -(tmpvar_3917);
      float tmpvar_3918;
      tmpvar_3918 = fract((iTime * 4.0));
      highp int tmpvar_3919;
      tmpvar_3919 = (tmpvar_3607 - 1);
      highp int tmpvar_3920;
      if ((_us_3915 >= 0)) {
        tmpvar_3920 = 0;
      } else {
        tmpvar_3920 = 1;
      };
      highp int tmpvar_3921;
      tmpvar_3921 = (6 + tmpvar_3920);
      _uidx1_3916 = tmpvar_3921;
      if ((tmpvar_3919 < 0)) {
        highp int tmpvar_3922;
        if ((_us_3915 >= 0)) {
          tmpvar_3922 = 1;
        } else {
          tmpvar_3922 = 0;
        };
        _uidx1_3916 = (6 + tmpvar_3922);
      };
      highp int tmpvar_3923;
      if ((tmpvar_3919 < 0)) {
        tmpvar_3923 = 3;
      } else {
        tmpvar_3923 = tmpvar_3919;
      };
      float tmpvar_3924;
      tmpvar_3924 = sin(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_3916), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_3923), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_3921), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_3607), 0.0, 3.0)
        )], tmpvar_3918))
       * 3.141593) / 180.0));
      highp int _us_3925;
      _us_3925 = -1;
      highp int _uidx1_3926;
      highp int tmpvar_3927;
      if ((tmpvar_3608 == 0)) {
        tmpvar_3927 = 1;
      } else {
        tmpvar_3927 = -1;
      };
      _us_3925 = -(tmpvar_3927);
      float tmpvar_3928;
      tmpvar_3928 = fract((iTime * 4.0));
      highp int tmpvar_3929;
      tmpvar_3929 = (tmpvar_3607 - 1);
      highp int tmpvar_3930;
      if ((_us_3925 >= 0)) {
        tmpvar_3930 = 0;
      } else {
        tmpvar_3930 = 1;
      };
      highp int tmpvar_3931;
      tmpvar_3931 = (6 + tmpvar_3930);
      _uidx1_3926 = tmpvar_3931;
      if ((tmpvar_3929 < 0)) {
        highp int tmpvar_3932;
        if ((_us_3925 >= 0)) {
          tmpvar_3932 = 1;
        } else {
          tmpvar_3932 = 0;
        };
        _uidx1_3926 = (6 + tmpvar_3932);
      };
      highp int tmpvar_3933;
      if ((tmpvar_3929 < 0)) {
        tmpvar_3933 = 3;
      } else {
        tmpvar_3933 = tmpvar_3929;
      };
      mat2 tmpvar_3934;
      tmpvar_3934[uint(0)].x = tmpvar_3904;
      tmpvar_3934[uint(0)].y = tmpvar_3914;
      tmpvar_3934[1u].x = -(tmpvar_3924);
      tmpvar_3934[1u].y = cos(((
        (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(_uidx1_3926), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_3933), 0.0, 3.0)
        )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
          clamp (float(tmpvar_3931), 0.0, 11.0)
        )][int(
          clamp (float(tmpvar_3607), 0.0, 3.0)
        )], tmpvar_3928))
       * 3.141593) / 180.0));
      _upArm0R_3594.yz = (tmpvar_3894.yz * tmpvar_3934);
      highp vec3 tmpvar_3935;
      tmpvar_3935 = (abs((_upArm0R_3594 - vec3(0.0, 0.08, 0.0))) - vec3(0.02, 0.08, 0.02));
      highp vec3 tmpvar_3936;
      tmpvar_3936 = max (tmpvar_3935, 0.0);
      highp float tmpvar_3937;
      tmpvar_3937 = min (tmpvar_3893, (sqrt(
        dot (tmpvar_3936, tmpvar_3936)
      ) + min (
        max (tmpvar_3935.x, max (tmpvar_3935.y, tmpvar_3935.z))
      , 0.0)));
      highp vec3 tmpvar_3938;
      tmpvar_3938 = (_upArm0R_3594 + vec3(0.0, -0.16, 0.0));
      _upArm1R_3593 = tmpvar_3938;
      highp int _us_3939;
      _us_3939 = -1;
      highp int _uidx1_3940;
      highp int tmpvar_3941;
      if ((tmpvar_3608 == 0)) {
        tmpvar_3941 = 1;
      } else {
        tmpvar_3941 = -1;
      };
      _us_3939 = -(tmpvar_3941);
      float tmpvar_3942;
      tmpvar_3942 = fract((iTime * 4.0));
      highp int tmpvar_3943;
      tmpvar_3943 = (tmpvar_3607 - 1);
      highp int tmpvar_3944;
      if ((_us_3939 >= 0)) {
        tmpvar_3944 = 0;
      } else {
        tmpvar_3944 = 1;
      };
      highp int tmpvar_3945;
      tmpvar_3945 = (8 + tmpvar_3944);
      _uidx1_3940 = tmpvar_3945;
      if ((tmpvar_3943 < 0)) {
        highp int tmpvar_3946;
        if ((_us_3939 >= 0)) {
          tmpvar_3946 = 1;
        } else {
          tmpvar_3946 = 0;
        };
        _uidx1_3940 = (8 + tmpvar_3946);
      };
      highp int tmpvar_3947;
      if ((tmpvar_3943 < 0)) {
        tmpvar_3947 = 3;
      } else {
        tmpvar_3947 = tmpvar_3943;
      };
      float tmpvar_3948;
      tmpvar_3948 = cos(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_3940)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_3947)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_3945)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_3607)
        , 0.0, 3.0))], tmpvar_3942)
       * 3.141593) / 180.0));
      highp int _us_3949;
      _us_3949 = -1;
      highp int _uidx1_3950;
      highp int tmpvar_3951;
      if ((tmpvar_3608 == 0)) {
        tmpvar_3951 = 1;
      } else {
        tmpvar_3951 = -1;
      };
      _us_3949 = -(tmpvar_3951);
      float tmpvar_3952;
      tmpvar_3952 = fract((iTime * 4.0));
      highp int tmpvar_3953;
      tmpvar_3953 = (tmpvar_3607 - 1);
      highp int tmpvar_3954;
      if ((_us_3949 >= 0)) {
        tmpvar_3954 = 0;
      } else {
        tmpvar_3954 = 1;
      };
      highp int tmpvar_3955;
      tmpvar_3955 = (8 + tmpvar_3954);
      _uidx1_3950 = tmpvar_3955;
      if ((tmpvar_3953 < 0)) {
        highp int tmpvar_3956;
        if ((_us_3949 >= 0)) {
          tmpvar_3956 = 1;
        } else {
          tmpvar_3956 = 0;
        };
        _uidx1_3950 = (8 + tmpvar_3956);
      };
      highp int tmpvar_3957;
      if ((tmpvar_3953 < 0)) {
        tmpvar_3957 = 3;
      } else {
        tmpvar_3957 = tmpvar_3953;
      };
      float tmpvar_3958;
      tmpvar_3958 = sin(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_3950)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_3957)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_3955)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_3607)
        , 0.0, 3.0))], tmpvar_3952)
       * 3.141593) / 180.0));
      highp int _us_3959;
      _us_3959 = -1;
      highp int _uidx1_3960;
      highp int tmpvar_3961;
      if ((tmpvar_3608 == 0)) {
        tmpvar_3961 = 1;
      } else {
        tmpvar_3961 = -1;
      };
      _us_3959 = -(tmpvar_3961);
      float tmpvar_3962;
      tmpvar_3962 = fract((iTime * 4.0));
      highp int tmpvar_3963;
      tmpvar_3963 = (tmpvar_3607 - 1);
      highp int tmpvar_3964;
      if ((_us_3959 >= 0)) {
        tmpvar_3964 = 0;
      } else {
        tmpvar_3964 = 1;
      };
      highp int tmpvar_3965;
      tmpvar_3965 = (8 + tmpvar_3964);
      _uidx1_3960 = tmpvar_3965;
      if ((tmpvar_3963 < 0)) {
        highp int tmpvar_3966;
        if ((_us_3959 >= 0)) {
          tmpvar_3966 = 1;
        } else {
          tmpvar_3966 = 0;
        };
        _uidx1_3960 = (8 + tmpvar_3966);
      };
      highp int tmpvar_3967;
      if ((tmpvar_3963 < 0)) {
        tmpvar_3967 = 3;
      } else {
        tmpvar_3967 = tmpvar_3963;
      };
      float tmpvar_3968;
      tmpvar_3968 = sin(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_3960)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_3967)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_3965)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_3607)
        , 0.0, 3.0))], tmpvar_3962)
       * 3.141593) / 180.0));
      highp int _us_3969;
      _us_3969 = -1;
      highp int _uidx1_3970;
      highp int tmpvar_3971;
      if ((tmpvar_3608 == 0)) {
        tmpvar_3971 = 1;
      } else {
        tmpvar_3971 = -1;
      };
      _us_3969 = -(tmpvar_3971);
      float tmpvar_3972;
      tmpvar_3972 = fract((iTime * 4.0));
      highp int tmpvar_3973;
      tmpvar_3973 = (tmpvar_3607 - 1);
      highp int tmpvar_3974;
      if ((_us_3969 >= 0)) {
        tmpvar_3974 = 0;
      } else {
        tmpvar_3974 = 1;
      };
      highp int tmpvar_3975;
      tmpvar_3975 = (8 + tmpvar_3974);
      _uidx1_3970 = tmpvar_3975;
      if ((tmpvar_3973 < 0)) {
        highp int tmpvar_3976;
        if ((_us_3969 >= 0)) {
          tmpvar_3976 = 1;
        } else {
          tmpvar_3976 = 0;
        };
        _uidx1_3970 = (8 + tmpvar_3976);
      };
      highp int tmpvar_3977;
      if ((tmpvar_3973 < 0)) {
        tmpvar_3977 = 3;
      } else {
        tmpvar_3977 = tmpvar_3973;
      };
      mat2 tmpvar_3978;
      tmpvar_3978[uint(0)].x = tmpvar_3948;
      tmpvar_3978[uint(0)].y = tmpvar_3958;
      tmpvar_3978[1u].x = -(tmpvar_3968);
      tmpvar_3978[1u].y = cos(((
        mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(_uidx1_3970)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_3977)
        , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
          float(tmpvar_3975)
        , 0.0, 11.0))][int(clamp (
          float(tmpvar_3607)
        , 0.0, 3.0))], tmpvar_3972)
       * 3.141593) / 180.0));
      _upArm1R_3593.yz = (tmpvar_3938.yz * tmpvar_3978);
      highp vec3 tmpvar_3979;
      tmpvar_3979 = (abs((_upArm1R_3593 - vec3(0.0, 0.08, 0.0))) - vec3(0.02, 0.08, 0.02));
      highp vec3 tmpvar_3980;
      tmpvar_3980 = max (tmpvar_3979, 0.0);
      highp vec4 tmpvar_3981;
      tmpvar_3981.yzw = vec3(0.2, 0.0, 0.0);
      tmpvar_3981.x = min (tmpvar_3937, (sqrt(
        dot (tmpvar_3980, tmpvar_3980)
      ) + min (
        max (tmpvar_3979.x, max (tmpvar_3979.y, tmpvar_3979.z))
      , 0.0)));
      tmpvar_3592 = tmpvar_3981;
    } else {
      tmpvar_3592 = tmpvar_3193;
    };
    _uhit_3190 = tmpvar_3592;
  };
  highp vec3 tmpvar_3982;
  tmpvar_3982 = normalize(((
    ((vec3(1e-05, -1e-05, -1e-05) * _uhit_811.x) + (vec3(-1e-05, 1e-05, -1e-05) * _uhit_1604.x))
   + 
    (vec3(-1e-05, -1e-05, 1e-05) * _uhit_2397.x)
  ) + (vec3(1e-05, 1e-05, 1e-05) * _uhit_3190.x)));
  _ucol_11 = vec4(0.0, 0.0, 0.0, 0.0);
  if ((_ud_15 < 4.48)) {
    highp float tmpvar_3983;
    tmpvar_3983 = clamp (dot (tmpvar_3982, normalize(
      (vec3(0.0, -100.0, 0.0) - tmpvar_809)
    )), 0.0, 1.0);
    highp float tmpvar_3984;
    tmpvar_3984 = clamp (dot (tmpvar_3982, normalize(
      (vec3(50.0, 100.0, 100.0) - tmpvar_809)
    )), 0.0, 1.0);
    highp float _ushadow_3985;
    highp vec3 tmpvar_3986;
    tmpvar_3986 = normalize((vec3(-50.0, 100.0, -100.0) - tmpvar_809));
    highp float tmpvar_3987;
    tmpvar_3987 = dot (tmpvar_3982, tmpvar_3986);
    _ushadow_3985 = 0.0;
    highp vec3 _uro_3988;
    _uro_3988 = tmpvar_809;
    highp vec3 _urd_3989;
    _urd_3989 = tmpvar_3986;
    highp float _unewD_3990;
    highp float _ud_3991;
    _ud_3991 = 0.0;
    _unewD_3990 = 0.01;
    while (true) {
      if (!(((_unewD_3990 >= 0.01) && (_ud_3991 < 4.5)))) {
        break;
      };
      highp vec3 _up_3992;
      _up_3992 = (_uro_3988 + (_urd_3989 * _ud_3991));
      highp vec4 _uhit_3993;
      _uhit_3993 = vec4(4.5, 0.0, 0.0, 0.0);
      highp float tmpvar_3994;
      highp vec3 _up_3995;
      _up_3995 = (_up_3992 - vec3(0.0, -2.0, 0.0));
      tmpvar_3994 = (sqrt(dot (_up_3995, _up_3995)) - 2.0);
      highp vec4 tmpvar_3996;
      if ((tmpvar_3994 < 4.5)) {
        highp vec3 _up_3997;
        _up_3997 = (_up_3992 - vec3(0.0, -2.0, 0.0));
        highp vec4 tmpvar_3998;
        tmpvar_3998.yzw = vec3(0.1, 0.0, 0.0);
        tmpvar_3998.x = (sqrt(dot (_up_3997, _up_3997)) - 2.0);
        tmpvar_3996 = tmpvar_3998;
      } else {
        tmpvar_3996 = vec4(4.5, 0.0, 0.0, 0.0);
      };
      _uhit_3993 = tmpvar_3996;
      highp float tmpvar_3999;
      highp vec3 tmpvar_4000;
      tmpvar_4000 = (abs((_up_3992 - vec3(0.0, 0.5, 0.0))) - vec3(0.3, 0.5, 0.3));
      highp vec3 tmpvar_4001;
      tmpvar_4001 = max (tmpvar_4000, 0.0);
      tmpvar_3999 = (sqrt(dot (tmpvar_4001, tmpvar_4001)) + min (max (tmpvar_4000.x, 
        max (tmpvar_4000.y, tmpvar_4000.z)
      ), 0.0));
      highp vec4 tmpvar_4002;
      if ((tmpvar_3999 < tmpvar_3996.x)) {
        highp vec3 tmpvar_4003;
        tmpvar_4003 = (abs((_up_3992 - vec3(0.0, 0.5, 0.0))) - vec3(0.3, 0.5, 0.3));
        highp vec3 tmpvar_4004;
        tmpvar_4004 = max (tmpvar_4003, 0.0);
        highp vec4 tmpvar_4005;
        tmpvar_4005.yzw = vec3(-0.1, 0.0, 0.0);
        tmpvar_4005.x = (sqrt(dot (tmpvar_4004, tmpvar_4004)) + min (max (tmpvar_4003.x, 
          max (tmpvar_4003.y, tmpvar_4003.z)
        ), 0.0));
        tmpvar_4002 = tmpvar_4005;
      } else {
        tmpvar_4002 = tmpvar_3996;
      };
      if ((tmpvar_4002.y < 0.0)) {
        highp vec3 _upArm1R_4006;
        highp vec3 _upArm0R_4007;
        highp vec3 _upArm1L_4008;
        highp vec3 _upArm0L_4009;
        highp vec3 _upLeg1R_4010;
        highp vec3 _upLeg0R_4011;
        highp vec3 _upLeg1L_4012;
        highp vec3 _upLeg0L_4013;
        highp vec3 _upHead_4014;
        highp vec3 _upNeck_4015;
        highp vec3 _upChest_4016;
        highp vec3 _upWaist_4017;
        highp vec3 _upPelvis_4018;
        float tmpvar_4019;
        tmpvar_4019 = (iTime * 4.0);
        highp int tmpvar_4020;
        tmpvar_4020 = ((int(tmpvar_4019)% 4));
        highp int tmpvar_4021;
        tmpvar_4021 = ((int((tmpvar_4019 / 4.0))% 2));
        highp int _uidx1_4022;
        highp int tmpvar_4023;
        if ((tmpvar_4021 == 0)) {
          tmpvar_4023 = 1;
        } else {
          tmpvar_4023 = -1;
        };
        float tmpvar_4024;
        tmpvar_4024 = fract((iTime * 4.0));
        highp int tmpvar_4025;
        tmpvar_4025 = (tmpvar_4020 - 1);
        highp int tmpvar_4026;
        if ((tmpvar_4023 >= 0)) {
          tmpvar_4026 = 0;
        } else {
          tmpvar_4026 = 1;
        };
        highp int tmpvar_4027;
        tmpvar_4027 = (10 + tmpvar_4026);
        _uidx1_4022 = tmpvar_4027;
        if ((tmpvar_4025 < 0)) {
          highp int tmpvar_4028;
          if ((tmpvar_4023 >= 0)) {
            tmpvar_4028 = 1;
          } else {
            tmpvar_4028 = 0;
          };
          _uidx1_4022 = (10 + tmpvar_4028);
        };
        highp int tmpvar_4029;
        if ((tmpvar_4025 < 0)) {
          tmpvar_4029 = 3;
        } else {
          tmpvar_4029 = tmpvar_4025;
        };
        float tmpvar_4030;
        tmpvar_4030 = ((mix (
          vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (float(_uidx1_4022), 0.0, 11.0))][int(clamp (float(tmpvar_4029), 0.0, 3.0))]
        , 
          vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (float(tmpvar_4027), 0.0, 11.0))][int(clamp (float(tmpvar_4020), 0.0, 3.0))]
        , tmpvar_4024) * 3.141593) / 180.0);
        highp int _uidx1_4031;
        highp int tmpvar_4032;
        if ((tmpvar_4021 == 0)) {
          tmpvar_4032 = 1;
        } else {
          tmpvar_4032 = -1;
        };
        float tmpvar_4033;
        tmpvar_4033 = fract((iTime * 4.0));
        highp int tmpvar_4034;
        tmpvar_4034 = (tmpvar_4020 - 1);
        highp int tmpvar_4035;
        if ((tmpvar_4032 >= 0)) {
          tmpvar_4035 = 0;
        } else {
          tmpvar_4035 = 1;
        };
        _uidx1_4031 = tmpvar_4035;
        if ((tmpvar_4034 < 0)) {
          highp int tmpvar_4036;
          if ((tmpvar_4032 >= 0)) {
            tmpvar_4036 = 1;
          } else {
            tmpvar_4036 = 0;
          };
          _uidx1_4031 = tmpvar_4036;
        };
        highp int tmpvar_4037;
        if ((tmpvar_4034 < 0)) {
          tmpvar_4037 = 3;
        } else {
          tmpvar_4037 = tmpvar_4034;
        };
        vec3 tmpvar_4038;
        tmpvar_4038.xz = vec2(0.0, 0.0);
        tmpvar_4038.y = (-0.5 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[
          int(clamp (float(_uidx1_4031), 0.0, 11.0))
        ][
          int(clamp (float(tmpvar_4037), 0.0, 3.0))
        ], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[
          int(clamp (float(tmpvar_4035), 0.0, 11.0))
        ][
          int(clamp (float(tmpvar_4020), 0.0, 3.0))
        ], tmpvar_4033));
        highp vec3 tmpvar_4039;
        tmpvar_4039 = (_up_3992 + tmpvar_4038);
        _upPelvis_4018.z = tmpvar_4039.z;
        mat2 tmpvar_4040;
        tmpvar_4040[uint(0)].x = cos(tmpvar_4030);
        tmpvar_4040[uint(0)].y = sin(tmpvar_4030);
        tmpvar_4040[1u].x = -(sin(tmpvar_4030));
        tmpvar_4040[1u].y = cos(tmpvar_4030);
        _upPelvis_4018.xy = (tmpvar_4039.xy * tmpvar_4040);
        highp vec3 tmpvar_4041;
        tmpvar_4041 = (abs((_upPelvis_4018 - vec3(0.0, 0.0, 0.025))) - vec3(0.085, 0.05, 0.05));
        highp vec3 tmpvar_4042;
        tmpvar_4042 = max (tmpvar_4041, 0.0);
        highp vec3 tmpvar_4043;
        tmpvar_4043 = (_upPelvis_4018 + vec3(0.0, -0.05, -0.02));
        _upWaist_4017.z = tmpvar_4043.z;
        mat2 tmpvar_4044;
        tmpvar_4044[uint(0)].x = cos(-(tmpvar_4030));
        tmpvar_4044[uint(0)].y = sin(-(tmpvar_4030));
        tmpvar_4044[1u].x = -(sin(-(tmpvar_4030)));
        tmpvar_4044[1u].y = cos(-(tmpvar_4030));
        _upWaist_4017.xy = (tmpvar_4043.xy * tmpvar_4044);
        _upWaist_4017.yz = (_upWaist_4017.yz * mat2(1.0, 0.0, -0.0, 1.0));
        highp vec3 tmpvar_4045;
        tmpvar_4045 = (abs((_upWaist_4017 - vec3(0.0, 0.04, 0.0))) - vec3(0.075, 0.08, 0.03));
        highp vec3 tmpvar_4046;
        tmpvar_4046 = max (tmpvar_4045, 0.0);
        highp vec3 tmpvar_4047;
        tmpvar_4047 = (_upWaist_4017 + vec3(0.0, -0.14, -0.01));
        _upChest_4016.x = tmpvar_4047.x;
        _upChest_4016.yz = (tmpvar_4047.yz * mat2(1.0, 0.0, -0.0, 1.0));
        highp vec3 tmpvar_4048;
        tmpvar_4048 = (abs((_upChest_4016 - vec3(0.0, 0.04, 0.0))) - vec3(0.09, 0.08, 0.05));
        highp vec3 tmpvar_4049;
        tmpvar_4049 = max (tmpvar_4048, 0.0);
        highp vec3 tmpvar_4050;
        tmpvar_4050 = (_upChest_4016 + vec3(0.0, -0.15, 0.0));
        _upNeck_4015.x = tmpvar_4050.x;
        _upNeck_4015.yz = (tmpvar_4050.yz * mat2(1.0, 0.0, -0.0, 1.0));
        highp vec3 tmpvar_4051;
        tmpvar_4051 = (abs((_upNeck_4015 - vec3(0.0, 0.01, 0.0))) - vec3(0.02, 0.04, 0.02));
        highp vec3 tmpvar_4052;
        tmpvar_4052 = max (tmpvar_4051, 0.0);
        highp vec3 tmpvar_4053;
        tmpvar_4053 = (_upNeck_4015 + vec3(0.0, -0.1, 0.0));
        _upHead_4014.x = tmpvar_4053.x;
        _upHead_4014.yz = (tmpvar_4053.yz * mat2(1.0, 0.0, -0.0, 1.0));
        highp vec3 tmpvar_4054;
        tmpvar_4054 = (abs((_upHead_4014 - vec3(0.0, 0.04, -0.025))) - vec3(0.05, 0.08, 0.06));
        highp vec3 tmpvar_4055;
        tmpvar_4055 = max (tmpvar_4054, 0.0);
        highp float tmpvar_4056;
        tmpvar_4056 = min (min (min (
          min (min (4.5, (sqrt(
            dot (tmpvar_4042, tmpvar_4042)
          ) + min (
            max (tmpvar_4041.x, max (tmpvar_4041.y, tmpvar_4041.z))
          , 0.0))), (sqrt(dot (tmpvar_4046, tmpvar_4046)) + min (max (tmpvar_4045.x, 
            max (tmpvar_4045.y, tmpvar_4045.z)
          ), 0.0)))
        , 
          (sqrt(dot (tmpvar_4049, tmpvar_4049)) + min (max (tmpvar_4048.x, max (tmpvar_4048.y, tmpvar_4048.z)), 0.0))
        ), (
          sqrt(dot (tmpvar_4052, tmpvar_4052))
         + 
          min (max (tmpvar_4051.x, max (tmpvar_4051.y, tmpvar_4051.z)), 0.0)
        )), (sqrt(
          dot (tmpvar_4055, tmpvar_4055)
        ) + min (
          max (tmpvar_4054.x, max (tmpvar_4054.y, tmpvar_4054.z))
        , 0.0)));
        highp vec3 tmpvar_4057;
        tmpvar_4057 = (_upPelvis_4018 + vec3(0.06, 0.025, 0.0));
        _upLeg0L_4013.z = tmpvar_4057.z;
        mat2 tmpvar_4058;
        tmpvar_4058[uint(0)].x = cos(-(tmpvar_4030));
        tmpvar_4058[uint(0)].y = sin(-(tmpvar_4030));
        tmpvar_4058[1u].x = -(sin(-(tmpvar_4030)));
        tmpvar_4058[1u].y = cos(-(tmpvar_4030));
        _upLeg0L_4013.xy = (tmpvar_4057.xy * tmpvar_4058);
        highp int _uidx1_4059;
        highp int tmpvar_4060;
        if ((tmpvar_4021 == 0)) {
          tmpvar_4060 = 1;
        } else {
          tmpvar_4060 = -1;
        };
        float tmpvar_4061;
        tmpvar_4061 = fract((iTime * 4.0));
        highp int tmpvar_4062;
        tmpvar_4062 = (tmpvar_4020 - 1);
        highp int tmpvar_4063;
        if ((tmpvar_4060 >= 0)) {
          tmpvar_4063 = 0;
        } else {
          tmpvar_4063 = 1;
        };
        highp int tmpvar_4064;
        tmpvar_4064 = (2 + tmpvar_4063);
        _uidx1_4059 = tmpvar_4064;
        if ((tmpvar_4062 < 0)) {
          highp int tmpvar_4065;
          if ((tmpvar_4060 >= 0)) {
            tmpvar_4065 = 1;
          } else {
            tmpvar_4065 = 0;
          };
          _uidx1_4059 = (2 + tmpvar_4065);
        };
        highp int tmpvar_4066;
        if ((tmpvar_4062 < 0)) {
          tmpvar_4066 = 3;
        } else {
          tmpvar_4066 = tmpvar_4062;
        };
        float tmpvar_4067;
        tmpvar_4067 = cos(((
          (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
            clamp (float(_uidx1_4059), 0.0, 11.0)
          )][int(
            clamp (float(tmpvar_4066), 0.0, 3.0)
          )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
            clamp (float(tmpvar_4064), 0.0, 11.0)
          )][int(
            clamp (float(tmpvar_4020), 0.0, 3.0)
          )], tmpvar_4061))
         * 3.141593) / 180.0));
        highp int _uidx1_4068;
        highp int tmpvar_4069;
        if ((tmpvar_4021 == 0)) {
          tmpvar_4069 = 1;
        } else {
          tmpvar_4069 = -1;
        };
        float tmpvar_4070;
        tmpvar_4070 = fract((iTime * 4.0));
        highp int tmpvar_4071;
        tmpvar_4071 = (tmpvar_4020 - 1);
        highp int tmpvar_4072;
        if ((tmpvar_4069 >= 0)) {
          tmpvar_4072 = 0;
        } else {
          tmpvar_4072 = 1;
        };
        highp int tmpvar_4073;
        tmpvar_4073 = (2 + tmpvar_4072);
        _uidx1_4068 = tmpvar_4073;
        if ((tmpvar_4071 < 0)) {
          highp int tmpvar_4074;
          if ((tmpvar_4069 >= 0)) {
            tmpvar_4074 = 1;
          } else {
            tmpvar_4074 = 0;
          };
          _uidx1_4068 = (2 + tmpvar_4074);
        };
        highp int tmpvar_4075;
        if ((tmpvar_4071 < 0)) {
          tmpvar_4075 = 3;
        } else {
          tmpvar_4075 = tmpvar_4071;
        };
        float tmpvar_4076;
        tmpvar_4076 = sin(((
          (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
            clamp (float(_uidx1_4068), 0.0, 11.0)
          )][int(
            clamp (float(tmpvar_4075), 0.0, 3.0)
          )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
            clamp (float(tmpvar_4073), 0.0, 11.0)
          )][int(
            clamp (float(tmpvar_4020), 0.0, 3.0)
          )], tmpvar_4070))
         * 3.141593) / 180.0));
        highp int _uidx1_4077;
        highp int tmpvar_4078;
        if ((tmpvar_4021 == 0)) {
          tmpvar_4078 = 1;
        } else {
          tmpvar_4078 = -1;
        };
        float tmpvar_4079;
        tmpvar_4079 = fract((iTime * 4.0));
        highp int tmpvar_4080;
        tmpvar_4080 = (tmpvar_4020 - 1);
        highp int tmpvar_4081;
        if ((tmpvar_4078 >= 0)) {
          tmpvar_4081 = 0;
        } else {
          tmpvar_4081 = 1;
        };
        highp int tmpvar_4082;
        tmpvar_4082 = (2 + tmpvar_4081);
        _uidx1_4077 = tmpvar_4082;
        if ((tmpvar_4080 < 0)) {
          highp int tmpvar_4083;
          if ((tmpvar_4078 >= 0)) {
            tmpvar_4083 = 1;
          } else {
            tmpvar_4083 = 0;
          };
          _uidx1_4077 = (2 + tmpvar_4083);
        };
        highp int tmpvar_4084;
        if ((tmpvar_4080 < 0)) {
          tmpvar_4084 = 3;
        } else {
          tmpvar_4084 = tmpvar_4080;
        };
        float tmpvar_4085;
        tmpvar_4085 = sin(((
          (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
            clamp (float(_uidx1_4077), 0.0, 11.0)
          )][int(
            clamp (float(tmpvar_4084), 0.0, 3.0)
          )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
            clamp (float(tmpvar_4082), 0.0, 11.0)
          )][int(
            clamp (float(tmpvar_4020), 0.0, 3.0)
          )], tmpvar_4079))
         * 3.141593) / 180.0));
        highp int _uidx1_4086;
        highp int tmpvar_4087;
        if ((tmpvar_4021 == 0)) {
          tmpvar_4087 = 1;
        } else {
          tmpvar_4087 = -1;
        };
        float tmpvar_4088;
        tmpvar_4088 = fract((iTime * 4.0));
        highp int tmpvar_4089;
        tmpvar_4089 = (tmpvar_4020 - 1);
        highp int tmpvar_4090;
        if ((tmpvar_4087 >= 0)) {
          tmpvar_4090 = 0;
        } else {
          tmpvar_4090 = 1;
        };
        highp int tmpvar_4091;
        tmpvar_4091 = (2 + tmpvar_4090);
        _uidx1_4086 = tmpvar_4091;
        if ((tmpvar_4089 < 0)) {
          highp int tmpvar_4092;
          if ((tmpvar_4087 >= 0)) {
            tmpvar_4092 = 1;
          } else {
            tmpvar_4092 = 0;
          };
          _uidx1_4086 = (2 + tmpvar_4092);
        };
        highp int tmpvar_4093;
        if ((tmpvar_4089 < 0)) {
          tmpvar_4093 = 3;
        } else {
          tmpvar_4093 = tmpvar_4089;
        };
        mat2 tmpvar_4094;
        tmpvar_4094[uint(0)].x = tmpvar_4067;
        tmpvar_4094[uint(0)].y = tmpvar_4076;
        tmpvar_4094[1u].x = -(tmpvar_4085);
        tmpvar_4094[1u].y = cos(((
          (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
            clamp (float(_uidx1_4086), 0.0, 11.0)
          )][int(
            clamp (float(tmpvar_4093), 0.0, 3.0)
          )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
            clamp (float(tmpvar_4091), 0.0, 11.0)
          )][int(
            clamp (float(tmpvar_4020), 0.0, 3.0)
          )], tmpvar_4088))
         * 3.141593) / 180.0));
        _upLeg0L_4013.yz = (_upLeg0L_4013.yz * tmpvar_4094);
        highp vec3 tmpvar_4095;
        tmpvar_4095 = (abs((_upLeg0L_4013 - vec3(0.0, 0.1, 0.0))) - vec3(0.025, 0.1, 0.025));
        highp vec3 tmpvar_4096;
        tmpvar_4096 = max (tmpvar_4095, 0.0);
        highp float tmpvar_4097;
        tmpvar_4097 = min (tmpvar_4056, (sqrt(
          dot (tmpvar_4096, tmpvar_4096)
        ) + min (
          max (tmpvar_4095.x, max (tmpvar_4095.y, tmpvar_4095.z))
        , 0.0)));
        highp vec3 tmpvar_4098;
        tmpvar_4098 = (_upLeg0L_4013 + vec3(0.01, -0.18, 0.02));
        _upLeg1L_4012 = tmpvar_4098;
        highp int _uidx1_4099;
        highp int tmpvar_4100;
        if ((tmpvar_4021 == 0)) {
          tmpvar_4100 = 1;
        } else {
          tmpvar_4100 = -1;
        };
        float tmpvar_4101;
        tmpvar_4101 = fract((iTime * 4.0));
        highp int tmpvar_4102;
        tmpvar_4102 = (tmpvar_4020 - 1);
        highp int tmpvar_4103;
        if ((tmpvar_4100 >= 0)) {
          tmpvar_4103 = 0;
        } else {
          tmpvar_4103 = 1;
        };
        highp int tmpvar_4104;
        tmpvar_4104 = (4 + tmpvar_4103);
        _uidx1_4099 = tmpvar_4104;
        if ((tmpvar_4102 < 0)) {
          highp int tmpvar_4105;
          if ((tmpvar_4100 >= 0)) {
            tmpvar_4105 = 1;
          } else {
            tmpvar_4105 = 0;
          };
          _uidx1_4099 = (4 + tmpvar_4105);
        };
        highp int tmpvar_4106;
        if ((tmpvar_4102 < 0)) {
          tmpvar_4106 = 3;
        } else {
          tmpvar_4106 = tmpvar_4102;
        };
        float tmpvar_4107;
        tmpvar_4107 = cos(((
          mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
            float(_uidx1_4099)
          , 0.0, 11.0))][int(clamp (
            float(tmpvar_4106)
          , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
            float(tmpvar_4104)
          , 0.0, 11.0))][int(clamp (
            float(tmpvar_4020)
          , 0.0, 3.0))], tmpvar_4101)
         * 3.141593) / 180.0));
        highp int _uidx1_4108;
        highp int tmpvar_4109;
        if ((tmpvar_4021 == 0)) {
          tmpvar_4109 = 1;
        } else {
          tmpvar_4109 = -1;
        };
        float tmpvar_4110;
        tmpvar_4110 = fract((iTime * 4.0));
        highp int tmpvar_4111;
        tmpvar_4111 = (tmpvar_4020 - 1);
        highp int tmpvar_4112;
        if ((tmpvar_4109 >= 0)) {
          tmpvar_4112 = 0;
        } else {
          tmpvar_4112 = 1;
        };
        highp int tmpvar_4113;
        tmpvar_4113 = (4 + tmpvar_4112);
        _uidx1_4108 = tmpvar_4113;
        if ((tmpvar_4111 < 0)) {
          highp int tmpvar_4114;
          if ((tmpvar_4109 >= 0)) {
            tmpvar_4114 = 1;
          } else {
            tmpvar_4114 = 0;
          };
          _uidx1_4108 = (4 + tmpvar_4114);
        };
        highp int tmpvar_4115;
        if ((tmpvar_4111 < 0)) {
          tmpvar_4115 = 3;
        } else {
          tmpvar_4115 = tmpvar_4111;
        };
        float tmpvar_4116;
        tmpvar_4116 = sin(((
          mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
            float(_uidx1_4108)
          , 0.0, 11.0))][int(clamp (
            float(tmpvar_4115)
          , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
            float(tmpvar_4113)
          , 0.0, 11.0))][int(clamp (
            float(tmpvar_4020)
          , 0.0, 3.0))], tmpvar_4110)
         * 3.141593) / 180.0));
        highp int _uidx1_4117;
        highp int tmpvar_4118;
        if ((tmpvar_4021 == 0)) {
          tmpvar_4118 = 1;
        } else {
          tmpvar_4118 = -1;
        };
        float tmpvar_4119;
        tmpvar_4119 = fract((iTime * 4.0));
        highp int tmpvar_4120;
        tmpvar_4120 = (tmpvar_4020 - 1);
        highp int tmpvar_4121;
        if ((tmpvar_4118 >= 0)) {
          tmpvar_4121 = 0;
        } else {
          tmpvar_4121 = 1;
        };
        highp int tmpvar_4122;
        tmpvar_4122 = (4 + tmpvar_4121);
        _uidx1_4117 = tmpvar_4122;
        if ((tmpvar_4120 < 0)) {
          highp int tmpvar_4123;
          if ((tmpvar_4118 >= 0)) {
            tmpvar_4123 = 1;
          } else {
            tmpvar_4123 = 0;
          };
          _uidx1_4117 = (4 + tmpvar_4123);
        };
        highp int tmpvar_4124;
        if ((tmpvar_4120 < 0)) {
          tmpvar_4124 = 3;
        } else {
          tmpvar_4124 = tmpvar_4120;
        };
        float tmpvar_4125;
        tmpvar_4125 = sin(((
          mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
            float(_uidx1_4117)
          , 0.0, 11.0))][int(clamp (
            float(tmpvar_4124)
          , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
            float(tmpvar_4122)
          , 0.0, 11.0))][int(clamp (
            float(tmpvar_4020)
          , 0.0, 3.0))], tmpvar_4119)
         * 3.141593) / 180.0));
        highp int _uidx1_4126;
        highp int tmpvar_4127;
        if ((tmpvar_4021 == 0)) {
          tmpvar_4127 = 1;
        } else {
          tmpvar_4127 = -1;
        };
        float tmpvar_4128;
        tmpvar_4128 = fract((iTime * 4.0));
        highp int tmpvar_4129;
        tmpvar_4129 = (tmpvar_4020 - 1);
        highp int tmpvar_4130;
        if ((tmpvar_4127 >= 0)) {
          tmpvar_4130 = 0;
        } else {
          tmpvar_4130 = 1;
        };
        highp int tmpvar_4131;
        tmpvar_4131 = (4 + tmpvar_4130);
        _uidx1_4126 = tmpvar_4131;
        if ((tmpvar_4129 < 0)) {
          highp int tmpvar_4132;
          if ((tmpvar_4127 >= 0)) {
            tmpvar_4132 = 1;
          } else {
            tmpvar_4132 = 0;
          };
          _uidx1_4126 = (4 + tmpvar_4132);
        };
        highp int tmpvar_4133;
        if ((tmpvar_4129 < 0)) {
          tmpvar_4133 = 3;
        } else {
          tmpvar_4133 = tmpvar_4129;
        };
        mat2 tmpvar_4134;
        tmpvar_4134[uint(0)].x = tmpvar_4107;
        tmpvar_4134[uint(0)].y = tmpvar_4116;
        tmpvar_4134[1u].x = -(tmpvar_4125);
        tmpvar_4134[1u].y = cos(((
          mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
            float(_uidx1_4126)
          , 0.0, 11.0))][int(clamp (
            float(tmpvar_4133)
          , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
            float(tmpvar_4131)
          , 0.0, 11.0))][int(clamp (
            float(tmpvar_4020)
          , 0.0, 3.0))], tmpvar_4128)
         * 3.141593) / 180.0));
        _upLeg1L_4012.yz = (tmpvar_4098.yz * tmpvar_4134);
        highp vec3 tmpvar_4135;
        tmpvar_4135 = (abs((_upLeg1L_4012 - vec3(0.0, 0.1, 0.0))) - vec3(0.025, 0.1, 0.025));
        highp vec3 tmpvar_4136;
        tmpvar_4136 = max (tmpvar_4135, 0.0);
        highp float tmpvar_4137;
        tmpvar_4137 = min (tmpvar_4097, (sqrt(
          dot (tmpvar_4136, tmpvar_4136)
        ) + min (
          max (tmpvar_4135.x, max (tmpvar_4135.y, tmpvar_4135.z))
        , 0.0)));
        highp vec3 tmpvar_4138;
        tmpvar_4138 = (_upPelvis_4018 + vec3(-0.06, 0.025, 0.0));
        _upLeg0R_4011.z = tmpvar_4138.z;
        mat2 tmpvar_4139;
        tmpvar_4139[uint(0)].x = cos(-(tmpvar_4030));
        tmpvar_4139[uint(0)].y = sin(-(tmpvar_4030));
        tmpvar_4139[1u].x = -(sin(-(tmpvar_4030)));
        tmpvar_4139[1u].y = cos(-(tmpvar_4030));
        _upLeg0R_4011.xy = (tmpvar_4138.xy * tmpvar_4139);
        highp int _us_4140;
        _us_4140 = -1;
        highp int _uidx1_4141;
        highp int tmpvar_4142;
        if ((tmpvar_4021 == 0)) {
          tmpvar_4142 = 1;
        } else {
          tmpvar_4142 = -1;
        };
        _us_4140 = -(tmpvar_4142);
        float tmpvar_4143;
        tmpvar_4143 = fract((iTime * 4.0));
        highp int tmpvar_4144;
        tmpvar_4144 = (tmpvar_4020 - 1);
        highp int tmpvar_4145;
        if ((_us_4140 >= 0)) {
          tmpvar_4145 = 0;
        } else {
          tmpvar_4145 = 1;
        };
        highp int tmpvar_4146;
        tmpvar_4146 = (2 + tmpvar_4145);
        _uidx1_4141 = tmpvar_4146;
        if ((tmpvar_4144 < 0)) {
          highp int tmpvar_4147;
          if ((_us_4140 >= 0)) {
            tmpvar_4147 = 1;
          } else {
            tmpvar_4147 = 0;
          };
          _uidx1_4141 = (2 + tmpvar_4147);
        };
        highp int tmpvar_4148;
        if ((tmpvar_4144 < 0)) {
          tmpvar_4148 = 3;
        } else {
          tmpvar_4148 = tmpvar_4144;
        };
        float tmpvar_4149;
        tmpvar_4149 = cos(((
          (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
            clamp (float(_uidx1_4141), 0.0, 11.0)
          )][int(
            clamp (float(tmpvar_4148), 0.0, 3.0)
          )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
            clamp (float(tmpvar_4146), 0.0, 11.0)
          )][int(
            clamp (float(tmpvar_4020), 0.0, 3.0)
          )], tmpvar_4143))
         * 3.141593) / 180.0));
        highp int _us_4150;
        _us_4150 = -1;
        highp int _uidx1_4151;
        highp int tmpvar_4152;
        if ((tmpvar_4021 == 0)) {
          tmpvar_4152 = 1;
        } else {
          tmpvar_4152 = -1;
        };
        _us_4150 = -(tmpvar_4152);
        float tmpvar_4153;
        tmpvar_4153 = fract((iTime * 4.0));
        highp int tmpvar_4154;
        tmpvar_4154 = (tmpvar_4020 - 1);
        highp int tmpvar_4155;
        if ((_us_4150 >= 0)) {
          tmpvar_4155 = 0;
        } else {
          tmpvar_4155 = 1;
        };
        highp int tmpvar_4156;
        tmpvar_4156 = (2 + tmpvar_4155);
        _uidx1_4151 = tmpvar_4156;
        if ((tmpvar_4154 < 0)) {
          highp int tmpvar_4157;
          if ((_us_4150 >= 0)) {
            tmpvar_4157 = 1;
          } else {
            tmpvar_4157 = 0;
          };
          _uidx1_4151 = (2 + tmpvar_4157);
        };
        highp int tmpvar_4158;
        if ((tmpvar_4154 < 0)) {
          tmpvar_4158 = 3;
        } else {
          tmpvar_4158 = tmpvar_4154;
        };
        float tmpvar_4159;
        tmpvar_4159 = sin(((
          (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
            clamp (float(_uidx1_4151), 0.0, 11.0)
          )][int(
            clamp (float(tmpvar_4158), 0.0, 3.0)
          )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
            clamp (float(tmpvar_4156), 0.0, 11.0)
          )][int(
            clamp (float(tmpvar_4020), 0.0, 3.0)
          )], tmpvar_4153))
         * 3.141593) / 180.0));
        highp int _us_4160;
        _us_4160 = -1;
        highp int _uidx1_4161;
        highp int tmpvar_4162;
        if ((tmpvar_4021 == 0)) {
          tmpvar_4162 = 1;
        } else {
          tmpvar_4162 = -1;
        };
        _us_4160 = -(tmpvar_4162);
        float tmpvar_4163;
        tmpvar_4163 = fract((iTime * 4.0));
        highp int tmpvar_4164;
        tmpvar_4164 = (tmpvar_4020 - 1);
        highp int tmpvar_4165;
        if ((_us_4160 >= 0)) {
          tmpvar_4165 = 0;
        } else {
          tmpvar_4165 = 1;
        };
        highp int tmpvar_4166;
        tmpvar_4166 = (2 + tmpvar_4165);
        _uidx1_4161 = tmpvar_4166;
        if ((tmpvar_4164 < 0)) {
          highp int tmpvar_4167;
          if ((_us_4160 >= 0)) {
            tmpvar_4167 = 1;
          } else {
            tmpvar_4167 = 0;
          };
          _uidx1_4161 = (2 + tmpvar_4167);
        };
        highp int tmpvar_4168;
        if ((tmpvar_4164 < 0)) {
          tmpvar_4168 = 3;
        } else {
          tmpvar_4168 = tmpvar_4164;
        };
        float tmpvar_4169;
        tmpvar_4169 = sin(((
          (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
            clamp (float(_uidx1_4161), 0.0, 11.0)
          )][int(
            clamp (float(tmpvar_4168), 0.0, 3.0)
          )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
            clamp (float(tmpvar_4166), 0.0, 11.0)
          )][int(
            clamp (float(tmpvar_4020), 0.0, 3.0)
          )], tmpvar_4163))
         * 3.141593) / 180.0));
        highp int _us_4170;
        _us_4170 = -1;
        highp int _uidx1_4171;
        highp int tmpvar_4172;
        if ((tmpvar_4021 == 0)) {
          tmpvar_4172 = 1;
        } else {
          tmpvar_4172 = -1;
        };
        _us_4170 = -(tmpvar_4172);
        float tmpvar_4173;
        tmpvar_4173 = fract((iTime * 4.0));
        highp int tmpvar_4174;
        tmpvar_4174 = (tmpvar_4020 - 1);
        highp int tmpvar_4175;
        if ((_us_4170 >= 0)) {
          tmpvar_4175 = 0;
        } else {
          tmpvar_4175 = 1;
        };
        highp int tmpvar_4176;
        tmpvar_4176 = (2 + tmpvar_4175);
        _uidx1_4171 = tmpvar_4176;
        if ((tmpvar_4174 < 0)) {
          highp int tmpvar_4177;
          if ((_us_4170 >= 0)) {
            tmpvar_4177 = 1;
          } else {
            tmpvar_4177 = 0;
          };
          _uidx1_4171 = (2 + tmpvar_4177);
        };
        highp int tmpvar_4178;
        if ((tmpvar_4174 < 0)) {
          tmpvar_4178 = 3;
        } else {
          tmpvar_4178 = tmpvar_4174;
        };
        mat2 tmpvar_4179;
        tmpvar_4179[uint(0)].x = tmpvar_4149;
        tmpvar_4179[uint(0)].y = tmpvar_4159;
        tmpvar_4179[1u].x = -(tmpvar_4169);
        tmpvar_4179[1u].y = cos(((
          (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
            clamp (float(_uidx1_4171), 0.0, 11.0)
          )][int(
            clamp (float(tmpvar_4178), 0.0, 3.0)
          )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
            clamp (float(tmpvar_4176), 0.0, 11.0)
          )][int(
            clamp (float(tmpvar_4020), 0.0, 3.0)
          )], tmpvar_4173))
         * 3.141593) / 180.0));
        _upLeg0R_4011.yz = (_upLeg0R_4011.yz * tmpvar_4179);
        highp vec3 tmpvar_4180;
        tmpvar_4180 = (abs((_upLeg0R_4011 - vec3(0.0, 0.1, 0.0))) - vec3(0.025, 0.1, 0.025));
        highp vec3 tmpvar_4181;
        tmpvar_4181 = max (tmpvar_4180, 0.0);
        highp float tmpvar_4182;
        tmpvar_4182 = min (tmpvar_4137, (sqrt(
          dot (tmpvar_4181, tmpvar_4181)
        ) + min (
          max (tmpvar_4180.x, max (tmpvar_4180.y, tmpvar_4180.z))
        , 0.0)));
        highp vec3 tmpvar_4183;
        tmpvar_4183 = (_upLeg0R_4011 + vec3(-0.01, -0.18, 0.02));
        _upLeg1R_4010 = tmpvar_4183;
        highp int _us_4184;
        _us_4184 = -1;
        highp int _uidx1_4185;
        highp int tmpvar_4186;
        if ((tmpvar_4021 == 0)) {
          tmpvar_4186 = 1;
        } else {
          tmpvar_4186 = -1;
        };
        _us_4184 = -(tmpvar_4186);
        float tmpvar_4187;
        tmpvar_4187 = fract((iTime * 4.0));
        highp int tmpvar_4188;
        tmpvar_4188 = (tmpvar_4020 - 1);
        highp int tmpvar_4189;
        if ((_us_4184 >= 0)) {
          tmpvar_4189 = 0;
        } else {
          tmpvar_4189 = 1;
        };
        highp int tmpvar_4190;
        tmpvar_4190 = (4 + tmpvar_4189);
        _uidx1_4185 = tmpvar_4190;
        if ((tmpvar_4188 < 0)) {
          highp int tmpvar_4191;
          if ((_us_4184 >= 0)) {
            tmpvar_4191 = 1;
          } else {
            tmpvar_4191 = 0;
          };
          _uidx1_4185 = (4 + tmpvar_4191);
        };
        highp int tmpvar_4192;
        if ((tmpvar_4188 < 0)) {
          tmpvar_4192 = 3;
        } else {
          tmpvar_4192 = tmpvar_4188;
        };
        float tmpvar_4193;
        tmpvar_4193 = cos(((
          mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
            float(_uidx1_4185)
          , 0.0, 11.0))][int(clamp (
            float(tmpvar_4192)
          , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
            float(tmpvar_4190)
          , 0.0, 11.0))][int(clamp (
            float(tmpvar_4020)
          , 0.0, 3.0))], tmpvar_4187)
         * 3.141593) / 180.0));
        highp int _us_4194;
        _us_4194 = -1;
        highp int _uidx1_4195;
        highp int tmpvar_4196;
        if ((tmpvar_4021 == 0)) {
          tmpvar_4196 = 1;
        } else {
          tmpvar_4196 = -1;
        };
        _us_4194 = -(tmpvar_4196);
        float tmpvar_4197;
        tmpvar_4197 = fract((iTime * 4.0));
        highp int tmpvar_4198;
        tmpvar_4198 = (tmpvar_4020 - 1);
        highp int tmpvar_4199;
        if ((_us_4194 >= 0)) {
          tmpvar_4199 = 0;
        } else {
          tmpvar_4199 = 1;
        };
        highp int tmpvar_4200;
        tmpvar_4200 = (4 + tmpvar_4199);
        _uidx1_4195 = tmpvar_4200;
        if ((tmpvar_4198 < 0)) {
          highp int tmpvar_4201;
          if ((_us_4194 >= 0)) {
            tmpvar_4201 = 1;
          } else {
            tmpvar_4201 = 0;
          };
          _uidx1_4195 = (4 + tmpvar_4201);
        };
        highp int tmpvar_4202;
        if ((tmpvar_4198 < 0)) {
          tmpvar_4202 = 3;
        } else {
          tmpvar_4202 = tmpvar_4198;
        };
        float tmpvar_4203;
        tmpvar_4203 = sin(((
          mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
            float(_uidx1_4195)
          , 0.0, 11.0))][int(clamp (
            float(tmpvar_4202)
          , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
            float(tmpvar_4200)
          , 0.0, 11.0))][int(clamp (
            float(tmpvar_4020)
          , 0.0, 3.0))], tmpvar_4197)
         * 3.141593) / 180.0));
        highp int _us_4204;
        _us_4204 = -1;
        highp int _uidx1_4205;
        highp int tmpvar_4206;
        if ((tmpvar_4021 == 0)) {
          tmpvar_4206 = 1;
        } else {
          tmpvar_4206 = -1;
        };
        _us_4204 = -(tmpvar_4206);
        float tmpvar_4207;
        tmpvar_4207 = fract((iTime * 4.0));
        highp int tmpvar_4208;
        tmpvar_4208 = (tmpvar_4020 - 1);
        highp int tmpvar_4209;
        if ((_us_4204 >= 0)) {
          tmpvar_4209 = 0;
        } else {
          tmpvar_4209 = 1;
        };
        highp int tmpvar_4210;
        tmpvar_4210 = (4 + tmpvar_4209);
        _uidx1_4205 = tmpvar_4210;
        if ((tmpvar_4208 < 0)) {
          highp int tmpvar_4211;
          if ((_us_4204 >= 0)) {
            tmpvar_4211 = 1;
          } else {
            tmpvar_4211 = 0;
          };
          _uidx1_4205 = (4 + tmpvar_4211);
        };
        highp int tmpvar_4212;
        if ((tmpvar_4208 < 0)) {
          tmpvar_4212 = 3;
        } else {
          tmpvar_4212 = tmpvar_4208;
        };
        float tmpvar_4213;
        tmpvar_4213 = sin(((
          mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
            float(_uidx1_4205)
          , 0.0, 11.0))][int(clamp (
            float(tmpvar_4212)
          , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
            float(tmpvar_4210)
          , 0.0, 11.0))][int(clamp (
            float(tmpvar_4020)
          , 0.0, 3.0))], tmpvar_4207)
         * 3.141593) / 180.0));
        highp int _us_4214;
        _us_4214 = -1;
        highp int _uidx1_4215;
        highp int tmpvar_4216;
        if ((tmpvar_4021 == 0)) {
          tmpvar_4216 = 1;
        } else {
          tmpvar_4216 = -1;
        };
        _us_4214 = -(tmpvar_4216);
        float tmpvar_4217;
        tmpvar_4217 = fract((iTime * 4.0));
        highp int tmpvar_4218;
        tmpvar_4218 = (tmpvar_4020 - 1);
        highp int tmpvar_4219;
        if ((_us_4214 >= 0)) {
          tmpvar_4219 = 0;
        } else {
          tmpvar_4219 = 1;
        };
        highp int tmpvar_4220;
        tmpvar_4220 = (4 + tmpvar_4219);
        _uidx1_4215 = tmpvar_4220;
        if ((tmpvar_4218 < 0)) {
          highp int tmpvar_4221;
          if ((_us_4214 >= 0)) {
            tmpvar_4221 = 1;
          } else {
            tmpvar_4221 = 0;
          };
          _uidx1_4215 = (4 + tmpvar_4221);
        };
        highp int tmpvar_4222;
        if ((tmpvar_4218 < 0)) {
          tmpvar_4222 = 3;
        } else {
          tmpvar_4222 = tmpvar_4218;
        };
        mat2 tmpvar_4223;
        tmpvar_4223[uint(0)].x = tmpvar_4193;
        tmpvar_4223[uint(0)].y = tmpvar_4203;
        tmpvar_4223[1u].x = -(tmpvar_4213);
        tmpvar_4223[1u].y = cos(((
          mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
            float(_uidx1_4215)
          , 0.0, 11.0))][int(clamp (
            float(tmpvar_4222)
          , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
            float(tmpvar_4220)
          , 0.0, 11.0))][int(clamp (
            float(tmpvar_4020)
          , 0.0, 3.0))], tmpvar_4217)
         * 3.141593) / 180.0));
        _upLeg1R_4010.yz = (tmpvar_4183.yz * tmpvar_4223);
        highp vec3 tmpvar_4224;
        tmpvar_4224 = (abs((_upLeg1R_4010 - vec3(0.0, 0.1, 0.0))) - vec3(0.025, 0.1, 0.025));
        highp vec3 tmpvar_4225;
        tmpvar_4225 = max (tmpvar_4224, 0.0);
        highp float tmpvar_4226;
        tmpvar_4226 = min (tmpvar_4182, (sqrt(
          dot (tmpvar_4225, tmpvar_4225)
        ) + min (
          max (tmpvar_4224.x, max (tmpvar_4224.y, tmpvar_4224.z))
        , 0.0)));
        highp vec3 tmpvar_4227;
        tmpvar_4227 = (_upChest_4016 + vec3(0.125, -0.1, 0.0));
        _upArm0L_4009 = tmpvar_4227;
        highp int _uidx1_4228;
        highp int tmpvar_4229;
        if ((tmpvar_4021 == 0)) {
          tmpvar_4229 = 1;
        } else {
          tmpvar_4229 = -1;
        };
        float tmpvar_4230;
        tmpvar_4230 = fract((iTime * 4.0));
        highp int tmpvar_4231;
        tmpvar_4231 = (tmpvar_4020 - 1);
        highp int tmpvar_4232;
        if ((tmpvar_4229 >= 0)) {
          tmpvar_4232 = 0;
        } else {
          tmpvar_4232 = 1;
        };
        highp int tmpvar_4233;
        tmpvar_4233 = (6 + tmpvar_4232);
        _uidx1_4228 = tmpvar_4233;
        if ((tmpvar_4231 < 0)) {
          highp int tmpvar_4234;
          if ((tmpvar_4229 >= 0)) {
            tmpvar_4234 = 1;
          } else {
            tmpvar_4234 = 0;
          };
          _uidx1_4228 = (6 + tmpvar_4234);
        };
        highp int tmpvar_4235;
        if ((tmpvar_4231 < 0)) {
          tmpvar_4235 = 3;
        } else {
          tmpvar_4235 = tmpvar_4231;
        };
        float tmpvar_4236;
        tmpvar_4236 = cos(((
          (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
            clamp (float(_uidx1_4228), 0.0, 11.0)
          )][int(
            clamp (float(tmpvar_4235), 0.0, 3.0)
          )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
            clamp (float(tmpvar_4233), 0.0, 11.0)
          )][int(
            clamp (float(tmpvar_4020), 0.0, 3.0)
          )], tmpvar_4230))
         * 3.141593) / 180.0));
        highp int _uidx1_4237;
        highp int tmpvar_4238;
        if ((tmpvar_4021 == 0)) {
          tmpvar_4238 = 1;
        } else {
          tmpvar_4238 = -1;
        };
        float tmpvar_4239;
        tmpvar_4239 = fract((iTime * 4.0));
        highp int tmpvar_4240;
        tmpvar_4240 = (tmpvar_4020 - 1);
        highp int tmpvar_4241;
        if ((tmpvar_4238 >= 0)) {
          tmpvar_4241 = 0;
        } else {
          tmpvar_4241 = 1;
        };
        highp int tmpvar_4242;
        tmpvar_4242 = (6 + tmpvar_4241);
        _uidx1_4237 = tmpvar_4242;
        if ((tmpvar_4240 < 0)) {
          highp int tmpvar_4243;
          if ((tmpvar_4238 >= 0)) {
            tmpvar_4243 = 1;
          } else {
            tmpvar_4243 = 0;
          };
          _uidx1_4237 = (6 + tmpvar_4243);
        };
        highp int tmpvar_4244;
        if ((tmpvar_4240 < 0)) {
          tmpvar_4244 = 3;
        } else {
          tmpvar_4244 = tmpvar_4240;
        };
        float tmpvar_4245;
        tmpvar_4245 = sin(((
          (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
            clamp (float(_uidx1_4237), 0.0, 11.0)
          )][int(
            clamp (float(tmpvar_4244), 0.0, 3.0)
          )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
            clamp (float(tmpvar_4242), 0.0, 11.0)
          )][int(
            clamp (float(tmpvar_4020), 0.0, 3.0)
          )], tmpvar_4239))
         * 3.141593) / 180.0));
        highp int _uidx1_4246;
        highp int tmpvar_4247;
        if ((tmpvar_4021 == 0)) {
          tmpvar_4247 = 1;
        } else {
          tmpvar_4247 = -1;
        };
        float tmpvar_4248;
        tmpvar_4248 = fract((iTime * 4.0));
        highp int tmpvar_4249;
        tmpvar_4249 = (tmpvar_4020 - 1);
        highp int tmpvar_4250;
        if ((tmpvar_4247 >= 0)) {
          tmpvar_4250 = 0;
        } else {
          tmpvar_4250 = 1;
        };
        highp int tmpvar_4251;
        tmpvar_4251 = (6 + tmpvar_4250);
        _uidx1_4246 = tmpvar_4251;
        if ((tmpvar_4249 < 0)) {
          highp int tmpvar_4252;
          if ((tmpvar_4247 >= 0)) {
            tmpvar_4252 = 1;
          } else {
            tmpvar_4252 = 0;
          };
          _uidx1_4246 = (6 + tmpvar_4252);
        };
        highp int tmpvar_4253;
        if ((tmpvar_4249 < 0)) {
          tmpvar_4253 = 3;
        } else {
          tmpvar_4253 = tmpvar_4249;
        };
        float tmpvar_4254;
        tmpvar_4254 = sin(((
          (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
            clamp (float(_uidx1_4246), 0.0, 11.0)
          )][int(
            clamp (float(tmpvar_4253), 0.0, 3.0)
          )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
            clamp (float(tmpvar_4251), 0.0, 11.0)
          )][int(
            clamp (float(tmpvar_4020), 0.0, 3.0)
          )], tmpvar_4248))
         * 3.141593) / 180.0));
        highp int _uidx1_4255;
        highp int tmpvar_4256;
        if ((tmpvar_4021 == 0)) {
          tmpvar_4256 = 1;
        } else {
          tmpvar_4256 = -1;
        };
        float tmpvar_4257;
        tmpvar_4257 = fract((iTime * 4.0));
        highp int tmpvar_4258;
        tmpvar_4258 = (tmpvar_4020 - 1);
        highp int tmpvar_4259;
        if ((tmpvar_4256 >= 0)) {
          tmpvar_4259 = 0;
        } else {
          tmpvar_4259 = 1;
        };
        highp int tmpvar_4260;
        tmpvar_4260 = (6 + tmpvar_4259);
        _uidx1_4255 = tmpvar_4260;
        if ((tmpvar_4258 < 0)) {
          highp int tmpvar_4261;
          if ((tmpvar_4256 >= 0)) {
            tmpvar_4261 = 1;
          } else {
            tmpvar_4261 = 0;
          };
          _uidx1_4255 = (6 + tmpvar_4261);
        };
        highp int tmpvar_4262;
        if ((tmpvar_4258 < 0)) {
          tmpvar_4262 = 3;
        } else {
          tmpvar_4262 = tmpvar_4258;
        };
        mat2 tmpvar_4263;
        tmpvar_4263[uint(0)].x = tmpvar_4236;
        tmpvar_4263[uint(0)].y = tmpvar_4245;
        tmpvar_4263[1u].x = -(tmpvar_4254);
        tmpvar_4263[1u].y = cos(((
          (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
            clamp (float(_uidx1_4255), 0.0, 11.0)
          )][int(
            clamp (float(tmpvar_4262), 0.0, 3.0)
          )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
            clamp (float(tmpvar_4260), 0.0, 11.0)
          )][int(
            clamp (float(tmpvar_4020), 0.0, 3.0)
          )], tmpvar_4257))
         * 3.141593) / 180.0));
        _upArm0L_4009.yz = (tmpvar_4227.yz * tmpvar_4263);
        highp vec3 tmpvar_4264;
        tmpvar_4264 = (abs((_upArm0L_4009 - vec3(0.0, 0.08, 0.0))) - vec3(0.02, 0.08, 0.02));
        highp vec3 tmpvar_4265;
        tmpvar_4265 = max (tmpvar_4264, 0.0);
        highp float tmpvar_4266;
        tmpvar_4266 = min (tmpvar_4226, (sqrt(
          dot (tmpvar_4265, tmpvar_4265)
        ) + min (
          max (tmpvar_4264.x, max (tmpvar_4264.y, tmpvar_4264.z))
        , 0.0)));
        highp vec3 tmpvar_4267;
        tmpvar_4267 = (_upArm0L_4009 + vec3(0.0, -0.16, 0.0));
        _upArm1L_4008 = tmpvar_4267;
        highp int _uidx1_4268;
        highp int tmpvar_4269;
        if ((tmpvar_4021 == 0)) {
          tmpvar_4269 = 1;
        } else {
          tmpvar_4269 = -1;
        };
        float tmpvar_4270;
        tmpvar_4270 = fract((iTime * 4.0));
        highp int tmpvar_4271;
        tmpvar_4271 = (tmpvar_4020 - 1);
        highp int tmpvar_4272;
        if ((tmpvar_4269 >= 0)) {
          tmpvar_4272 = 0;
        } else {
          tmpvar_4272 = 1;
        };
        highp int tmpvar_4273;
        tmpvar_4273 = (8 + tmpvar_4272);
        _uidx1_4268 = tmpvar_4273;
        if ((tmpvar_4271 < 0)) {
          highp int tmpvar_4274;
          if ((tmpvar_4269 >= 0)) {
            tmpvar_4274 = 1;
          } else {
            tmpvar_4274 = 0;
          };
          _uidx1_4268 = (8 + tmpvar_4274);
        };
        highp int tmpvar_4275;
        if ((tmpvar_4271 < 0)) {
          tmpvar_4275 = 3;
        } else {
          tmpvar_4275 = tmpvar_4271;
        };
        float tmpvar_4276;
        tmpvar_4276 = cos(((
          mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
            float(_uidx1_4268)
          , 0.0, 11.0))][int(clamp (
            float(tmpvar_4275)
          , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
            float(tmpvar_4273)
          , 0.0, 11.0))][int(clamp (
            float(tmpvar_4020)
          , 0.0, 3.0))], tmpvar_4270)
         * 3.141593) / 180.0));
        highp int _uidx1_4277;
        highp int tmpvar_4278;
        if ((tmpvar_4021 == 0)) {
          tmpvar_4278 = 1;
        } else {
          tmpvar_4278 = -1;
        };
        float tmpvar_4279;
        tmpvar_4279 = fract((iTime * 4.0));
        highp int tmpvar_4280;
        tmpvar_4280 = (tmpvar_4020 - 1);
        highp int tmpvar_4281;
        if ((tmpvar_4278 >= 0)) {
          tmpvar_4281 = 0;
        } else {
          tmpvar_4281 = 1;
        };
        highp int tmpvar_4282;
        tmpvar_4282 = (8 + tmpvar_4281);
        _uidx1_4277 = tmpvar_4282;
        if ((tmpvar_4280 < 0)) {
          highp int tmpvar_4283;
          if ((tmpvar_4278 >= 0)) {
            tmpvar_4283 = 1;
          } else {
            tmpvar_4283 = 0;
          };
          _uidx1_4277 = (8 + tmpvar_4283);
        };
        highp int tmpvar_4284;
        if ((tmpvar_4280 < 0)) {
          tmpvar_4284 = 3;
        } else {
          tmpvar_4284 = tmpvar_4280;
        };
        float tmpvar_4285;
        tmpvar_4285 = sin(((
          mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
            float(_uidx1_4277)
          , 0.0, 11.0))][int(clamp (
            float(tmpvar_4284)
          , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
            float(tmpvar_4282)
          , 0.0, 11.0))][int(clamp (
            float(tmpvar_4020)
          , 0.0, 3.0))], tmpvar_4279)
         * 3.141593) / 180.0));
        highp int _uidx1_4286;
        highp int tmpvar_4287;
        if ((tmpvar_4021 == 0)) {
          tmpvar_4287 = 1;
        } else {
          tmpvar_4287 = -1;
        };
        float tmpvar_4288;
        tmpvar_4288 = fract((iTime * 4.0));
        highp int tmpvar_4289;
        tmpvar_4289 = (tmpvar_4020 - 1);
        highp int tmpvar_4290;
        if ((tmpvar_4287 >= 0)) {
          tmpvar_4290 = 0;
        } else {
          tmpvar_4290 = 1;
        };
        highp int tmpvar_4291;
        tmpvar_4291 = (8 + tmpvar_4290);
        _uidx1_4286 = tmpvar_4291;
        if ((tmpvar_4289 < 0)) {
          highp int tmpvar_4292;
          if ((tmpvar_4287 >= 0)) {
            tmpvar_4292 = 1;
          } else {
            tmpvar_4292 = 0;
          };
          _uidx1_4286 = (8 + tmpvar_4292);
        };
        highp int tmpvar_4293;
        if ((tmpvar_4289 < 0)) {
          tmpvar_4293 = 3;
        } else {
          tmpvar_4293 = tmpvar_4289;
        };
        float tmpvar_4294;
        tmpvar_4294 = sin(((
          mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
            float(_uidx1_4286)
          , 0.0, 11.0))][int(clamp (
            float(tmpvar_4293)
          , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
            float(tmpvar_4291)
          , 0.0, 11.0))][int(clamp (
            float(tmpvar_4020)
          , 0.0, 3.0))], tmpvar_4288)
         * 3.141593) / 180.0));
        highp int _uidx1_4295;
        highp int tmpvar_4296;
        if ((tmpvar_4021 == 0)) {
          tmpvar_4296 = 1;
        } else {
          tmpvar_4296 = -1;
        };
        float tmpvar_4297;
        tmpvar_4297 = fract((iTime * 4.0));
        highp int tmpvar_4298;
        tmpvar_4298 = (tmpvar_4020 - 1);
        highp int tmpvar_4299;
        if ((tmpvar_4296 >= 0)) {
          tmpvar_4299 = 0;
        } else {
          tmpvar_4299 = 1;
        };
        highp int tmpvar_4300;
        tmpvar_4300 = (8 + tmpvar_4299);
        _uidx1_4295 = tmpvar_4300;
        if ((tmpvar_4298 < 0)) {
          highp int tmpvar_4301;
          if ((tmpvar_4296 >= 0)) {
            tmpvar_4301 = 1;
          } else {
            tmpvar_4301 = 0;
          };
          _uidx1_4295 = (8 + tmpvar_4301);
        };
        highp int tmpvar_4302;
        if ((tmpvar_4298 < 0)) {
          tmpvar_4302 = 3;
        } else {
          tmpvar_4302 = tmpvar_4298;
        };
        mat2 tmpvar_4303;
        tmpvar_4303[uint(0)].x = tmpvar_4276;
        tmpvar_4303[uint(0)].y = tmpvar_4285;
        tmpvar_4303[1u].x = -(tmpvar_4294);
        tmpvar_4303[1u].y = cos(((
          mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
            float(_uidx1_4295)
          , 0.0, 11.0))][int(clamp (
            float(tmpvar_4302)
          , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
            float(tmpvar_4300)
          , 0.0, 11.0))][int(clamp (
            float(tmpvar_4020)
          , 0.0, 3.0))], tmpvar_4297)
         * 3.141593) / 180.0));
        _upArm1L_4008.yz = (tmpvar_4267.yz * tmpvar_4303);
        highp vec3 tmpvar_4304;
        tmpvar_4304 = (abs((_upArm1L_4008 - vec3(0.0, 0.08, 0.0))) - vec3(0.02, 0.08, 0.02));
        highp vec3 tmpvar_4305;
        tmpvar_4305 = max (tmpvar_4304, 0.0);
        highp float tmpvar_4306;
        tmpvar_4306 = min (tmpvar_4266, (sqrt(
          dot (tmpvar_4305, tmpvar_4305)
        ) + min (
          max (tmpvar_4304.x, max (tmpvar_4304.y, tmpvar_4304.z))
        , 0.0)));
        highp vec3 tmpvar_4307;
        tmpvar_4307 = (_upChest_4016 + vec3(-0.125, -0.1, 0.0));
        _upArm0R_4007 = tmpvar_4307;
        highp int _us_4308;
        _us_4308 = -1;
        highp int _uidx1_4309;
        highp int tmpvar_4310;
        if ((tmpvar_4021 == 0)) {
          tmpvar_4310 = 1;
        } else {
          tmpvar_4310 = -1;
        };
        _us_4308 = -(tmpvar_4310);
        float tmpvar_4311;
        tmpvar_4311 = fract((iTime * 4.0));
        highp int tmpvar_4312;
        tmpvar_4312 = (tmpvar_4020 - 1);
        highp int tmpvar_4313;
        if ((_us_4308 >= 0)) {
          tmpvar_4313 = 0;
        } else {
          tmpvar_4313 = 1;
        };
        highp int tmpvar_4314;
        tmpvar_4314 = (6 + tmpvar_4313);
        _uidx1_4309 = tmpvar_4314;
        if ((tmpvar_4312 < 0)) {
          highp int tmpvar_4315;
          if ((_us_4308 >= 0)) {
            tmpvar_4315 = 1;
          } else {
            tmpvar_4315 = 0;
          };
          _uidx1_4309 = (6 + tmpvar_4315);
        };
        highp int tmpvar_4316;
        if ((tmpvar_4312 < 0)) {
          tmpvar_4316 = 3;
        } else {
          tmpvar_4316 = tmpvar_4312;
        };
        float tmpvar_4317;
        tmpvar_4317 = cos(((
          (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
            clamp (float(_uidx1_4309), 0.0, 11.0)
          )][int(
            clamp (float(tmpvar_4316), 0.0, 3.0)
          )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
            clamp (float(tmpvar_4314), 0.0, 11.0)
          )][int(
            clamp (float(tmpvar_4020), 0.0, 3.0)
          )], tmpvar_4311))
         * 3.141593) / 180.0));
        highp int _us_4318;
        _us_4318 = -1;
        highp int _uidx1_4319;
        highp int tmpvar_4320;
        if ((tmpvar_4021 == 0)) {
          tmpvar_4320 = 1;
        } else {
          tmpvar_4320 = -1;
        };
        _us_4318 = -(tmpvar_4320);
        float tmpvar_4321;
        tmpvar_4321 = fract((iTime * 4.0));
        highp int tmpvar_4322;
        tmpvar_4322 = (tmpvar_4020 - 1);
        highp int tmpvar_4323;
        if ((_us_4318 >= 0)) {
          tmpvar_4323 = 0;
        } else {
          tmpvar_4323 = 1;
        };
        highp int tmpvar_4324;
        tmpvar_4324 = (6 + tmpvar_4323);
        _uidx1_4319 = tmpvar_4324;
        if ((tmpvar_4322 < 0)) {
          highp int tmpvar_4325;
          if ((_us_4318 >= 0)) {
            tmpvar_4325 = 1;
          } else {
            tmpvar_4325 = 0;
          };
          _uidx1_4319 = (6 + tmpvar_4325);
        };
        highp int tmpvar_4326;
        if ((tmpvar_4322 < 0)) {
          tmpvar_4326 = 3;
        } else {
          tmpvar_4326 = tmpvar_4322;
        };
        float tmpvar_4327;
        tmpvar_4327 = sin(((
          (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
            clamp (float(_uidx1_4319), 0.0, 11.0)
          )][int(
            clamp (float(tmpvar_4326), 0.0, 3.0)
          )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
            clamp (float(tmpvar_4324), 0.0, 11.0)
          )][int(
            clamp (float(tmpvar_4020), 0.0, 3.0)
          )], tmpvar_4321))
         * 3.141593) / 180.0));
        highp int _us_4328;
        _us_4328 = -1;
        highp int _uidx1_4329;
        highp int tmpvar_4330;
        if ((tmpvar_4021 == 0)) {
          tmpvar_4330 = 1;
        } else {
          tmpvar_4330 = -1;
        };
        _us_4328 = -(tmpvar_4330);
        float tmpvar_4331;
        tmpvar_4331 = fract((iTime * 4.0));
        highp int tmpvar_4332;
        tmpvar_4332 = (tmpvar_4020 - 1);
        highp int tmpvar_4333;
        if ((_us_4328 >= 0)) {
          tmpvar_4333 = 0;
        } else {
          tmpvar_4333 = 1;
        };
        highp int tmpvar_4334;
        tmpvar_4334 = (6 + tmpvar_4333);
        _uidx1_4329 = tmpvar_4334;
        if ((tmpvar_4332 < 0)) {
          highp int tmpvar_4335;
          if ((_us_4328 >= 0)) {
            tmpvar_4335 = 1;
          } else {
            tmpvar_4335 = 0;
          };
          _uidx1_4329 = (6 + tmpvar_4335);
        };
        highp int tmpvar_4336;
        if ((tmpvar_4332 < 0)) {
          tmpvar_4336 = 3;
        } else {
          tmpvar_4336 = tmpvar_4332;
        };
        float tmpvar_4337;
        tmpvar_4337 = sin(((
          (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
            clamp (float(_uidx1_4329), 0.0, 11.0)
          )][int(
            clamp (float(tmpvar_4336), 0.0, 3.0)
          )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
            clamp (float(tmpvar_4334), 0.0, 11.0)
          )][int(
            clamp (float(tmpvar_4020), 0.0, 3.0)
          )], tmpvar_4331))
         * 3.141593) / 180.0));
        highp int _us_4338;
        _us_4338 = -1;
        highp int _uidx1_4339;
        highp int tmpvar_4340;
        if ((tmpvar_4021 == 0)) {
          tmpvar_4340 = 1;
        } else {
          tmpvar_4340 = -1;
        };
        _us_4338 = -(tmpvar_4340);
        float tmpvar_4341;
        tmpvar_4341 = fract((iTime * 4.0));
        highp int tmpvar_4342;
        tmpvar_4342 = (tmpvar_4020 - 1);
        highp int tmpvar_4343;
        if ((_us_4338 >= 0)) {
          tmpvar_4343 = 0;
        } else {
          tmpvar_4343 = 1;
        };
        highp int tmpvar_4344;
        tmpvar_4344 = (6 + tmpvar_4343);
        _uidx1_4339 = tmpvar_4344;
        if ((tmpvar_4342 < 0)) {
          highp int tmpvar_4345;
          if ((_us_4338 >= 0)) {
            tmpvar_4345 = 1;
          } else {
            tmpvar_4345 = 0;
          };
          _uidx1_4339 = (6 + tmpvar_4345);
        };
        highp int tmpvar_4346;
        if ((tmpvar_4342 < 0)) {
          tmpvar_4346 = 3;
        } else {
          tmpvar_4346 = tmpvar_4342;
        };
        mat2 tmpvar_4347;
        tmpvar_4347[uint(0)].x = tmpvar_4317;
        tmpvar_4347[uint(0)].y = tmpvar_4327;
        tmpvar_4347[1u].x = -(tmpvar_4337);
        tmpvar_4347[1u].y = cos(((
          (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
            clamp (float(_uidx1_4339), 0.0, 11.0)
          )][int(
            clamp (float(tmpvar_4346), 0.0, 3.0)
          )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
            clamp (float(tmpvar_4344), 0.0, 11.0)
          )][int(
            clamp (float(tmpvar_4020), 0.0, 3.0)
          )], tmpvar_4341))
         * 3.141593) / 180.0));
        _upArm0R_4007.yz = (tmpvar_4307.yz * tmpvar_4347);
        highp vec3 tmpvar_4348;
        tmpvar_4348 = (abs((_upArm0R_4007 - vec3(0.0, 0.08, 0.0))) - vec3(0.02, 0.08, 0.02));
        highp vec3 tmpvar_4349;
        tmpvar_4349 = max (tmpvar_4348, 0.0);
        highp float tmpvar_4350;
        tmpvar_4350 = min (tmpvar_4306, (sqrt(
          dot (tmpvar_4349, tmpvar_4349)
        ) + min (
          max (tmpvar_4348.x, max (tmpvar_4348.y, tmpvar_4348.z))
        , 0.0)));
        highp vec3 tmpvar_4351;
        tmpvar_4351 = (_upArm0R_4007 + vec3(0.0, -0.16, 0.0));
        _upArm1R_4006 = tmpvar_4351;
        highp int _us_4352;
        _us_4352 = -1;
        highp int _uidx1_4353;
        highp int tmpvar_4354;
        if ((tmpvar_4021 == 0)) {
          tmpvar_4354 = 1;
        } else {
          tmpvar_4354 = -1;
        };
        _us_4352 = -(tmpvar_4354);
        float tmpvar_4355;
        tmpvar_4355 = fract((iTime * 4.0));
        highp int tmpvar_4356;
        tmpvar_4356 = (tmpvar_4020 - 1);
        highp int tmpvar_4357;
        if ((_us_4352 >= 0)) {
          tmpvar_4357 = 0;
        } else {
          tmpvar_4357 = 1;
        };
        highp int tmpvar_4358;
        tmpvar_4358 = (8 + tmpvar_4357);
        _uidx1_4353 = tmpvar_4358;
        if ((tmpvar_4356 < 0)) {
          highp int tmpvar_4359;
          if ((_us_4352 >= 0)) {
            tmpvar_4359 = 1;
          } else {
            tmpvar_4359 = 0;
          };
          _uidx1_4353 = (8 + tmpvar_4359);
        };
        highp int tmpvar_4360;
        if ((tmpvar_4356 < 0)) {
          tmpvar_4360 = 3;
        } else {
          tmpvar_4360 = tmpvar_4356;
        };
        float tmpvar_4361;
        tmpvar_4361 = cos(((
          mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
            float(_uidx1_4353)
          , 0.0, 11.0))][int(clamp (
            float(tmpvar_4360)
          , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
            float(tmpvar_4358)
          , 0.0, 11.0))][int(clamp (
            float(tmpvar_4020)
          , 0.0, 3.0))], tmpvar_4355)
         * 3.141593) / 180.0));
        highp int _us_4362;
        _us_4362 = -1;
        highp int _uidx1_4363;
        highp int tmpvar_4364;
        if ((tmpvar_4021 == 0)) {
          tmpvar_4364 = 1;
        } else {
          tmpvar_4364 = -1;
        };
        _us_4362 = -(tmpvar_4364);
        float tmpvar_4365;
        tmpvar_4365 = fract((iTime * 4.0));
        highp int tmpvar_4366;
        tmpvar_4366 = (tmpvar_4020 - 1);
        highp int tmpvar_4367;
        if ((_us_4362 >= 0)) {
          tmpvar_4367 = 0;
        } else {
          tmpvar_4367 = 1;
        };
        highp int tmpvar_4368;
        tmpvar_4368 = (8 + tmpvar_4367);
        _uidx1_4363 = tmpvar_4368;
        if ((tmpvar_4366 < 0)) {
          highp int tmpvar_4369;
          if ((_us_4362 >= 0)) {
            tmpvar_4369 = 1;
          } else {
            tmpvar_4369 = 0;
          };
          _uidx1_4363 = (8 + tmpvar_4369);
        };
        highp int tmpvar_4370;
        if ((tmpvar_4366 < 0)) {
          tmpvar_4370 = 3;
        } else {
          tmpvar_4370 = tmpvar_4366;
        };
        float tmpvar_4371;
        tmpvar_4371 = sin(((
          mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
            float(_uidx1_4363)
          , 0.0, 11.0))][int(clamp (
            float(tmpvar_4370)
          , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
            float(tmpvar_4368)
          , 0.0, 11.0))][int(clamp (
            float(tmpvar_4020)
          , 0.0, 3.0))], tmpvar_4365)
         * 3.141593) / 180.0));
        highp int _us_4372;
        _us_4372 = -1;
        highp int _uidx1_4373;
        highp int tmpvar_4374;
        if ((tmpvar_4021 == 0)) {
          tmpvar_4374 = 1;
        } else {
          tmpvar_4374 = -1;
        };
        _us_4372 = -(tmpvar_4374);
        float tmpvar_4375;
        tmpvar_4375 = fract((iTime * 4.0));
        highp int tmpvar_4376;
        tmpvar_4376 = (tmpvar_4020 - 1);
        highp int tmpvar_4377;
        if ((_us_4372 >= 0)) {
          tmpvar_4377 = 0;
        } else {
          tmpvar_4377 = 1;
        };
        highp int tmpvar_4378;
        tmpvar_4378 = (8 + tmpvar_4377);
        _uidx1_4373 = tmpvar_4378;
        if ((tmpvar_4376 < 0)) {
          highp int tmpvar_4379;
          if ((_us_4372 >= 0)) {
            tmpvar_4379 = 1;
          } else {
            tmpvar_4379 = 0;
          };
          _uidx1_4373 = (8 + tmpvar_4379);
        };
        highp int tmpvar_4380;
        if ((tmpvar_4376 < 0)) {
          tmpvar_4380 = 3;
        } else {
          tmpvar_4380 = tmpvar_4376;
        };
        float tmpvar_4381;
        tmpvar_4381 = sin(((
          mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
            float(_uidx1_4373)
          , 0.0, 11.0))][int(clamp (
            float(tmpvar_4380)
          , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
            float(tmpvar_4378)
          , 0.0, 11.0))][int(clamp (
            float(tmpvar_4020)
          , 0.0, 3.0))], tmpvar_4375)
         * 3.141593) / 180.0));
        highp int _us_4382;
        _us_4382 = -1;
        highp int _uidx1_4383;
        highp int tmpvar_4384;
        if ((tmpvar_4021 == 0)) {
          tmpvar_4384 = 1;
        } else {
          tmpvar_4384 = -1;
        };
        _us_4382 = -(tmpvar_4384);
        float tmpvar_4385;
        tmpvar_4385 = fract((iTime * 4.0));
        highp int tmpvar_4386;
        tmpvar_4386 = (tmpvar_4020 - 1);
        highp int tmpvar_4387;
        if ((_us_4382 >= 0)) {
          tmpvar_4387 = 0;
        } else {
          tmpvar_4387 = 1;
        };
        highp int tmpvar_4388;
        tmpvar_4388 = (8 + tmpvar_4387);
        _uidx1_4383 = tmpvar_4388;
        if ((tmpvar_4386 < 0)) {
          highp int tmpvar_4389;
          if ((_us_4382 >= 0)) {
            tmpvar_4389 = 1;
          } else {
            tmpvar_4389 = 0;
          };
          _uidx1_4383 = (8 + tmpvar_4389);
        };
        highp int tmpvar_4390;
        if ((tmpvar_4386 < 0)) {
          tmpvar_4390 = 3;
        } else {
          tmpvar_4390 = tmpvar_4386;
        };
        mat2 tmpvar_4391;
        tmpvar_4391[uint(0)].x = tmpvar_4361;
        tmpvar_4391[uint(0)].y = tmpvar_4371;
        tmpvar_4391[1u].x = -(tmpvar_4381);
        tmpvar_4391[1u].y = cos(((
          mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
            float(_uidx1_4383)
          , 0.0, 11.0))][int(clamp (
            float(tmpvar_4390)
          , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
            float(tmpvar_4388)
          , 0.0, 11.0))][int(clamp (
            float(tmpvar_4020)
          , 0.0, 3.0))], tmpvar_4385)
         * 3.141593) / 180.0));
        _upArm1R_4006.yz = (tmpvar_4351.yz * tmpvar_4391);
        highp vec3 tmpvar_4392;
        tmpvar_4392 = (abs((_upArm1R_4006 - vec3(0.0, 0.08, 0.0))) - vec3(0.02, 0.08, 0.02));
        highp vec3 tmpvar_4393;
        tmpvar_4393 = max (tmpvar_4392, 0.0);
        highp float tmpvar_4394;
        tmpvar_4394 = min (tmpvar_4350, (sqrt(
          dot (tmpvar_4393, tmpvar_4393)
        ) + min (
          max (tmpvar_4392.x, max (tmpvar_4392.y, tmpvar_4392.z))
        , 0.0)));
        highp vec4 tmpvar_4395;
        if ((tmpvar_4394 < tmpvar_3996.x)) {
          highp vec3 _upArm1R_4396;
          highp vec3 _upArm0R_4397;
          highp vec3 _upArm1L_4398;
          highp vec3 _upArm0L_4399;
          highp vec3 _upLeg1R_4400;
          highp vec3 _upLeg0R_4401;
          highp vec3 _upLeg1L_4402;
          highp vec3 _upLeg0L_4403;
          highp vec3 _upHead_4404;
          highp vec3 _upNeck_4405;
          highp vec3 _upChest_4406;
          highp vec3 _upWaist_4407;
          highp vec3 _upPelvis_4408;
          float tmpvar_4409;
          tmpvar_4409 = (iTime * 4.0);
          highp int tmpvar_4410;
          tmpvar_4410 = ((int(tmpvar_4409)% 4));
          highp int tmpvar_4411;
          tmpvar_4411 = ((int((tmpvar_4409 / 4.0))% 2));
          highp int _uidx1_4412;
          highp int tmpvar_4413;
          if ((tmpvar_4411 == 0)) {
            tmpvar_4413 = 1;
          } else {
            tmpvar_4413 = -1;
          };
          float tmpvar_4414;
          tmpvar_4414 = fract((iTime * 4.0));
          highp int tmpvar_4415;
          tmpvar_4415 = (tmpvar_4410 - 1);
          highp int tmpvar_4416;
          if ((tmpvar_4413 >= 0)) {
            tmpvar_4416 = 0;
          } else {
            tmpvar_4416 = 1;
          };
          highp int tmpvar_4417;
          tmpvar_4417 = (10 + tmpvar_4416);
          _uidx1_4412 = tmpvar_4417;
          if ((tmpvar_4415 < 0)) {
            highp int tmpvar_4418;
            if ((tmpvar_4413 >= 0)) {
              tmpvar_4418 = 1;
            } else {
              tmpvar_4418 = 0;
            };
            _uidx1_4412 = (10 + tmpvar_4418);
          };
          highp int tmpvar_4419;
          if ((tmpvar_4415 < 0)) {
            tmpvar_4419 = 3;
          } else {
            tmpvar_4419 = tmpvar_4415;
          };
          float tmpvar_4420;
          tmpvar_4420 = ((mix (
            vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (float(_uidx1_4412), 0.0, 11.0))][int(clamp (float(tmpvar_4419), 0.0, 3.0))]
          , 
            vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (float(tmpvar_4417), 0.0, 11.0))][int(clamp (float(tmpvar_4410), 0.0, 3.0))]
          , tmpvar_4414) * 3.141593) / 180.0);
          highp int _uidx1_4421;
          highp int tmpvar_4422;
          if ((tmpvar_4411 == 0)) {
            tmpvar_4422 = 1;
          } else {
            tmpvar_4422 = -1;
          };
          float tmpvar_4423;
          tmpvar_4423 = fract((iTime * 4.0));
          highp int tmpvar_4424;
          tmpvar_4424 = (tmpvar_4410 - 1);
          highp int tmpvar_4425;
          if ((tmpvar_4422 >= 0)) {
            tmpvar_4425 = 0;
          } else {
            tmpvar_4425 = 1;
          };
          _uidx1_4421 = tmpvar_4425;
          if ((tmpvar_4424 < 0)) {
            highp int tmpvar_4426;
            if ((tmpvar_4422 >= 0)) {
              tmpvar_4426 = 1;
            } else {
              tmpvar_4426 = 0;
            };
            _uidx1_4421 = tmpvar_4426;
          };
          highp int tmpvar_4427;
          if ((tmpvar_4424 < 0)) {
            tmpvar_4427 = 3;
          } else {
            tmpvar_4427 = tmpvar_4424;
          };
          vec3 tmpvar_4428;
          tmpvar_4428.xz = vec2(0.0, 0.0);
          tmpvar_4428.y = (-0.5 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[
            int(clamp (float(_uidx1_4421), 0.0, 11.0))
          ][
            int(clamp (float(tmpvar_4427), 0.0, 3.0))
          ], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[
            int(clamp (float(tmpvar_4425), 0.0, 11.0))
          ][
            int(clamp (float(tmpvar_4410), 0.0, 3.0))
          ], tmpvar_4423));
          highp vec3 tmpvar_4429;
          tmpvar_4429 = (_up_3992 + tmpvar_4428);
          _upPelvis_4408.z = tmpvar_4429.z;
          mat2 tmpvar_4430;
          tmpvar_4430[uint(0)].x = cos(tmpvar_4420);
          tmpvar_4430[uint(0)].y = sin(tmpvar_4420);
          tmpvar_4430[1u].x = -(sin(tmpvar_4420));
          tmpvar_4430[1u].y = cos(tmpvar_4420);
          _upPelvis_4408.xy = (tmpvar_4429.xy * tmpvar_4430);
          highp vec3 tmpvar_4431;
          tmpvar_4431 = (abs((_upPelvis_4408 - vec3(0.0, 0.0, 0.025))) - vec3(0.085, 0.05, 0.05));
          highp vec3 tmpvar_4432;
          tmpvar_4432 = max (tmpvar_4431, 0.0);
          highp vec3 tmpvar_4433;
          tmpvar_4433 = (_upPelvis_4408 + vec3(0.0, -0.05, -0.02));
          _upWaist_4407.z = tmpvar_4433.z;
          mat2 tmpvar_4434;
          tmpvar_4434[uint(0)].x = cos(-(tmpvar_4420));
          tmpvar_4434[uint(0)].y = sin(-(tmpvar_4420));
          tmpvar_4434[1u].x = -(sin(-(tmpvar_4420)));
          tmpvar_4434[1u].y = cos(-(tmpvar_4420));
          _upWaist_4407.xy = (tmpvar_4433.xy * tmpvar_4434);
          _upWaist_4407.yz = (_upWaist_4407.yz * mat2(1.0, 0.0, -0.0, 1.0));
          highp vec3 tmpvar_4435;
          tmpvar_4435 = (abs((_upWaist_4407 - vec3(0.0, 0.04, 0.0))) - vec3(0.075, 0.08, 0.03));
          highp vec3 tmpvar_4436;
          tmpvar_4436 = max (tmpvar_4435, 0.0);
          highp vec3 tmpvar_4437;
          tmpvar_4437 = (_upWaist_4407 + vec3(0.0, -0.14, -0.01));
          _upChest_4406.x = tmpvar_4437.x;
          _upChest_4406.yz = (tmpvar_4437.yz * mat2(1.0, 0.0, -0.0, 1.0));
          highp vec3 tmpvar_4438;
          tmpvar_4438 = (abs((_upChest_4406 - vec3(0.0, 0.04, 0.0))) - vec3(0.09, 0.08, 0.05));
          highp vec3 tmpvar_4439;
          tmpvar_4439 = max (tmpvar_4438, 0.0);
          highp vec3 tmpvar_4440;
          tmpvar_4440 = (_upChest_4406 + vec3(0.0, -0.15, 0.0));
          _upNeck_4405.x = tmpvar_4440.x;
          _upNeck_4405.yz = (tmpvar_4440.yz * mat2(1.0, 0.0, -0.0, 1.0));
          highp vec3 tmpvar_4441;
          tmpvar_4441 = (abs((_upNeck_4405 - vec3(0.0, 0.01, 0.0))) - vec3(0.02, 0.04, 0.02));
          highp vec3 tmpvar_4442;
          tmpvar_4442 = max (tmpvar_4441, 0.0);
          highp vec3 tmpvar_4443;
          tmpvar_4443 = (_upNeck_4405 + vec3(0.0, -0.1, 0.0));
          _upHead_4404.x = tmpvar_4443.x;
          _upHead_4404.yz = (tmpvar_4443.yz * mat2(1.0, 0.0, -0.0, 1.0));
          highp vec3 tmpvar_4444;
          tmpvar_4444 = (abs((_upHead_4404 - vec3(0.0, 0.04, -0.025))) - vec3(0.05, 0.08, 0.06));
          highp vec3 tmpvar_4445;
          tmpvar_4445 = max (tmpvar_4444, 0.0);
          highp float tmpvar_4446;
          tmpvar_4446 = min (min (min (
            min (min (4.5, (sqrt(
              dot (tmpvar_4432, tmpvar_4432)
            ) + min (
              max (tmpvar_4431.x, max (tmpvar_4431.y, tmpvar_4431.z))
            , 0.0))), (sqrt(dot (tmpvar_4436, tmpvar_4436)) + min (max (tmpvar_4435.x, 
              max (tmpvar_4435.y, tmpvar_4435.z)
            ), 0.0)))
          , 
            (sqrt(dot (tmpvar_4439, tmpvar_4439)) + min (max (tmpvar_4438.x, max (tmpvar_4438.y, tmpvar_4438.z)), 0.0))
          ), (
            sqrt(dot (tmpvar_4442, tmpvar_4442))
           + 
            min (max (tmpvar_4441.x, max (tmpvar_4441.y, tmpvar_4441.z)), 0.0)
          )), (sqrt(
            dot (tmpvar_4445, tmpvar_4445)
          ) + min (
            max (tmpvar_4444.x, max (tmpvar_4444.y, tmpvar_4444.z))
          , 0.0)));
          highp vec3 tmpvar_4447;
          tmpvar_4447 = (_upPelvis_4408 + vec3(0.06, 0.025, 0.0));
          _upLeg0L_4403.z = tmpvar_4447.z;
          mat2 tmpvar_4448;
          tmpvar_4448[uint(0)].x = cos(-(tmpvar_4420));
          tmpvar_4448[uint(0)].y = sin(-(tmpvar_4420));
          tmpvar_4448[1u].x = -(sin(-(tmpvar_4420)));
          tmpvar_4448[1u].y = cos(-(tmpvar_4420));
          _upLeg0L_4403.xy = (tmpvar_4447.xy * tmpvar_4448);
          highp int _uidx1_4449;
          highp int tmpvar_4450;
          if ((tmpvar_4411 == 0)) {
            tmpvar_4450 = 1;
          } else {
            tmpvar_4450 = -1;
          };
          float tmpvar_4451;
          tmpvar_4451 = fract((iTime * 4.0));
          highp int tmpvar_4452;
          tmpvar_4452 = (tmpvar_4410 - 1);
          highp int tmpvar_4453;
          if ((tmpvar_4450 >= 0)) {
            tmpvar_4453 = 0;
          } else {
            tmpvar_4453 = 1;
          };
          highp int tmpvar_4454;
          tmpvar_4454 = (2 + tmpvar_4453);
          _uidx1_4449 = tmpvar_4454;
          if ((tmpvar_4452 < 0)) {
            highp int tmpvar_4455;
            if ((tmpvar_4450 >= 0)) {
              tmpvar_4455 = 1;
            } else {
              tmpvar_4455 = 0;
            };
            _uidx1_4449 = (2 + tmpvar_4455);
          };
          highp int tmpvar_4456;
          if ((tmpvar_4452 < 0)) {
            tmpvar_4456 = 3;
          } else {
            tmpvar_4456 = tmpvar_4452;
          };
          float tmpvar_4457;
          tmpvar_4457 = cos(((
            (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
              clamp (float(_uidx1_4449), 0.0, 11.0)
            )][int(
              clamp (float(tmpvar_4456), 0.0, 3.0)
            )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
              clamp (float(tmpvar_4454), 0.0, 11.0)
            )][int(
              clamp (float(tmpvar_4410), 0.0, 3.0)
            )], tmpvar_4451))
           * 3.141593) / 180.0));
          highp int _uidx1_4458;
          highp int tmpvar_4459;
          if ((tmpvar_4411 == 0)) {
            tmpvar_4459 = 1;
          } else {
            tmpvar_4459 = -1;
          };
          float tmpvar_4460;
          tmpvar_4460 = fract((iTime * 4.0));
          highp int tmpvar_4461;
          tmpvar_4461 = (tmpvar_4410 - 1);
          highp int tmpvar_4462;
          if ((tmpvar_4459 >= 0)) {
            tmpvar_4462 = 0;
          } else {
            tmpvar_4462 = 1;
          };
          highp int tmpvar_4463;
          tmpvar_4463 = (2 + tmpvar_4462);
          _uidx1_4458 = tmpvar_4463;
          if ((tmpvar_4461 < 0)) {
            highp int tmpvar_4464;
            if ((tmpvar_4459 >= 0)) {
              tmpvar_4464 = 1;
            } else {
              tmpvar_4464 = 0;
            };
            _uidx1_4458 = (2 + tmpvar_4464);
          };
          highp int tmpvar_4465;
          if ((tmpvar_4461 < 0)) {
            tmpvar_4465 = 3;
          } else {
            tmpvar_4465 = tmpvar_4461;
          };
          float tmpvar_4466;
          tmpvar_4466 = sin(((
            (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
              clamp (float(_uidx1_4458), 0.0, 11.0)
            )][int(
              clamp (float(tmpvar_4465), 0.0, 3.0)
            )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
              clamp (float(tmpvar_4463), 0.0, 11.0)
            )][int(
              clamp (float(tmpvar_4410), 0.0, 3.0)
            )], tmpvar_4460))
           * 3.141593) / 180.0));
          highp int _uidx1_4467;
          highp int tmpvar_4468;
          if ((tmpvar_4411 == 0)) {
            tmpvar_4468 = 1;
          } else {
            tmpvar_4468 = -1;
          };
          float tmpvar_4469;
          tmpvar_4469 = fract((iTime * 4.0));
          highp int tmpvar_4470;
          tmpvar_4470 = (tmpvar_4410 - 1);
          highp int tmpvar_4471;
          if ((tmpvar_4468 >= 0)) {
            tmpvar_4471 = 0;
          } else {
            tmpvar_4471 = 1;
          };
          highp int tmpvar_4472;
          tmpvar_4472 = (2 + tmpvar_4471);
          _uidx1_4467 = tmpvar_4472;
          if ((tmpvar_4470 < 0)) {
            highp int tmpvar_4473;
            if ((tmpvar_4468 >= 0)) {
              tmpvar_4473 = 1;
            } else {
              tmpvar_4473 = 0;
            };
            _uidx1_4467 = (2 + tmpvar_4473);
          };
          highp int tmpvar_4474;
          if ((tmpvar_4470 < 0)) {
            tmpvar_4474 = 3;
          } else {
            tmpvar_4474 = tmpvar_4470;
          };
          float tmpvar_4475;
          tmpvar_4475 = sin(((
            (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
              clamp (float(_uidx1_4467), 0.0, 11.0)
            )][int(
              clamp (float(tmpvar_4474), 0.0, 3.0)
            )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
              clamp (float(tmpvar_4472), 0.0, 11.0)
            )][int(
              clamp (float(tmpvar_4410), 0.0, 3.0)
            )], tmpvar_4469))
           * 3.141593) / 180.0));
          highp int _uidx1_4476;
          highp int tmpvar_4477;
          if ((tmpvar_4411 == 0)) {
            tmpvar_4477 = 1;
          } else {
            tmpvar_4477 = -1;
          };
          float tmpvar_4478;
          tmpvar_4478 = fract((iTime * 4.0));
          highp int tmpvar_4479;
          tmpvar_4479 = (tmpvar_4410 - 1);
          highp int tmpvar_4480;
          if ((tmpvar_4477 >= 0)) {
            tmpvar_4480 = 0;
          } else {
            tmpvar_4480 = 1;
          };
          highp int tmpvar_4481;
          tmpvar_4481 = (2 + tmpvar_4480);
          _uidx1_4476 = tmpvar_4481;
          if ((tmpvar_4479 < 0)) {
            highp int tmpvar_4482;
            if ((tmpvar_4477 >= 0)) {
              tmpvar_4482 = 1;
            } else {
              tmpvar_4482 = 0;
            };
            _uidx1_4476 = (2 + tmpvar_4482);
          };
          highp int tmpvar_4483;
          if ((tmpvar_4479 < 0)) {
            tmpvar_4483 = 3;
          } else {
            tmpvar_4483 = tmpvar_4479;
          };
          mat2 tmpvar_4484;
          tmpvar_4484[uint(0)].x = tmpvar_4457;
          tmpvar_4484[uint(0)].y = tmpvar_4466;
          tmpvar_4484[1u].x = -(tmpvar_4475);
          tmpvar_4484[1u].y = cos(((
            (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
              clamp (float(_uidx1_4476), 0.0, 11.0)
            )][int(
              clamp (float(tmpvar_4483), 0.0, 3.0)
            )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
              clamp (float(tmpvar_4481), 0.0, 11.0)
            )][int(
              clamp (float(tmpvar_4410), 0.0, 3.0)
            )], tmpvar_4478))
           * 3.141593) / 180.0));
          _upLeg0L_4403.yz = (_upLeg0L_4403.yz * tmpvar_4484);
          highp vec3 tmpvar_4485;
          tmpvar_4485 = (abs((_upLeg0L_4403 - vec3(0.0, 0.1, 0.0))) - vec3(0.025, 0.1, 0.025));
          highp vec3 tmpvar_4486;
          tmpvar_4486 = max (tmpvar_4485, 0.0);
          highp float tmpvar_4487;
          tmpvar_4487 = min (tmpvar_4446, (sqrt(
            dot (tmpvar_4486, tmpvar_4486)
          ) + min (
            max (tmpvar_4485.x, max (tmpvar_4485.y, tmpvar_4485.z))
          , 0.0)));
          highp vec3 tmpvar_4488;
          tmpvar_4488 = (_upLeg0L_4403 + vec3(0.01, -0.18, 0.02));
          _upLeg1L_4402 = tmpvar_4488;
          highp int _uidx1_4489;
          highp int tmpvar_4490;
          if ((tmpvar_4411 == 0)) {
            tmpvar_4490 = 1;
          } else {
            tmpvar_4490 = -1;
          };
          float tmpvar_4491;
          tmpvar_4491 = fract((iTime * 4.0));
          highp int tmpvar_4492;
          tmpvar_4492 = (tmpvar_4410 - 1);
          highp int tmpvar_4493;
          if ((tmpvar_4490 >= 0)) {
            tmpvar_4493 = 0;
          } else {
            tmpvar_4493 = 1;
          };
          highp int tmpvar_4494;
          tmpvar_4494 = (4 + tmpvar_4493);
          _uidx1_4489 = tmpvar_4494;
          if ((tmpvar_4492 < 0)) {
            highp int tmpvar_4495;
            if ((tmpvar_4490 >= 0)) {
              tmpvar_4495 = 1;
            } else {
              tmpvar_4495 = 0;
            };
            _uidx1_4489 = (4 + tmpvar_4495);
          };
          highp int tmpvar_4496;
          if ((tmpvar_4492 < 0)) {
            tmpvar_4496 = 3;
          } else {
            tmpvar_4496 = tmpvar_4492;
          };
          float tmpvar_4497;
          tmpvar_4497 = cos(((
            mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
              float(_uidx1_4489)
            , 0.0, 11.0))][int(clamp (
              float(tmpvar_4496)
            , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
              float(tmpvar_4494)
            , 0.0, 11.0))][int(clamp (
              float(tmpvar_4410)
            , 0.0, 3.0))], tmpvar_4491)
           * 3.141593) / 180.0));
          highp int _uidx1_4498;
          highp int tmpvar_4499;
          if ((tmpvar_4411 == 0)) {
            tmpvar_4499 = 1;
          } else {
            tmpvar_4499 = -1;
          };
          float tmpvar_4500;
          tmpvar_4500 = fract((iTime * 4.0));
          highp int tmpvar_4501;
          tmpvar_4501 = (tmpvar_4410 - 1);
          highp int tmpvar_4502;
          if ((tmpvar_4499 >= 0)) {
            tmpvar_4502 = 0;
          } else {
            tmpvar_4502 = 1;
          };
          highp int tmpvar_4503;
          tmpvar_4503 = (4 + tmpvar_4502);
          _uidx1_4498 = tmpvar_4503;
          if ((tmpvar_4501 < 0)) {
            highp int tmpvar_4504;
            if ((tmpvar_4499 >= 0)) {
              tmpvar_4504 = 1;
            } else {
              tmpvar_4504 = 0;
            };
            _uidx1_4498 = (4 + tmpvar_4504);
          };
          highp int tmpvar_4505;
          if ((tmpvar_4501 < 0)) {
            tmpvar_4505 = 3;
          } else {
            tmpvar_4505 = tmpvar_4501;
          };
          float tmpvar_4506;
          tmpvar_4506 = sin(((
            mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
              float(_uidx1_4498)
            , 0.0, 11.0))][int(clamp (
              float(tmpvar_4505)
            , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
              float(tmpvar_4503)
            , 0.0, 11.0))][int(clamp (
              float(tmpvar_4410)
            , 0.0, 3.0))], tmpvar_4500)
           * 3.141593) / 180.0));
          highp int _uidx1_4507;
          highp int tmpvar_4508;
          if ((tmpvar_4411 == 0)) {
            tmpvar_4508 = 1;
          } else {
            tmpvar_4508 = -1;
          };
          float tmpvar_4509;
          tmpvar_4509 = fract((iTime * 4.0));
          highp int tmpvar_4510;
          tmpvar_4510 = (tmpvar_4410 - 1);
          highp int tmpvar_4511;
          if ((tmpvar_4508 >= 0)) {
            tmpvar_4511 = 0;
          } else {
            tmpvar_4511 = 1;
          };
          highp int tmpvar_4512;
          tmpvar_4512 = (4 + tmpvar_4511);
          _uidx1_4507 = tmpvar_4512;
          if ((tmpvar_4510 < 0)) {
            highp int tmpvar_4513;
            if ((tmpvar_4508 >= 0)) {
              tmpvar_4513 = 1;
            } else {
              tmpvar_4513 = 0;
            };
            _uidx1_4507 = (4 + tmpvar_4513);
          };
          highp int tmpvar_4514;
          if ((tmpvar_4510 < 0)) {
            tmpvar_4514 = 3;
          } else {
            tmpvar_4514 = tmpvar_4510;
          };
          float tmpvar_4515;
          tmpvar_4515 = sin(((
            mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
              float(_uidx1_4507)
            , 0.0, 11.0))][int(clamp (
              float(tmpvar_4514)
            , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
              float(tmpvar_4512)
            , 0.0, 11.0))][int(clamp (
              float(tmpvar_4410)
            , 0.0, 3.0))], tmpvar_4509)
           * 3.141593) / 180.0));
          highp int _uidx1_4516;
          highp int tmpvar_4517;
          if ((tmpvar_4411 == 0)) {
            tmpvar_4517 = 1;
          } else {
            tmpvar_4517 = -1;
          };
          float tmpvar_4518;
          tmpvar_4518 = fract((iTime * 4.0));
          highp int tmpvar_4519;
          tmpvar_4519 = (tmpvar_4410 - 1);
          highp int tmpvar_4520;
          if ((tmpvar_4517 >= 0)) {
            tmpvar_4520 = 0;
          } else {
            tmpvar_4520 = 1;
          };
          highp int tmpvar_4521;
          tmpvar_4521 = (4 + tmpvar_4520);
          _uidx1_4516 = tmpvar_4521;
          if ((tmpvar_4519 < 0)) {
            highp int tmpvar_4522;
            if ((tmpvar_4517 >= 0)) {
              tmpvar_4522 = 1;
            } else {
              tmpvar_4522 = 0;
            };
            _uidx1_4516 = (4 + tmpvar_4522);
          };
          highp int tmpvar_4523;
          if ((tmpvar_4519 < 0)) {
            tmpvar_4523 = 3;
          } else {
            tmpvar_4523 = tmpvar_4519;
          };
          mat2 tmpvar_4524;
          tmpvar_4524[uint(0)].x = tmpvar_4497;
          tmpvar_4524[uint(0)].y = tmpvar_4506;
          tmpvar_4524[1u].x = -(tmpvar_4515);
          tmpvar_4524[1u].y = cos(((
            mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
              float(_uidx1_4516)
            , 0.0, 11.0))][int(clamp (
              float(tmpvar_4523)
            , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
              float(tmpvar_4521)
            , 0.0, 11.0))][int(clamp (
              float(tmpvar_4410)
            , 0.0, 3.0))], tmpvar_4518)
           * 3.141593) / 180.0));
          _upLeg1L_4402.yz = (tmpvar_4488.yz * tmpvar_4524);
          highp vec3 tmpvar_4525;
          tmpvar_4525 = (abs((_upLeg1L_4402 - vec3(0.0, 0.1, 0.0))) - vec3(0.025, 0.1, 0.025));
          highp vec3 tmpvar_4526;
          tmpvar_4526 = max (tmpvar_4525, 0.0);
          highp float tmpvar_4527;
          tmpvar_4527 = min (tmpvar_4487, (sqrt(
            dot (tmpvar_4526, tmpvar_4526)
          ) + min (
            max (tmpvar_4525.x, max (tmpvar_4525.y, tmpvar_4525.z))
          , 0.0)));
          highp vec3 tmpvar_4528;
          tmpvar_4528 = (_upPelvis_4408 + vec3(-0.06, 0.025, 0.0));
          _upLeg0R_4401.z = tmpvar_4528.z;
          mat2 tmpvar_4529;
          tmpvar_4529[uint(0)].x = cos(-(tmpvar_4420));
          tmpvar_4529[uint(0)].y = sin(-(tmpvar_4420));
          tmpvar_4529[1u].x = -(sin(-(tmpvar_4420)));
          tmpvar_4529[1u].y = cos(-(tmpvar_4420));
          _upLeg0R_4401.xy = (tmpvar_4528.xy * tmpvar_4529);
          highp int _us_4530;
          _us_4530 = -1;
          highp int _uidx1_4531;
          highp int tmpvar_4532;
          if ((tmpvar_4411 == 0)) {
            tmpvar_4532 = 1;
          } else {
            tmpvar_4532 = -1;
          };
          _us_4530 = -(tmpvar_4532);
          float tmpvar_4533;
          tmpvar_4533 = fract((iTime * 4.0));
          highp int tmpvar_4534;
          tmpvar_4534 = (tmpvar_4410 - 1);
          highp int tmpvar_4535;
          if ((_us_4530 >= 0)) {
            tmpvar_4535 = 0;
          } else {
            tmpvar_4535 = 1;
          };
          highp int tmpvar_4536;
          tmpvar_4536 = (2 + tmpvar_4535);
          _uidx1_4531 = tmpvar_4536;
          if ((tmpvar_4534 < 0)) {
            highp int tmpvar_4537;
            if ((_us_4530 >= 0)) {
              tmpvar_4537 = 1;
            } else {
              tmpvar_4537 = 0;
            };
            _uidx1_4531 = (2 + tmpvar_4537);
          };
          highp int tmpvar_4538;
          if ((tmpvar_4534 < 0)) {
            tmpvar_4538 = 3;
          } else {
            tmpvar_4538 = tmpvar_4534;
          };
          float tmpvar_4539;
          tmpvar_4539 = cos(((
            (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
              clamp (float(_uidx1_4531), 0.0, 11.0)
            )][int(
              clamp (float(tmpvar_4538), 0.0, 3.0)
            )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
              clamp (float(tmpvar_4536), 0.0, 11.0)
            )][int(
              clamp (float(tmpvar_4410), 0.0, 3.0)
            )], tmpvar_4533))
           * 3.141593) / 180.0));
          highp int _us_4540;
          _us_4540 = -1;
          highp int _uidx1_4541;
          highp int tmpvar_4542;
          if ((tmpvar_4411 == 0)) {
            tmpvar_4542 = 1;
          } else {
            tmpvar_4542 = -1;
          };
          _us_4540 = -(tmpvar_4542);
          float tmpvar_4543;
          tmpvar_4543 = fract((iTime * 4.0));
          highp int tmpvar_4544;
          tmpvar_4544 = (tmpvar_4410 - 1);
          highp int tmpvar_4545;
          if ((_us_4540 >= 0)) {
            tmpvar_4545 = 0;
          } else {
            tmpvar_4545 = 1;
          };
          highp int tmpvar_4546;
          tmpvar_4546 = (2 + tmpvar_4545);
          _uidx1_4541 = tmpvar_4546;
          if ((tmpvar_4544 < 0)) {
            highp int tmpvar_4547;
            if ((_us_4540 >= 0)) {
              tmpvar_4547 = 1;
            } else {
              tmpvar_4547 = 0;
            };
            _uidx1_4541 = (2 + tmpvar_4547);
          };
          highp int tmpvar_4548;
          if ((tmpvar_4544 < 0)) {
            tmpvar_4548 = 3;
          } else {
            tmpvar_4548 = tmpvar_4544;
          };
          float tmpvar_4549;
          tmpvar_4549 = sin(((
            (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
              clamp (float(_uidx1_4541), 0.0, 11.0)
            )][int(
              clamp (float(tmpvar_4548), 0.0, 3.0)
            )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
              clamp (float(tmpvar_4546), 0.0, 11.0)
            )][int(
              clamp (float(tmpvar_4410), 0.0, 3.0)
            )], tmpvar_4543))
           * 3.141593) / 180.0));
          highp int _us_4550;
          _us_4550 = -1;
          highp int _uidx1_4551;
          highp int tmpvar_4552;
          if ((tmpvar_4411 == 0)) {
            tmpvar_4552 = 1;
          } else {
            tmpvar_4552 = -1;
          };
          _us_4550 = -(tmpvar_4552);
          float tmpvar_4553;
          tmpvar_4553 = fract((iTime * 4.0));
          highp int tmpvar_4554;
          tmpvar_4554 = (tmpvar_4410 - 1);
          highp int tmpvar_4555;
          if ((_us_4550 >= 0)) {
            tmpvar_4555 = 0;
          } else {
            tmpvar_4555 = 1;
          };
          highp int tmpvar_4556;
          tmpvar_4556 = (2 + tmpvar_4555);
          _uidx1_4551 = tmpvar_4556;
          if ((tmpvar_4554 < 0)) {
            highp int tmpvar_4557;
            if ((_us_4550 >= 0)) {
              tmpvar_4557 = 1;
            } else {
              tmpvar_4557 = 0;
            };
            _uidx1_4551 = (2 + tmpvar_4557);
          };
          highp int tmpvar_4558;
          if ((tmpvar_4554 < 0)) {
            tmpvar_4558 = 3;
          } else {
            tmpvar_4558 = tmpvar_4554;
          };
          float tmpvar_4559;
          tmpvar_4559 = sin(((
            (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
              clamp (float(_uidx1_4551), 0.0, 11.0)
            )][int(
              clamp (float(tmpvar_4558), 0.0, 3.0)
            )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
              clamp (float(tmpvar_4556), 0.0, 11.0)
            )][int(
              clamp (float(tmpvar_4410), 0.0, 3.0)
            )], tmpvar_4553))
           * 3.141593) / 180.0));
          highp int _us_4560;
          _us_4560 = -1;
          highp int _uidx1_4561;
          highp int tmpvar_4562;
          if ((tmpvar_4411 == 0)) {
            tmpvar_4562 = 1;
          } else {
            tmpvar_4562 = -1;
          };
          _us_4560 = -(tmpvar_4562);
          float tmpvar_4563;
          tmpvar_4563 = fract((iTime * 4.0));
          highp int tmpvar_4564;
          tmpvar_4564 = (tmpvar_4410 - 1);
          highp int tmpvar_4565;
          if ((_us_4560 >= 0)) {
            tmpvar_4565 = 0;
          } else {
            tmpvar_4565 = 1;
          };
          highp int tmpvar_4566;
          tmpvar_4566 = (2 + tmpvar_4565);
          _uidx1_4561 = tmpvar_4566;
          if ((tmpvar_4564 < 0)) {
            highp int tmpvar_4567;
            if ((_us_4560 >= 0)) {
              tmpvar_4567 = 1;
            } else {
              tmpvar_4567 = 0;
            };
            _uidx1_4561 = (2 + tmpvar_4567);
          };
          highp int tmpvar_4568;
          if ((tmpvar_4564 < 0)) {
            tmpvar_4568 = 3;
          } else {
            tmpvar_4568 = tmpvar_4564;
          };
          mat2 tmpvar_4569;
          tmpvar_4569[uint(0)].x = tmpvar_4539;
          tmpvar_4569[uint(0)].y = tmpvar_4549;
          tmpvar_4569[1u].x = -(tmpvar_4559);
          tmpvar_4569[1u].y = cos(((
            (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
              clamp (float(_uidx1_4561), 0.0, 11.0)
            )][int(
              clamp (float(tmpvar_4568), 0.0, 3.0)
            )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
              clamp (float(tmpvar_4566), 0.0, 11.0)
            )][int(
              clamp (float(tmpvar_4410), 0.0, 3.0)
            )], tmpvar_4563))
           * 3.141593) / 180.0));
          _upLeg0R_4401.yz = (_upLeg0R_4401.yz * tmpvar_4569);
          highp vec3 tmpvar_4570;
          tmpvar_4570 = (abs((_upLeg0R_4401 - vec3(0.0, 0.1, 0.0))) - vec3(0.025, 0.1, 0.025));
          highp vec3 tmpvar_4571;
          tmpvar_4571 = max (tmpvar_4570, 0.0);
          highp float tmpvar_4572;
          tmpvar_4572 = min (tmpvar_4527, (sqrt(
            dot (tmpvar_4571, tmpvar_4571)
          ) + min (
            max (tmpvar_4570.x, max (tmpvar_4570.y, tmpvar_4570.z))
          , 0.0)));
          highp vec3 tmpvar_4573;
          tmpvar_4573 = (_upLeg0R_4401 + vec3(-0.01, -0.18, 0.02));
          _upLeg1R_4400 = tmpvar_4573;
          highp int _us_4574;
          _us_4574 = -1;
          highp int _uidx1_4575;
          highp int tmpvar_4576;
          if ((tmpvar_4411 == 0)) {
            tmpvar_4576 = 1;
          } else {
            tmpvar_4576 = -1;
          };
          _us_4574 = -(tmpvar_4576);
          float tmpvar_4577;
          tmpvar_4577 = fract((iTime * 4.0));
          highp int tmpvar_4578;
          tmpvar_4578 = (tmpvar_4410 - 1);
          highp int tmpvar_4579;
          if ((_us_4574 >= 0)) {
            tmpvar_4579 = 0;
          } else {
            tmpvar_4579 = 1;
          };
          highp int tmpvar_4580;
          tmpvar_4580 = (4 + tmpvar_4579);
          _uidx1_4575 = tmpvar_4580;
          if ((tmpvar_4578 < 0)) {
            highp int tmpvar_4581;
            if ((_us_4574 >= 0)) {
              tmpvar_4581 = 1;
            } else {
              tmpvar_4581 = 0;
            };
            _uidx1_4575 = (4 + tmpvar_4581);
          };
          highp int tmpvar_4582;
          if ((tmpvar_4578 < 0)) {
            tmpvar_4582 = 3;
          } else {
            tmpvar_4582 = tmpvar_4578;
          };
          float tmpvar_4583;
          tmpvar_4583 = cos(((
            mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
              float(_uidx1_4575)
            , 0.0, 11.0))][int(clamp (
              float(tmpvar_4582)
            , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
              float(tmpvar_4580)
            , 0.0, 11.0))][int(clamp (
              float(tmpvar_4410)
            , 0.0, 3.0))], tmpvar_4577)
           * 3.141593) / 180.0));
          highp int _us_4584;
          _us_4584 = -1;
          highp int _uidx1_4585;
          highp int tmpvar_4586;
          if ((tmpvar_4411 == 0)) {
            tmpvar_4586 = 1;
          } else {
            tmpvar_4586 = -1;
          };
          _us_4584 = -(tmpvar_4586);
          float tmpvar_4587;
          tmpvar_4587 = fract((iTime * 4.0));
          highp int tmpvar_4588;
          tmpvar_4588 = (tmpvar_4410 - 1);
          highp int tmpvar_4589;
          if ((_us_4584 >= 0)) {
            tmpvar_4589 = 0;
          } else {
            tmpvar_4589 = 1;
          };
          highp int tmpvar_4590;
          tmpvar_4590 = (4 + tmpvar_4589);
          _uidx1_4585 = tmpvar_4590;
          if ((tmpvar_4588 < 0)) {
            highp int tmpvar_4591;
            if ((_us_4584 >= 0)) {
              tmpvar_4591 = 1;
            } else {
              tmpvar_4591 = 0;
            };
            _uidx1_4585 = (4 + tmpvar_4591);
          };
          highp int tmpvar_4592;
          if ((tmpvar_4588 < 0)) {
            tmpvar_4592 = 3;
          } else {
            tmpvar_4592 = tmpvar_4588;
          };
          float tmpvar_4593;
          tmpvar_4593 = sin(((
            mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
              float(_uidx1_4585)
            , 0.0, 11.0))][int(clamp (
              float(tmpvar_4592)
            , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
              float(tmpvar_4590)
            , 0.0, 11.0))][int(clamp (
              float(tmpvar_4410)
            , 0.0, 3.0))], tmpvar_4587)
           * 3.141593) / 180.0));
          highp int _us_4594;
          _us_4594 = -1;
          highp int _uidx1_4595;
          highp int tmpvar_4596;
          if ((tmpvar_4411 == 0)) {
            tmpvar_4596 = 1;
          } else {
            tmpvar_4596 = -1;
          };
          _us_4594 = -(tmpvar_4596);
          float tmpvar_4597;
          tmpvar_4597 = fract((iTime * 4.0));
          highp int tmpvar_4598;
          tmpvar_4598 = (tmpvar_4410 - 1);
          highp int tmpvar_4599;
          if ((_us_4594 >= 0)) {
            tmpvar_4599 = 0;
          } else {
            tmpvar_4599 = 1;
          };
          highp int tmpvar_4600;
          tmpvar_4600 = (4 + tmpvar_4599);
          _uidx1_4595 = tmpvar_4600;
          if ((tmpvar_4598 < 0)) {
            highp int tmpvar_4601;
            if ((_us_4594 >= 0)) {
              tmpvar_4601 = 1;
            } else {
              tmpvar_4601 = 0;
            };
            _uidx1_4595 = (4 + tmpvar_4601);
          };
          highp int tmpvar_4602;
          if ((tmpvar_4598 < 0)) {
            tmpvar_4602 = 3;
          } else {
            tmpvar_4602 = tmpvar_4598;
          };
          float tmpvar_4603;
          tmpvar_4603 = sin(((
            mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
              float(_uidx1_4595)
            , 0.0, 11.0))][int(clamp (
              float(tmpvar_4602)
            , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
              float(tmpvar_4600)
            , 0.0, 11.0))][int(clamp (
              float(tmpvar_4410)
            , 0.0, 3.0))], tmpvar_4597)
           * 3.141593) / 180.0));
          highp int _us_4604;
          _us_4604 = -1;
          highp int _uidx1_4605;
          highp int tmpvar_4606;
          if ((tmpvar_4411 == 0)) {
            tmpvar_4606 = 1;
          } else {
            tmpvar_4606 = -1;
          };
          _us_4604 = -(tmpvar_4606);
          float tmpvar_4607;
          tmpvar_4607 = fract((iTime * 4.0));
          highp int tmpvar_4608;
          tmpvar_4608 = (tmpvar_4410 - 1);
          highp int tmpvar_4609;
          if ((_us_4604 >= 0)) {
            tmpvar_4609 = 0;
          } else {
            tmpvar_4609 = 1;
          };
          highp int tmpvar_4610;
          tmpvar_4610 = (4 + tmpvar_4609);
          _uidx1_4605 = tmpvar_4610;
          if ((tmpvar_4608 < 0)) {
            highp int tmpvar_4611;
            if ((_us_4604 >= 0)) {
              tmpvar_4611 = 1;
            } else {
              tmpvar_4611 = 0;
            };
            _uidx1_4605 = (4 + tmpvar_4611);
          };
          highp int tmpvar_4612;
          if ((tmpvar_4608 < 0)) {
            tmpvar_4612 = 3;
          } else {
            tmpvar_4612 = tmpvar_4608;
          };
          mat2 tmpvar_4613;
          tmpvar_4613[uint(0)].x = tmpvar_4583;
          tmpvar_4613[uint(0)].y = tmpvar_4593;
          tmpvar_4613[1u].x = -(tmpvar_4603);
          tmpvar_4613[1u].y = cos(((
            mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
              float(_uidx1_4605)
            , 0.0, 11.0))][int(clamp (
              float(tmpvar_4612)
            , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
              float(tmpvar_4610)
            , 0.0, 11.0))][int(clamp (
              float(tmpvar_4410)
            , 0.0, 3.0))], tmpvar_4607)
           * 3.141593) / 180.0));
          _upLeg1R_4400.yz = (tmpvar_4573.yz * tmpvar_4613);
          highp vec3 tmpvar_4614;
          tmpvar_4614 = (abs((_upLeg1R_4400 - vec3(0.0, 0.1, 0.0))) - vec3(0.025, 0.1, 0.025));
          highp vec3 tmpvar_4615;
          tmpvar_4615 = max (tmpvar_4614, 0.0);
          highp float tmpvar_4616;
          tmpvar_4616 = min (tmpvar_4572, (sqrt(
            dot (tmpvar_4615, tmpvar_4615)
          ) + min (
            max (tmpvar_4614.x, max (tmpvar_4614.y, tmpvar_4614.z))
          , 0.0)));
          highp vec3 tmpvar_4617;
          tmpvar_4617 = (_upChest_4406 + vec3(0.125, -0.1, 0.0));
          _upArm0L_4399 = tmpvar_4617;
          highp int _uidx1_4618;
          highp int tmpvar_4619;
          if ((tmpvar_4411 == 0)) {
            tmpvar_4619 = 1;
          } else {
            tmpvar_4619 = -1;
          };
          float tmpvar_4620;
          tmpvar_4620 = fract((iTime * 4.0));
          highp int tmpvar_4621;
          tmpvar_4621 = (tmpvar_4410 - 1);
          highp int tmpvar_4622;
          if ((tmpvar_4619 >= 0)) {
            tmpvar_4622 = 0;
          } else {
            tmpvar_4622 = 1;
          };
          highp int tmpvar_4623;
          tmpvar_4623 = (6 + tmpvar_4622);
          _uidx1_4618 = tmpvar_4623;
          if ((tmpvar_4621 < 0)) {
            highp int tmpvar_4624;
            if ((tmpvar_4619 >= 0)) {
              tmpvar_4624 = 1;
            } else {
              tmpvar_4624 = 0;
            };
            _uidx1_4618 = (6 + tmpvar_4624);
          };
          highp int tmpvar_4625;
          if ((tmpvar_4621 < 0)) {
            tmpvar_4625 = 3;
          } else {
            tmpvar_4625 = tmpvar_4621;
          };
          float tmpvar_4626;
          tmpvar_4626 = cos(((
            (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
              clamp (float(_uidx1_4618), 0.0, 11.0)
            )][int(
              clamp (float(tmpvar_4625), 0.0, 3.0)
            )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
              clamp (float(tmpvar_4623), 0.0, 11.0)
            )][int(
              clamp (float(tmpvar_4410), 0.0, 3.0)
            )], tmpvar_4620))
           * 3.141593) / 180.0));
          highp int _uidx1_4627;
          highp int tmpvar_4628;
          if ((tmpvar_4411 == 0)) {
            tmpvar_4628 = 1;
          } else {
            tmpvar_4628 = -1;
          };
          float tmpvar_4629;
          tmpvar_4629 = fract((iTime * 4.0));
          highp int tmpvar_4630;
          tmpvar_4630 = (tmpvar_4410 - 1);
          highp int tmpvar_4631;
          if ((tmpvar_4628 >= 0)) {
            tmpvar_4631 = 0;
          } else {
            tmpvar_4631 = 1;
          };
          highp int tmpvar_4632;
          tmpvar_4632 = (6 + tmpvar_4631);
          _uidx1_4627 = tmpvar_4632;
          if ((tmpvar_4630 < 0)) {
            highp int tmpvar_4633;
            if ((tmpvar_4628 >= 0)) {
              tmpvar_4633 = 1;
            } else {
              tmpvar_4633 = 0;
            };
            _uidx1_4627 = (6 + tmpvar_4633);
          };
          highp int tmpvar_4634;
          if ((tmpvar_4630 < 0)) {
            tmpvar_4634 = 3;
          } else {
            tmpvar_4634 = tmpvar_4630;
          };
          float tmpvar_4635;
          tmpvar_4635 = sin(((
            (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
              clamp (float(_uidx1_4627), 0.0, 11.0)
            )][int(
              clamp (float(tmpvar_4634), 0.0, 3.0)
            )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
              clamp (float(tmpvar_4632), 0.0, 11.0)
            )][int(
              clamp (float(tmpvar_4410), 0.0, 3.0)
            )], tmpvar_4629))
           * 3.141593) / 180.0));
          highp int _uidx1_4636;
          highp int tmpvar_4637;
          if ((tmpvar_4411 == 0)) {
            tmpvar_4637 = 1;
          } else {
            tmpvar_4637 = -1;
          };
          float tmpvar_4638;
          tmpvar_4638 = fract((iTime * 4.0));
          highp int tmpvar_4639;
          tmpvar_4639 = (tmpvar_4410 - 1);
          highp int tmpvar_4640;
          if ((tmpvar_4637 >= 0)) {
            tmpvar_4640 = 0;
          } else {
            tmpvar_4640 = 1;
          };
          highp int tmpvar_4641;
          tmpvar_4641 = (6 + tmpvar_4640);
          _uidx1_4636 = tmpvar_4641;
          if ((tmpvar_4639 < 0)) {
            highp int tmpvar_4642;
            if ((tmpvar_4637 >= 0)) {
              tmpvar_4642 = 1;
            } else {
              tmpvar_4642 = 0;
            };
            _uidx1_4636 = (6 + tmpvar_4642);
          };
          highp int tmpvar_4643;
          if ((tmpvar_4639 < 0)) {
            tmpvar_4643 = 3;
          } else {
            tmpvar_4643 = tmpvar_4639;
          };
          float tmpvar_4644;
          tmpvar_4644 = sin(((
            (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
              clamp (float(_uidx1_4636), 0.0, 11.0)
            )][int(
              clamp (float(tmpvar_4643), 0.0, 3.0)
            )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
              clamp (float(tmpvar_4641), 0.0, 11.0)
            )][int(
              clamp (float(tmpvar_4410), 0.0, 3.0)
            )], tmpvar_4638))
           * 3.141593) / 180.0));
          highp int _uidx1_4645;
          highp int tmpvar_4646;
          if ((tmpvar_4411 == 0)) {
            tmpvar_4646 = 1;
          } else {
            tmpvar_4646 = -1;
          };
          float tmpvar_4647;
          tmpvar_4647 = fract((iTime * 4.0));
          highp int tmpvar_4648;
          tmpvar_4648 = (tmpvar_4410 - 1);
          highp int tmpvar_4649;
          if ((tmpvar_4646 >= 0)) {
            tmpvar_4649 = 0;
          } else {
            tmpvar_4649 = 1;
          };
          highp int tmpvar_4650;
          tmpvar_4650 = (6 + tmpvar_4649);
          _uidx1_4645 = tmpvar_4650;
          if ((tmpvar_4648 < 0)) {
            highp int tmpvar_4651;
            if ((tmpvar_4646 >= 0)) {
              tmpvar_4651 = 1;
            } else {
              tmpvar_4651 = 0;
            };
            _uidx1_4645 = (6 + tmpvar_4651);
          };
          highp int tmpvar_4652;
          if ((tmpvar_4648 < 0)) {
            tmpvar_4652 = 3;
          } else {
            tmpvar_4652 = tmpvar_4648;
          };
          mat2 tmpvar_4653;
          tmpvar_4653[uint(0)].x = tmpvar_4626;
          tmpvar_4653[uint(0)].y = tmpvar_4635;
          tmpvar_4653[1u].x = -(tmpvar_4644);
          tmpvar_4653[1u].y = cos(((
            (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
              clamp (float(_uidx1_4645), 0.0, 11.0)
            )][int(
              clamp (float(tmpvar_4652), 0.0, 3.0)
            )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
              clamp (float(tmpvar_4650), 0.0, 11.0)
            )][int(
              clamp (float(tmpvar_4410), 0.0, 3.0)
            )], tmpvar_4647))
           * 3.141593) / 180.0));
          _upArm0L_4399.yz = (tmpvar_4617.yz * tmpvar_4653);
          highp vec3 tmpvar_4654;
          tmpvar_4654 = (abs((_upArm0L_4399 - vec3(0.0, 0.08, 0.0))) - vec3(0.02, 0.08, 0.02));
          highp vec3 tmpvar_4655;
          tmpvar_4655 = max (tmpvar_4654, 0.0);
          highp float tmpvar_4656;
          tmpvar_4656 = min (tmpvar_4616, (sqrt(
            dot (tmpvar_4655, tmpvar_4655)
          ) + min (
            max (tmpvar_4654.x, max (tmpvar_4654.y, tmpvar_4654.z))
          , 0.0)));
          highp vec3 tmpvar_4657;
          tmpvar_4657 = (_upArm0L_4399 + vec3(0.0, -0.16, 0.0));
          _upArm1L_4398 = tmpvar_4657;
          highp int _uidx1_4658;
          highp int tmpvar_4659;
          if ((tmpvar_4411 == 0)) {
            tmpvar_4659 = 1;
          } else {
            tmpvar_4659 = -1;
          };
          float tmpvar_4660;
          tmpvar_4660 = fract((iTime * 4.0));
          highp int tmpvar_4661;
          tmpvar_4661 = (tmpvar_4410 - 1);
          highp int tmpvar_4662;
          if ((tmpvar_4659 >= 0)) {
            tmpvar_4662 = 0;
          } else {
            tmpvar_4662 = 1;
          };
          highp int tmpvar_4663;
          tmpvar_4663 = (8 + tmpvar_4662);
          _uidx1_4658 = tmpvar_4663;
          if ((tmpvar_4661 < 0)) {
            highp int tmpvar_4664;
            if ((tmpvar_4659 >= 0)) {
              tmpvar_4664 = 1;
            } else {
              tmpvar_4664 = 0;
            };
            _uidx1_4658 = (8 + tmpvar_4664);
          };
          highp int tmpvar_4665;
          if ((tmpvar_4661 < 0)) {
            tmpvar_4665 = 3;
          } else {
            tmpvar_4665 = tmpvar_4661;
          };
          float tmpvar_4666;
          tmpvar_4666 = cos(((
            mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
              float(_uidx1_4658)
            , 0.0, 11.0))][int(clamp (
              float(tmpvar_4665)
            , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
              float(tmpvar_4663)
            , 0.0, 11.0))][int(clamp (
              float(tmpvar_4410)
            , 0.0, 3.0))], tmpvar_4660)
           * 3.141593) / 180.0));
          highp int _uidx1_4667;
          highp int tmpvar_4668;
          if ((tmpvar_4411 == 0)) {
            tmpvar_4668 = 1;
          } else {
            tmpvar_4668 = -1;
          };
          float tmpvar_4669;
          tmpvar_4669 = fract((iTime * 4.0));
          highp int tmpvar_4670;
          tmpvar_4670 = (tmpvar_4410 - 1);
          highp int tmpvar_4671;
          if ((tmpvar_4668 >= 0)) {
            tmpvar_4671 = 0;
          } else {
            tmpvar_4671 = 1;
          };
          highp int tmpvar_4672;
          tmpvar_4672 = (8 + tmpvar_4671);
          _uidx1_4667 = tmpvar_4672;
          if ((tmpvar_4670 < 0)) {
            highp int tmpvar_4673;
            if ((tmpvar_4668 >= 0)) {
              tmpvar_4673 = 1;
            } else {
              tmpvar_4673 = 0;
            };
            _uidx1_4667 = (8 + tmpvar_4673);
          };
          highp int tmpvar_4674;
          if ((tmpvar_4670 < 0)) {
            tmpvar_4674 = 3;
          } else {
            tmpvar_4674 = tmpvar_4670;
          };
          float tmpvar_4675;
          tmpvar_4675 = sin(((
            mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
              float(_uidx1_4667)
            , 0.0, 11.0))][int(clamp (
              float(tmpvar_4674)
            , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
              float(tmpvar_4672)
            , 0.0, 11.0))][int(clamp (
              float(tmpvar_4410)
            , 0.0, 3.0))], tmpvar_4669)
           * 3.141593) / 180.0));
          highp int _uidx1_4676;
          highp int tmpvar_4677;
          if ((tmpvar_4411 == 0)) {
            tmpvar_4677 = 1;
          } else {
            tmpvar_4677 = -1;
          };
          float tmpvar_4678;
          tmpvar_4678 = fract((iTime * 4.0));
          highp int tmpvar_4679;
          tmpvar_4679 = (tmpvar_4410 - 1);
          highp int tmpvar_4680;
          if ((tmpvar_4677 >= 0)) {
            tmpvar_4680 = 0;
          } else {
            tmpvar_4680 = 1;
          };
          highp int tmpvar_4681;
          tmpvar_4681 = (8 + tmpvar_4680);
          _uidx1_4676 = tmpvar_4681;
          if ((tmpvar_4679 < 0)) {
            highp int tmpvar_4682;
            if ((tmpvar_4677 >= 0)) {
              tmpvar_4682 = 1;
            } else {
              tmpvar_4682 = 0;
            };
            _uidx1_4676 = (8 + tmpvar_4682);
          };
          highp int tmpvar_4683;
          if ((tmpvar_4679 < 0)) {
            tmpvar_4683 = 3;
          } else {
            tmpvar_4683 = tmpvar_4679;
          };
          float tmpvar_4684;
          tmpvar_4684 = sin(((
            mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
              float(_uidx1_4676)
            , 0.0, 11.0))][int(clamp (
              float(tmpvar_4683)
            , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
              float(tmpvar_4681)
            , 0.0, 11.0))][int(clamp (
              float(tmpvar_4410)
            , 0.0, 3.0))], tmpvar_4678)
           * 3.141593) / 180.0));
          highp int _uidx1_4685;
          highp int tmpvar_4686;
          if ((tmpvar_4411 == 0)) {
            tmpvar_4686 = 1;
          } else {
            tmpvar_4686 = -1;
          };
          float tmpvar_4687;
          tmpvar_4687 = fract((iTime * 4.0));
          highp int tmpvar_4688;
          tmpvar_4688 = (tmpvar_4410 - 1);
          highp int tmpvar_4689;
          if ((tmpvar_4686 >= 0)) {
            tmpvar_4689 = 0;
          } else {
            tmpvar_4689 = 1;
          };
          highp int tmpvar_4690;
          tmpvar_4690 = (8 + tmpvar_4689);
          _uidx1_4685 = tmpvar_4690;
          if ((tmpvar_4688 < 0)) {
            highp int tmpvar_4691;
            if ((tmpvar_4686 >= 0)) {
              tmpvar_4691 = 1;
            } else {
              tmpvar_4691 = 0;
            };
            _uidx1_4685 = (8 + tmpvar_4691);
          };
          highp int tmpvar_4692;
          if ((tmpvar_4688 < 0)) {
            tmpvar_4692 = 3;
          } else {
            tmpvar_4692 = tmpvar_4688;
          };
          mat2 tmpvar_4693;
          tmpvar_4693[uint(0)].x = tmpvar_4666;
          tmpvar_4693[uint(0)].y = tmpvar_4675;
          tmpvar_4693[1u].x = -(tmpvar_4684);
          tmpvar_4693[1u].y = cos(((
            mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
              float(_uidx1_4685)
            , 0.0, 11.0))][int(clamp (
              float(tmpvar_4692)
            , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
              float(tmpvar_4690)
            , 0.0, 11.0))][int(clamp (
              float(tmpvar_4410)
            , 0.0, 3.0))], tmpvar_4687)
           * 3.141593) / 180.0));
          _upArm1L_4398.yz = (tmpvar_4657.yz * tmpvar_4693);
          highp vec3 tmpvar_4694;
          tmpvar_4694 = (abs((_upArm1L_4398 - vec3(0.0, 0.08, 0.0))) - vec3(0.02, 0.08, 0.02));
          highp vec3 tmpvar_4695;
          tmpvar_4695 = max (tmpvar_4694, 0.0);
          highp float tmpvar_4696;
          tmpvar_4696 = min (tmpvar_4656, (sqrt(
            dot (tmpvar_4695, tmpvar_4695)
          ) + min (
            max (tmpvar_4694.x, max (tmpvar_4694.y, tmpvar_4694.z))
          , 0.0)));
          highp vec3 tmpvar_4697;
          tmpvar_4697 = (_upChest_4406 + vec3(-0.125, -0.1, 0.0));
          _upArm0R_4397 = tmpvar_4697;
          highp int _us_4698;
          _us_4698 = -1;
          highp int _uidx1_4699;
          highp int tmpvar_4700;
          if ((tmpvar_4411 == 0)) {
            tmpvar_4700 = 1;
          } else {
            tmpvar_4700 = -1;
          };
          _us_4698 = -(tmpvar_4700);
          float tmpvar_4701;
          tmpvar_4701 = fract((iTime * 4.0));
          highp int tmpvar_4702;
          tmpvar_4702 = (tmpvar_4410 - 1);
          highp int tmpvar_4703;
          if ((_us_4698 >= 0)) {
            tmpvar_4703 = 0;
          } else {
            tmpvar_4703 = 1;
          };
          highp int tmpvar_4704;
          tmpvar_4704 = (6 + tmpvar_4703);
          _uidx1_4699 = tmpvar_4704;
          if ((tmpvar_4702 < 0)) {
            highp int tmpvar_4705;
            if ((_us_4698 >= 0)) {
              tmpvar_4705 = 1;
            } else {
              tmpvar_4705 = 0;
            };
            _uidx1_4699 = (6 + tmpvar_4705);
          };
          highp int tmpvar_4706;
          if ((tmpvar_4702 < 0)) {
            tmpvar_4706 = 3;
          } else {
            tmpvar_4706 = tmpvar_4702;
          };
          float tmpvar_4707;
          tmpvar_4707 = cos(((
            (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
              clamp (float(_uidx1_4699), 0.0, 11.0)
            )][int(
              clamp (float(tmpvar_4706), 0.0, 3.0)
            )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
              clamp (float(tmpvar_4704), 0.0, 11.0)
            )][int(
              clamp (float(tmpvar_4410), 0.0, 3.0)
            )], tmpvar_4701))
           * 3.141593) / 180.0));
          highp int _us_4708;
          _us_4708 = -1;
          highp int _uidx1_4709;
          highp int tmpvar_4710;
          if ((tmpvar_4411 == 0)) {
            tmpvar_4710 = 1;
          } else {
            tmpvar_4710 = -1;
          };
          _us_4708 = -(tmpvar_4710);
          float tmpvar_4711;
          tmpvar_4711 = fract((iTime * 4.0));
          highp int tmpvar_4712;
          tmpvar_4712 = (tmpvar_4410 - 1);
          highp int tmpvar_4713;
          if ((_us_4708 >= 0)) {
            tmpvar_4713 = 0;
          } else {
            tmpvar_4713 = 1;
          };
          highp int tmpvar_4714;
          tmpvar_4714 = (6 + tmpvar_4713);
          _uidx1_4709 = tmpvar_4714;
          if ((tmpvar_4712 < 0)) {
            highp int tmpvar_4715;
            if ((_us_4708 >= 0)) {
              tmpvar_4715 = 1;
            } else {
              tmpvar_4715 = 0;
            };
            _uidx1_4709 = (6 + tmpvar_4715);
          };
          highp int tmpvar_4716;
          if ((tmpvar_4712 < 0)) {
            tmpvar_4716 = 3;
          } else {
            tmpvar_4716 = tmpvar_4712;
          };
          float tmpvar_4717;
          tmpvar_4717 = sin(((
            (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
              clamp (float(_uidx1_4709), 0.0, 11.0)
            )][int(
              clamp (float(tmpvar_4716), 0.0, 3.0)
            )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
              clamp (float(tmpvar_4714), 0.0, 11.0)
            )][int(
              clamp (float(tmpvar_4410), 0.0, 3.0)
            )], tmpvar_4711))
           * 3.141593) / 180.0));
          highp int _us_4718;
          _us_4718 = -1;
          highp int _uidx1_4719;
          highp int tmpvar_4720;
          if ((tmpvar_4411 == 0)) {
            tmpvar_4720 = 1;
          } else {
            tmpvar_4720 = -1;
          };
          _us_4718 = -(tmpvar_4720);
          float tmpvar_4721;
          tmpvar_4721 = fract((iTime * 4.0));
          highp int tmpvar_4722;
          tmpvar_4722 = (tmpvar_4410 - 1);
          highp int tmpvar_4723;
          if ((_us_4718 >= 0)) {
            tmpvar_4723 = 0;
          } else {
            tmpvar_4723 = 1;
          };
          highp int tmpvar_4724;
          tmpvar_4724 = (6 + tmpvar_4723);
          _uidx1_4719 = tmpvar_4724;
          if ((tmpvar_4722 < 0)) {
            highp int tmpvar_4725;
            if ((_us_4718 >= 0)) {
              tmpvar_4725 = 1;
            } else {
              tmpvar_4725 = 0;
            };
            _uidx1_4719 = (6 + tmpvar_4725);
          };
          highp int tmpvar_4726;
          if ((tmpvar_4722 < 0)) {
            tmpvar_4726 = 3;
          } else {
            tmpvar_4726 = tmpvar_4722;
          };
          float tmpvar_4727;
          tmpvar_4727 = sin(((
            (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
              clamp (float(_uidx1_4719), 0.0, 11.0)
            )][int(
              clamp (float(tmpvar_4726), 0.0, 3.0)
            )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
              clamp (float(tmpvar_4724), 0.0, 11.0)
            )][int(
              clamp (float(tmpvar_4410), 0.0, 3.0)
            )], tmpvar_4721))
           * 3.141593) / 180.0));
          highp int _us_4728;
          _us_4728 = -1;
          highp int _uidx1_4729;
          highp int tmpvar_4730;
          if ((tmpvar_4411 == 0)) {
            tmpvar_4730 = 1;
          } else {
            tmpvar_4730 = -1;
          };
          _us_4728 = -(tmpvar_4730);
          float tmpvar_4731;
          tmpvar_4731 = fract((iTime * 4.0));
          highp int tmpvar_4732;
          tmpvar_4732 = (tmpvar_4410 - 1);
          highp int tmpvar_4733;
          if ((_us_4728 >= 0)) {
            tmpvar_4733 = 0;
          } else {
            tmpvar_4733 = 1;
          };
          highp int tmpvar_4734;
          tmpvar_4734 = (6 + tmpvar_4733);
          _uidx1_4729 = tmpvar_4734;
          if ((tmpvar_4732 < 0)) {
            highp int tmpvar_4735;
            if ((_us_4728 >= 0)) {
              tmpvar_4735 = 1;
            } else {
              tmpvar_4735 = 0;
            };
            _uidx1_4729 = (6 + tmpvar_4735);
          };
          highp int tmpvar_4736;
          if ((tmpvar_4732 < 0)) {
            tmpvar_4736 = 3;
          } else {
            tmpvar_4736 = tmpvar_4732;
          };
          mat2 tmpvar_4737;
          tmpvar_4737[uint(0)].x = tmpvar_4707;
          tmpvar_4737[uint(0)].y = tmpvar_4717;
          tmpvar_4737[1u].x = -(tmpvar_4727);
          tmpvar_4737[1u].y = cos(((
            (180.0 + mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
              clamp (float(_uidx1_4729), 0.0, 11.0)
            )][int(
              clamp (float(tmpvar_4736), 0.0, 3.0)
            )], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(
              clamp (float(tmpvar_4734), 0.0, 11.0)
            )][int(
              clamp (float(tmpvar_4410), 0.0, 3.0)
            )], tmpvar_4731))
           * 3.141593) / 180.0));
          _upArm0R_4397.yz = (tmpvar_4697.yz * tmpvar_4737);
          highp vec3 tmpvar_4738;
          tmpvar_4738 = (abs((_upArm0R_4397 - vec3(0.0, 0.08, 0.0))) - vec3(0.02, 0.08, 0.02));
          highp vec3 tmpvar_4739;
          tmpvar_4739 = max (tmpvar_4738, 0.0);
          highp float tmpvar_4740;
          tmpvar_4740 = min (tmpvar_4696, (sqrt(
            dot (tmpvar_4739, tmpvar_4739)
          ) + min (
            max (tmpvar_4738.x, max (tmpvar_4738.y, tmpvar_4738.z))
          , 0.0)));
          highp vec3 tmpvar_4741;
          tmpvar_4741 = (_upArm0R_4397 + vec3(0.0, -0.16, 0.0));
          _upArm1R_4396 = tmpvar_4741;
          highp int _us_4742;
          _us_4742 = -1;
          highp int _uidx1_4743;
          highp int tmpvar_4744;
          if ((tmpvar_4411 == 0)) {
            tmpvar_4744 = 1;
          } else {
            tmpvar_4744 = -1;
          };
          _us_4742 = -(tmpvar_4744);
          float tmpvar_4745;
          tmpvar_4745 = fract((iTime * 4.0));
          highp int tmpvar_4746;
          tmpvar_4746 = (tmpvar_4410 - 1);
          highp int tmpvar_4747;
          if ((_us_4742 >= 0)) {
            tmpvar_4747 = 0;
          } else {
            tmpvar_4747 = 1;
          };
          highp int tmpvar_4748;
          tmpvar_4748 = (8 + tmpvar_4747);
          _uidx1_4743 = tmpvar_4748;
          if ((tmpvar_4746 < 0)) {
            highp int tmpvar_4749;
            if ((_us_4742 >= 0)) {
              tmpvar_4749 = 1;
            } else {
              tmpvar_4749 = 0;
            };
            _uidx1_4743 = (8 + tmpvar_4749);
          };
          highp int tmpvar_4750;
          if ((tmpvar_4746 < 0)) {
            tmpvar_4750 = 3;
          } else {
            tmpvar_4750 = tmpvar_4746;
          };
          float tmpvar_4751;
          tmpvar_4751 = cos(((
            mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
              float(_uidx1_4743)
            , 0.0, 11.0))][int(clamp (
              float(tmpvar_4750)
            , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
              float(tmpvar_4748)
            , 0.0, 11.0))][int(clamp (
              float(tmpvar_4410)
            , 0.0, 3.0))], tmpvar_4745)
           * 3.141593) / 180.0));
          highp int _us_4752;
          _us_4752 = -1;
          highp int _uidx1_4753;
          highp int tmpvar_4754;
          if ((tmpvar_4411 == 0)) {
            tmpvar_4754 = 1;
          } else {
            tmpvar_4754 = -1;
          };
          _us_4752 = -(tmpvar_4754);
          float tmpvar_4755;
          tmpvar_4755 = fract((iTime * 4.0));
          highp int tmpvar_4756;
          tmpvar_4756 = (tmpvar_4410 - 1);
          highp int tmpvar_4757;
          if ((_us_4752 >= 0)) {
            tmpvar_4757 = 0;
          } else {
            tmpvar_4757 = 1;
          };
          highp int tmpvar_4758;
          tmpvar_4758 = (8 + tmpvar_4757);
          _uidx1_4753 = tmpvar_4758;
          if ((tmpvar_4756 < 0)) {
            highp int tmpvar_4759;
            if ((_us_4752 >= 0)) {
              tmpvar_4759 = 1;
            } else {
              tmpvar_4759 = 0;
            };
            _uidx1_4753 = (8 + tmpvar_4759);
          };
          highp int tmpvar_4760;
          if ((tmpvar_4756 < 0)) {
            tmpvar_4760 = 3;
          } else {
            tmpvar_4760 = tmpvar_4756;
          };
          float tmpvar_4761;
          tmpvar_4761 = sin(((
            mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
              float(_uidx1_4753)
            , 0.0, 11.0))][int(clamp (
              float(tmpvar_4760)
            , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
              float(tmpvar_4758)
            , 0.0, 11.0))][int(clamp (
              float(tmpvar_4410)
            , 0.0, 3.0))], tmpvar_4755)
           * 3.141593) / 180.0));
          highp int _us_4762;
          _us_4762 = -1;
          highp int _uidx1_4763;
          highp int tmpvar_4764;
          if ((tmpvar_4411 == 0)) {
            tmpvar_4764 = 1;
          } else {
            tmpvar_4764 = -1;
          };
          _us_4762 = -(tmpvar_4764);
          float tmpvar_4765;
          tmpvar_4765 = fract((iTime * 4.0));
          highp int tmpvar_4766;
          tmpvar_4766 = (tmpvar_4410 - 1);
          highp int tmpvar_4767;
          if ((_us_4762 >= 0)) {
            tmpvar_4767 = 0;
          } else {
            tmpvar_4767 = 1;
          };
          highp int tmpvar_4768;
          tmpvar_4768 = (8 + tmpvar_4767);
          _uidx1_4763 = tmpvar_4768;
          if ((tmpvar_4766 < 0)) {
            highp int tmpvar_4769;
            if ((_us_4762 >= 0)) {
              tmpvar_4769 = 1;
            } else {
              tmpvar_4769 = 0;
            };
            _uidx1_4763 = (8 + tmpvar_4769);
          };
          highp int tmpvar_4770;
          if ((tmpvar_4766 < 0)) {
            tmpvar_4770 = 3;
          } else {
            tmpvar_4770 = tmpvar_4766;
          };
          float tmpvar_4771;
          tmpvar_4771 = sin(((
            mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
              float(_uidx1_4763)
            , 0.0, 11.0))][int(clamp (
              float(tmpvar_4770)
            , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
              float(tmpvar_4768)
            , 0.0, 11.0))][int(clamp (
              float(tmpvar_4410)
            , 0.0, 3.0))], tmpvar_4765)
           * 3.141593) / 180.0));
          highp int _us_4772;
          _us_4772 = -1;
          highp int _uidx1_4773;
          highp int tmpvar_4774;
          if ((tmpvar_4411 == 0)) {
            tmpvar_4774 = 1;
          } else {
            tmpvar_4774 = -1;
          };
          _us_4772 = -(tmpvar_4774);
          float tmpvar_4775;
          tmpvar_4775 = fract((iTime * 4.0));
          highp int tmpvar_4776;
          tmpvar_4776 = (tmpvar_4410 - 1);
          highp int tmpvar_4777;
          if ((_us_4772 >= 0)) {
            tmpvar_4777 = 0;
          } else {
            tmpvar_4777 = 1;
          };
          highp int tmpvar_4778;
          tmpvar_4778 = (8 + tmpvar_4777);
          _uidx1_4773 = tmpvar_4778;
          if ((tmpvar_4776 < 0)) {
            highp int tmpvar_4779;
            if ((_us_4772 >= 0)) {
              tmpvar_4779 = 1;
            } else {
              tmpvar_4779 = 0;
            };
            _uidx1_4773 = (8 + tmpvar_4779);
          };
          highp int tmpvar_4780;
          if ((tmpvar_4776 < 0)) {
            tmpvar_4780 = 3;
          } else {
            tmpvar_4780 = tmpvar_4776;
          };
          mat2 tmpvar_4781;
          tmpvar_4781[uint(0)].x = tmpvar_4751;
          tmpvar_4781[uint(0)].y = tmpvar_4761;
          tmpvar_4781[1u].x = -(tmpvar_4771);
          tmpvar_4781[1u].y = cos(((
            mix (vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
              float(_uidx1_4773)
            , 0.0, 11.0))][int(clamp (
              float(tmpvar_4780)
            , 0.0, 3.0))], vec4[12](vec4(0.09, 0.08, 0.09, 0.1), vec4(0.09, 0.08, 0.09, 0.1), vec4(20.0, 20.0, 0.0, -10.0), vec4(-15.0, 5.0, 15.0, 40.0), vec4(0.0, -20.0, 0.0, 0.0), vec4(0.0, -40.0, -65.0, -70.0), vec4(-20.0, -10.0, 0.0, 10.0), vec4(20.0, 10.0, 0.0, -10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(10.0, 0.0, 0.0, 10.0), vec4(1.0, -2.0, -4.0, -3.0), vec4(-1.0, 2.0, 4.0, 3.0))[int(clamp (
              float(tmpvar_4778)
            , 0.0, 11.0))][int(clamp (
              float(tmpvar_4410)
            , 0.0, 3.0))], tmpvar_4775)
           * 3.141593) / 180.0));
          _upArm1R_4396.yz = (tmpvar_4741.yz * tmpvar_4781);
          highp vec3 tmpvar_4782;
          tmpvar_4782 = (abs((_upArm1R_4396 - vec3(0.0, 0.08, 0.0))) - vec3(0.02, 0.08, 0.02));
          highp vec3 tmpvar_4783;
          tmpvar_4783 = max (tmpvar_4782, 0.0);
          highp vec4 tmpvar_4784;
          tmpvar_4784.yzw = vec3(0.2, 0.0, 0.0);
          tmpvar_4784.x = min (tmpvar_4740, (sqrt(
            dot (tmpvar_4783, tmpvar_4783)
          ) + min (
            max (tmpvar_4782.x, max (tmpvar_4782.y, tmpvar_4782.z))
          , 0.0)));
          tmpvar_4395 = tmpvar_4784;
        } else {
          tmpvar_4395 = tmpvar_3996;
        };
        _uhit_3993 = tmpvar_4395;
      };
      _unewD_3990 = _uhit_3993.x;
      _ud_3991 = min (4.5, (_ud_3991 + _uhit_3993.x));
    };
    _ushadow_3985 = (1.0 - (_ud_3991 / 4.5));
    _ucol_11.xyz = (((vec3(0.1, 0.1, 0.1) + 
      (vec3(0.0, 0.1, 0.2) * tmpvar_3983)
    ) + (vec3(0.4, 0.3, 0.2) * tmpvar_3984)) + (vec3(0.6, 0.6, 0.6) * clamp (
      (tmpvar_3987 - _ushadow_3985)
    , 0.0, 1.0)));
    _ucol_11.w = 1.0;
  };
  _ucol_1 = _ucol_11;
  if ((_ucol_11.w < 0.01)) {
    highp vec3 _urd_4785;
    _urd_4785.y = _urd_2.y;
    _urd_4785.xz = (mat2(0.7660444, 0.6427876, -0.6427876, 0.7660444) * _urd_2.xz);
    _ucol_1 = mix (vec4(1.0, 1.0, 1.0, 1.0), (clamp (
      (tmpvar_9.y + 0.5)
    , 0.0, 1.0) * (
      (vec4(0.7, 0.8, 0.9, 1.0) * clamp (-(_urd_4785.z), 0.0, 1.0))
     + 
      (vec4(0.8, 0.6, 0.4, 1.0) * clamp ((_urd_4785.z - 0.25), 0.0, 1.0))
    )), clamp ((
      -(tmpvar_9.y)
     + 1.35), 0.0, 1.0));
  };
  fragColor = _ucol_1;
}
