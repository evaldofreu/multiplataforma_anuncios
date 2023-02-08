import 'package:anuncios/app/modulos/anuncio/dominio/anuncio.dart';
import 'package:anuncios/app/modulos/anuncio/infra/comunicacao/anuncio_repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/testing.dart';
import 'package:http/http.dart' as http;

void main() {
  testWidgets('Respositorio de anúncios: obter.', (tester) async {
    var client = MockClient((request) => Future.value(http.Response(
        '{"id": "2", "titulo": "Teste", "preco":0.0, "urlImagem":"https://encurtador.com.br/mCEQ0"}',
        200)));

    var repo = AnuncioRepo(client);
    var anuncio = await repo.obter("1");
    expect(anuncio, isNotNull, reason: "Retornou nulo");
    expect(anuncio, isA<Anuncio>(), reason: "Não retornou um Anuncio");
    expect(anuncio.id, '1', reason: "Não retornou o anúncio solicitado");
  });
}
