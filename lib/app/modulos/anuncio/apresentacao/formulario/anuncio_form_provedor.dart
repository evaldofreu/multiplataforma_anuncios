import 'package:anuncios/app/modulos/anuncio/anuncio_casouso.dart';
import 'package:flutter/material.dart';

import '../../anuncio_controlador.dart';

class AnuncioFormProvider extends InheritedWidget {
  const AnuncioFormProvider(
      {required this.controlador,
      required this.repositorio,
      super.key,
      required this.child})
      : super(child: child);

  final Widget child;
  final AnuncioCasoUso repositorio;
  final AnuncioControlador controlador;

  static AnuncioFormProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AnuncioFormProvider>();
  }

  @override
  bool updateShouldNotify(AnuncioFormProvider oldWidget) {
    return true;
  }
}
