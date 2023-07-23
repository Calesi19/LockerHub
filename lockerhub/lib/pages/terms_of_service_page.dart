import 'package:flutter/material.dart';

class TermsOfServicePage extends StatelessWidget {
  const TermsOfServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 50, 10, 57),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('TERMS OF SERVICE'),
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
                                text:
                                    '\nThank you for choosing LockerHub for your storage needs. Please read our Terms of Service carefully before using our app. By accessing or using LockerHub, you agree to be bound by these terms.',
                              ),
                              TextSpan(
                                  text:
                                      '\n\n1. Service Description: LockerHub provides an online marketplace that connects users seeking storage space with available storage providers. We do not own or operate any storage facilities, nor do we endorse any particular storage provider. We simply facilitate the transaction between the user and the storage provider.'),
                              TextSpan(
                                  text:
                                      '\n\n2.User Eligibility: To use LockerHub, you must be at least 18 years old and have the legal capacity to enter into contracts. You must also provide accurate and complete information when registering for an account.'),
                              TextSpan(
                                  text:
                                      '\n\n3.Storage Provider Eligibility: Storage providers must be legally authorized to provide storage services and must comply with all applicable laws and regulations.'),
                              TextSpan(
                                  text:
                                      '\n\n4.Booking and Payment: Users can browse storage options, view availability, and make a booking through the app. Payment is processed securely through our third-party payment processor. Users are responsible for paying all fees and charges associated with their booking, including any taxes or additional fees imposed by the storage provider.'),
                              TextSpan(
                                  text:
                                      '\n\n5.Cancellation and Refunds: Cancellation policies vary by storage provider and are displayed during the booking process. Users may be entitled to a refund in certain circumstances, as outlined in the cancellation policy.'),
                              TextSpan(
                                  text:
                                      '\n\n6.Prohibited Activities: Users are prohibited from using LockerHub for any illegal or unauthorized purpose, including but not limited to fraud, intellectual property infringement, or harassment. Storage providers are prohibited from misrepresenting their services or engaging in any unlawful or unethical conduct.'),
                              TextSpan(
                                  text:
                                      '\n\n7.Limitation of Liability: LockerHub is not responsible for any loss or damage resulting from the use of our app or the services provided by storage providers. Users and storage providers assume all risk associated with the use of the app and the storage facilities.'),
                              TextSpan(
                                  text:
                                      '\n\n8.Indemnification: Users and storage providers agree to indemnify and hold LockerHub harmless from any claims, damages, or losses arising from their use of the app or the storage facilities.'),
                              TextSpan(
                                  text:
                                      '\n\n9.Governing Law and Jurisdiction: These Terms of Service are governed by the laws of the jurisdiction where LockerHub is incorporated. Any disputes arising from these terms will be resolved in the courts of that jurisdiction.'),
                              TextSpan(
                                  text:
                                      '\n\n10.Amendments: LockerHub may modify these Terms of Service at any time. Any changes will be posted on the app, and your continued use of LockerHub after the changes have been made will constitute your acceptance of the new terms.'),
                            ],
                          ),
                        ),

                        SizedBox(height: 50),


                        Image.asset(
                          'lib/images/lockerhub_black.png',
                          width: 175,
                          height: 175,
                        ),


                        SizedBox(height: 20),


                      ]),
                    ),
                    Positioned(
                      left: 50,
                      top: 5,
                      child: Container(
                        padding: const EdgeInsets.only(
                            bottom: 0, left: 10, right: 10),
                        color: Colors.grey[300],
                        child: const Text(
                          'Terms of Service',
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
      ),
    );
  }
}
