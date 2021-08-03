import 'package:flutter/material.dart';

import 'package:calculadora/src/providers/menu_providers.dart';

class HomePage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora'),
      ),
      body: _lista()
    );
  }
  Widget _lista() {

    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: ( context, AsyncSnapshot<List<dynamic>> snapshot ){
        return ListView(
          children: _listaItems( snapshot.data!, context ),
        );

      },
    );
  }
  List<Widget> _listaItems( List<dynamic> data, BuildContext context ) {

    final List<Widget> opciones = [];


    data.forEach( (opt) {

      final widgetTemp = ListTile(
        title: Text( opt['texto'] ),
        onTap: () {

          Navigator.pushNamed(context, opt['ruta'] );

        },
      );

      opciones..add( widgetTemp )
              ..add( Divider() );

    });

    return opciones;

  }
}