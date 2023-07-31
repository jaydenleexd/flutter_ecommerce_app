import 'package:e_commerce_flutter/src/view/screen/admin_homepage.dart';
import 'package:e_commerce_flutter/src/view/screen/new_results.dart';
import 'package:e_commerce_flutter/src/view/screen/notes.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_flutter/src/view/screen/birthday.dart';
import 'package:e_commerce_flutter/src/view/screen/admin_homepage.dart';
import 'package:e_commerce_flutter/src/view/screen/new_results.dart';
import 'package:e_commerce_flutter/src/view/screen/home_screen.dart';

class AccountDetailsScreen extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        return Scaffold(
          key: scaffoldKey, // Assign the scaffoldKey to the key property
          appBar: AppBar(
            title: Text('Account Details'),
            leading: IconButton(
              icon: Icon(Icons.menu, color: Colors.black,),
              onPressed: () {
                scaffoldKey.currentState?.openDrawer();
              },
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.logout, color: Colors.black,),
                 onPressed: () {
              Navigator.push(
              context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
              ),
            ],
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                 DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/logo.jpg',
                  )
                ],
              ),
            ),
                ListTile(
                  title: Text('Notes'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NoteScreen()),
                    );
                  },
                ),
                ListTile(
                  title: Text('Birthdays'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BirthdaysScreen()),
                    );
                  },
                ),
                ListTile(
                  title: Text('Account Details'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AdminHomepage()),
                    );
                  },
                ),
                ListTile(
                  title: Text('New Results'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NewResultsScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
          body: Center(
            child: Text('Account Details Screen'),
          ),
        );
      },
    );
  }
}
