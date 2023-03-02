import 'package:flutter/material.dart';
import 'package:lockerhub/activity_log_page.dart';
import 'package:lockerhub/login_page.dart';
import 'package:lockerhub/payments_page.dart';
import 'package:lockerhub/help_page.dart';
import 'package:lockerhub/locker_page.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: [
        UserAccountsDrawerHeader(
          accountName: Text("Carlos Lespin"),
          accountEmail: Text("carlos.lespin.silva@gmail.com"),
          currentAccountPicture: CircleAvatar(
              child: ClipOval(
                  child: Image.network(
            'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MXw3NjA4Mjc3NHx8ZW58MHx8fHw%3D&w=1000&q=80',
            width: 90,
            height: 90,
            fit: BoxFit.cover,
          ))),
          decoration: BoxDecoration(
              color: Colors.black,
              ),
        ),
        ListTile(
          leading: const Icon(Icons.payment),
          title: const Text('Payments'),
          onTap: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PaymentsPage()))
                }
        ),
        ListTile(
            leading: const Icon(Icons.content_paste_search_rounded),
            title: const Text('Activity Log'),
            onTap: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ActivityLogPage()))
                }),
        ListTile(
          leading: const Icon(Icons.warehouse_rounded),
          title: const Text('Rent Unit'),
          onTap: () => print('Fav'),
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.person_rounded),
          title: const Text('Profile'),
          onTap: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LockerPage()))
                }
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text('Settings'),
          onTap: () => print('Fav'),
        ),
        const Divider(),

        ListTile(
            leading: const Icon(Icons.help_outline),
            title: const Text('Help'),
            onTap: () => {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HelpPage()))
                }),



        ListTile(
            leading: const Icon(Icons.logout_rounded),
            title: const Text('Log Out'),
            onTap: () => {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginPage()))
                }),
      ],
    ));
  }
}
