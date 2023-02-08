import 'usuario.dart';

abstract class UsuarioCasoUso {
  Future<Usuario> autenticar(String email, String senha);
}
