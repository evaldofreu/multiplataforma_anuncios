// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import '../../anuncio_casouso.dart';
import '../../dominio/anuncio.dart';
import 'package:http/http.dart' as http;

class AnuncioRepo extends AnuncioCasoUso {
  final http.Client client;
  AnuncioRepo(
    this.client,
  );

  @override
  Future<Anuncio> obter(String id) {
    return client
        .get(Uri.parse("https://localhost/api/anuncios/$id"))
        .then((value) => Anuncio.fromJson(json.decode(value.body)));
  }

  @override
  Future<List<Anuncio>> obterLista() {
    return Future.value([
      Anuncio(
          id: "1",
          titulo: "Óculos",
          urlImagem: "https://encurtador.com.br/mCEQ0",
          preco: 200.21),
      Anuncio(
          id: "2",
          titulo: "Batom",
          urlImagem: "https://encurtador.com.br/hlzZ4",
          preco: 80.23),
      Anuncio(
          id: "2",
          titulo: "Tênis",
          urlImagem: "https://encurtador.com.br/lpuCT",
          preco: 1000)
    ]);
  }

  @override
  Future<void> atualizar(Anuncio anuncio) {
    return Future.delayed(Duration(milliseconds: 800));
  }

  @override
  Future<void> exluir(Anuncio anuncio) {
    return Future.delayed(Duration(milliseconds: 800));
  }
}
