import 'package:flutter/material.dart';

import 'item.dart';

class ListaFilmes extends StatefulWidget {
  @override
  _ListaFilmesState createState() => _ListaFilmesState();
}

class _ListaFilmesState extends State<ListaFilmes> {

  List<Item> listaFilmes = [];

  TextEditingController txtNomeFilme = new TextEditingController();

  String nomeFilme = "";

  Widget _itemLista(context, index) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
      color: Colors.black,
      child: Card(
        color: Colors.red[300],
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 15,
            ),
            //Icon(lista[index].icone, size: 60, color: Colors.blue[900],),
            Text(
              listaFilmes[index].titulo,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Image.asset(listaFilmes[index].imagem),
            SizedBox(
              height: 15,
            ),            
            Text(
              listaFilmes[index].subtitulo,
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {

    listaFilmes = ModalRoute.of(context).settings.arguments;


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("FILMES"),
          centerTitle: true,
          backgroundColor: Colors.red,
          actions: [
            IconButton(
              icon: Icon(Icons.arrow_back), 
              onPressed: (){
                Navigator.pop(context);
              }
            ),
          ],
        ),
        body: Container(
          color: Colors.black,
          child: Column(            
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: listaFilmes.length, // total de itens da lista
                  itemBuilder:
                      _itemLista, // especificar a aparência dos itens da lista
                ),
              ),
            ],
          ),

          
        )
      )
    );
  }
}