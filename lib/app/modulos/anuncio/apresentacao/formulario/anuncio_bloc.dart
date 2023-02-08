import 'package:bloc/bloc.dart';

class AnuncioFormBloc extends Cubit<String> {
  AnuncioFormBloc() : super("");

  void trocarImage(imagem) => emit(imagem);
}
