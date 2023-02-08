import 'package:anuncios/app/modulos/anuncio/apresentacao/formulario/anuncio_form_pagina.dart';
import 'package:anuncios/app/modulos/anuncio/dominio/anuncio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('anuncio form pagina ...', (tester) async {
    var anuncio = Anuncio(
      titulo: "Anúncio novo",
    );
    await tester.pumpWidget(
        MaterialApp(home: AnuncioFormPagina(anuncio))); // lança o widget
    final botao = find.byKey(const Key("btsalvar")); // localiza o botão
    expect(botao, findsOneWidget); // verifica se o botão foi encontrado
    await tester.press(botao);
    await tester.pumpAndSettle();
    final validacao = find.textContaining("Digite");
    expect(validacao, findsOneWidget,
        reason:
            "formulário permitindo titulo vazio"); // verifica se o botão foi encontrado
  });
}
