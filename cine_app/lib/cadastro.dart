import 'package:flutter/material.dart';

class Usuario {
  String usuario;
  String senha;
  String email;

  Usuario(this.usuario, this.senha, this.email);
}

class  Cadastro extends StatefulWidget {
  static const nomeRota = '/cadastro';

  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {

  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  TextEditingController txtUsuario = TextEditingController();
  TextEditingController txtSenha = TextEditingController();
  TextEditingController txtEmail = TextEditingController();

  List<Usuario> listaUsuarios = new List();

  adicionarUsuario(String usuario, String senha, String email){
    if(usuario != null && senha != null && email != null){
      this.listaUsuarios.add(new Usuario(usuario, senha, email));
    }
  }

  getTodosUsuario(){
    return this.listaUsuarios;
  }
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Form(
        key: _formkey,
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(Icons.movie, size: 80, color: Colors.red[900]),
              campoUsuarioSenha("Usuário", txtUsuario),
              campoUsuarioSenha("Senha", txtSenha),
              campoEmail("Email", txtEmail),
              botaoConfirmar(context)
            ],
          ),
        ),
        
      ),

      

      backgroundColor: Colors.white,
    );
  }

  campoUsuarioSenha(rotulo, controle){
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 100),
      child: TextFormField(
        keyboardType: TextInputType.text, //permite digitar apenas valores
        style: TextStyle(color: Colors.red[900], fontSize: 20),

        //perfumaria no design
        decoration: InputDecoration(
          labelText: rotulo,
          labelStyle: TextStyle(
            color: Colors.red[500],
            fontSize: 12,
          ),
        ),
        controller: controle, //pega o valor que o usuário digitou nos edites através do metodo campoTexto("Peso", txtPeso)
        validator: (value) {
          return (value.isEmpty) ? "Informe o valor" : null;
        },
      ),
    );
  }

  campoEmail(rotulo, controle){
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 100),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress, //permite digitar apenas valores
        style: TextStyle(color: Colors.red[900], fontSize: 20),

        //perfumaria no design
        decoration: InputDecoration(
          labelText: rotulo,
          labelStyle: TextStyle(
            color: Colors.red[500],
            fontSize: 12,
          ),
        ),
        controller: controle, //pega o valor que o usuário digitou nos edites através do metodo campoTexto("Peso", txtPeso)
        validator: (value) {
          return (value.isEmpty) ? "Informe o valor" : null;
        },
      ),
    );
  }


  botaoConfirmar(BuildContext context){
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
        color: Colors.grey[500],
        //evento do botão
        onPressed: () {
          mostraAlert(context);
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

  
}