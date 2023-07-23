import 'package:flutter/material.dart';

Widget activity(
    String activityDescription, String activityDate, String unitNumber) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    child: ElevatedButton(
      
      style: ButtonStyle(
        
        backgroundColor: MaterialStateProperty.all(Colors.white),
        elevation: MaterialStateProperty.all(5), // this adds shadow to the button
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(17.0),
          ),
        ),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        ),
      ),
      onPressed: () {
        // Handle button tap
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 25, ),
        child: Row(children: [
          RichText(
            textAlign: TextAlign.left,
            text: TextSpan(
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.black,
              ),
              children: [
                TextSpan(text: 'Unit\n'),
                TextSpan(
                    text: unitNumber,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
              ],
            ),
          ),
          Spacer(),
          Column(children: [
            RichText(
              textAlign: TextAlign.right,
              text: TextSpan(
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                      text: 'You\n',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  TextSpan(text: activityDate + '\n'),
                  TextSpan(text: activityDescription),
                ],
              ),
            ),
          ]),
        ]),
      ),
    ),
  );
}




// Widget that is a list of activity log entries

Widget activityLogList() {
  return ListView(
    children: [
      activity('Open', '10/10/2021', '1'),
      activity('Open', '10/10/2021', '2'),
      activity('Open', '10/10/2021', '3'),
      activity('Open', '10/10/2021', '4'),
      activity('Open', '10/10/2021', '5'),
      activity('Open', '10/10/2021', '6'),
      activity('Open', '10/10/2021', '7'),
      activity('Open', '10/10/2021', '8'),
      activity('Open', '10/10/2021', '9'),
      activity('Open', '10/10/2021', '10'),
      activity('Open', '10/10/2021', '11'),
      activity('Open', '10/10/2021', '12'),
      activity('Open', '10/10/2021', '13'),
      activity('Open', '10/10/2021', '14'),
      activity('Open', '10/10/2021', '15'),
      activity('Open', '10/10/2021', '16'),
      activity('Open', '10/10/2021', '17'),
      activity('Open', '10/10/2021', '18'),
      activity('Open', '10/10/2021', '19'),
      activity('Open', '10/10/2021', '20'),
      activity('Open', '10/10/2021', '21'),
      activity('Open', '10/10/2021', '22'),
      activity('Open', '10/10/2021', '23'),
      activity('Open', '10/10/2021', '24'),
      activity('Open', '10/10/2021', '25'),
      activity('Open', '10/10/2021', '26'),
      activity('Open', '10/10/2021', '27'),
      activity('Open', '10/10/2021', '28'),
      activity('Open', '10/10/2021', '29'),
      activity('Open', '10/10/2021', '30'),
      activity('Open', '10/10/2021', '31')],
  );
}


// The activity log page. This page displays a list of activity log entries. It loads the activity data for all the units rented by the user.

class ActivityLogPage extends StatelessWidget {
  const ActivityLogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple[100],
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            'ACTIVITY LOG',
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Image.asset(
                'lib/images/logo_black.png',
                width: 32,
                height: 32,
              ),
            ),
          ],
        ),
        body: SafeArea(
            child: Center(
                child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Row(children: const <Widget>[
                Expanded(
                    child: Divider(
                  thickness: 0,
                )),
                Text(
                  'PAST MONTH',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Expanded(
                    child: Divider(
                  thickness: 0,
                )),
              ]),
              const SizedBox(height: 20),
              Expanded(
                child: activityLogList(),
              ),
            ],
          ),
        ))));
  }
}
