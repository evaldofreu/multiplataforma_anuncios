import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dominio/anuncio.dart';
import 'anuncio_casouso.dart';
import 'apresentacao/detalhe/anuncio_detalhe_provedor.dart';
import 'apresentacao/lista/anuncio_lista_bloc.dart';
import 'apresentacao/lista/anuncio_lista_provedor.dart';

class AnuncioControlador {
  void editarAnuncio(BuildContext context, Anuncio anuncio) {
    Navigator.of(context).pushNamed("/anuncio/editar", arguments: anuncio);
  }

  carregarAnuncios(BuildContext context) async {
    AnuncioCasoUso? repo = AnuncioListaProvedor.of(context)?.anuncioRepo;
    var bloc = context.read<AnuncioListaBloc>();
    context.read<AnuncioListaBloc>().consultandoAnuncios();
    try {
      var anuncios = await repo?.obterLista();
      bloc.atualizarAnuncios(anuncios ?? []);
    } catch (e) {
      context.read<AnuncioListaBloc>().erro(e);
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
    AnuncioDetalheProvider provider = AnuncioDetalheProvider.of(context)!;
    await provider.anuncioCliente.atualizar(anuncio);
    Navigator.of(context).pop();
  }
}
