import 'dart:convert';
import 'package:demoappfortest/models/passenger_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Session {
  static const _key = 'passenger_list';

  static Future<void> savePassenger(Passenger passenger) async {
    final prefs = await SharedPreferences.getInstance();
    final list = await getPassengers();
    list.add(passenger);

    final jsonList = list.map((e) => jsonEncode(e.toJson())).toList();
    await prefs.setStringList(_key, jsonList);
  }

  static Future<void> saveAllPassengers(List<Passenger> passengers) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = passengers.map((e) => jsonEncode(e.toJson())).toList();
    await prefs.setStringList(_key, jsonList);
  }

  static Future<List<Passenger>> getPassengers() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = prefs.getStringList(_key) ?? [];
    return jsonList.map((e) => Passenger.fromJson(jsonDecode(e))).toList();
  }
}
