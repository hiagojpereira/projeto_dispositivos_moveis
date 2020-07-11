import 'package:flutter/material.dart';

class Sobre extends StatefulWidget {
  @override
  _SobreState createState() => _SobreState();
}



class _SobreState extends State<Sobre> {

  String tema = "Aplicativo para listar filmes";
  String descricao = "Bem vindo ao Cine App. \nCine App é um aplicativo para a listagem de filmes, séries e animações, permitindo que o usuário desfrute do conteúdo disponibilizado.";
  String dev = "Hiago J. Pereira";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Sobre"),        
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: [
            IconButton(
              icon: Icon(Icons.arrow_back), 
              onPressed: (){
                Navigator.pop(context);
              }
            ),
          ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.05,
            padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
            child: Center(
              child: Text(
                tema,
                style: TextStyle(
                  fontSize: 22, 
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[500]
                )
              )
            )
          ),

          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
            child: Container(
              child: Center(
                child: Text(
                  descricao, 
                  style: TextStyle(
                    fontSize: 18, 
                    fontWeight: FontWeight.bold,
                    color: Colors.yellow
                  )
                )
              )
            ),                 
          ),

          Container(
            height: MediaQuery.of(context).size.height * 0.45,
            padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
            child: Center(
              child: Image.asset("assets/imagens/foto_1.jpg")
            ),           
          ),

          Container(
            height: MediaQuery.of(context).size.height * 0.05,
            child: Row(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Row(children: <Widget>[
                    Icon(Icons.person, color: Colors.grey[500],),
                    Container(width: 2,),
                    Text(
                      dev, 
                      style: TextStyle(
                        fontSize: 18, 
                        fontWeight: FontWeight.bold, 
                        color: Colors.grey[500]
                      )
                    )
                  ],)
                )
                
              ],
            ),
            
          ),
          
        ] ,
      ),
      
      backgroundColor: Colors.black,
    );
  }
}