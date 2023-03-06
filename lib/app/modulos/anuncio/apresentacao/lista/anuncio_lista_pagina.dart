import 'package:anuncios/app/modulos/anuncio/infra/firebase/anuncio_fb.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../anuncio_controlador.dart';
import '../../infra/bd/anuncio_sql.dart';
import 'anuncio_lista_bloc.dart';
import 'anuncio_lista_widget.dart';
import 'anuncio_lista_provedor.dart';

class AnuncioListaPagina extends StatelessWidget {
  const AnuncioListaPagina({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = AnuncioListaProvedor(
        controlador: AnuncioControlador(),
        // anuncioRepo: AnuncioRepo(http.Client()),
        anuncioRepo: AnuncioSql(),
        //anuncioRepo: AnuncioFirebase(),
        child: BlocProvider(
          create: (context) => AnuncioListaBloc(),
          child: const AnuncioListaWidget(),
        ));
    return provider;
  }
}
