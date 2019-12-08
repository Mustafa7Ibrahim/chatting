import 'package:chat_fire/sign_up.dart';
import 'package:flutter/material.dart';

class Bar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              top: 18.0,
              left: 30.0,
              right: 18.0,
            ),
            child: SizedBox(
              height: 45.0,
              width: 45.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Icon(Icons.people),
                clipBehavior: Clip.hardEdge,
              ),
            ),
          ),
          Spacer(
            flex: 1,
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 18.0,
              left: 18.0,
              right: 18.0,
            ),
            child: Text(
              'Sign In',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 18.0,
              left: 18.0,
              right: 30.0,
            ),
            child: FlatButton(
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
                    builder: (
                        context,
                        ) =>
                        SignUp(),
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
