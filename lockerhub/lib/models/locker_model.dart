import 'dart:convert';
import 'dart:ffi';

import 'package:lockerhub/models/activity_model.dart';
import 'package:http/http.dart' as http;

class LockerModel {
  String id;
  String addressLine;
  String city;
  String dimensions;
  String state;
  bool isAvailable;
  bool isIndoor;
  bool isInsulated;
  bool isWaterproof;
  int number;
  int phone;
  int zipcode;
  String establishmentName;
  int rate;
  String photoUrl;

  List<ActivityModel> activityLog = [];

  LockerModel({
    required this.id,
    required this.addressLine,
    required this.city,
    required this.dimensions,
    required this.state,
    required this.isIndoor,
    required this.isInsulated,
    required this.isWaterproof,
    required this.number,
    required this.phone,
    required this.zipcode,
    required this.isAvailable,
    required this.establishmentName,
    required this.rate,
    required this.photoUrl,
  });

  factory LockerModel.fromJson(Map<String, dynamic> json) {
    return LockerModel(
        id: json['id'],
        addressLine: json['data']['addressLine'],
        city: json['data']['city'],
        dimensions: json['data']['dimensions'],
        state: json['data']['state'],
        isIndoor: json['data']['isIndoor'],
        isInsulated: json['data']['isInsulated'],
        isWaterproof: json['data']['isWaterproof'],
        number: json['data']['number'],
        phone: json['data']['phone'],
        zipcode: json['data']['zipcode'],
        isAvailable: json['data']['isAvailable'],
        establishmentName: json['data']['establishmentName'],
        rate: json['data']['rate'],
        photoUrl: json['data']['photoUrl']);
  }

  addActivity(activityData) {
    ActivityModel activity = ActivityModel(
        id: activityData["id"],
        number: activityData['data']["number"],
        date: activityData['data']["date"],
        description: activityData['data']["description"]);

    activityLog.add(activity);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'data': {
          'addressLine': addressLine,
          'city': city,
          'dimensions': dimensions,
          'state': state,
          'isIndoor': isIndoor,
          'isInsulated': isInsulated,
          'isWaterproof': isWaterproof,
          'number': number,
          'phone': phone,
          'zipcode': zipcode,
          'isAvailable': isAvailable,
          'establishmentName': establishmentName,
          'rate': rate,
          'photoUrl': photoUrl
        }
      };

  // this method fetches the activity log for a locker using an http request. It then populates the list with the data from the request.

  Future<void> fetchActivityLog() async {
    // the url for the request is the url of the database, plus the id of the locker, plus the path to the activity log.
    final url = Uri.parse(
        'https://us-central1-lockerhub-5382f.cloudfunctions.net/getActivityLogByUnit?unit=$id');

    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      // the activity log is a map of maps, so we need to iterate through the map to get the data.
      extractedData.forEach((key, value) {
        addActivity(value);
      });
    } catch (error) {
      throw (error);
    }
  }
}
