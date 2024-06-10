
abstract class ReservationEvent   {
  const ReservationEvent();

  @override
  List<Object> get props => [];
}

class InitializeReservation extends ReservationEvent {
  final String cancha;

  const InitializeReservation(this.cancha);

  @override
  List<Object> get props => [cancha];
}

class UpdateReservationDate extends ReservationEvent {
  final DateTime fecha;

  const UpdateReservationDate(this.fecha);

  @override
  List<Object> get props => [fecha];
}

class UpdateReservationTime extends ReservationEvent {
  final String hora;

  const UpdateReservationTime(this.hora);

  @override
  List<Object> get props => [hora];
}

class ConfirmReservation extends ReservationEvent {}
