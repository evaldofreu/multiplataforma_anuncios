import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'apresentacao/formulario/anuncio_form_provedor.dart';
import 'dominio/anuncio.dart';
import 'anuncio_casouso.dart';
import 'apresentacao/lista/anuncio_lista_bloc.dart';
import 'apresentacao/lista/anuncio_lista_provedor.dart';

class AnuncioControlador {
  void editarAnuncio(BuildContext context, Anuncio anuncio) {
    Navigator.of(context).pushNamed("/anuncio/editar", arguments: anuncio);
  }

  carregarAnuncios(BuildContext context) async {
    AnuncioCasoUso? repo = AnuncioListaProvedor.of(context)?.anuncioRepo;
    var bloc = context.read<AnuncioListaBloc>();

    bloc.consultandoAnuncios();
    try {
      var anuncios = await repo?.obterLista();
      bloc.atualizarAnuncios(anuncios ?? []);
    } catch (e) {
      bloc.erro(e);
    }
  }

  novoAnuncio(BuildContext context) async {
    await Navigator.of(context)
        .pushNamed("/anuncio/novo", arguments: Anuncio(titulo: ""));
  }

  exibirAnuncio(BuildContext context, Anuncio anuncio) async {
    await Navigator.of(context).pushNamed("/anuncio", arguments: anuncio);
  }

  atualizar(BuildContext context, Anuncio anuncio) async {
    AnuncioFormProvider provider = AnuncioFormProvider.of(context)!;
    await provider.repositorio.atualizar(anuncio);
    Navigator.of(context).pop();
  }
}
