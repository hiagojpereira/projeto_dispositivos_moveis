import 'package:cine_app/item.dart';
import 'package:flutter/material.dart';

class ListaAnimacoes extends StatefulWidget {
  @override
  _ListaAnimacoesState createState() => _ListaAnimacoesState();
}

class _ListaAnimacoesState extends State<ListaAnimacoes> {

  List<Item> listaAnimacao = [];

  TextEditingController txtNomeFilme = new TextEditingController();

  String nomeFilme = "";

  Widget _itemLista(context, index) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
      color: Colors.black,
      child: Card(
        color: Colors.green[300],
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 15,
            ),
            Text(
              listaAnimacao[index].titulo,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Image.asset(
              listaAnimacao[index].imagem,
            ),
            SizedBox(
              height: 15,
            ),            
            Text(
              listaAnimacao[index].subtitulo,
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    listaAnimacao = ModalRoute.of(context).settings.arguments;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("ANIMAÇÕES"),
          centerTitle: true,
          backgroundColor: Colors.green,
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
          //height: MediaQuery.of(context).size.height * 0.8,
          child: Column(            
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: listaAnimacao.length, // total de itens da lista
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