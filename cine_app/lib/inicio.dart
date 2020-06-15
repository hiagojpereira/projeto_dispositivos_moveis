import 'package:flutter/material.dart';

class Inicio extends StatefulWidget {
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          color: Colors.black,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,      
          child: ListTile(                                                 
            title: Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Image.asset("assets/imagens/cine_app.png")
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Text(
                    "Toque: ir para Aplicação. \nToque e segure: ir para Sobre.", 
                    style: TextStyle(
                      color: Colors.white)
                  )
                )
              ],
            ),
            onTap: (){
              Navigator.pushNamed(context, "/login", );              
            },
            onLongPress: (){
              Navigator.pushNamed(context, "/sobre", );
            },
          ),
        )
        ),
      );
  }
}


