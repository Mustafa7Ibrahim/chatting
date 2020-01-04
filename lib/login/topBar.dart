import 'package:chat_fire/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          IconButton(
            padding: EdgeInsets.all(30),
            icon: Icon(FontAwesomeIcons.user),
            onPressed: () {},
          ),
          Spacer(),
          FlatButton(
            padding: EdgeInsets.all(30),
            child: Text(
              'Sign In',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {},
          ),
          FlatButton(
            padding: EdgeInsets.all(30),
            child: Text(
              'Sign Up',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SignUp(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
