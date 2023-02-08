import 'package:flutter/material.dart';

import '../../anuncio_casouso.dart';
import '../../anuncio_controlador.dart';

class AnuncioDetalheProvider extends InheritedWidget {
  const AnuncioDetalheProvider(
      {super.key,
      required this.child,
      required this.anuncioCliente,
      required this.controlador})
      : super(child: child);

  final Widget child;

  final AnuncioCasoUso anuncioCliente;
  final AnuncioControlador controlador;

  static AnuncioDetalheProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AnuncioDetalheProvider>();
  }

  @override
  bool updateShouldNotify(AnuncioDetalheProvider oldWidget) {
    return true;
  }
}
