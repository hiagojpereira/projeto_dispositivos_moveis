import 'package:cine_app/lista_animacoes.dart';
import 'package:cine_app/lista_filmes.dart';
import 'package:cine_app/sobre.dart';
import 'package:cine_app/tela_log.dart';
import 'package:flutter/material.dart';
import 'package:cine_app/home.dart';
import 'package:cine_app/login.dart';

import 'cadastrarItem.dart';
import 'home.dart';
import 'inicio.dart';
import 'lista_series.dart';
import 'lista_usuarios.dart';
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
        "/lista_usuarios":(context) => ListaUsuarios(),
        "/cadastrarItem":(context) => CadastrarItem(),
        "/tela_log":(context) => TelaLog()
      },
    )
  );
}
