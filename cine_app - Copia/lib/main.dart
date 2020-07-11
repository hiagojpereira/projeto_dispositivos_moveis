import 'package:cine_app/cadastro.dart';
import 'package:cine_app/lista_animacoes.dart';
import 'package:cine_app/lista_filmes.dart';
import 'package:cine_app/sobre.dart';
import 'package:flutter/material.dart';
import 'package:cine_app/home.dart';
import 'package:cine_app/login.dart';

import 'home.dart';
import 'inicio.dart';
import 'lista_series.dart';
import 'login.dart';
import 'sobre.dart';


void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "CineApp",
      initialRoute: "/inicio",
      routes: {
        "/inicio":(context) => Inicio(),
        "/login":(context) => Login(),
        "/home":(context) => Home(),
        "/sobre":(context) => Sobre(),
        "/lista_filmes":(context) => ListaFilmes(),
        "/lista_animacoes":(context) => ListaAnimacoes(),
        "/lista_series":(context) => ListaSeries(),
        "/cadastro":(context) => Cadastro()
      },
    )
  );
}
