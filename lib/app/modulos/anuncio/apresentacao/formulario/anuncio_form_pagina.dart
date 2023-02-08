import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../dominio/anuncio.dart';
import '../../anuncio_controlador.dart';
import 'anuncio_bloc.dart';
import 'anuncio_form_provedor.dart';
import 'anuncio_form_widget.dart';

class AnuncioFormPagina extends StatelessWidget {
  final Anuncio anuncio;
  const AnuncioFormPagina(this.anuncio, {super.key});

  @override
  Widget build(BuildContext context) {
    return AnuncioFormProvider(
        controlador: AnuncioControlador(),
        child: BlocProvider(
            create: (context) => AnuncioFormBloc(),
            child: AnuncioFormWidget(anuncio)));
  }
}
