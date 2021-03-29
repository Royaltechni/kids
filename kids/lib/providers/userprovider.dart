import 'package:flutter/material.dart';
import 'package:kids/models/db.dart';
import 'package:kids/models/location.dart';

class Userprovider with ChangeNotifier {
  Location location;
  static String country;
  static String city;
  static String timezone;
  Future<void> fetchuserlocation() async {
    try {
      location = await Dbhandler.instance.getlocation();
      country=location.country;
      city=location.city;
      timezone=location.timezone.split('/').first;
    } catch (error) {
      print('error');
    }
  }

}