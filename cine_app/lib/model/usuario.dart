class Usuario {  
  String _id;
  String _usuario;
  String _senha;
  String _email;

  Usuario(this._id, this._usuario, this._senha, this._email);

  String get id => _id;
  String get usuario => _usuario;
  String get senha => _senha;
  String get email => _email;

  Usuario.map(dynamic obj) {
    this._id = obj['id'];
    this._usuario = obj['usuario'];
    this._senha = obj['senha'];
    this._email = obj['email'];
  }

  //Converter os dados para um Mapa
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (_id != null) {
      map["id"] = _id;
    }
    map["usuario"] = _usuario;
    map["senha"] = _senha;
    map["email"] = _email;
    return map;
  }

  //Converter um Mapa para o modelo de dados
  Usuario.fromMap(Map<String, dynamic> map, String id) {
    //Atribuir id ao this._id, somente se id não for
    //nulo, caso contrário atribui '' (vazio).
    this._id = id ?? '';
    this._usuario = map['usuario'];
    this._senha = map['senha'];
    this._email = map['email'];
  }
}