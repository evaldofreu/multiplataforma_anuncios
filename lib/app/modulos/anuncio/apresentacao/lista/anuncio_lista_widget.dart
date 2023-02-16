import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../dominio/anuncio.dart';
import 'anuncio_lista_bloc.dart';
import 'anuncio_lista_estado.dart';
import 'anuncio_lista_item_widget.dart';
import 'anuncio_lista_provedor.dart';

class AnuncioListaWidget extends StatelessWidget {
  const AnuncioListaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    AnuncioListaProvedor? provider = AnuncioListaProvedor.of(context);
    provider?.controlador.carregarAnuncios(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("App Anúncios"),
      ),
      body: BlocBuilder<AnuncioListaBloc, AnuncioListaEstado>(
        builder: (context, snapshot) {
          List<Anuncio> anuncios = snapshot.anuncios;
          return snapshot.carregandoAnuncios
              ? _indicadorProgresso(context)
              : ListView.builder(
                  itemCount: snapshot.anuncios.length,
                  itemBuilder: (context, index) =>
                      AnuncioListaItemWidget(anuncios[index]));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => provider?.controlador.novoAnuncio(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  _indicadorProgresso(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              valueColor:
                  AlwaysStoppedAnimation(Theme.of(context).indicatorColor),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 18.0),
              child: Text("Aguarde, carregando anuncios..."),
            )
          ],
        ),
      ],
    );
  }
}
