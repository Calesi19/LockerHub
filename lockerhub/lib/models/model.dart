import 'package:lockerhub/models/establishment_model.dart';
import 'package:lockerhub/models/user_model.dart';
import 'package:lockerhub/models/locker_model.dart';

import 'package:lockerhub/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Model {
  // User Data
  UserModel? userModel;

  // A list of all lockers rented by user.
  List<LockerModel> userLockers = [];

  // A connection to the Firebase Authentication service. Tracks if user is valid and logged in.
  final FirebaseAuth auth = FirebaseAuth.instance;

  // A reference to the user's profile in the Authentication service.
  final User? user = FirebaseAuth.instance.currentUser;

  // A list of establishments the show up as a result of a search. Each establishment holds a list of lockers available for rent.
  List<EstablishmentModel> locationResults = [];

  // Private constructor
  Model._privateConstructor();

  // Static private instance
  static final Model _instance = Model._privateConstructor();

  // Static getter to get the instance
  static Model get instance => _instance;

  // Clear search results.
  clearLocationResults() {
    locationResults = [];
  }

  // Clear list of lockers rented by user.
  clearUserLockers() {
    userLockers = [];
  }

  // For testing purposes: print establishments from search results.
  printLockers() {
    for (var establishment in locationResults) {
      for (var locker in establishment.lockers) {
        print(locker.addressLine);
      }
      print(establishment.getCount());
    }
  }

  addLocker(lockerData) {
    LockerModel locker = LockerModel(
        id: lockerData["id"],
        addressLine: lockerData["data"]['addressLine'],
        city: lockerData["data"]['city'],
        dimensions: lockerData["data"]['dimensions'],
        state: lockerData["data"]['state'],
        isIndoor: lockerData["data"]['isIndoor'],
        isInsulated: lockerData["data"]['isInsulated'],
        isWaterproof: lockerData["data"]['isWaterproof'],
        number: lockerData["data"]['number'],
        phone: lockerData["data"]['phone'],
        zipcode: lockerData["data"]['zipcode'],
        isAvailable: lockerData["data"]['isAvailable'],
        establishmentName: lockerData["data"]['establishmentName'],
        rate: lockerData["data"]['rate'],
        photoUrl: lockerData["data"]['photoUrl']);

    userLockers.add(locker);
  }

  addLockerToSearchResults(lockerData) {
    LockerModel locker = LockerModel(
        id: lockerData["id"],
        addressLine: lockerData["data"]['addressLine'],
        city: lockerData["data"]['city'],
        dimensions: lockerData["data"]['dimensions'],
        state: lockerData["data"]['state'],
        isIndoor: lockerData["data"]['isIndoor'],
        isInsulated: lockerData["data"]['isInsulated'],
        isWaterproof: lockerData["data"]['isWaterproof'],
        number: lockerData["data"]['number'],
        phone: lockerData["data"]['phone'],
        zipcode: lockerData["data"]['zipcode'],
        isAvailable: lockerData["data"]['isAvailable'],
        establishmentName: lockerData["data"]['establishmentName'],
        rate: lockerData["data"]['rate'],
        photoUrl: lockerData["data"]['photoUrl']);

    for (var establishment in locationResults) {
      if (establishment.addressLine == locker.addressLine &&
          establishment.city == locker.city) {
        establishment.addLocker(locker);
        return;
      }
    }
    ;

    EstablishmentModel newLocation = new EstablishmentModel(
        city: lockerData['data']["city"],
        addressLine: lockerData['data']['addressLine'],
        name: lockerData['data']["establishmentName"],
        state: lockerData['data']["state"],
        zipcode: lockerData['data']["zipcode"],
        phone: lockerData['data']["phone"]);

    newLocation.addLocker(locker);

    locationResults.add(newLocation);
  }

  Future<void> fetchUnitsByOwner(String owner_id) async {
    Model.instance.clearUserLockers();

    final response = await http.get(Uri.parse(
        'https://us-central1-lockerhub-5382f.cloudfunctions.net/getUnitsByOwner?owner=$owner_id'));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      jsonResponse.forEach((item) => {Model.instance.addLocker(item)});
    } else {
      throw Exception('Failed to load data');
    }
  }

  void clearSearchResults() {
    locationResults = [];
  }
}
