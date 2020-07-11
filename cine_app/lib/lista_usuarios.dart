import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'model/usuario.dart';

class ListaUsuarios extends StatefulWidget {
  @override
  _ListaUsuariosState createState() => _ListaUsuariosState();
}

class _ListaUsuariosState extends State<ListaUsuarios> {

     //Conexão Fluter+Firebase
  final db = Firestore.instance;
  final String colecao = "usuario";

  //Lista dinâmica para manipulação dos dados
  List<Usuario> lista = List();

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
            .map((doc) => Usuario.fromMap(doc.data, doc.documentID))
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
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Usuários Cadastrados"),
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

      body: StreamBuilder<QuerySnapshot>(

          //fonte de dados
          stream: db.collection(colecao).snapshots(),

          //exibição dos dados
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              default:
                List<DocumentSnapshot> docs = snapshot.data.documents;
                return ListView.builder(
                  itemCount: docs.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        'usuario:   ' + lista[index].usuario,
                        style: TextStyle(fontSize: 20),
                      ),
                      subtitle: Text('email:   ' + lista[index].email + '\nsenha:   ' + lista[index].senha,
                          style: TextStyle(fontSize: 16)),
                      trailing: retornarBotao(lista[index].usuario, index),
                                            
                    );
                  });
            }
          }
      )
    );
    
  }
  retornarBotao(String nome, int index){
    if(nome == "adm"){
      return IconButton(
        icon: Icon(Icons.delete, color: Colors.red,),
        onPressed: () {

        },
                
      );
    }
    else{
      return IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {

          db.collection(colecao).document(lista[index].id).delete();

        });
    }
  }
}