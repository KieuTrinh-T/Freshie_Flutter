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
                Container(
                  child: initScreen(),
                )
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

  Widget initScreen() {
    return new Container(
      child: Wrap(children: <Widget>[
        Container(
          height: 220.0,
          child: ListView(
            children: <Widget>[
              dummyDataOfListView(
                  "assets/images/sanpham1.jpeg",
                  "Kem dưỡng da Vitamin Tree Water-Gel",
                  "350.000 đ",
                  "Số lượng: 1"),
              dummyDataOfListView(
                  "assets/images/sanpham2.jpg",
                  "Mặt nạ BNBG Whitening Stem Cell Collagen",
                  "180.000 đ",
                  "Số lượng: 2"),
            ],
          ),
        ),
      ]),
    );
  }

  dummyDataOfListView(
      String imgSrc, String itemName, String itemPrice, String itemCount) {
    return Container(
      child: Card(
        elevation: 4.0,
        margin:
            EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0, bottom: 5.0),
        color: Color(0xffFFFFFF),
        child: ListTile(
          // on ListItem clicked
          onTap: () {},

          // Image of ListItem
          leading: Container(
            child: Image(
              fit: BoxFit.fitHeight,
              image: AssetImage(imgSrc),
            ),
          ),
          // Lists of titles
          title: Container(
            margin: EdgeInsets.only(top: 10.0),
            height: 80.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(bottom: 2.0),
                  child: Text(
                    itemName,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 3.0),
                  child: Text(
                    itemPrice,
                    style: TextStyle(color: Color(0xff374ABE)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
