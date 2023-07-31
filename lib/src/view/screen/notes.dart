import 'package:e_commerce_flutter/src/view/screen/admin_homepage.dart';
import 'package:e_commerce_flutter/src/view/screen/new_results.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_flutter/src/view/screen/birthday.dart';
import 'package:e_commerce_flutter/src/view/screen/admin_homepage.dart';
import 'package:e_commerce_flutter/src/view/screen/new_results.dart';
import 'package:e_commerce_flutter/src/view/screen/home_screen.dart';

class ApprovalCard extends StatelessWidget {
  final String date;
  final String id;
  final bool approvalStatus;
  final double amount;
  final String method;
  final String image;

  ApprovalCard({
    required this.date,
    required this.id,
    required this.approvalStatus,
    required this.amount,
    required this.method,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text('Date: $date'),
            subtitle: Text('ID: $id'),
          ),
          ListTile(
            title: Text(
                'Status: ${approvalStatus ? 'Approved' : 'Pending'}'),
            subtitle: Text('Amount: $amount'),
          ),
          ListTile(
            title: Text('Payment Method: $method'),
          ),
          Image.asset(image),
          if (!approvalStatus)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle approve button press
                  },
                  child: Text('Approve'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle decline button press
                  },
                  child: Text('Decline'),
                ),
              ],
            ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

class NoteScreen extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            title: Text('Cards Needing Approval'),
            leading: IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: () {
                scaffoldKey.currentState?.openDrawer();
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
                      MaterialPageRoute(
                          builder: (context) => BirthdaysScreen()),
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
                      MaterialPageRoute(
                          builder: (context) => NewResultsScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
          body: ListView(
            children: [
              ApprovalCard(
                date: '2022-01-01',
                id: '123456',
                approvalStatus: true,
                amount: 99.99,
                method: 'Cherry',
                image: 'assets/images/cherry.png',
              ),
              ApprovalCard(
                date: '2022-01-02',
                id: '654321',
                approvalStatus: false,
                amount: 199.99,
                method: 'Mango',
                image: 'assets/images/mango.png',
              ),
              // Add more ApprovalCard widgets as needed
            ],
          ),
        );
      },
    );
  }
}
