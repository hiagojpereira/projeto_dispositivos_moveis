class Log {  
  //String _id;
  String _usuario;
  String _data;

  //this._id

  Log(this._usuario, this._data);

  //String get id => _id;
  String get usuario => _usuario;
  String get data => _data;

  Log.map(dynamic obj) {
    //this._id = obj['id'];
    this._usuario = obj['usuario'];
    this._data = obj['data'];
  }

  //Converter os dados para um Mapa
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    // if (_id != null) {
    //   map["id"] = _id;
    // }
    map["usuario"] = _usuario;
    map["data"] = _data;
    return map;
  }

  //Converter um Mapa para o modelo de dados
  Log.fromMap(Map<String, dynamic> map, String id) {
    //Atribuir id ao this._id, somente se id não for
    //nulo, caso contrário atribui '' (vazio).
    //this._id = id ?? '';
    this._usuario = map['usuario'];
    this._data = map['data'];
  }
}