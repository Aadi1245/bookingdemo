import 'package:demoappfortest/models/seat_layout_data_model.dart';

abstract class SeatLayoutState {}

class SeatLayoutInitial extends SeatLayoutState {}

class SeatLayoutLoading extends SeatLayoutState {}

class SeatLayoutLoaded extends SeatLayoutState {
  final SeatLayoutDataModel seatLayoutDataModel;

  SeatLayoutLoaded({required this.seatLayoutDataModel});
}
