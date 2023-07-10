import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.blue,
      child: ListView(
        padding: EdgeInsets.zero,

        children: [
          DrawerHeader(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(color: Colors.blue),
            child: UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
              accountName: Text("Rao Faheem", style: TextStyle(color: Colors.white),),
              accountEmail: Text("faheemrao449@gmail.com", style: TextStyle(color: Colors.white),),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/images/log.png"),
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.home,
              color: Colors.white,
            ),
            title: Text("Home", style: TextStyle(color: Colors.white),),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.profile_circled,
              color: Colors.white,
            ),
            title: Text("Profile", style: TextStyle(color: Colors.white),),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.mail,
              color: Colors.white,
            ),
            title: Text("Email", style: TextStyle(color: Colors.white),),
          ),
        ],
      ),
    );
  }
}
