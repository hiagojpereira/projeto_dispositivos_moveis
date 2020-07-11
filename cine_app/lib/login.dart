import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'model/log.dart';
import 'model/usuario.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

//List<Usuario> listaTeste = new List<Usuario>();

class _LoginState extends State<Login> {

  //globa key serve para identificar de forma unificada todos os elementos da classe
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  TextEditingController txtUsuario = TextEditingController();
  TextEditingController txtSenha = TextEditingController();
  TextEditingController txtCadUsuario = TextEditingController();
  TextEditingController txtCadSenha = TextEditingController();
  TextEditingController txtCadSenha2 = TextEditingController();
  TextEditingController txtCadEmail = TextEditingController();

  bool _cadastrarHabilitado;
  bool okUsuario;
  bool okEmail;


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

    _cadastrarHabilitado = false;

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

  cadastroTrue(){
    setState(() {
      _cadastrarHabilitado = true;
    });
  }

  loginTrue(){
    setState(() {
      _cadastrarHabilitado = false;
    });
  }

  
  @override
  Widget build(BuildContext context) {
    

    if(_cadastrarHabilitado == false){
      return new Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Login"),
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

        body: Container(
          child: Center(          
            child: Form(
              key: _formkey,
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Icon(Icons.movie, size: 80, color: Colors.red[900]),
                  campoUsuarioLogin("Usuário", txtUsuario),
                  campoSenhaLogin("Senha", txtSenha),
                  botaoLogar(context),
                  botaoRegistrar(context),
                ],
              ),
            ),   
          )       
        ),
        backgroundColor: Colors.transparent,
      );
    }
    else{
      return new Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text("Cadastro"),
            centerTitle: true,
            backgroundColor: Colors.black,
            actions: [
              IconButton(
                icon: Icon(Icons.arrow_back), 
                onPressed: (){
                  setState(() {
                    _cadastrarHabilitado = false;
                    txtUsuario.text = null;
                    txtSenha.text = null;
                    txtCadUsuario.text = null;
                    txtCadSenha.text = null;
                    txtCadSenha2.text = null;
                    txtCadEmail.text = null;
                  });
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
                  campoUsuarioCadastro("Usuário", txtCadUsuario),
                  campoSenhaCadastro("Senha", txtCadSenha),
                  campoSenha2Cadastro("Informe a senha novamente", txtCadSenha2),
                  campoEmailCadastro("Email", txtCadEmail),
                  botaoConfirmar(context)
                ],
              ),
            ),
            
          ),

          backgroundColor: Colors.white,
        );
    }    
  }

  campoUsuarioLogin(rotulo, controle){    
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 100),
      child: TextFormField(
        keyboardType: TextInputType.text,
        style: TextStyle(color: Colors.red[900], fontSize: 20),
        decoration: InputDecoration(
          labelText: rotulo,
          labelStyle: TextStyle(
            color: Colors.red[500],
            fontSize: 12,
          ),
          icon: const Padding(
            padding: const EdgeInsets.only(
            top: 15.0),
            child: const Icon(Icons.person)
          )
        ),
        controller: controle,
        validator: (value) {
          return (value.isEmpty) ? "Campo obrigatório" : null;
        },
      ),
    );
  }

  campoSenhaLogin(rotulo, controle){    
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 100),
      child: TextFormField(
        keyboardType: TextInputType.text,
        style: TextStyle(color: Colors.red[900], fontSize: 20),
        decoration: InputDecoration(
          labelText: rotulo,
          labelStyle: TextStyle(
            color: Colors.red[500],
            fontSize: 12,
          ),
          icon: const Padding(
            padding: const EdgeInsets.only(
            top: 15.0),
            child: const Icon(Icons.lock)
          )
        ),
        controller: controle,
        validator: (value) {
          return (value.isEmpty) ? "Campo obrigatório" : null;
        },
        obscureText: true,
      ),
    );
  }

  campoUsuarioCadastro(rotulo2, controle2){
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
          ),
          icon: const Padding(
            padding: const EdgeInsets.only(
            top: 15.0),
            child: const Icon(Icons.person)
          )
        ),
        controller: controle2,        
        validator: (value) {
          return (value.isEmpty) ? "Campo obrigatório" : null;
        },
      ),
    );
  }

  campoSenhaCadastro(rotulo2, controle2){
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
          ),
          icon: const Padding(
            padding: const EdgeInsets.only(
            top: 15.0),
            child: const Icon(Icons.lock)
          )
        ),
        controller: controle2,        
        validator: (value) {
          return (value.isEmpty) ? "Campo obrigatório" : null;
        },
        obscureText: true,
      ),
    );
  }

  campoSenha2Cadastro(rotulo2, controle2){
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
          ),
          icon: const Padding(
            padding: const EdgeInsets.only(
            top: 15.0),
            child: const Icon(Icons.lock)
          )
        ),
        controller: controle2,        
        validator: (value) {
          return (value.isEmpty) ? "Campo obrigatório" : null;
        },
        obscureText: true,
      ),
    );
  }

  campoEmailCadastro(rotulo2, controle2){
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
          ),
          icon: const Padding(
            padding: const EdgeInsets.only(
            top: 15.0),
            child: const Icon(Icons.email)
          )
        ),
        controller: controle2,        
        validator: (value) {
          return (value.isEmpty) ? "Campo obrigatório" : null;
        },
      ),
    );
  }

  botaoLogar(BuildContext context){
      
    var db = Firestore.instance;

    String nome;

    //retornar dados do documento a partir do idDocument
    void getDocumento(String idDocumento) async {
      //Recuperar o documento no Firestore
      DocumentSnapshot doc =
          await db.collection("usuario").document(idDocumento).get();

      setState(() {
        nome = doc.data["usuario"];
      });
    }

    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: RaisedButton(
        child: Text(
          "Logar",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        color: Colors.black,
        //evento do botão
        onPressed: () {          

          //jsonRestApiHttp();
          String usuario = txtUsuario.text;
          String senha = txtSenha.text;
          String usOK = "";
          
          //se as condições das validações dos controles não forem atendidas, gera uma mensagem
          if (_formkey.currentState.validate()) {

            if(this.lista.length == 0){
              return mostraAlert(context);
            }
            this.lista.forEach((element) {
              if(element.usuario == usuario && element.senha == senha){
                usOK = element.usuario;
              }
            });

            if(usOK.length > 0){
              final todayDate = DateTime.now();
              String data = todayDate.toString();
              nome = txtUsuario.text;
              inserirLog(context, Log(nome, data));
              Navigator.pushNamed(context, "/home", arguments: txtUsuario.text);
            }
            else{
              mostraAlert(context);
            }
          }
        },
      )
    );
  }

 

  mostraAlert(BuildContext context){ 
  // configura o button         
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed:  () {
        Navigator.of(context).pop();
        //botaoLogar(context);
      },                 
    );
    // configura o  AlertDialog
    AlertDialog alerta = AlertDialog(
      title: Text("Erro!"),
      content: Text("Usuário ou senha inválidos."),
      actions: [
        okButton,
      ],
    );
    // exibe o dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }

  botaoRegistrar(context){
    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: RaisedButton(
        child: Text(
          "Registrar",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        color: Colors.black,
          //evento do botão
        onPressed: () {
          setState(() {
            _cadastrarHabilitado = true;
            txtUsuario.text = null;
            txtSenha.text = null;
            txtCadUsuario.text = null;
            txtCadSenha.text = null;
            txtCadSenha2.text = null;
            txtCadEmail.text = null;
          });
        },
      )
    );
  }

  botaoConfirmar(BuildContext context){
    String nome;
    String senha;
    String senha2;
    String email;

    //instância do Firebase
  var db = Firestore.instance;

  //retornar dados do documento a partir do idDocument
  void getDocumento(String idDocumento) async {
    //Recuperar o documento no Firestore
    DocumentSnapshot doc =
        await db.collection("usuario").document(idDocumento).get();

    setState(() {
      nome = doc.data["usuario"];
    });
  }
    
    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: RaisedButton(
        child: Text(
          "Confirmar",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        color: Colors.black,
        //evento do botão
        onPressed: () {        
          final String idDocumento = ModalRoute.of(context).settings.arguments;

          if (idDocumento != null) {
            if (nome == "" && senha == "") {
              getDocumento(idDocumento);
            }
          }
          

          nome = txtCadUsuario.text;
          senha = txtCadSenha.text;
          senha2 = txtCadSenha2.text;
          email = txtCadEmail.text; 

          String msg = "";

          if(senha != senha2){
            msg = "Senhas em divergencia.";
            alertaCadastroErro(context, msg);
          }
          else{
            if(nome == "" || nome == null || email == "" || email == null){
              msg = "Informe os campos obrigatórios.";
                alertaCadastroErro(context, msg);
            }
            else{
              var cadastrado = lista.where((element) => element.usuario == nome).length;

              if(cadastrado == 0){
                if (idDocumento == null) {
                        inserir(context, 
                          Usuario(idDocumento, nome, senha, email));
                      } else {
                        atualizar(context,
                            Usuario(idDocumento, nome, senha, email));
                      }

                alertaCadastroOk(context);
                txtUsuario.text = "";
                txtSenha.text = "";
                txtCadUsuario.text = "";
                txtCadSenha.text = "";
                txtCadSenha2.text = "";
                txtCadEmail.text = ""; 
              }
              else
              {
                msg = "Usuario ou Email já cadastrado.";
                alertaCadastroErro(context, msg);
              }
            }
          }
          return false;
        }
      )
    );
  }

  
  
  alertaCadastroOk(BuildContext context){ 
  // configura o button         
    Widget botaoCadastradoComSucesso = FlatButton(
      child: Text("OK"),
      onPressed:  () {
        setState(() {
          Navigator.of(context).pop();
          _cadastrarHabilitado = false;              
          okEmail = true;  
          okUsuario = true;
        });
      },                 
    );

    // configura o  AlertDialog
    AlertDialog alertaUsuarioCadastrado = AlertDialog(
      title: Text("Sucesso!"),
      content: Text("Usuário cadastrado com sucesso."),
      actions: [
        botaoCadastradoComSucesso,
      ],
    );

    // exibe o dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertaUsuarioCadastrado;
      },
    );
  }

  alertaCadastroErro(BuildContext context, String msg){ 
  // configura o button
    Widget problemCadastro = FlatButton(
      child: Text("OK"),
      onPressed:  () {
        Navigator.of(context).pop();
      },                 
    );

    AlertDialog alertaUsuarioExiste = AlertDialog(
      title: Text("Erro!"),
      content: Text(msg),
      actions: [
        problemCadastro,
      ],
    );
    // exibe o dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertaUsuarioExiste;
      },
    );
  }


  void atualizar(BuildContext context, Usuario usuario) async{
    await db.collection("usuario").document(usuario.id)
      .updateData(
        {
          "usuario": usuario.usuario,
          "senha": usuario.senha,
          "email": usuario.email
        }
      );
  }

  //
  // INSERIR
  //
  void inserir(BuildContext context, Usuario usuario) async{
    await db.collection("usuario")
      .add(
        {
          "usuario": usuario.usuario,
          "senha": usuario.senha,
          "email": usuario.email
        }
      );
  } 

   //
  // INSERIR
  //
  void inserirLog(BuildContext context, Log log) async{
    await db.collection("log")
      .add(
        {
          "usuario": log.usuario,
          "data": log.data,
        }
      );
  } 

}

