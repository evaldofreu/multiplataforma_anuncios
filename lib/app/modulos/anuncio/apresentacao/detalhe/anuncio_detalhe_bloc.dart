import 'package:bloc/bloc.dart';

import '../../dominio/anuncio.dart';
import 'anuncio_detalhe_estado.dart';

class AnuncioDetalheBloc extends Cubit<AnuncioDetalheEstado> {
  AnuncioDetalheBloc(Anuncio anuncio)
      : super(AnuncioDetalheEstado(anuncio: anuncio));

  selecionarAnuncio(Anuncio? anuncio) =>
      emit(AnuncioDetalheEstado(anuncio: anuncio));
}
