import 'package:flutter/material.dart';

class PaymentsPage extends StatelessWidget {
  const PaymentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () => {print('test')}, child: Icon(Icons.money),),//BubbleButton(iconData: Icons.money, onPressed: () => {print('fac')},),
        backgroundColor: Colors.deepPurple[100],
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text('PAYMENTS', style: TextStyle(color: Colors.black),),
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
                            RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(text: 'Total Balance\n'),
                        TextSpan(
                            text: '\$2312.00',
                            style: TextStyle(
                                fontSize: 45, fontWeight: FontWeight.bold))
                      ])),
                            const SizedBox(height: 25),
                            Row(children: const <Widget>[
                              Expanded(
                    child: Divider(
                      thickness: 0,
                
                              )),
                              Text(
                  'PAYMENTS DUE',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                              Expanded(
                    child: Divider(
                  
                  thickness: 0,
                  
                              )),
                            ]),
                            const SizedBox(height: 25),
                            Center(
                              child: Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17.0),
                    color: Colors.white,
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
                            text: 'LOCKER 241\n',
                          ),
                          TextSpan(text: 'FEES:\n'),
                          TextSpan(text: '\t\t\t\tPAYMENT MARCH: '),
                          TextSpan(
                              text: '\$45.00\n',
                              style: TextStyle(color: Colors.red)),
                          TextSpan(text: '\t\t\t\tCLEANING FEE: '),
                          TextSpan(
                              text: '\$2267.00',
                              style: TextStyle(color: Colors.red))
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
                                text: '\$2312.00',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                          ],
                        ),
                      ),
                    ]),
                  ]),
                              ),
                            ),
                            const SizedBox(height: 25),
                            Row(children: const <Widget>[
                              Expanded(
                    child: Divider(
                  indent: 40,
                  endIndent: 5,
                              )),
                              Text(
                  'LAST MONTH',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                              Expanded(
                    child: Divider(
                  indent: 5,
                  endIndent: 45,
                              )),
                            ]),
                            const SizedBox(height: 25),
                
                
                
                Center(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                      padding: MaterialStateProperty.all(EdgeInsets.all(0)),  // to remove default padding
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(17.0),
                        ),
                      ),
                      elevation: MaterialStateProperty.all(5),  // set the elevation for shadow
                    ),
                    onPressed: () {
                      // handle button tap here
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
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
                  TextSpan(text: 'DISCOVER 6894'),
                              ],
                            ),
                          ),
                          Spacer(),
                          Column(
                            children: [
                              RichText(
                  textAlign: TextAlign.right,
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: '\$24.00',
                        style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                
                
                
                
                
                          ],
                        ),
                ))));
  }
}
