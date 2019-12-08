import 'package:chat_fire/chat_home/chat.dart';
import 'package:flutter/material.dart';

class NextBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomLeft,
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 30.0,
                      top: 18.0,
                      bottom: 60.0,
                    ),
                    child: Text(
                      'Forgert Password?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 30.0,
                      top: 18.0,
                      right: 30.0,
                      bottom: 60.0,
                    ),
                    child: Container(
                      color: Colors.red[300],
                      child: IconButton(
                        icon: Icon(Icons.arrow_forward),
                        color: Colors.white,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChatHome(),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
