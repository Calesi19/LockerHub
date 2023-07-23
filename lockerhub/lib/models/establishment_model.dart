import 'package:lockerhub/models/locker_model.dart';

class EstablishmentModel {
  String name;
  String addressLine;
  String city;
  int zipcode;
  String state;
  int phone;

  List<LockerModel> lockers = [];

  EstablishmentModel(
      {required this.city,
      required this.addressLine,
      required this.name,
      required this.state,
      required this.zipcode,
      required this.phone});

  addLocker(LockerModel locker) {
    lockers.add(locker);
  }

  clearResults() {
    lockers = [];
  }

  int getCount() {
    return lockers.length;
  }

}
