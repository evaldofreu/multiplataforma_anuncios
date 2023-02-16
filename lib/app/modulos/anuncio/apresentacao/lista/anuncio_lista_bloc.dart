import 'package:bloc/bloc.dart';
import '../../dominio/anuncio.dart';
import 'anuncio_lista_estado.dart';

class AnuncioListaBloc extends Cubit<AnuncioListaEstado> {
  AnuncioListaBloc() : super(AnuncioListaEstado());

  void consultandoAnuncios() {
    AnuncioListaEstado novoEstado = AnuncioListaEstado();
    novoEstado.carregandoAnuncios = true;
    emit(novoEstado);
  }

  void atualizarAnuncios(List<Anuncio> anuncios) {
    AnuncioListaEstado novoEstado = AnuncioListaEstado();
    novoEstado.carregandoAnuncios = false;

    novoEstado.anuncios.addAll(anuncios);
    emit(novoEstado);
  }

  void erro(Object e) {
    addError(e);
    AnuncioListaEstado novoEstado = AnuncioListaEstado();
    novoEstado.carregandoAnuncios = false;
    novoEstado.anuncios = [];
    emit(novoEstado);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print(error);
  }
}
