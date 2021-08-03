import 'package:flutter/material.dart';

import 'package:calculadora/src/pages/factorial.dart';
import 'package:calculadora/src/pages/home_page.dart';
import 'package:calculadora/src/pages/operaciones_basicas.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {

  return <String, WidgetBuilder> {
      '/'      : ( BuildContext context ) => HomePage(),
      'sumas'  : ( BuildContext context ) => OperacionesBasicasPage('suma'),
      'restas'   : ( BuildContext context ) => OperacionesBasicasPage('resta'),
      'multiplicaciones'   : ( BuildContext context ) => OperacionesBasicasPage('multiplicacion'),
      'divisiones' : ( BuildContext context ) => OperacionesBasicasPage('division'),
      'factorial' : ( BuildContext context ) => FactorialPage(),
  };

}