import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyect/domain/models/my_reservations.dart';
import 'package:proyect/presentation/blocs/my_reservation/my_reservation_event.dart';
import 'package:proyect/presentation/blocs/my_reservation/my_reservation_state.dart';
import 'package:proyect/repository/my_reservations/my_reservations_repository.dart';

class MyReservationBloc extends Bloc<MyReservationEvent, MyReservationState>{

    final MyReservationRepository myRepository;
    // MyReservationBloc(super.initialState);
    MyReservationBloc({required this.myRepository}):super(MyReservationInitial()){
      on<FetchList>((event, emit)async{
        emit(MyReservationLoading());
        try{
          //aqui es donde se debe llamar al repositorio de datos
          List<Reserva> lista = await myRepository.fetchReservation();
          emit(MyReservationLoaded(list: lista));
        }catch(err) {
          emit(MyReservationError(err.toString()));
        }
        });
      }
    }
    

