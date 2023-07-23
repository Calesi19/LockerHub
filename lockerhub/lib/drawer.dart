import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lockerhub/auth.dart';
import 'package:lockerhub/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lockerhub/models/user_model.dart';
import 'package:lockerhub/pages/payments_page.dart';
import 'package:lockerhub/pages/help_page.dart';
import 'package:lockerhub/pages/activity_log_page.dart';
import 'package:lockerhub/pages/profile_page.dart';
import 'package:lockerhub/pages/rent_search_page.dart';
import 'package:lockerhub/pages/settings_page.dart';

String getInitials(String name) {
  List<String> nameSplit =
      name.split(' '); // Split the name into separate words
  String initials = '';

  // Iterate through each word and append the first character to the initials
  for (var word in nameSplit) {
    if (word.isNotEmpty) {
      initials += word[0].toUpperCase();
    }
  }

  return initials;
}

class NavBar extends StatelessWidget {
  UserModel model = UserModel();
  final String name;
  final String email;

  NavBar({required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        
        backgroundColor: Color.fromRGBO(53, 53, 53, 1),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(model.firstName + ' ' + model.lastName),
              accountEmail: Text(model.email),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors
                    .deepPurpleAccent, // Set the background color of the avatar
                child: Text(
                  getInitials(model.firstName +
                      ' ' +
                      model
                          .lastName), // Pass the user's name to the getInitials function
                  style: TextStyle(
                      color: Colors.white, fontSize: 30), // Set the text color
                ),
              ),
              decoration: BoxDecoration(
                color: Color.fromRGBO(53, 53, 53, 1),
              ),
            ),
            ListTile(
                leading: const Icon(
                  Icons.payment,
                  color: Colors.white,
                ),
                title: const Text(
                  'Payments',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PaymentsPage()))
                    }),
            ListTile(
                leading: const Icon(
                  Icons.content_paste_search_rounded,
                  color: Colors.white,
                ),
                title: const Text(
                  'Activity Log',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ActivityLogPage()))
                    }),
            ListTile(
              leading: const Icon(
                Icons.warehouse_rounded,
                color: Colors.white,
              ),
              title: const Text(
                'Rent Unit',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  RentSearchPage()))
                    },
            ),
            const Divider(
              color: Colors.white,
            ),
            ListTile(
                leading: const Icon(
                  Icons.person_rounded,
                  color: Colors.white,
                ),
                title: const Text(
                  'Profile',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () => {
                  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditProfilePage()))
                }),
            ListTile(
              leading: const Icon(
                Icons.settings,
                color: Colors.white,
              ),
              title: const Text(
                'Settings',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () => {
                Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SettingsPage()))
              },
            ),
            const Divider(
              color: Colors.white,
            ),
            ListTile(
                leading: const Icon(
                  Icons.help_outline,
                  color: Colors.white,
                ),
                title: const Text(
                  'Help',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HelpPage()))
                    }),
            const ListTile(
                leading: const Icon(
                  Icons.logout_rounded,
                  color: Colors.white,
                ),
                title: const Text(
                  'Log Out',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: HomePage.signOut),
          ],
        ));
  }
}
