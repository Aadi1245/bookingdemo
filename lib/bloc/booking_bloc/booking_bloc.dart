import 'dart:convert';

import 'package:demoappfortest/bloc/booking_bloc/booking_event.dart';
import 'package:demoappfortest/bloc/booking_bloc/booking_state.dart';
import 'package:demoappfortest/models/available_trip_data.dart';
import 'package:demoappfortest/models/seat_layout_data_model.dart';
import 'package:demoappfortest/models/seat_model2.dart';
import 'package:demoappfortest/repository/ApiConst.dart';
import 'package:demoappfortest/repository/ApiRepository.dart';
import 'package:demoappfortest/utils/app_const.dart';
import 'package:demoappfortest/utils/sessio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  Availabletrips tripData;

  BookingBloc(this.tripData) : super(BookingInitial()) {
    // getSatLayout();

    // getTentativeBooking();
  }

  getTentativeBooking() async {
    emit(BookingLoading());

    try {
      var formData = {
        "routeid": 5901,
        "tripid": 148789,
        "bpoint": 522446,
        "noofseats": 1,
        "mobileno": "8305933803",
        "email": "aadityagupta778@gmail.com",
        "totalfare": 1050,
        "bookedat": "2025-07-31",
        "seatInfo": {
          "passengerInfo": [
            {
              "Name": "Aaditya",
              "gender": "Male",
              "seatNo": "U10",
              "age": "25",
              "fare": "1050"
            }
          ]
        },
        "opid": "VGT"
      };

      var response =
          await ApiRepository.postAPI(ApiConst.getTentativeBooking, formData);

      final data = response.data; // ✅ Extract actual response map

      if (data["status"] != null && data["status"]["success"] == true) {
        await Session().setPnr(data["BookingInfo"]["PNR"]);

        print(
            "Tentative Booking done----------->${data["BookingInfo"]["PNR"]}");

        emit(BookingLoaded());
      } else {
        final message = data["status"]?["message"] ?? "Failed to load stations";
        emit(BookingFailure(error: message));
      }
    } catch (e) {
      print("Error in getAllStations: $e");
      emit(BookingFailure(error: "Something went wrong. Please try again."));
    }
  }

// AppConst.
}
