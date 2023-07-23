import 'package:flutter/material.dart';
import 'package:lockerhub/pages/terms_of_service_page.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('HELP'),
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
              const SizedBox(height: 30),
              Stack(
                children: <Widget>[
                  Container(
                      width: double.infinity,
                      margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(14),
                        shape: BoxShape.rectangle,
                      ),
                      child: Column(children: [
                        const Text(
                          'Welcome to LockerHub\'s help page! We\'re here to assist you in making the most of our app. If you have any questions or concerns about using LockerHub to rent a storage space, you\'ve come to the right place. Our team is available 24/7 to answer your inquiries and provide support. Whether you need help finding the perfect storage space, managing your account, or understanding our policies and procedures, we\'re here to help. Don\'t hesitate to reach out to us via the app\'s support channel or email.',
                          style: TextStyle(color: Colors.black, fontSize: 17),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: const EdgeInsets.all(13),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                          ),
                          child: Row(children: const [
                            Text(
                              "Contact Us",
                              textAlign: TextAlign.left,
                            ),
                            Spacer(),
                            Icon(Icons.arrow_forward_ios_rounded)
                          ]),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.all(13),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                          ),
                          child: Row(children: const [
                            Text(
                              "Frequently Asked Questions",
                              textAlign: TextAlign.left,
                            ),
                            Spacer(),
                            Icon(Icons.arrow_forward_ios_rounded)
                          ]),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () => {},
                          child: Container(
                            padding: const EdgeInsets.all(13),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                            ),
                            child: Row(children: const [
                              Text(
                                "Rules and Guidelines",
                                textAlign: TextAlign.left,
                              ),
                              Spacer(),
                              Icon(Icons.arrow_forward_ios_rounded)
                            ]),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const TermsOfServicePage()))
                          },
                          child: Container(
                            padding: const EdgeInsets.all(13),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                            ),
                            child: Row(children: const [
                              Text(
                                "Terms of Service",
                                textAlign: TextAlign.left,
                              ),
                              Spacer(),
                              Icon(Icons.arrow_forward_ios_rounded)
                            ]),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () => {},
                          child: Container(
                            padding: const EdgeInsets.all(13),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                            ),
                            child: Row(children: const [
                              Text(
                                "About Us",
                                textAlign: TextAlign.left,
                              ),
                              Spacer(),
                              Icon(Icons.arrow_forward_ios_rounded)
                            ]),
                          ),
                        ),
                      ])),
                  Positioned(
                    left: 50,
                    top: 5,
                    child: Container(
                      padding:
                          const EdgeInsets.only(bottom: 0, left: 10, right: 10),
                      color: Colors.grey[300],
                      child: const Text(
                        'LockerHub Support',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
