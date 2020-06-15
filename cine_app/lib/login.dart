import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Usuario {
  final String nome;
  final String senha;
  final String email;

  Usuario(this.nome, this.senha, this.email);

  Usuario.fromJson(Map<String, dynamic> jsonData) :
    nome = jsonData['Nome'],
    senha = jsonData['Senha'],
    email = jsonData['Email'];

}

class ListaUsuario {
  static List<Usuario> listaUsuario = new List<Usuario>();

  ListaUsuario();

  getUsuarios(){
    return listaUsuario;
  }

  addUsuario(Usuario usuario){
    listaUsuario.forEach((element) {
      if(usuario.nome == element.nome || usuario.email == element.email){
        return false;
      }
    });

    listaUsuario.add(usuario);
    return true; 
  }
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

//List<Usuario> listaTeste = new List<Usuario>();

class _LoginState extends State<Login> {
  //variaveis

  //globa key serve para identificar de forma unificada todos os elementos da classe
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  TextEditingController txtUsuario = TextEditingController();
  TextEditingController txtSenha = TextEditingController();
  TextEditingController txtCadUsuario = TextEditingController();
  TextEditingController txtCadSenha = TextEditingController();
  TextEditingController txtCadSenha2 = TextEditingController();
  TextEditingController txtCadEmail = TextEditingController();

  ListaUsuario listaUsuario = new ListaUsuario();

  bool _cadastrarHabilitado;
  bool okUsuario;
  bool okEmail;

  @override
  void initState() {
    super.initState();
    
    _cadastrarHabilitado = false;
    listaUsuario.addUsuario(new Usuario("adm", "adm", "adm@email.com"));
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
        keyboardType: TextInputType.text, //permite digitar apenas valores
        style: TextStyle(color: Colors.red[900], fontSize: 20),

        //perfumaria no design
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
        keyboardType: TextInputType.text, //permite digitar apenas valores
        style: TextStyle(color: Colors.red[900], fontSize: 20),

        //perfumaria no design
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
        keyboardType: TextInputType.text, //permite digitar apenas valores
        style: TextStyle(color: Colors.red[900], fontSize: 20),

        //perfumaria no design
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
        keyboardType: TextInputType.text, //permite digitar apenas valores
        style: TextStyle(color: Colors.red[900], fontSize: 20),

        //perfumaria no design
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
        keyboardType: TextInputType.text, //permite digitar apenas valores
        style: TextStyle(color: Colors.red[900], fontSize: 20),

        //perfumaria no design
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
        keyboardType: TextInputType.emailAddress, //permite digitar apenas valores
        style: TextStyle(color: Colors.red[900], fontSize: 20),

        //perfumaria no design
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

            if(this.listaUsuario.getUsuarios() == 0){
              return mostraAlert(context);
            }
            this.listaUsuario.getUsuarios().forEach((element) {
              if(element.nome == usuario && element.senha == senha){
                usOK = element.nome;
              }
            });

            if(usOK.length > 0){
              Navigator.pushNamed(context, "/home", arguments: Usuario(txtUsuario.text, txtSenha.text, ""));
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
              if(this.listaUsuario.addUsuario(new Usuario(nome, senha,email))){
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

}