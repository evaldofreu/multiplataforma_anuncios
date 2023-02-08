import 'package:anuncios/app/modulos/anuncio/apresentacao/formulario/anuncio_form_pagina.dart';
import 'package:anuncios/app/modulos/anuncio/dominio/anuncio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Anuncio Form valida titulo ...', (tester) async {
    var anuncio = Anuncio(
      titulo: "",
    );
    final botaoFinder = find.byKey(const Key("btsalvar")); // localiza o botão
    final validacaoFinder = find.text("Digite um título para o anúncio.");

    await tester.pumpWidget(
        MaterialApp(home: AnuncioFormPagina(anuncio))); // lança o widget
    expect(botaoFinder, findsOneWidget); // verifica se o botão foi encontrado
    await tester.tap(botaoFinder);
    await tester.pumpAndSettle();
    expect(validacaoFinder, findsOneWidget,
        reason:
            "formulário permitindo titulo vazio"); // verifica se o botão foi encontrado
  });
}
