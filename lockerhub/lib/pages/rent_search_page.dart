import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:lockerhub/models/model.dart';
import 'package:lockerhub/models/establishment_model.dart';
import 'package:lockerhub/pages/establishment_page.dart';

class RentSearchPage extends StatefulWidget {
  RentSearchPage({Key? key}) : super(key: key);

  @override
  _RentSearchPageState createState() => _RentSearchPageState();
}

class _RentSearchPageState extends State<RentSearchPage> {
  List<Widget> locationTiles = [
    Container(
      color: Colors.deepPurple[200],
      padding: EdgeInsets.all(20),
      child: Text(
        'Find a storage rental place near you.',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20),
      ),
    )
  ];

  Future<void> fetchUnitsByZipcode(String zipcode) async {
    final response = await http.get(Uri.parse(
        'https://us-central1-lockerhub-5382f.cloudfunctions.net/getUnitsByZipcode?zipcode=$zipcode'));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      jsonResponse
          .forEach((item) => {Model.instance.addLockerToSearchResults(item)});

      Model.instance.printLockers();

      setState(() {
        locationTiles = [];
        for (var establishment in Model.instance.locationResults) {
          Widget newLocationTile = locationTile(establishment);
          locationTiles.add(newLocationTile);
        }
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> fetchUnitsByState(String state) async {
    final response = await http.get(Uri.parse(
        'https://us-central1-lockerhub-5382f.cloudfunctions.net/getUnitsByState?state=$state'));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      jsonResponse
          .forEach((item) => {Model.instance.addLockerToSearchResults(item)});

      Model.instance.printLockers();

      setState(() {
        locationTiles = [];
        for (var establishment in Model.instance.locationResults) {
          Widget newLocationTile = locationTile(establishment);
          locationTiles.add(newLocationTile);
        }
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> fetchUnitsByCity(String city) async {
    final response = await http.get(Uri.parse(
        'https://us-central1-lockerhub-5382f.cloudfunctions.net/getUnitsByCity?city=$city'));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      jsonResponse
          .forEach((item) => {Model.instance.addLockerToSearchResults(item)});

      Model.instance.printLockers();

      setState(() {
        locationTiles = [];
        for (var establishment in Model.instance.locationResults) {
          Widget newLocationTile = locationTile(establishment);
          locationTiles.add(newLocationTile);
        }
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  Widget listOfLocation() {
    return ListView(
      children: locationTiles,
    );
  }

  Widget locationTile(EstablishmentModel establishment) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          elevation:
              MaterialStateProperty.all(5), // this adds shadow to the button
          padding: MaterialStateProperty.all(
              EdgeInsets.all(0)), // to remove default padding
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        onPressed: () {
          // Go to establishment page
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      EstablishmnetPage(establishment: establishment)));
        },
        child: Container(
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              Image.asset(
                'lib/images/lockerhub_black.png',
                width: 120,
              ),
              Spacer(),
              Column(
                children: [
                  Text(
                    'Available Units',
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    '${establishment.getCount()}',
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Text(establishment.addressLine,
                      style: TextStyle(color: Colors.black)),
                  Text('${establishment.city}, ${establishment.state}',
                      style: TextStyle(color: Colors.black)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget searchBar() {
    // Create a TextEditingController
    final TextEditingController _controller = TextEditingController();

    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: Row(
        children: [
          Expanded(
              child: TextField(
            controller: _controller, // Add the controller here
            decoration: InputDecoration(
                hintText: "Search ZipCode, City, or State",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)))),
          )),
          IconButton(
              onPressed: () {
                String searchText = _controller.text;

               
                Model.instance.clearSearchResults();
                fetchUnitsByZipcode(searchText);
                fetchUnitsByCity(searchText);
                fetchUnitsByState(searchText);
              },
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple[100],
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
            title: Text(
              'FIND LOCATION',
              style: TextStyle(color: Colors.black),
            )),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                searchBar(),
                Container(height: 1000, child: listOfLocation()),
              ],
            ),
          ),
        ));
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
