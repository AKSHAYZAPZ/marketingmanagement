import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color blueGray50 = fromHex('#e8eff3');

  static Color blueA700 = fromHex('#0153fc');

  static Color lightGreenA700 = fromHex('#3fb507');

  static Color lightBlueA200 = fromHex('#3cb5fc');

  static Color lightBlue700 = fromHex('#008dd4');

  static Color gray80003 = fromHex('#505050');

  static Color gray80002 = fromHex('#4f4f4f');

  static Color gray80001 = fromHex('#333a42');

  static Color black9003f = fromHex('#3f000000');

  static Color gray80087 = fromHex('#874f4f4f');

  static Color gray50 = fromHex('#f0f9ff');

  static Color teal300 = fromHex('#48b1bf');

  static Color yellowA400 = fromHex('#ffe500');

  static Color black900 = fromHex('#000000');

  static Color blueGray900 = fromHex('#2f3733');

  static Color blueGray5001 = fromHex('#eff1f3');

  static Color gray700 = fromHex('#656070');

  static Color blueGray100 = fromHex('#d9d9d9');

  static Color blueGray400 = fromHex('#7d8fab');

  static Color gray800 = fromHex('#383838');

  static Color gray900 = fromHex('#1e1e1e');

  static Color blue600 = fromHex('#2590cf');

  static Color gray200A2 = fromHex('#a2efefef');

  static Color orange600 = fromHex('#fe8201');

  static Color gray300 = fromHex('#dbdbde');

  static Color gray100 = fromHex('#f2f2f2');

  static Color lightBlue70001 = fromHex('#1195ce');

  static Color indigoA700 = fromHex('#0148fc');

  static Color blueGray40001 = fromHex('#888888');

  static Color whiteA700 = fromHex('#ffffff');

  static Color bluelite = fromHex('#E1EFFF');

  static Color bluelite100 = fromHex('#DEEFFF');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
