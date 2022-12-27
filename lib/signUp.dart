import 'package:flutter/material.dart';
import 'signIn.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _email = TextEditingController();
  final _phoneNumber = TextEditingController();
  final _pas = TextEditingController();
  final _repas = TextEditingController();
  String _passValidate = '';
  String _repassValidate = '';
  String _emailValidate = '';
  String _phoneValidate = '';
  bool passenable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up Page"),
      ),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: const BoxDecoration(
              color: Color(0xffF473B9),
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/images/logo_freshie.png',
                    width: 100,
                    height: 100,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      const Padding(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 50,
                                fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                ]),
          ),
          Container(
            height: 60,
            margin: EdgeInsets.only(bottom: 3),
            width: MediaQuery.of(context).size.width * 0.8,
            child: TextField(
              controller: _email,
              decoration: InputDecoration(
                errorText: _emailValidate,
                filled: true,
                fillColor: Color.fromARGB(255, 237, 236, 236),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: 'Nhập email của bạn',
                hintStyle: TextStyle(
                  fontSize: 13,
                  color: Color.fromARGB(255, 146, 144, 144),
                ),
              ),
            ),
          ),
          Container(
            height: 60,
            margin: EdgeInsets.only(bottom: 3),
            width: MediaQuery.of(context).size.width * 0.8,
            child: TextField(
              controller: _phoneNumber,
              decoration: InputDecoration(
                errorText: _phoneValidate,
                filled: true,
                fillColor: Color.fromARGB(255, 237, 236, 236),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: 'Nhập số điện thoại của bạn',
                hintStyle: TextStyle(
                  fontSize: 13,
                  color: Color.fromARGB(255, 146, 144, 144),
                ),
              ),
            ),
          ),
          Container(
            height: 60,
            margin: EdgeInsets.only(bottom: 3),
            width: MediaQuery.of(context).size.width * 0.8,
            child: TextField(
              controller: _pas,
              obscureText: passenable,
              decoration: InputDecoration(
                errorText: _passValidate,
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
                        : Icons.password)),
                hintText: 'Nhập mật khẩu của bạn',
                hintStyle: TextStyle(
                  fontSize: 13,
                  color: Color.fromARGB(255, 146, 144, 144),
                ),
              ),
            ),
          ),
          Container(
            height: 60,
            margin: EdgeInsets.only(bottom: 10),
            width: MediaQuery.of(context).size.width * 0.8,
            child: TextField(
              controller: _repas,
              obscureText: passenable,
              decoration: InputDecoration(
                errorText: _repassValidate,
                filled: true,
                fillColor: Color.fromARGB(255, 237, 236, 236),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: 'Xác nhận mật khẩu',
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
                        : Icons.read_more_outlined)),
                hintStyle: TextStyle(
                  fontSize: 13,
                  color: Color.fromARGB(255, 146, 144, 144),
                ),
              ),
            ),
          ),
          Container(
            height: 40,
            margin: EdgeInsets.only(bottom: 3),
            width: MediaQuery.of(context).size.width * 0.5,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  _email.text.isEmpty
                      ? _emailValidate = 'Email không được để trống'
                      : (RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                              .hasMatch(_email.text))
                          ? _emailValidate = ''
                          : _emailValidate = 'Email không hợp lệ';
                });
                setState(() {
                  _phoneNumber.text.isEmpty
                      ? _phoneValidate = 'Số điện thoại không được để trống'
                      : (RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)')
                              .hasMatch(_phoneNumber.text))
                          ? _phoneValidate = ''
                          : _phoneValidate = 'Số điện thoại không hợp lệ';
                });
                setState(() {
                  _pas.text.isEmpty
                      ? _passValidate = 'Mật khẩu không được để trống'
                      : (RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$')
                              .hasMatch(_pas.text))
                          ? _passValidate = ''
                          : _passValidate =
                              'Mật khẩu phải có ít nhất 8 ký tự, bao gồm chữ và số';
                });
                setState(() {
                  _repas.text.isEmpty
                      ? _repassValidate = 'Mật khẩu không được để trống'
                      : (_repas.text == _pas.text)
                          ? _repassValidate = ''
                          : _repassValidate = 'Mật khẩu không khớp';
                });
                if (_emailValidate == '' &&
                    _phoneValidate == '' &&
                    _passValidate == '' &&
                    _repassValidate == '') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignIn()),
                  );
                }
              },
              child: Text("Sign up"),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Color(0xffF473B9),
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
                "Already have an account? ",
                style: TextStyle(
                  color: Color.fromARGB(255, 146, 144, 144),
                ),
              ),
              new GestureDetector(
                child: Text(
                  "Sign in",
                  style: TextStyle(
                    color: Color(0xffF473B9),
                    decoration: TextDecoration.underline,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignIn()),
                  );
                },
              )
            ],
          ),
        ],
      )),
    );
  }
}
