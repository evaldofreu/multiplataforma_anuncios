import 'package:anuncios/app/modulos/anuncio/dominio/anuncio.dart';
import 'package:anuncios/app/modulos/anuncio/apresentacao/detalhe/anuncio_detalhe_pagina.dart';
import 'package:anuncios/app/modulos/anuncio/apresentacao/formulario/anuncio_form_pagina.dart';
import 'package:anuncios/app/modulos/anuncio/apresentacao/lista/anuncio_lista_pagina.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        '/': (context) => const AnuncioListaPagina(),
        '/anuncio': (context) {
          Anuncio anuncio =
              ModalRoute.of(context)?.settings.arguments as Anuncio;
          return AnuncioDetalhePagina(anuncio);
        },
        '/anuncio/editar': (context) {
          Anuncio? anuncio =
              ModalRoute.of(context)?.settings.arguments as Anuncio?;
          return AnuncioFormPagina(anuncio!);
        },
        '/anuncio/novo': (context) {
          return AnuncioFormPagina(Anuncio(titulo: ""));
        }
      },
    );
  }
}
