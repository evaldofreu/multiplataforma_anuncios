import 'dominio/anuncio.dart';

abstract class AnuncioCasoUso {
  Future<Anuncio> obter(String id);
  Future<List<Anuncio>> obterLista();
  Future<void> atualizar(Anuncio anuncio);
  Future<void> exluir(Anuncio anuncio);
}
