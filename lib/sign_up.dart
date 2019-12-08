import 'package:chat_fire/login/log_in.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              Row(
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
                      ),
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 18.0,
                      left: 30.0,
                      right: 18.0,
                    ),
                    child: FlatButton(
                      child: Text(
                        'Sign In',
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
                                LoginHome(),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 18.0,
                      left: 18.0,
                      right: 30.0,
                    ),
                    child: Text(
                      'Sing Up',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 30.0,
                            top: 60.0,
                          ),
                          child: Text(
                            'Hello',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 34.0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 8.0,
                            right: 30.0,
                            top: 60.0,
                          ),
                          child: Text(
                            'Beautiful,',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 34.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 18.0,
                        left: 30.0,
                        top: 8.0,
                      ),
                      child: Text(
                        'Enter your informations below\nor logain with a social account',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 60.0,
                        right: 30.0,
                        left: 30.0,
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Email address",
                          hintStyle: TextStyle(
                            fontSize: 20.0,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 18.0,
                        right: 30.0,
                        left: 30.0,
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: TextStyle(
                            fontSize: 20.0,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 18.0,
                        right: 30.0,
                        left: 30.0,
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Password again",
                          hintStyle: TextStyle(
                            fontSize: 20.0,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 18.0,
                            left: 30.0,
                          ),
                          child: SizedBox(
                            height: 30.0,
                            width: 30.0,
                            child:Icon(Icons.fast_forward)
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 18.0,
                            left: 15.0,
                          ),
                          child: SizedBox(
                            height: 45.0,
                            width: 45.0,
                            child: Icon(Icons.golf_course),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 18.0,
                      left: 30.0,
                      right: 30.0,
                    ),
                    child: SizedBox(
                      height: 45,
                      width: 45,
                      child: Container(
                        color: Colors.red[300],
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_forward,
                          ),
                          color: Colors.white,
                          onPressed: () => Navigator.pop(
                            context,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
