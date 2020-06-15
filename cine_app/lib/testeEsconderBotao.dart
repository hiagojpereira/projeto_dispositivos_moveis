import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isButtonDisabled;

  @override
  void initState() {
    _isButtonDisabled = false;
  }

  void btnTrue() {
    setState(() {
      _isButtonDisabled = true;
    });
  }

  void btnFalse() {
    setState(() {
      _isButtonDisabled = false;
    });
  }

  Widget azul(contexto){
    return Container(
      height: 100,
      width: 100,
      color: Colors.blue,
    );
  }

  Widget amarelo(contexto){
    return Container(
      height: 100,
      width: 100,
      color: Colors.yellow,
    );
  }

  Widget vermelho(contexto){
    return Container(
      height: 100,
      width: 100,
      color: Colors.red,
    );
  }

  botao(){
    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: RaisedButton(
        child: Text(
          "Registrar",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        color: Colors.grey[500],
          //evento do botão
        onPressed: () {
          btnTrue();
        },
      )
    );
  }

  botaoF(){
    return new RaisedButton(onPressed: () {
      btnFalse();
    } );
  }

  @override
  Widget build(BuildContext context) {
    if(_isButtonDisabled){
      return Scaffold(
        appBar: AppBar(
          title: Text("3 quadrados")
        ),

        body: Center(
          child: Column(
            children: <Widget>[
              azul(context),
              amarelo(context),
              vermelho(context),
              botaoF()
            ]
          )
        )
      );
    }
    else{
      return Scaffold(
        appBar: AppBar(
          title: Text("1 quadrado")
        ),

        body: Center(
          child: Column(
            children: <Widget>[
              azul(context),
              botao()
            ]
          )
        )
      );
    }
  }
    

}