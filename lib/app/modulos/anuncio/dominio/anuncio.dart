class Anuncio {
  String? id;
  String titulo;
  double preco;
  String? urlImagem;

  Anuncio({this.id, required this.titulo, this.preco = 0.0, this.urlImagem});

  factory Anuncio.fromJson(Map<String, dynamic> json) {
    return Anuncio(
        titulo: json['titulo'],
        id: "${json['id']}",
        preco: json["preco"],
        urlImagem: json['urlImagem']);
  }

  Map<String, dynamic> toMap() {
    return {
      'titulo': titulo,
      'preco': preco,
      'urlimagem': urlImagem,
      ...id != null ? {'id': id} : {}
    };
  }
}
