import 'package:flutter/material.dart';

class ActivityLogPage extends StatelessWidget {
  const ActivityLogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('ACTIVITY LOG'),
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
            child: Center(
                child: Column(
          children: [
            const SizedBox(height: 40),
            Row(children: const <Widget>[
              Expanded(
                  child: Divider(
                indent: 40,
                endIndent: 5,
              )),
              Text(
                'LAST MONTH',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Expanded(
                  child: Divider(
                indent: 5,
                endIndent: 45,
              )),
            ]),
            const SizedBox(height: 40),



            Center(
              child: Container(
                padding: const EdgeInsets.all(25),
                margin: const EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17.0),
                  color: Colors.green,
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
                          TextSpan(text: 'Locker\n', ),
                          TextSpan(text: '241', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
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
                          
                          TextSpan(text: 'You\n', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                          TextSpan(text: 'Feb 28, 2023 at 7:34pm\n', ),
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
        ))));
  }
}
