import 'package:flutter/material.dart';

class OperacionesBasicasPage extends StatefulWidget {
  final String _nombre;
  const OperacionesBasicasPage(this._nombre);
  @override
  _OperacionesBasicasPageState createState() => _OperacionesBasicasPageState();
}

class _OperacionesBasicasPageState extends State<OperacionesBasicasPage> {
  String _nombre='';
  double _numero1=0;
  double _numero2=0;
  double _resultado=0;
  @override
  Widget build(BuildContext context) {
    _nombre=widget._nombre;
    return Scaffold(
      appBar: AppBar(
        title: Text('Cálculo de $_nombre'),
        ),
        body: ListView(
         padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
         children: <Widget>[
           _crearInput1(),
           Divider(),
           _crearInput2(),
           Divider(),
           _crearButton(),
           Divider(),
           _darResultado(),
         ],
       )
    );
  }

  Widget _crearInput1() {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: '0',  
      ),   
      onChanged: (valor){
        setState(() {
          if(valor==''){
            _numero1=0;
          }else{
            _numero1 = double.parse(valor);  
          }
        });
      },  
    ); 
  }

  Widget _crearInput2() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: '0',
      ),   
      onChanged: (valor){
        setState(() {
          if(valor==''){
            if(_nombre=='division'){
              print ('No se puede realizar division entre 0');
            }else{
              print('Hola');
              _numero2=0;
            }
          
          }else{
            _numero2 = double.parse(valor);
            //return('Aqui');  
          }
        });
      },
      validator: (value) {
        if (value == '1' ) {
          return 'Please enter some text';
        }
        return null;
      },
    );
  }

  Widget _crearButton() {
    return ElevatedButton(
      child: Text('Calcular'),
      onPressed: (){
        _resultado=_calculo();
        _darResultado();
        setState(() {});
      } 
    );
  }

  Widget _darResultado() {
    return ListTile(
      title: Text('$_nombre de $_numero1 y $_numero2 es $_resultado'),
    );
  }

  double _calculo(){
    double resultado=0;
    if(_nombre=='suma'){
      resultado = _numero1 + _numero2;
    }else if(_nombre=='resta'){
      resultado= _numero1 - _numero2;
    }else if(_nombre=='multiplicacion'){
      resultado= _numero1 * _numero2;
    }else if(_nombre=='division'){
      resultado= _numero1 / _numero2;
    }
    return resultado;
  }

  
}