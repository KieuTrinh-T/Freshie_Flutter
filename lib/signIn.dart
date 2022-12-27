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
  bool passenable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Đăng nhập"),
        ),
        body: SingleChildScrollView(
            child: Container(
                child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: const BoxDecoration(
                color: Color(0xff3AB0FF),
              ),
              child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Image.asset(
                      'assets/images/logo_freshie.png',
                      width: 80,
                      height: 80,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 15),
                            child: Text(
                              "Chào mừng bạn trở lại!",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                  ]),
            ),
            Container(
              height: 50,
              margin: EdgeInsets.only(bottom: 20),
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextField(
                controller: _username,
                decoration: InputDecoration(
                  errorText: (_nameValidate) ? 'Bạn chưa nhập email' : null,
                  filled: true,
                  fillColor: Color.fromARGB(255, 237, 236, 236),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Số điện thoại hoặc email',
                  hintStyle: TextStyle(
                    fontSize: 13,
                    color: Color.fromARGB(255, 146, 144, 144),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              height: 50,
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextField(
                controller: _pas,
                obscureText: passenable,
                decoration: InputDecoration(
                  errorText: (_passValidate) ? 'Bạn chưa nhập mật khẩu' : null,
                  filled: true,
                  fillColor: Color.fromARGB(255, 237, 236, 236),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffix: IconButton(
                      onPressed: () {
                        //add Icon button at end of TextField
                        setState(() {
                          //refresh UI
                          if (passenable) {
                            //if passenable == true, make it false
                            passenable = false;
                          } else {
                            passenable =
                                true; //if passenable == false, make it true
                          }
                        });
                      },
                      icon: Icon(passenable == true
                          ? Icons.remove_red_eye
                          : Icons.remove_red_eye_outlined)),
                  hintText: 'Mât khẩu',
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
                "Quên mật khẩu?",
                style: TextStyle(
                  color: Color(0xff3AB0FF),
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
                child: Text("Đăng nhập"),
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
                Text("Đăng nhập bằng"),
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
                  "Bạn chưa có tài khoản? ",
                  style: TextStyle(
                    color: Color.fromARGB(255, 146, 144, 144),
                  ),
                ),
                new GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUp()),
                    );
                  },
                  child: Text(
                    "Đăng ký",
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                )
              ],
            ),
          ],
        ))));
  }
}
