import 'package:flutter/material.dart';

class LockerPage extends StatelessWidget {
  const LockerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          bottom: TabBar(indicatorColor: Colors.white, tabs: [
            Tab(
              text: 'Access',
              icon: Icon(
                Icons.warehouse_rounded,
                color: Colors.white,
              ),
            ),
            Tab(
              text: 'Activity Log',
              icon: Icon(
                Icons.content_paste_search_rounded,
                color: Colors.white,
              ),
            ),
            Tab(
              text: 'Payments',
              icon: Icon(
                Icons.payment,
                color: Colors.white,
              ),
            ),
          ]),
          backgroundColor: Colors.black,
          title: const Text('UNIT 241'),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Image.asset(
                'lib/images/logo_white.png',
                width: 32,
                height: 32,
              ),
            ),
          ],
        ),
        body: TabBarView(children: [








          //************Tab 1 */
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
              
              SizedBox(height: 20,),

              Expanded(

                child: Container(
                  
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(color: Colors.black, width: 4),
                    
                  ),
                  child: Image.asset(
                            'lib/images/place1.jpg',
                            fit: BoxFit.fill,
                            
                  ),
                ),
              ),
              
              
              Row(
            children: [

              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 20, left: 20, right: 10 ,bottom: 20),
                  padding: EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: Colors.green[400],
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(children: const [
                    Icon(
                      Icons.lock_open_rounded,
                      size: 50,
                    ),
                    Text('OPEN UNIT')
                  ]),
                ),
              ),


              Expanded(
                child: Container(
                  padding: EdgeInsets.all(25),
                  margin: EdgeInsets.only(top: 20, left: 10, right: 20 ,bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.blue[400],
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(children: const [
                    Icon(
                      Icons.pin,
                      size: 50,
                    ),
                    Text(
                      'GENERATE CODE',
                      textAlign: TextAlign.center,
                    )
                  ]),
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
                  Text('Size:'),
                  Spacer(),
                  Text('Medium'),
                ],
              ),
              
              Row(
                children: [
                  Text('Dimnensions:'),
                  Spacer(),
                  Text('7\'x7\'x8\''),
                ],
              ),
              Divider(),

              Row(
                children: [
                  Text('Address:'),
                  Spacer(),
                  Text('Birch Lane 1213\nWoodbury, Minnesota 10230', textAlign: TextAlign.right,),
                ],
              ),
              SizedBox(height: 10,),

              Row(
                children: [
                  Text('Phone:'),
                  Spacer(),
                  Text('787-988-9090'),
                ],
              ),
              Divider(),

              Row(
                children: [
                  Text('Rate:'),
                  Spacer(),
                  Text('\$45.00/month'),
                ],
              ),

              SizedBox(height: 40,)

              

            ]),
              ),

              Divider()
            ]
            ),
          ),











          //************Tab 2 */
          Container(
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
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Expanded(
                    child: Divider(
                  indent: 5,
                  endIndent: 45,
                )),
              ]),
              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17.0),
                    color: Colors.grey[500],
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
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
                            text: 'Locker\n',
                          ),
                          TextSpan(
                              text: '241',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30)),
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
                                text: 'You\n',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                            TextSpan(
                              text: 'Feb 28, 2023 at 7:34pm\n',
                            ),
                            TextSpan(text: 'Opened'),
                          ],
                        ),
                      ),

                      //Text('Admin\nFeb 28, 2023 at 7:34pm',
                      //textAlign: TextAlign.right,
                      //style: TextStyle(
                      //fontSize: 15
                      //),),
                    ]),
                  ]),
                ),
              )
            ],
          )),

          //************Tab 3 */
          Container(
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
                            text: 'Balance\n', style: TextStyle(fontSize: 20)),
                        TextSpan(
                          text: '\$2312.00',
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                        TextSpan(text: '\nNext Payment Due By: April 14, 2023')
                      ])),
                ),
                Divider(),
                Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                    child: Text(
                      'Fees',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 20),
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
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
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

                    //Second Fee

                    Center(
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(17.0),
                          color: Colors.red[300],
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
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
                                TextSpan(text: 'CLEANING FEE'),
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
                                      text: '\$2267.00',
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
                Divider(),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Text(
                    'Payments',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 20),
                  ),
                ),

                Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17.0),
                  color: Colors.green[400],
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
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
                                  fontWeight: FontWeight.bold, fontSize: 20)),
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
}
