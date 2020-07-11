import 'package:cine_app/item.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Item> lista = [];

  @override
  Widget build(BuildContext context) {

    lista.add(Item("FROZEN 2", "assets/imagens/frozen2.jpg", "Animação", "A"));
    lista.add(Item("PROCURANDO DORY", "assets/imagens/dory.jpg", "Animação", "A"));
    lista.add(Item("DIVERTIDAMENTE", "assets/imagens/divertidamente.jpg", "Animação", "A"));
    lista.add(Item("COMO TREINAR O SEU DRAGÃO 3", "assets/imagens/dragao.jpg", "Animação", "A"));
    lista.add(Item("TOY STORY 4", "assets/imagens/toy.jpg", "Animação", "A"));
    lista.add(Item("A BRUXA DE BLAIR", "assets/imagens/a_bruxa_de_blair.jpg", "Terror", "F"));
    lista.add(Item("AVATAR", "assets/imagens/avatar.jpg", "Ficção Cientifica", "F"));
    lista.add(Item("ANNABELLE", "assets/imagens/annabelle.jpg", "Terror", "F"));
    lista.add(Item("CORINGA", "assets/imagens/coringa.jpg", "Ficção Cientifica", "F"));
    lista.add(Item("VINGADORES - GUERRA INFINITA", "assets/imagens/guerra_infinita.jpg", "Ficção Cientifica", "F"));
    lista.add(Item("INTERESTELAR", "assets/imagens/interestelar.jpg", "Ficção Cientifica", "F"));
    lista.add(Item("O SENHOR DOS ANEIS", "assets/imagens/senhor_dos_aneis.jpg", "Ficção Cientifica", "F"));
    lista.add(Item("VINGADORES - ULTIMATO", "assets/imagens/ultimato.jpg", "Ficção Cientifica", "F"));
    lista.add(Item("GAME OF THRONES", "assets/imagens/got.jpg", "Ficção Cientifica", "S"));
    lista.add(Item("STRANGER THINGS", "assets/imagens/strangerthings.jpg", "Ficção Cientifica", "S"));
    lista.add(Item("THE WITCHER", "assets/imagens/thewitcher.jpg", "Terror", "S"));
    lista.add(Item("VIKINGS", "assets/imagens/vikings.jpg", "Comedia", "S"));
    lista.add(Item("CHERNOBYL", "assets/imagens/chernobyl.jpg", "Terror", "S"));

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
                    botaoVerFilmes(context),
                    Container(width: MediaQuery.of(context).size.width * 0.005),
                    botaoSeries(context),
                    Container(width: MediaQuery.of(context).size.width * 0.005,),
                    botaoAnimacoes(context)
                  ],
                )
              ),
              Container(
                color: Colors.black,
                child: Image.asset("assets/imagens/background.png")
              ),

              
            ],
          ),
        ),

        backgroundColor: Colors.black,
      )
    );
  }


  botaoVerFilmes(BuildContext context){
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
            arguments: lista.where((element) => element.tipo == "F").toList()
          );
        },
      )
    );
  }

  botaoSeries(BuildContext context){
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
            arguments: lista.where((element) => element.tipo == "S").toList()
          );
        },
      )
    );
  }

  botaoAnimacoes(BuildContext context){
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
            arguments: lista.where((element) => element.tipo == "A").toList()
          );
        },
      )
    );
  }


}
