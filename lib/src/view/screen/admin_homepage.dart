import 'package:e_commerce_flutter/src/view/screen/notes.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_flutter/src/view/screen/account_details.dart';
import 'package:e_commerce_flutter/src/view/screen/birthday.dart';
import 'package:e_commerce_flutter/src/view/screen/new_results.dart';
import 'package:e_commerce_flutter/src/view/screen/home_screen.dart';

import 'package:flutter/material.dart';

class AdminHomepage extends StatefulWidget {
  AdminHomepage({Key? key}) : super(key: key);
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  _AdminHomepageState createState() => _AdminHomepageState();
}

class _AdminHomepageState extends State<AdminHomepage> {
  var searchText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: widget.scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.black),
          onPressed: () {
            widget.scaffoldKey.currentState?.openDrawer();
          },
        ),
        title: Text('New Screen'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout, color: Colors.black),
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
                  ),
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              onChanged: (value) {
                setState(() {
                  searchText = value;
                  // Apply search filter to the list of cards
                });
              },
              decoration: InputDecoration(
                hintText: 'Search...',
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text('ID: $index'),
                    subtitle: Text('Balance: 5000'),
                    trailing: ElevatedButton(
                      onPressed: () {
                        // Handle edit button press
                      },
                      child: Text('Edit'),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Admin App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AdminHomepage(),
    );
  }
}

