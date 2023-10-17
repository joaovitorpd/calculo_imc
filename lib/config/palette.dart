import 'package:flutter/material.dart';

class Palette {
  static const MaterialColor modoEscuro = MaterialColor(
    0xff95ba00, //0% entra aqui, será a cor escolhida se nenhum matiz for selecionado ao definir uma propriedade Color que não requer uma amostra.
    <int, Color>{
      50: Color(0xff86a700), //10%
      100: Color(0xff779500), //20%
      200: Color(0xff688200), //30%
      300: Color(0xff597000), //40%
      400: Color(0xff4b5d00), //50%
      500: Color(0xff3c4a00), //60%
      600: Color(0xff2d3800), //70%
      700: Color(0xff1e2500), //80%
      800: Color(0xff0f1300), //90%
      900: Color(0xff000000), //100%
    },
  );
}
