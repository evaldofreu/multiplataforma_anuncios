import 'dart:io';

import 'package:anuncios/app/modulos/anuncio/apresentacao/formulario/anuncio_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../dominio/anuncio.dart';

import 'anuncio_form_provedor.dart';

class AnuncioFormWidget extends StatefulWidget {
  final Anuncio anuncio;
  const AnuncioFormWidget(this.anuncio, {super.key});

  @override
  State<AnuncioFormWidget> createState() => _AnuncioFormWidgetState();
}

class _AnuncioFormWidgetState extends State<AnuncioFormWidget> {
  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    AnuncioFormProvider provider = AnuncioFormProvider.of(context)!;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("Editando anúncio"),
        ),
        body: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                GestureDetector(
                    onTap: () => provider.controlador.tirarFoto(context),
                    child: BlocBuilder<AnuncioFormBloc, String>(
                        builder: (context, snapshot) {
                      if (snapshot.isNotEmpty) {
                        widget.anuncio.urlImagem = snapshot;
                      }
                      return Container(
                        width: 200,
                        height: 200,
                        child: (widget.anuncio.urlImagem ?? "").isNotEmpty
                            ? widget.anuncio.urlImagem?.contains("https://") ??
                                    false
                                ? Image.network(
                                    widget.anuncio.urlImagem!,
                                    fit: BoxFit.cover,
                                  )
                                : Image.file(File(widget.anuncio.urlImagem!),
                                    fit: BoxFit.cover)
                            : const Icon(
                                Icons.photo_camera,
                                size: 20,
                              ),
                      );
                    })),
                const SizedBox(height: 10),
                TextFormField(
                  key: const Key("titulo"),
                  initialValue: widget.anuncio.titulo,
                  decoration: _decoracao("Título"),
                  onSaved: (newValue) => widget.anuncio.titulo = newValue ?? "",
                  validator: (value) => value == null || value.isEmpty
                      ? "Digite um título para o anúncio."
                      : null,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  initialValue: widget.anuncio.preco.toStringAsFixed(2),
                  decoration: _decoracao("Preço (R\$)"),
                  onSaved: (newValue) => widget.anuncio.preco =
                      double.tryParse(newValue ?? "0.0") ?? 0.0,
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    key: const Key("btsalvar"),
                    onPressed: () async {
                      if (formKey.currentState?.validate() ?? false) {
                        formKey.currentState?.save();
                        await provider.controlador
                            .atualizar(context, widget.anuncio);

                        Navigator.of(context).pop();
                      }
                    },
                    child: const Text("Salvar"))
              ],
            ),
          ),
        ));
  }

  _decoracao(String rotulo) {
    return InputDecoration(
      border: InputBorder.none,
      focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
      filled: true,
      contentPadding:
          const EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
      labelText: rotulo,
    );
  }
}
