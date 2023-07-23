import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lockerhub/models/locker_model.dart';
import 'package:lockerhub/models/model.dart';

// Create a pop up box that confirms the user wants to unsubscribe from the unit

showMyDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button to dismiss dialog
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Unsubscribe from Unit'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text('Are you sure you want to unsubscribe from this unit?'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Yes'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('No'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

// Red button that says unsubscribe from unit

Widget UnsubscribeButton(BuildContext context) {
  return Expanded(
    child: Container(
      margin: EdgeInsets.only(top: 20, left: 20, right: 10, bottom: 20),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(Color.fromRGBO(230, 130, 130, 1)),
          padding: MaterialStateProperty.all(EdgeInsets.all(10)),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
          elevation: MaterialStateProperty.all(5), // Adjust as needed
        ),
        onPressed: () => {showMyDialog(context)},
        child: Column(
          mainAxisSize: MainAxisSize
              .min, // To align the Column in the center of the button
          children: const [
            Icon(
              Icons.delete_forever_rounded,
              size: 30,
              color: Colors.white,
            ),
            Text(
              'UNSUBSCRIBE',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    ),
  );
}

// Button that sends user to a new page

Widget AddPeopleButton() {
  return Expanded(
    child: Container(
      margin: EdgeInsets.only(top: 20, left: 10, right: 20, bottom: 20),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(Color.fromRGBO(53, 53, 53, 1)),
          padding: MaterialStateProperty.all(EdgeInsets.all(10)),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
          elevation: MaterialStateProperty.all(5), // Adjust as needed
        ),
        onPressed: () {
          // Your onPressed code here
        },
        child: Column(
          mainAxisSize: MainAxisSize
              .min, // To align the Column in the center of the button
          children: const [
            Icon(
              Icons.person_add_alt_1_rounded,
              size: 30,
              color: Colors.white,
            ),
            Text(
              'ADD PEOPLE',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    ),
  );
}

class LockerPage extends StatelessWidget {
  LockerPage({super.key, required this.locker});

  final LockerModel locker;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.deepPurple[50],
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          elevation: 0,
          bottom: TabBar(
              labelColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Colors.deepPurple[900],
              tabs: [
                Tab(
                  text: 'Access',
                  icon: Icon(
                    Icons.warehouse_rounded,
                    color: Colors.black,
                  ),
                ),
                Tab(
                  text: 'Activity Log',
                  icon: Icon(
                    Icons.content_paste_search_rounded,
                    color: Colors.black,
                  ),
                ),
                Tab(
                  text: 'Payments',
                  icon: Icon(
                    Icons.payment,
                    color: Colors.black,
                  ),
                ),
              ]),
          title: Text(
            'Unit ${locker.number}',
            style: TextStyle(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
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
        body: TabBarView(children: [
          //************Tab 1 */
          Container(
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(color: Colors.black, width: 4),
                  ),
                  child: Image.network(
                    locker.photoUrl,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Row(
                children: [
                  AccessButton(),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(
                          top: 20, left: 10, right: 20, bottom: 20),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromRGBO(53, 53, 53, 1)),
                          padding:
                              MaterialStateProperty.all(EdgeInsets.all(25)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16))),
                          elevation:
                              MaterialStateProperty.all(5), // Adjust as needed
                        ),
                        onPressed: () {
                          // Your onPressed code here
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize
                              .min, // To align the Column in the center of the button
                          children: const [
                            Icon(
                              Icons.pin,
                              size: 50,
                              color: Colors.white,
                            ),
                            Text(
                              'GENERATE CODE',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Divider(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(children: [
                  Row(
                    children: [
                      Text('Size:', style: TextStyle(color: Colors.black)),
                      Spacer(),
                      Text('Medium', style: TextStyle(color: Colors.black)),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Dimnensions:',
                          style: TextStyle(color: Colors.black)),
                      Spacer(),
                      Text('${locker.dimensions}',
                          style: TextStyle(color: Colors.black)),
                    ],
                  ),
                  Divider(),
                  Row(
                    children: [
                      Text('Address:', style: TextStyle(color: Colors.black)),
                      Spacer(),
                      Text(
                          '${locker.addressLine}\n${locker.city}, ${locker.state} ${locker.zipcode}',
                          textAlign: TextAlign.right,
                          style: TextStyle(color: Colors.black)),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text('Phone:', style: TextStyle(color: Colors.black)),
                      Spacer(),
                      Text('${locker.phone}',
                          style: TextStyle(color: Colors.black)),
                    ],
                  ),
                  Divider(),
                  Row(
                    children: [
                      Text('Rate:', style: TextStyle(color: Colors.black)),
                      Spacer(),
                      Text(
                        '\$${locker.rate}/month',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ]),
              ),
              Divider(),
              Row(
                children: [
                  UnsubscribeButton(context),
                  AddPeopleButton(),
                ],
              ),
              SizedBox(
                height: 30,
              )
            ]),
          ),

          //************Tab 2 */
          SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    Row(children: const <Widget>[
                      Expanded(
                          child: Divider(
                        indent: 40,
                        endIndent: 5,
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
                        indent: 5,
                        endIndent: 45,
                      )),
                    ]),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        elevation: MaterialStateProperty.all(
                            5), // this adds shadow to the button
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
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
                        margin: const EdgeInsets.symmetric(horizontal: 25),
                        child: Row(children: [
                          RichText(
                            textAlign: TextAlign.left,
                            text: const TextSpan(
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.black,
                              ),
                              children: [
                                TextSpan(text: 'Unit\n'),
                                TextSpan(
                                    text: '241',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30)),
                              ],
                            ),
                          ),
                          Spacer(),
                          Column(children: [
                            RichText(
                              textAlign: TextAlign.right,
                              text: const TextSpan(
                                style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.black,
                                ),
                                children: [
                                  TextSpan(
                                      text: 'You\n',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20)),
                                  TextSpan(text: 'Feb 28, 2023 at 7:34pm\n'),
                                  TextSpan(text: 'Opened'),
                                ],
                              ),
                            ),
                          ]),
                        ]),
                      ),
                    ),
                  ],
                )),
          ),

          //************Tab 3 */
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: RichText(
                      text: TextSpan(
                          style: TextStyle(color: Colors.black),
                          children: [
                        TextSpan(
                            text: 'Balance\n',
                            style:
                                TextStyle(fontSize: 20, color: Colors.black)),
                        TextSpan(
                          text: '\$2312.00',
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        TextSpan(
                            text: '\nNext Payment Due By: April 14, 2023',
                            style: TextStyle(color: Colors.black))
                      ])),
                ),
                Divider(),
                Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                    child: Text(
                      'Fees',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    )),
                Column(
                  children: [
                    Center(
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(17.0),
                          color: Colors.red[300],
                        ),
                        child: Row(children: [
                          RichText(
                            textAlign: TextAlign.left,
                            text: const TextSpan(
                              // Note: Styles for TextSpans must be explicitly defined.
                              // Child text spans will inherit styles from parent
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.black,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Feb 28, 2023\n',
                                ),
                                TextSpan(text: 'PAYMENT MARCH'),
                              ],
                            ),
                          ),
                          Spacer(),
                          Column(children: [
                            RichText(
                              textAlign: TextAlign.right,
                              text: const TextSpan(
                                // Note: Styles for TextSpans must be explicitly defined.
                                // Child text spans will inherit styles from parent
                                style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.black,
                                ),

                                children: [
                                  TextSpan(
                                      text: '\$45.00',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20)),
                                ],
                              ),
                            ),
                          ]),
                        ]),
                      ),
                    ),

                    // Second Fee

                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.red[300]),
                        elevation: MaterialStateProperty.all(
                            5), // this adds shadow to the button
                        padding: MaterialStateProperty.all(
                            EdgeInsets.all(0)), // to remove default padding
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17.0),
                          ),
                        ),
                      ),
                      onPressed: () {
                        // Handle button tap
                      },
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 5),
                        child: Row(children: [
                          RichText(
                            textAlign: TextAlign.left,
                            text: const TextSpan(
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.black,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Feb 28, 2023\n',
                                ),
                                TextSpan(text: 'CLEANING FEE'),
                              ],
                            ),
                          ),
                          Spacer(),
                          Column(children: [
                            RichText(
                              textAlign: TextAlign.right,
                              text: const TextSpan(
                                style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.black,
                                ),
                                children: [
                                  TextSpan(
                                    text: '\$2267.00',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                        ]),
                      ),
                    ),
                  ],
                ),
                Divider(),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Text(
                    'Payments',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17.0),
                      color: Colors.green[600],
                    ),
                    child: Row(children: [
                      RichText(
                        textAlign: TextAlign.left,
                        text: const TextSpan(
                          // Note: Styles for TextSpans must be explicitly defined.
                          // Child text spans will inherit styles from parent
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: 'Feb 28, 2023\n',
                            ),
                            TextSpan(text: 'DISCOVER 6894'),
                          ],
                        ),
                      ),
                      Spacer(),
                      Column(children: [
                        RichText(
                          textAlign: TextAlign.right,
                          text: const TextSpan(
                            // Note: Styles for TextSpans must be explicitly defined.
                            // Child text spans will inherit styles from parent
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.black,
                            ),

                            children: [
                              TextSpan(
                                  text: '\$24.00',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                            ],
                          ),
                        ),
                      ]),
                    ]),
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }

  // Button that sends a request to open the locker
  Widget AccessButton() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 20, left: 20, right: 10, bottom: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.deepPurple, Colors.deepPurple[900]!],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // Changes position of shadow
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () async {
              final response = await http.get(Uri.parse(
                  'https://us-central1-lockerhub-5382f.cloudfunctions.net/openLocker?ownerId=${Model.instance.user?.uid}&unitId=${locker.id}'));

              if (response.statusCode == 200) {
                // If server returns a 200 OK response, parse the JSON.
                print(response.body);
              } else {
                // If server returns an unexpected response, throw an exception.
                throw Exception('Failed to open lock.');
              }
            },
            child: Padding(
              padding: EdgeInsets.all(25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.lock_open_rounded,
                    size: 50,
                    color: Colors.white,
                  ),
                  Text(
                    'OPEN UNIT',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
