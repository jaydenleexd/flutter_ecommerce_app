import 'package:flutter/material.dart';

class AddDataScreen extends StatefulWidget {
  @override
  _AddDataScreenState createState() => _AddDataScreenState();
}

class _AddDataScreenState extends State<AddDataScreen> {
  int? _methodValue;
  int? _platformValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  title: Text('Add Data'),
  iconTheme: IconThemeData(color: Colors.black),  // Set the color of the back button to black
),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Add Note',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Amount:',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Amount',
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Methods',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio(
                    value: 1,
                    groupValue: _methodValue,
                    onChanged: (value) {
                      setState(() {
                        _methodValue = value as int?;
                      });
                    },
                  ),
                  Text('CA'),
                  Radio(
                    value: 2,
                    groupValue: _methodValue,
                    onChanged: (value) {
                      setState(() {
                        _methodValue = value as int?;
                      });
                    },
                  ),
                  Text('BT'),
                  Radio(
                    value: 3,
                    groupValue: _methodValue,
                    onChanged: (value) {
                      setState(() {
                        _methodValue = value as int?;
                      });
                    },
                  ),
                  Text('CH'),
                  Radio(
                    value: 4,
                    groupValue: _methodValue,
                    onChanged: (value) {
                      setState(() {
                        _methodValue = value as int?;
                      });
                    },
                  ),
                  Text('BI'),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Platform:',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio(
                    value: 1,
                    groupValue: _platformValue,
                    onChanged: (value) {
                      setState(() {
                        _platformValue = value as int?;
                      });
                    },
                  ),
                  Text('P'),
                  Radio(
                    value: 2,
                    groupValue: _platformValue,
                    onChanged: (value) {
                      setState(() {
                        _platformValue = value as int?;
                      });
                    },
                  ),
                  Text('M'),
                  Radio(
                    value: 3,
                    groupValue: _platformValue,
                    onChanged: (value) {
                      setState(() {
                        _platformValue = value as int?;
                      });
                    },
                  ),
                  Text('CH'),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Perform submit action here
                  Navigator.pop(context);
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
