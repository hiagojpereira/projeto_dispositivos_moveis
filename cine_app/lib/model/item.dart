class Item {  
  String _id;
  String _titulo;
  String _imagem;
  String _subtitulo;
  String _tipo;

  Item(this._id, this._titulo, this._imagem, this._subtitulo, this._tipo);

  String get id => _id;
  String get titulo => _titulo;
  String get imagem => _imagem;
  String get subtitulo => _subtitulo;
  String get tipo => _tipo;

  Item.map(dynamic obj) {
    this._id = obj['id'];
    this._titulo = obj['titulo'];
    this._imagem = obj['imagem'];
    this._subtitulo = obj['subtitulo'];
    this._tipo = obj['tipo'];
  }

  //Converter os dados para um Mapa
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (_id != null) {
      map["id"] = _id;
    }
    map["titulo"] = _titulo;
    map["imagem"] = _imagem;
    map["subtitulo"] = _subtitulo;
    map["tipo"] = _tipo;
    return map;
  }

  //Converter um Mapa para o modelo de dados
  Item.fromMap(Map<String, dynamic> map, String id) {
    //Atribuir id ao this._id, somente se id não for
    //nulo, caso contrário atribui '' (vazio).
    this._id = id ?? '';
    this._titulo = map['titulo'];
    this._imagem = map['imagem'];
    this._subtitulo = map['subtitulo'];
    this._tipo = map['tipo'];
  }
}