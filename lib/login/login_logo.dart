import 'package:flutter/material.dart';

class SigninLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              top: 18.0,
              left: 30.0,
              right: 18.0,
            ),
            child: SizedBox(
              height: 30.0,
              width: 30.0,
              child: Icon(Icons.perm_device_information),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 18.0,
            ),
            child: SizedBox(
              height: 45.0,
              width: 45.0,
              child: Icon(Icons.perm_phone_msg)
            ),
          ),
        ],
      ),
    );
  }
}
