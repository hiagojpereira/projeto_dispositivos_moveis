import 'dart:async';

import 'package:cine_app/model/item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  //List<Item> lista = [];

      //Conexão Fluter+Firebase
  final db = Firestore.instance;
  final String colecao = "cafes";

  //Lista dinâmica para manipulação dos dados
  List<Item> lista = List();

  //Stream para "ouvir" o Firebase
  StreamSubscription<QuerySnapshot> listen;

  @override
  void initState() {
    super.initState();

    //cancelar o listen, caso a coleção esteja vazia.
    listen?.cancel();

    //retornar dados da coleção e inserir na lista dinâmica
    listen = db.collection(colecao).snapshots().listen((res) {
      setState(() {
        lista = res.documents
            .map((doc) => Item.fromMap(doc.data, doc.documentID))
            .toList();
      });
    });
  }

  @override
  void dispose() {
    listen?.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    String usuario = ModalRoute.of(context).settings.arguments.toString();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("HOME"),
          centerTitle: true,
          backgroundColor: Colors.black,
          actions: [
            IconButton(
              icon: Icon(Icons.exit_to_app), 
              onPressed: (){
                Navigator.pop(context);
              }
            ),
          ],
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                child: Row(
                  children: <Widget>[
                    botaoVerFilmes(context, usuario),
                    Container(width: MediaQuery.of(context).size.width * 0.005),
                    botaoSeries(context, usuario),
                    Container(width: MediaQuery.of(context).size.width * 0.005,),
                    botaoAnimacoes(context, usuario)                    
                  ],
                )
              ),
              Container(
                color: Colors.black,
                child: Image.asset("assets/imagens/background.png")
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    botaoCadastrarItem(context, usuario),
                    Container(width: MediaQuery.of(context).size.width * 0.005),
                    botaoUsuariosCadastrados(context, usuario),
                    Container(width: MediaQuery.of(context).size.width * 0.005),
                    botaoLog(context, usuario),
                  ],
                )                
              )

              
            ],
          ),
        ),

        backgroundColor: Colors.black,
      )
    );
  }


  botaoVerFilmes(BuildContext context, String usuario){
    return Container(
      width: MediaQuery.of(context).size.width * 0.33,
      padding: const EdgeInsets.only(top: 20),
      child: RaisedButton(
        child: Text(
          "Filmes",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        color: Colors.red[300],
        //evento do botão
        onPressed: () {
          Navigator.pushNamed(
            context, 
            "/lista_filmes", 
            arguments: usuario
          );
        },
      )
    );
  }

  botaoSeries(BuildContext context, String usuario){
    return Container(      
      width: MediaQuery.of(context).size.width * 0.33,
      padding: const EdgeInsets.only(top: 20),
      child: RaisedButton(
        child: Text(
          "Series",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        color: Colors.blue[300],
        //evento do botão
        onPressed: () {
          Navigator.pushNamed(
            context, 
            "/lista_series", 
            arguments: usuario
          );
        },
      )
    );
  }

  botaoAnimacoes(BuildContext context, String usuario){
    return Container(
      width: MediaQuery.of(context).size.width * 0.33,
      padding: const EdgeInsets.only(top: 20),
      child: RaisedButton(
        child: Text(
          "Animações",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        color: Colors.green[300],
        //evento do botão
        onPressed: () {
          Navigator.pushNamed(
            context, 
            "/lista_animacoes",
            arguments: usuario
          );
        },
      )
    );
  }

  botaoCadastrarItem(BuildContext context, String usuario){
    if(usuario == "adm"){
      return Container(
      width: MediaQuery.of(context).size.width * 0.33,
      padding: const EdgeInsets.only(top: 20),
      child: RaisedButton(
        child: Text(
          "Cadastrar Item",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),
        ),
        color: Colors.yellow[300],
        //evento do botão
        onPressed: () {
          Navigator.pushNamed(
            context, 
            "/cadastrarItem"
          );
        },
      )
    );
    }
    else{
      return Container(
      );
    }
  }

  botaoUsuariosCadastrados(BuildContext context, String usuario){
    if(usuario == "adm"){
      return Container(
      width: MediaQuery.of(context).size.width * 0.33,
      padding: const EdgeInsets.only(top: 20),
      child: RaisedButton(
        child: Text(
          "Lista Usuarios",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),
        ),
        color: Colors.yellow[300],
        //evento do botão
        onPressed: () {
          Navigator.pushNamed(
            context, 
            "/lista_usuarios"
          );
        },
      )
    );
    }
    else{
      return Container(
      );
    }
  }

  botaoLog(BuildContext context, String usuario){
    if(usuario == "adm"){
      return Container(
      width: MediaQuery.of(context).size.width * 0.33,
      padding: const EdgeInsets.only(top: 20),
      child: RaisedButton(
        child: Text(
          "Lista de Log's",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),
        ),
        color: Colors.yellow[300],
        //evento do botão
        onPressed: () {
          Navigator.pushNamed(
            context, 
            "/tela_log"
          );
        },
      )
    );
    }
    else{
      return Container(
      );
    }
  }
}
