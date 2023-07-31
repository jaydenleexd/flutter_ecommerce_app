import 'package:e_commerce_flutter/src/view/screen/notes.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_flutter/src/view/screen/admin_homepage.dart';
import 'package:e_commerce_flutter/src/view/screen/birthday.dart';
import 'package:e_commerce_flutter/src/view/screen/account_details.dart';
import 'package:e_commerce_flutter/src/view/screen/home_screen.dart';

class NewResultsScreen extends StatelessWidget {
  List<String> fruits = ['Mango', 'Peach', 'Cherry'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Results'),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu, color: Colors.black),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
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
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DropdownButton<String>(
              value: fruits[0],
              onChanged: (newValue) {},
              items: fruits.map((fruit) {
                return DropdownMenuItem<String>(
                  value: fruit,
                  child: Text(fruit),
                );
              }).toList(),
            ),
            Row(
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'ID',
                      hintText: 'Enter ID',
                    ),
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Amount',
                      hintText: 'Enter Amount',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              '',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
           
              child: Align(
                alignment: Alignment.centerLeft,
        
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ID: 12345',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10.0),
                        Text('Balance: \5000'),
                        
                        
                      ],
                    ),
                  ),
                ),
              
            )
            
             ,Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
           
              child: Align(
                alignment: Alignment.centerLeft,
        
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ID: 12345',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10.0),
                        Text('Balance: \5000'),
                        
                        
                      ],
                    ),
                  ),
                ),
              
            )
               ,Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
           
              child: Align(
                alignment: Alignment.centerLeft,
        
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ID: 12345',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10.0),
                        Text('Balance: \5000'),
                        
                        
                      ],
                    ),
                  ),
                ),
              
            )
            
             ,Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
           
              child: Align(
                alignment: Alignment.centerLeft,
        
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ID: 12345',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10.0),
                        Text('Balance: \5000'),
                        
                        
                      ],
                    ),
                  ),
                ),
              
            )
          ],
        ),
      ),
    );
  }
}
