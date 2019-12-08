import 'package:flutter/material.dart';

class EditBox extends StatefulWidget {
  @override
  _EditBoxState createState() => _EditBoxState();
}

class _EditBoxState extends State<EditBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              left: 30.0,
              right: 30.0,
              top: 120.0,
            ),
            child: Text(
              'Welcome back,',
              style: TextStyle(
                fontSize: 34.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 30.0,
              right: 30.0,
              top: 8.0,
            ),
            child: Text(
              'Sophie',
              style: TextStyle(
                fontSize: 34.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 18.0,
              bottom: 9.0,
              left: 30.0,
              right: 30.0,
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Email address',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 18.0,
              bottom: 9.0,
              left: 30.0,
              right: 30.0,
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
