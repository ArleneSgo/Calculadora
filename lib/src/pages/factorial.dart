//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FactorialPage extends StatefulWidget {
  

  @override
  _FactorialPageState createState() => _FactorialPageState();
}

class _FactorialPageState extends State<FactorialPage> {
  double _numero = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('Cálculo del Factorial'),
       ),
       body: ListView(
         padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
         children: <Widget>[
           _crearInput(),
           Divider(),
           _darResultado()
         ],
       )
    );
  }

  Widget _crearInput() {
    return TextField(
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
      
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: '0',  
      ),
      
      onChanged: (valor){
        setState(() {
          if(valor==''){
            valor='0';
          }else{
            _numero = double.parse(valor);  
          }
        });
      },
    );
  }

  Widget _darResultado() {
    double _resultado = _calculoFactorial();
    return ListTile(
      title: Text('El factorial de $_numero es $_resultado'),
    );
  }
  double _calculoFactorial(){
    double resultado = 1;
      if(_numero < 2){
        resultado = 1;
      }else{
        for(double i = 1; i <= _numero; i++){
          resultado = resultado * i;
        }
      }
    return resultado;
  }
}