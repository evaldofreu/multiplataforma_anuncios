import 'package:anuncios/app/modulos/anuncio/apresentacao/formulario/anuncio_form_pagina.dart';
import 'package:anuncios/app/modulos/anuncio/dominio/anuncio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: AnuncioFormPagina(Anuncio(titulo: "")),
  ));
}
