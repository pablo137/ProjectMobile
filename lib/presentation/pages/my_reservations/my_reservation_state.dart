

import 'package:proyect/domain/my_reservations/my_reservations_page.dart';

class MyReservationState{}

class MyReservationInitial extends MyReservationState{}

class MyReservationLoading extends MyReservationState{}

class MyReservationLoaded extends MyReservationState{
  List<Reserva> get props => [];
  MyReservationLoaded(props);
}


class MyReservationError extends MyReservationState {
  late String errorMessage;
  MyReservationError(this.errorMessage);
}