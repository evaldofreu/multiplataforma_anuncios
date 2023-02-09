import 'package:flutter/material.dart';

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
                    child: Container(
                  width: 200,
                  height: 200,
                  child: (widget.anuncio.urlImagem ?? "").isNotEmpty
                      ? Image.network(
                          widget.anuncio.urlImagem!,
                          fit: BoxFit.cover,
                        )
                      : const Icon(
                          Icons.photo_camera,
                          size: 20,
                        ),
                )),
                const SizedBox(height: 10),
                TextFormField(
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
                    onPressed: () {
                      if (formKey.currentState?.validate() ?? false) {
                        provider.controlador.atualizar(context, widget.anuncio);
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
