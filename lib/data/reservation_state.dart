import 'package:proyect/domain/models/my_reservations.dart';

abstract class ReservationState{
  const ReservationState();

  @override
  List<Object> get props => [];
}

class ReservationInitial extends ReservationState {}

class ReservationPending extends ReservationState {
  final Reserva reserva;

  const ReservationPending(this.reserva);

  @override
  List<Object> get props => [reserva];
}

class ReservationConfirmed extends ReservationState {
  final Reserva reserva;

  const ReservationConfirmed(this.reserva);

  @override
  List<Object> get props => [reserva];
}
