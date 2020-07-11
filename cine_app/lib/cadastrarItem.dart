import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'model/item.dart';

class CadastrarItem extends StatefulWidget {
  @override
  _CadastrarItemState createState() => _CadastrarItemState();
}

class _CadastrarItemState extends State<CadastrarItem> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  TextEditingController txtImagem = TextEditingController();
  TextEditingController txtTitulo = TextEditingController();
  TextEditingController txtSubtitulo = TextEditingController();
  TextEditingController txtTipo = TextEditingController();

  //instância do Firebase
  var db = Firestore.instance;

  //retornar dados do documento a partir do idDocument
  void getDocumento(String idDocumento) async {
    //Recuperar o documento no Firestore
    DocumentSnapshot doc =
        await db.collection("usuario").document(idDocumento).get();

    setState(() {
      txtImagem.text = doc.data["imagem"];
      txtTitulo.text = doc.data["titulo"];
      txtSubtitulo.text = doc.data["subtitulo"];
      txtTipo.text = doc.data["tipo"];
    });
  }
  @override
  Widget build(BuildContext context) {

    final String idDocumento = ModalRoute.of(context).settings.arguments;

    if (idDocumento != null) {
      if (txtImagem.text == "" && txtSubtitulo.text == "" && txtTitulo.text == "" && txtTipo.text == "") {
        getDocumento(idDocumento);
      }
    }


    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Cadastro de Itens"),
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

      body: Center(
        child: Form(
        key: _formkey,
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(Icons.movie, size: 80, color: Colors.red[900]),                
              campoImagem("Caminho da imagem", txtImagem),
              campoTitulo("Titulo", txtTitulo),
              campoSubtitulo("Subtitulo", txtSubtitulo),
              campoTipo("Tipo", txtTipo),
              Row(children: <Widget>[
                Container(width: MediaQuery.of(context).size.width * 0.24),
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  padding: const EdgeInsets.only(top: 20),
                  child: RaisedButton(
                    child: Text(
                      "Salvar",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    color: Colors.black,
                    //evento do botão
                    onPressed: () {
                      if (idDocumento == null) {
                        inserir(context, 
                          Item(idDocumento, txtTitulo.text, txtImagem.text, txtSubtitulo.text, txtTipo.text));
                      } else {
                        atualizar(context,
                            Item(idDocumento, txtTitulo.text, txtImagem.text, txtSubtitulo.text, txtTipo.text));
                      }

                      Navigator.pop(context);
                    }
                  )
                ),
                Container(width: MediaQuery.of(context).size.width * 0.02),
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  padding: const EdgeInsets.only(top: 20),
                  child: RaisedButton(
                    child: Text(
                      "Cancelar",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    color: Colors.black,
                    //evento do botão
                    onPressed: () {
                      Navigator.pop(context);
                    }
                  )
                ),
                Container(width: MediaQuery.of(context).size.width * 0.24)
              ],)
              
            ],
          ),
        ),
        
      ),

      backgroundColor: Colors.white,
    );
  }


  campoImagem(rotulo2, controle2){
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 100),
      child: TextFormField(
        keyboardType: TextInputType.text,
        style: TextStyle(color: Colors.red[900], fontSize: 20),
        decoration: InputDecoration(
          labelText: rotulo2,
          labelStyle: TextStyle(
            color: Colors.red[500],
            fontSize: 12,
          )
        ),
        controller: controle2,        
        validator: (value) {
          return (value.isEmpty) ? "Campo obrigatório" : null;
        },
      ),
    );
  }

  campoTitulo(rotulo2, controle2){
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 100),
      child: TextFormField(
        keyboardType: TextInputType.text,
        style: TextStyle(color: Colors.red[900], fontSize: 20),
        decoration: InputDecoration(
          labelText: rotulo2,
          labelStyle: TextStyle(
            color: Colors.red[500],
            fontSize: 12,
          )
        ),
        controller: controle2,        
        validator: (value) {
          return (value.isEmpty) ? "Campo obrigatório" : null;
        }
      ),
    );
  }

  campoSubtitulo(rotulo2, controle2){
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 100),
      child: TextFormField(
        keyboardType: TextInputType.text,
        style: TextStyle(color: Colors.red[900], fontSize: 20),
        decoration: InputDecoration(
          labelText: rotulo2,
          labelStyle: TextStyle(
            color: Colors.red[500],
            fontSize: 12,
          )
        ),
        controller: controle2,        
        validator: (value) {
          return (value.isEmpty) ? "Campo obrigatório" : null;
        }
      ),
    );
  }

  campoTipo(rotulo2, controle2){
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 100),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress, 
        style: TextStyle(color: Colors.red[900], fontSize: 20),

        decoration: InputDecoration(
          labelText: rotulo2,
          labelStyle: TextStyle(
            color: Colors.red[500],
            fontSize: 12,
          )
        ),
        controller: controle2,        
        validator: (value) {
          return (value.isEmpty) ? "Campo obrigatório" : null;
        },
      ),
    );
  }

   void atualizar(BuildContext context, Item item) async{
    await db.collection("item").document(item.id)
      .updateData(
        {
          "imagem": item.imagem,
          "titulo": item.titulo,
          "subtitulo": item.subtitulo,
          "tipo": item.tipo,
        }
      );
    //Navigator.pop(context);
  }

  //
  // INSERIR
  //
  void inserir(BuildContext context, Item item) async{
    await db.collection("item")
      .add(
        {
          "imagem": item.imagem,
          "titulo": item.titulo,
          "subtitulo": item.subtitulo,
          "tipo": item.tipo,
        }
      );
    //Navigator.pop(context);
  } 
}
