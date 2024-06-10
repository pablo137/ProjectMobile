import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyect/domain/models/my_reservations.dart';
import 'reservation_event.dart';
import 'reservation_state.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ReservationBloc extends Bloc<ReservationEvent, ReservationState> {
  ReservationBloc() : super(ReservationInitial()) {
    on<InitializeReservation>(_onInitializeReservation);
    on<UpdateReservationDate>(_onUpdateReservationDate);
    on<UpdateReservationTime>(_onUpdateReservationTime);
    on<ConfirmReservation>(_onConfirmReservation);
  }

  Future<void> _onInitializeReservation(
    InitializeReservation event,
    Emitter<ReservationState> emit,
  ) async {
    User? user = FirebaseAuth.instance.currentUser;
    final reserva = Reserva(
      cancha: event.cancha,
      estado: 'Pendiente',
      fecha: DateTime.now(),
      hora: '',
      usuarioId: user?.uid ?? '',
      usuario: user?.displayName ?? '',
    );
    emit(ReservationPending(reserva));
  }

  void _onUpdateReservationDate(
    UpdateReservationDate event,
    Emitter<ReservationState> emit,
  ) {
    final currentState = state;
    if (currentState is ReservationPending) {
      final updatedReserva = currentState.reserva.copyWith(fecha: event.fecha);
      emit(ReservationPending(updatedReserva));
    }
  }

  void _onUpdateReservationTime(
    UpdateReservationTime event,
    Emitter<ReservationState> emit,
  ) {
    final currentState = state;
    if (currentState is ReservationPending) {
      final updatedReserva = currentState.reserva.copyWith(hora: event.hora);
      emit(ReservationPending(updatedReserva));
    }
  }

  void _onConfirmReservation(
    ConfirmReservation event,
    Emitter<ReservationState> emit,
  ) {
    final currentState = state;
    if (currentState is ReservationPending) {
      final updatedReserva = currentState.reserva.copyWith(estado: 'Confirmada');
      emit(ReservationConfirmed(updatedReserva));
    }
  }
}
