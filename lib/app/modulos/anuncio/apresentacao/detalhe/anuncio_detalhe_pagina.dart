import 'package:anuncios/app/modulos/anuncio/infra/comunicacao/anuncio_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../dominio/anuncio.dart';
import 'anuncio_detalhe_bloc.dart';
import '../../anuncio_controlador.dart';
import 'anuncio_detalhe_provedor.dart';
import 'anuncio_detalhe_widget.dart';
import 'package:http/http.dart' as http;

class AnuncioDetalhePagina extends StatelessWidget {
  final Anuncio anuncio;
  const AnuncioDetalhePagina(this.anuncio, {super.key});

  @override
  Widget build(BuildContext context) {
    return AnuncioDetalheProvider(
        controlador: AnuncioControlador(),
        anuncioCliente: AnuncioRepo(http.Client()),
        child: BlocProvider(
          create: (context) => AnuncioDetalheBloc(anuncio),
          child: const AnuncioDetalheWidget(),
        ));
  }
}
