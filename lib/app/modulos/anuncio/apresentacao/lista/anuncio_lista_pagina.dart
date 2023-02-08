import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../infra/comunicacao/anuncio_repo.dart';
import '../../anuncio_controlador.dart';
import 'anuncio_lista_bloc.dart';
import 'anuncio_lista_widget.dart';
import 'anuncio_lista_provedor.dart';
import 'package:http/http.dart' as http;

class AnuncioListaPagina extends StatelessWidget {
  const AnuncioListaPagina({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = AnuncioListaProvedor(
        controlador: AnuncioControlador(),
        anuncioRepo: AnuncioRepo(http.Client()),
        child: BlocProvider(
          create: (context) => AnuncioListaBloc(),
          child: const AnuncioListaWidget(),
        ));
    return provider;
  }
}
