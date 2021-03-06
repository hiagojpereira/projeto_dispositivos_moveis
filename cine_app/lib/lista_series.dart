import 'dart:async';

import 'package:cine_app/model/item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListaSeries extends StatefulWidget {
  @override
  _ListaSeriesState createState() => _ListaSeriesState();
}

class _ListaSeriesState extends State<ListaSeries> {

  String usuarioLogado;

        //Conexão Fluter+Firebase
  final db = Firestore.instance;
  final String colecao = "item";

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
            .map((doc) => Item.fromMap(doc.data, doc.documentID)).where((element) => element.tipo == "S")
            .toList();
      });
    });
  }

  @override
  void dispose() {
    listen?.cancel();
    super.dispose();
  }


  Widget _itemLista(context, index) {
        
    return Container(
      padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
      color: Colors.black,
      child: Card(
        color: Colors.blue[300],
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 15,
            ),
            Text(
              lista[index].titulo,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Image.asset(lista[index].imagem),
            SizedBox(
              height: 15,
            ),            
            Text(
              lista[index].subtitulo,
              style: TextStyle(fontSize: 16),
            ),
            botaoDeletar(context, index)
          ],
        ),
      ),
    );
  }

 botaoDeletar(context, int index){
    if(usuarioLogado == "adm"){      
      return IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {

          db.collection(colecao).document(lista[index].id).delete();

        });
    }
    else{
      return Container();      
    }
  }

  @override
  Widget build(BuildContext context) {

      //listaSeries = ModalRoute.of(context).settings.arguments;
    usuarioLogado = ModalRoute.of(context).settings.arguments;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("SERIES"),
          centerTitle: true,
          backgroundColor: Colors.blue,
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
                return Container(
                  color: Colors.black,
                  //height: MediaQuery.of(context).size.height * 0.8,
                  child: Column(            
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: lista.length, // total de itens da lista
                          itemBuilder:
                              _itemLista // especificar a aparência dos itens da lista
                        ),
                      ),
                    ],
                  ),
                );
            }
          }
        )
      )
    );
  }
}