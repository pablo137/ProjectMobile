import 'package:bloc/bloc.dart';
import 'package:proyect/presentation/blocs/courts/courts_event.dart';
import 'package:proyect/presentation/blocs/courts/courts_state.dart';

class CourtsBloc extends Bloc<CourtsEvent, CourtsState> {
  CourtsBloc() : super(const CourtsState(0)) {
    // Registra el controlador de eventos
    on<CourtsEvent>((event, emit) {
      if (event == CourtsEvent.selectFutbol8 || event == CourtsEvent.navigateToCourts) {
        emit(const CourtsState(0));
      } else if (event == CourtsEvent.selectWallyRaquet) {
        emit(const CourtsState(1));
      }
    });
  }
}