import 'package:firebase_auth/firebase_auth.dart';
import 'package:lockerhub/auth.dart';
import 'package:flutter/material.dart';
import 'package:lockerhub/drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'package:lockerhub/models/locker_model.dart';
import 'dart:convert';
import 'package:lockerhub/models/user_model.dart';
import 'package:lockerhub/pages/activity_log_page.dart';
import 'package:lockerhub/pages/locker_page.dart';
import 'package:lockerhub/pages/payments_page.dart';
import 'package:lockerhub/models/model.dart';
import 'package:lockerhub/pages/rent_search_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();

  static Future<void> signOut() async {
    await Auth().signOut();
  }
}

class _HomePageState extends State<HomePage> {
  List<LockerModel> userLockers = Model.instance.userLockers;

  final User? user = Auth().currentUser;

  UserModel model = UserModel();

  Widget _title() {
    return const Text(
      'Lockers',
      style: TextStyle(color: Colors.black),
    );
  }

  Widget _userUid() {
    return Text(user?.email ?? 'User email');
  }

  Widget homeDivider() {
    return Container(
      margin: EdgeInsets.only(bottom: 20, top: 20),
      child: Row(children: const <Widget>[
        Expanded(
            child: Divider(
          color: Colors.transparent,
          indent: 40,
          endIndent: 5,
          thickness: 4,
        )),
        Text(
          'RENTED UNITS',
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        Expanded(
            child: Divider(
          color: Colors.transparent,
          indent: 5,
          endIndent: 45,
          thickness: 4,
        )),
      ]),
    );
  }

  Widget accountBalance(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(61, 34, 108, 1),
            Color.fromRGBO(130, 79, 217, 1)
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const PaymentsPage()))
          },
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(children: [
              const Text(
                'Account Balance',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                  color: Colors.white, // Set color for visibility
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                '\$343.34',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Set color for visibility
                  fontSize: 50.0,
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Widget lockerTile(BuildContext context, LockerModel locker) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LockerPage(locker: locker)))
          },
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Row(children: [
              Column(
                children: [
                  Text("Unit",
                      style: TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 26, 7, 31),
                          fontWeight: FontWeight.bold)),
                  Text(
                    
                    '${locker.number}',
                    style: TextStyle(
                        fontSize: 50,
                        color: Color.fromARGB(255, 26, 7, 31),
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Spacer(),
              Column(children: [
                Text('${locker.addressLine}\n${locker.city}, ${locker.state}',
                    style: TextStyle(color: Colors.black)),
              ]),
            ]),
          ),
        ),
      ),
    );
  }

  Future<List<Widget>> createLockerList() async {
    Model.instance.clearUserLockers();
    await Model.instance
        .fetchUnitsByOwner(Model.instance.user?.uid ?? 'No ID Found');
    List<LockerModel> fetchedLockers = Model.instance.userLockers;
    print(fetchedLockers.length);
    return List<Widget>.generate(fetchedLockers.length, (int index) {
      return lockerTile(context, fetchedLockers[index]);
    });
  }

  Widget rentButton(context) {
    return SafeArea(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Color.fromRGBO(53, 53, 53, 1),
            ), // Adjust this value as needed
            child: MaterialButton(
              minWidth: double.infinity,
              height: 60,
              onPressed: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RentSearchPage()))
              },
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(10.0), // Adjust this value as needed
              ),
              child: Text(
                'Rent Unit',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: .0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Image.asset(
              'lib/images/logo_black.png',
              width: 32,
              height: 32,
            ),
          )
        ],
        title: _title(),
      ),
      drawer: NavBar(name: model.firstName, email: model.email),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: FutureBuilder<List<Widget>>(
              future: createLockerList(),
              builder:
                  (BuildContext context, AsyncSnapshot<List<Widget>> snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.connectionState == ConnectionState.done) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Expanded(child: accountBalance(context)),
                        ],
                      ),
                      homeDivider(),
                      ...snapshot.data!,
                      rentButton(context),
                      _buildGrid(context),
                    ],
                  );
                } else {
                  return Center(
                      child:
                          CircularProgressIndicator()); // Maybe return a loading spinner
                }
              }),
        ),
      ),
    );
  }
}

// A widget that displays a grid with 2 columns and 1 row. Each grid has a square button.
// 1 square button has the payment icon and takes you to the payment page
// 1 square button has the activity icon and takes you to the activity page
// The grid is contained within a fixed height container.

Widget _buildGrid(context) => Container(
      height: 200,
      child: GridView.count(
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.
        crossAxisCount: 2,
        // Generate 2 widgets that display their index in the List.
        children: [
          menuTile(
              Icons.payment,
              'Payment',
              () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PaymentsPage()))
                  }),
          menuTile(
              Icons.history,
              'Activity',
              () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ActivityLogPage()))
                  }),
        ],
      ),
    );

// A widget that displays a square tile with an icon and a label

Widget menuTile(IconData icon, String label, Function() onTap) => Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 1), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 50, color: Color.fromARGB(255, 26, 7, 31)),
                SizedBox(height: 10),
                Text(label, style: TextStyle(color: Colors.black)),
              ],
            ),
          ),
        ),
      ),
    );
