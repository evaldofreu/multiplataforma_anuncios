import 'package:sqflite/sqflite.dart';

import '../../anuncio_casouso.dart';
import '../../dominio/anuncio.dart';

class AnuncioSql extends AnuncioCasoUso {
  late Database _db; //istancia do banco de dados sqflite
  Future _openDb() async {
    _db = await openDatabase(
      'anuncio.db', // arquivo do banco de dados na pasta do aplicativo
      version: 1, // númeor da versão atual do banco de dados
      onCreate: (db, version) async => await db.execute(
          "CREATE TABLE anuncio (id INTEGER PRIMARY KEY, titulo TEXT NOT NULL,preco REAL, urlImagem TEXT )"), // cria as tabelas junto com o banco
    );
  }

  @override
  Future<void> atualizar(Anuncio anuncio) async {
    // é importante deixar o banco de dados fechado quando não estiver utilizando
    await _openDb();
    if (anuncio.id == null) {
      await _db.insert('anuncio', anuncio.toMap());
    } else {
      await _db.update('anuncio', anuncio.toMap(),
          where: "id=?", whereArgs: [anuncio.id]);
    }
    _db.close();
  }

  @override
  Future<void> exluir(Anuncio anuncio) async {
    await _openDb();
    await _db.delete('anuncio', where: "id", whereArgs: [anuncio.id]);
    _db.close();
  }

  @override
  Future<Anuncio> obter(String id) async {
    await _openDb();
    List<Map<String, Object?>> anuncios =
        await _db.rawQuery("SELECT * FROM id=?", [id]);
    var anuncio = Anuncio.fromJson(anuncios.first);
    _db.close();

    return anuncio;
  }

  @override
  Future<List<Anuncio>> obterLista() async {
    await _openDb();
    var registros = await _db.query('anuncio');
    var anuncios = registros.map((e) => Anuncio.fromJson(e)).toList();
    _db.close();
    return anuncios;
  }
}
