import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:kidsapp/models/Homedata.dart';
import 'package:kidsapp/models/Salahsummry.dart';
import 'package:kidsapp/models/Top_student.dart';
import 'package:kidsapp/models/db.dart';
import 'package:kidsapp/models/location.dart';
import 'package:kidsapp/models/score.dart';
import 'package:kidsapp/models/user.dart';
import 'package:kidsapp/providers/lanprovider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Userprovider with ChangeNotifier {
  User currentUser;
  Locationn location;
  static String country;
  static String city;
  static String enabled;
  static String timezone;
  static String sd;
  static String done;
  static String username;
  Score score;
  Salahsummary salah;
  Homedata homedata;
  Topstudents topstudents;
  Topstudents topclassstudents;
  LocationPermission permission;

  Future<Score> fetchscore() async {
    try {
      score = await Dbhandler.instance.getscore();
    } catch (error) {
      print('erroe');
    }
  }

  Future<void> saverUserData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('token', currentUser.token);
    preferences.setString('name', Userprovider.username);
    //  preferences.setString('email', currentUser.email);
    // preferences.setString('id', currentUser.id.toString());
  }

  Future<void> clearuserdata() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('token');
    preferences.remove('name');
  }

  Future<String> signInn(String email, String password) async {
    try {
      currentUser = await Dbhandler.instance.signIn(email, password);
      await saverUserData();
      return null;
    } catch (error) {
      return 'errorrrrrrr';
    }
  }

  Future<bool> isLoggedIn() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    if (preferences.containsKey('token')) {
      currentUser = User.fromPrefs(preferences);
      // Provider.of<Lanprovider>(context,listen: false).islogin=
      return true;
    } else {
      return false;
    }
  }

  Future<void> getusername() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    currentUser = User.fromPrefs(preferences);
  }

  Future<void> getUserLocation() async {
    try {
      var position = await GeolocatorPlatform.instance.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      var placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      var first = placemarks.first;
      Userprovider.city = first.administrativeArea;
      Userprovider.country = first.country;
    } catch (error) {
      Userprovider.city = 'cairo';
      Userprovider.country = 'egypt';
      return false;
    }
  }

  Future<void> fetchhomedata() async {
    try {
      homedata = await Dbhandler.instance.gethomedata();
    } catch (error) {
      print('erroe');
    }
  }

  Future<void> fetchsalahsummary(int id) async {
    try {
      salah = await Dbhandler.instance.getsalahsumrry(id);
    } catch (error) {
      print('error');
    }
  }

  Future<void> fetchtopstudents() async {
    try {
      topstudents = await Dbhandler.instance.gettopstudents();
    } catch (error) {
      print('error');
    }
  }

  Future<void> topclassstudent() async {
    try {
      topclassstudents = await Dbhandler.instance.gettopclassstudents();
    } catch (error) {
      print('error');
    }
  }
}
