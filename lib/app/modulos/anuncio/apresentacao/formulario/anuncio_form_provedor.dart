import 'package:flutter/material.dart';

import '../../anuncio_controlador.dart';

class AnuncioFormProvider extends InheritedWidget {
  const AnuncioFormProvider(
      {required this.controlador, super.key, required this.child})
      : super(child: child);

  final Widget child;
  final AnuncioControlador controlador;

  static AnuncioFormProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AnuncioFormProvider>();
  }

  @override
  bool updateShouldNotify(AnuncioFormProvider oldWidget) {
    return true;
  }
}
