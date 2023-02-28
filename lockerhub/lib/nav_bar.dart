import 'package:flutter/material.dart';
import 'package:lockerhub/activity_log_page.dart';
import 'package:lockerhub/login_page.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(accountName: Text("Carlos"), 
          accountEmail: Text("carlos.lespin.silva@gmail.com"),
          currentAccountPicture: CircleAvatar(
            child: ClipOval(
              child: Image.network(
                  'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MXw3NjA4Mjc3NHx8ZW58MHx8fHw%3D&w=1000&q=80',
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                )
                )
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                  image: NetworkImage('https://t4.ftcdn.net/jpg/04/61/23/23/360_F_461232389_XCYvca9n9P437nm3FrCsEIapG4SrhufP.jpg'
                  ),
                  fit: BoxFit.cover
                  )
              ),
          ),
          ListTile(
            leading: const Icon(Icons.payment),
            title: const Text('Payments'),
            onTap: () => print('Fav'), 
          ),
          ListTile(
            leading: const Icon(Icons.content_paste_search_rounded),
            title: const Text('Activity Log'),
            onTap: () => {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ActivityLogPage()))}
          ),
          ListTile(
            leading: const Icon(Icons.meeting_room),
            title: const Text('Rent Unit'),
            onTap: () => print('Fav'), 
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.person_rounded),
            title: const Text('Profile'),
            onTap: () => print('Fav'), 
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () => print('Fav'), 
          ),
          
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout_rounded),
            title: const Text('Log Out'),
            onTap: () => {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage()))}
          ),
        ],
      )
    );
  }
}
