import 'package:flutter/material.dart';

class Filmes extends StatelessWidget {

  final String nomeFilme;
  final String cinemas;
  final String foto;

  Filmes(this.nomeFilme, this.foto, this.cinemas);

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(),
        ),
        padding: EdgeInsets.all(10.0),
        child: Center(
          child:Column(
            children: <Widget>[
              Text(this.nomeFilme, textScaleFactor: 3,),
              Image.asset(this.foto, scale: 1.5, fit: BoxFit.fitWidth),
              Text(this.cinemas, textScaleFactor: 3,),
            ],
          ),
        
        )
      )
    );
  }
}

