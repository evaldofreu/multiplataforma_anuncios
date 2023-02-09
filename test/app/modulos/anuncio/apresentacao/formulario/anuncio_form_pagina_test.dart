import 'package:anuncios/app/modulos/anuncio/apresentacao/formulario/anuncio_form_pagina.dart';
import 'package:anuncios/app/modulos/anuncio/dominio/anuncio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Anuncio Form valida titulo ...', (tester) async {
    var anuncio = Anuncio(
      titulo: "", // titulo vazio
    ); // objeto novo
    final botaoFinder =
        find.byKey(const Key("btsalvar")); // localizador  do botão
    final validacaoFinder = find.text(
        "Digite um título para o anúncio."); // localizador da mensagem de validação

    await tester.pumpWidget(
        MaterialApp(home: AnuncioFormPagina(anuncio))); // abre o widget
    expect(botaoFinder, findsOneWidget); // verifica se o botão foi encontrado
    await tester.tap(botaoFinder); // pressiona o botão
    await tester.pumpAndSettle(); // aguarda a interface atualizar
    expect(validacaoFinder, findsOneWidget,
        reason:
            "formulário permitindo titulo vazio"); // verifica se a validação apareceu
  });
}
