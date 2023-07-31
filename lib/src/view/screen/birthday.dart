import 'package:e_commerce_flutter/src/view/screen/notes.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_flutter/src/view/screen/admin_homepage.dart';
import 'package:e_commerce_flutter/src/view/screen/account_details.dart';
import 'package:e_commerce_flutter/src/view/screen/new_results.dart';
import 'package:e_commerce_flutter/src/view/screen/home_screen.dart';

class BirthdaysScreen extends StatelessWidget {
  List<String> names = [
    'John',
    'Anna',
    'Michael',
    'Emma',
    'Alex',
    'Joe',
    'Monica',
    'Rachel',
    'Ross',
    'Chandler',
    'Phoebe'
  ];
  List<String> dates = [
    '01/12/1990',
    '05/24/1985',
    '11/15/1998',
    '09/08/1992',
    '02/14/1995',
    '06/30/1991',
    '03/21/1994',
    '07/04/1993',
    '10/11/1996',
    '12/25/1997',
    '04/01/1999'
  ];

  Widget buildBirthdayCard(String name, String date) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(date),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Birthdays'),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.logout,
              color: Colors.black,
            ),
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
                  MaterialPageRoute(
                      builder: (context) => AdminHomepage()),
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
      body: ListView.builder(
        itemCount: names.length,
        itemBuilder: (context, index) {
          return buildBirthdayCard(names[index], dates[index]);
        },
      ),
    );
  }
}
