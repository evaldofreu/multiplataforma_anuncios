import 'package:anuncios/app/modulos/anuncio/anuncio_casouso.dart';
import 'package:anuncios/app/modulos/anuncio/dominio/anuncio.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AnuncioFirebase extends AnuncioCasoUso {
  @override
  Future<void> atualizar(Anuncio anuncio) async {
    var ref = await FirebaseFirestore.instance
        .collection("anuncio")
        .add(anuncio.toMap());
  }

  @override
  Future<void> exluir(Anuncio anuncio) async {
    var ref = await FirebaseFirestore.instance
        .collection("anuncio")
        .doc(anuncio.id)
        .delete();
  }

  @override
  Future<Anuncio> obter(String id) async {
    var ref = FirebaseFirestore.instance.collection("anuncio").doc(id);
    Map<String, dynamic>? json = (await ref.get()).data();

    return Anuncio.fromJson(json!);
  }

  @override
  Future<List<Anuncio>> obterLista() async {
    CollectionReference<Map<String, dynamic>> ref =
        FirebaseFirestore.instance.collection("anuncio");
    var anuncios = await ref.get();
    return anuncios.docs.map((e) => Anuncio.fromJson(e.data())).toList();
  }
}
