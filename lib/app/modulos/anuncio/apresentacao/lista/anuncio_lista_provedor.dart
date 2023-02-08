import 'package:flutter/material.dart';

import '../../anuncio_casouso.dart';
import '../../anuncio_controlador.dart';

class AnuncioListaProvedor extends InheritedWidget {
  const AnuncioListaProvedor(
      {super.key,
      required this.child,
      required this.anuncioRepo,
      required this.controlador})
      : super(child: child);

  final Widget child;

  final AnuncioCasoUso anuncioRepo;
  final AnuncioControlador controlador;

  static AnuncioListaProvedor? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AnuncioListaProvedor>();
  }

  @override
  bool updateShouldNotify(AnuncioListaProvedor oldWidget) {
    return true;
  }
}
