import 'package:cine_app/item.dart';
import 'package:flutter/material.dart';

class ListaSeries extends StatefulWidget {
  @override
  _ListaSeriesState createState() => _ListaSeriesState();
}

class _ListaSeriesState extends State<ListaSeries> {

  List<Item> listaSeries = [];

  TextEditingController txtNomeFilme = new TextEditingController();

  String nomeFilme = "";

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
              listaSeries[index].titulo,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Image.asset(listaSeries[index].imagem),
            SizedBox(
              height: 15,
            ),            
            Text(
              listaSeries[index].subtitulo,
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {

      listaSeries = ModalRoute.of(context).settings.arguments;


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
        body: Container(
          color: Colors.grey[600],
          child: Column(            
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: listaSeries.length, // total de itens da lista
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