// A page showing the details of a single establishment.

import 'package:flutter/material.dart';
import 'package:lockerhub/models/locker_model.dart';
import 'package:lockerhub/models/model.dart';
import 'package:lockerhub/models/establishment_model.dart';
import 'package:lockerhub/pages/available_unit_page.dart';



// Widget representing each single unit that belongs to an establishment. The widget has padding and rounded borders. It is also color grey.
// The widget is also a button that can be clicked to navigate to the unit details page.

Widget unitTile(LockerModel locker, context) {
  return Container(
    padding: EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: Colors.grey[300],
      borderRadius: BorderRadius.circular(10),
    ),
    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
    child: 
    InkWell(
      // There's an animation when the button is clicked.
      splashColor: Colors.deepPurple[900],

      onTap: () {
        // Go to unit details page
        
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UnitPage(locker: locker),
          ),
        );
      },
      
      child: Column(
        children: [
          Text(
            locker.number.toString(),
            style: TextStyle(fontSize: 20),
          ),
          Text(
            locker.city,
            style: TextStyle(fontSize: 20),
          ),
          Text(
            locker.state,
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    ),
  );
}


// A grid of units that belong to an establishment. The grid is scrollable.

Widget unitGrid(List<LockerModel> lockers, context) {
  return GridView.count(
    shrinkWrap: true,
    crossAxisCount: 2,
    children: List.generate(lockers.length, (index) {
      return unitTile(lockers[index], context);
    }),
  );
}



// A Widget representing a single establishment. It has a title, a description, and a grid of units.
Widget establishmentTile(EstablishmentModel establishment) {
  return Row(
    children: [
      Expanded(
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            // Gradient background
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.deepPurple, Colors.deepPurple[900]!],
            ),
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(10),
          ),
          margin: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              Text(
                establishment.name,
                // Aligh text to the left.
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 10),
              Text(
                establishment.addressLine,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              Text(
                '${establishment.city}, ${establishment.state} ${establishment.zipcode}',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              Text(
                establishment.phone.toString(),
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),     
            ],
          ),
        ),
      ),
    ],
  );
}



class EstablishmnetPage extends StatelessWidget {
  final EstablishmentModel establishment;

  const EstablishmnetPage({Key? key, required this.establishment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Establishment'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              
              
              establishmentTile(establishment),


              unitGrid(establishment.lockers, context),
            
            
            ],
      ),
    )));
  }
}


