// A page that shows the details of a unit. The page is accessed by clicking on a unit from the establishment page. There's a button to rent the unit.

// Path: lib/pages/unit_page.dart
// Compare this snippet from lib/pages/establishment_page.dart:
// // A page showing the details of a single establishment.
//

import 'package:flutter/material.dart';
import 'package:lockerhub/models/locker_model.dart';
import 'package:lockerhub/models/model.dart';

// A button for renting a unit. The button is color purple and has rounded borders. There's an animation when the button is clicked.

Widget rentButton(context) {
  return Row(
    children: [
      Expanded(
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.deepPurple[900],
            borderRadius: BorderRadius.circular(10),
          ),
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: InkWell(
            // There's an animation when the button is clicked.
            splashColor: Colors.grey[300],

            onTap: () {
              print('test');
            },
            child: Text(
              'Rent',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
      ),
    ],
  );
}

// A widget displaying all the information for a single unit. The widget has padding and rounded borders. It is also color grey.

Widget UnitInformation(LockerModel locker) {
  return Container(
    padding: EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: Colors.grey[300],
      borderRadius: BorderRadius.circular(10),
    ),
    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
    child: Column(
      children: [
        Text(
          'Unit Information',
          style: TextStyle(fontSize: 20),
        ),
        Text(
          'Locker Number: ${locker.number}',
          style: TextStyle(fontSize: 20),
        ),
        Text(
          'City: ${locker.city}',
          style: TextStyle(fontSize: 20),
        ),
        Text(
          'State: ${locker.state}',
          style: TextStyle(fontSize: 20),
        ),
        
      ],
    ),
  );
}

// A class representing the unit details page. The page is accessed by clicking on a unit from the establishment page. There's a button to rent the unit.
// It's a stateless widget. The widget has a single property: the unit that is being displayed.

class UnitPage extends StatelessWidget {
  final LockerModel locker;

  UnitPage({required this.locker});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Unit Details'),
      ),
      body: Column(
        children: [UnitInformation(locker), rentButton(context)],
      ),
    );
  }
}
