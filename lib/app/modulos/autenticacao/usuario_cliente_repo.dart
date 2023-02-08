import 'usuario.dart';
import 'usuario_casouso.dart';

class UsuarioClienteRest extends UsuarioCasoUso {
  @override
  Future<Usuario> autenticar(String email, String senha) {
    return Future.value(
        Usuario(id: "1", email: "teste@teste", nome: "Tester de Teste"));
  }
}
