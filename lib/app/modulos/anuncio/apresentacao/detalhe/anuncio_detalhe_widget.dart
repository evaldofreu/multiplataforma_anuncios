import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'anuncio_detalhe_bloc.dart';

import 'anuncio_detalhe_estado.dart';
import 'anuncio_detalhe_provedor.dart';

class AnuncioDetalheWidget extends StatelessWidget {
  const AnuncioDetalheWidget({super.key});

  @override
  Widget build(BuildContext context) {
    AnuncioDetalheProvider? provider = AnuncioDetalheProvider.of(context);
    return BlocBuilder<AnuncioDetalheBloc, AnuncioDetalheEstado>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title:
                  Text("${(state.anuncio?.id == null) ? 'Novo ' : ''}Anúncio"),
              actions: [
                IconButton(
                    onPressed: () {
                      provider!.controlador
                          .editarAnuncio(context, state.anuncio!);
                    },
                    icon: const Icon(Icons.edit))
              ],
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ((state.anuncio?.urlImagem ?? "").isEmpty)
                        ? Icon(Icons.photo_size_select_actual_outlined)
                        : Image.network(
                            state.anuncio?.urlImagem ?? "",
                            fit: BoxFit.cover,
                          ),
                  ),
                  Text(
                    state.anuncio?.titulo ?? "",
                    style: const TextStyle(fontSize: 45),
                  ),
                  Text("Preço R\$ ${state.anuncio?.preco.toStringAsFixed(2)}",
                      style: const TextStyle(fontSize: 20)),
                  const SizedBox(
                    height: 50,
                  )
                ],
              ),
            ));
      },
    );
  }
}
