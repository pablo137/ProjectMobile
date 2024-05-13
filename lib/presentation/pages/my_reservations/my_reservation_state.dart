import 'package:proyect/domain/my_reservations/my_reservations_page.dart';
import 'package:proyect/presentation/pages/my_reservations/my_reservation_page.dart';

class MyReservationState{}

class MyReservationInitial extends MyReservationState{}

class MyReservationLoading extends MyReservationState{}

class MyReservationLoaded extends MyReservationState{
  List<Reserva> list;
  MyReservationLoaded(MyRerservationPage reserv, {required this.list});

  @override
  List<Object> get props => [list];
}


class MyReservationError extends MyReservationState {
  late String errorMessage;
  MyReservationError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}