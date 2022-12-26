import 'package:flutter_first_project/CartItem.dart';

import 'cart.dart';
import 'package:flutter/material.dart';

class Checkout extends StatefulWidget {
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  String? paymentValue;
  String? shippingValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Checkout"),
        ),
        body: SingleChildScrollView(
            child: Stack(
          children: <Widget>[
            Column(children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                child: Card(
                    child: Column(children: <Widget>[
                  Text("Thông tin",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Họ và tên',
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Số điện thoại',
                      ),
                    ),
                  ),
                ])),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                child: Card(
                    child: Column(children: <Widget>[
                  Text("Địa chỉ",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            margin:
                                EdgeInsets.only(top: 10, bottom: 10, left: 10),
                            child: TextField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Tỉnh/Thành phố',
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            margin:
                                EdgeInsets.only(top: 10, bottom: 10, left: 10),
                            child: TextField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Quận/Huyện',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            margin:
                                EdgeInsets.only(top: 10, bottom: 10, left: 10),
                            child: TextField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Xã/Phường',
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            margin:
                                EdgeInsets.only(top: 10, bottom: 10, left: 10),
                            child: TextField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Địa chỉ cụ thể',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ])),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.12,
                child: Card(
                    child: Column(children: <Widget>[
                  Text("Phương thức vận chuyển",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                  Container(
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      children: <Widget>[
                        Radio(
                          value: "1",
                          groupValue: shippingValue,
                          onChanged: (value) {
                            setState(() {
                              shippingValue = value.toString();
                            });
                          },
                        ),
                        Text("Giao hàng tiêu chuẩn"),
                      ],
                    ),
                  ),
                ])),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                child: Card(
                    child: Column(children: <Widget>[
                  Text("Phương thức thanh toán",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      children: <Widget>[
                        Radio(
                          value: "1",
                          groupValue: paymentValue,
                          onChanged: (value) {
                            setState(() {
                              paymentValue = value.toString();
                            });
                          },
                        ),
                        Text("Thanh toán khi nhận hàng"),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      children: <Widget>[
                        Radio(
                          value: "2",
                          groupValue: paymentValue,
                          onChanged: (value) {
                            setState(() {
                              paymentValue = value.toString();
                            });
                          },
                        ),
                        Text("Thanh toán qua thẻ"),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      children: <Widget>[
                        Radio(
                          value: "3",
                          groupValue: paymentValue,
                          onChanged: (value) {
                            setState(() {
                              paymentValue = value.toString();
                            });
                          },
                        ),
                        Text("Thanh toán qua ví Momo"),
                      ],
                    ),
                  ),
                ])),
              ),
              Container(
                child: Card(
                    child: Column(children: <Widget>[
                  Text("Chọn mã giảm giá",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            margin:
                                EdgeInsets.only(top: 10, bottom: 10, left: 10),
                            child: TextField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Nhập mã giảm giá',
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(top: 10, bottom: 10, left: 10),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text("Áp dụng"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ])),
              ),
              Container(
                  child: Card(
                      child: Column(children: <Widget>[
                Text("Kiểm tra đơn hàng",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
                Container()
              ]))),
              Container(
                child: Card(
                    child: Column(children: <Widget>[
                  Text("Tổng tiền",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color(0xffF473B9),
                          fontWeight: FontWeight.bold)),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      children: <Widget>[
                        Text("Tổng tiền: 100.000đ",
                            style: TextStyle(
                              color: Color(0xffF473B9),
                            ))
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      children: <Widget>[
                        Text("Phí vận chuyển: 20.000đ",
                            style: TextStyle(
                              color: Color(0xffF473B9),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      children: <Widget>[
                        Text("Tổng tiền thanh toán: 120.000đ",
                            style: TextStyle(
                              color: Color(0xffF473B9),
                            ))
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Đặt hàng"),
                    ),
                  ),
                ])),
              )
            ]),
          ],
        )));
  }
}
