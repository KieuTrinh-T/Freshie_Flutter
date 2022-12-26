import 'package:flutter/material.dart';
import 'main.dart';
import 'cart.dart';
import 'signUp.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _username = TextEditingController();
  final _pas = TextEditingController();
  bool _passValidate = false;
  bool _nameValidate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login Page"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: const BoxDecoration(
                color: Color(0xff3AB0FF),
              ),
              child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Image.asset(
                      'assets/images/logo_freshie.png',
                      width: 100,
                      height: 100,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 15),
                            child: Text(
                              "Sign in",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold),
                            )),
                        new GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUp()),
                              );
                            },
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 25),
                              child: Text(
                                "Sign up",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 207, 205, 205),
                                    fontSize: 30),
                              ),
                            ))
                      ],
                    ),
                  ]),
            ),
            Container(
              height: 30,
              margin: EdgeInsets.only(bottom: 20),
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextField(
                controller: _username,
                decoration: InputDecoration(
                  errorText:
                      (_nameValidate) ? 'Username Can\'t Be Empty' : null,
                  filled: true,
                  fillColor: Color.fromARGB(255, 237, 236, 236),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Enter your email or phone number',
                  hintStyle: TextStyle(
                    fontSize: 13,
                    color: Color.fromARGB(255, 146, 144, 144),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              height: 30,
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextField(
                controller: _pas,
                decoration: InputDecoration(
                  errorText:
                      (_passValidate) ? 'Password Can\'t Be Empty' : null,
                  filled: true,
                  fillColor: Color.fromARGB(255, 237, 236, 236),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Enter your password',
                  hintStyle: TextStyle(
                    fontSize: 13,
                    color: Color.fromARGB(255, 146, 144, 144),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              height: 30,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 20),
              child: Text(
                "Forgot Password?",
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              height: 50,
              width: MediaQuery.of(context).size.width * 0.5,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _username.text.isEmpty
                        ? _nameValidate = true
                        : _nameValidate = false;
                    _pas.text.isEmpty
                        ? _passValidate = true
                        : _passValidate = false;
                  });
                },
                child: Text("Login"),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Color(0xff3AB0FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 20, right: 10),
                    child: Divider(
                      color: Color.fromARGB(255, 146, 144, 144),
                      height: 36,
                    ),
                  ),
                ),
                Text("Or"),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 10, right: 20),
                    child: Divider(
                      color: Color.fromARGB(255, 146, 144, 144),
                      height: 36,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 20, right: 20),
                  child: Image.asset(
                    'assets/images/icon_Google.png',
                    width: 50,
                    height: 50,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 20, left: 20),
                  child: Image.asset(
                    'assets/images/icon_Facebook.png',
                    width: 50,
                    height: 50,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Don't have an account? ",
                  style: TextStyle(
                    color: Color.fromARGB(255, 146, 144, 144),
                  ),
                ),
                Text(
                  "Sign up",
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
