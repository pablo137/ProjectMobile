import 'package:proyect/domain/models/my_reservations.dart';

class MyReservationState{}

class MyReservationInitial extends MyReservationState{}

class MyReservationLoading extends MyReservationState{}

class MyReservationLoaded extends MyReservationState{
  List<Reserva> list;
  MyReservationLoaded({required this.list});

  //@override
  List<Object> get props => [list];
}


class MyReservationError extends MyReservationState {
  late String errorMessage;
  MyReservationError(this.errorMessage);

  //@override
  List<Object> get props => [errorMessage];
}