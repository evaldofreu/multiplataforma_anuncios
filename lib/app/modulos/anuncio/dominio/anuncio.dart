class Anuncio {
  String? id;
  String titulo;
  double preco;
  String? urlImagem;

  Anuncio({this.id, required this.titulo, this.preco = 0.0, this.urlImagem});

  static Future<Anuncio> fromJson(Map<String, dynamic> json) async {
    return Anuncio(
        titulo: json['titulo'],
        id: json['id'],
        preco: json["preco"],
        urlImagem: json['urlImagem']);
  }
}
