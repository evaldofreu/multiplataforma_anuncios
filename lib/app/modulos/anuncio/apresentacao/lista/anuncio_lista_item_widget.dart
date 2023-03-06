import 'dart:io';

import 'package:flutter/material.dart';

import '../../dominio/anuncio.dart';
import 'anuncio_lista_provedor.dart';

class AnuncioListaItemWidget extends StatelessWidget {
  final Anuncio anuncio;
  const AnuncioListaItemWidget(this.anuncio, {super.key});

  @override
  Widget build(BuildContext context) {
    Uri imagemCaminho = Uri.parse(anuncio.urlImagem ?? "");
    return ListTile(
        leading: ((anuncio.urlImagem ?? "").isEmpty)
            ? Icon(Icons.photo_size_select_actual_outlined)
            : imagemCaminho.isScheme("HTTP")
                ? Image.network(
                    anuncio.urlImagem ?? "",
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  )
                : Image.file(
                    File(imagemCaminho.path),
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
        title: Text(anuncio.titulo),
        subtitle: Text("R\$ ${anuncio.preco.toStringAsFixed(2)}"),
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.shopping_bag_outlined),
        ),
        onTap: () => AnuncioListaProvedor.of(context)
            ?.controlador
            .exibirAnuncio(context, anuncio));
  }
}
