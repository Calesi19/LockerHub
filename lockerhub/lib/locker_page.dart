import 'package:flutter/material.dart';

class LockerPage extends StatelessWidget {
  const LockerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('LOCKER'),
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
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(children: [
        Image.asset('lib/images/place1.jpg'),
        
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            
             Expanded(
                flex: 1,
               child: Container(
                  
                  padding: EdgeInsets.all(25),
                  margin: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
                  decoration: BoxDecoration(
                    color: Colors.green,
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
                    Text('OPEN')
                  ]),
                ),
             ),
            
            
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(25),
                  margin: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
                  decoration: BoxDecoration(
                    color: Colors.blue,
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
                      'GENERATE\nCODE',
                      textAlign: TextAlign.center,
                    )
                  ]),
                ),
              ),
            
          ],
        ),
        Divider(),
        Divider()
      ]))),
    );
  }
}
