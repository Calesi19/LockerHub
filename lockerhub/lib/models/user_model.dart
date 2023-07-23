import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lockerhub/auth.dart';
import 'package:lockerhub/models/model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String? _lastName;
  String? _firstName;
  String? _email;
  int? _phone;

  UserModel() {
    _firstName = null;
    _lastName = null;
    _email = null;
    _phone = null;
    fetchUser();
  }

  Future<void> fetchUser() async {
    print(Model.instance.auth.currentUser!.uid);
    final response = await http.get(Uri.parse(
        'https://us-central1-lockerhub-5382f.cloudfunctions.net/getUser?id=${Model.instance.auth.currentUser!.uid}'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      _lastName = data['lastName'];
      _firstName = data['firstName'];
      _email = data['email'];
      _phone = data['phone'];
    } else {
      throw Exception('Failed to load user');
    }
  }

  String get lastName {
    return _lastName ?? '';
  }

  String get firstName {
    return _firstName ?? '';
  }

  String get email {
    return _email ?? '';
  }

  int get phone {
    return _phone ?? 0;
  }
}

void fetchData() async {
  final response = await http.get(Uri.parse(
      'https://us-central1-lockerhub-5382f.cloudfunctions.net/getUser?id=J4WseMX06b40Cbr0RK8F'));

  if (response.statusCode == 200) {
    // If the server returns a 200 OK response, then parse the JSON.
    print(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response, then throw an exception.
    throw Exception('Failed to load data');
  }
}
