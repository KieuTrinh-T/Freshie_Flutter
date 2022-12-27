// ignore_for_file: prefer_const_constructors, dead_code
import 'package:flutter/cupertino.dart';

import 'dart:ffi';
import 'package:flutter_first_project/signIn.dart';

import 'checkout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first_project/checkout.dart';
// ignore: unused_import
import 'main.dart';
import 'CartItem.dart';

class Cart extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  ScrollController _CartScrollController = ScrollController();

  static final List<CartItem> _cartItems = [
    CartItem("Kem Dưỡng Mắt OLAY Retinol 24 Tái Tạo Da Chống Lão Hóa Toàn Diện",
        2, 467000, "assets/images/1.webp"),
    CartItem(
        "Tinh Chất Dưỡng Da Ngăn Ngừa Lão Hoá Laneige Perfect Renew Youth Regenerator",
        1,
        1312000,
        "assets/images/2.webp"),
    CartItem("Tinh Chất Ngăn Ngừa Lão Hóa Da Laneige Time Freeze Essence Ex", 2,
        1394000, "assets/images/3.webp"),
    CartItem("Kem Dưỡng Mắt OLAY Retinol 24 Tái Tạo Da Chống Lão Hóa Toàn Diện",
        2, 467000, "assets/images/1.webp"),
    CartItem(
        "Tinh Chất Serum ST Beauty Chuyên Ngừa Các Loại Mụn - Giảm Thâm Nám, Tàn Nhang - Tái Tạo & Làm Trắng Hồng Da Tự Nhiên - ST BEAUTY ACNE WHITENING AMPOULE",
        2,
        467000,
        "assets/images/4.webp"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
          builder: (p0, p1) => Column(children: <Widget>[
                SingleChildScrollView(
                  controller: _CartScrollController,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.7,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        itemCount: _cartItems.length,
                        itemBuilder: (BuildContext context, int index) =>
                            createCart(context, index)),
                  ),
                ),
                SizedBox(
                    height: MediaQuery.of(context).size.height -
                        0.7 * MediaQuery.of(context).size.height -
                        AppBar().preferredSize.height -
                        80,
                    child: Container(
                        color: Color(0xffF473B9),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: createCheckout(context),
                        ))),
              ])),
    );
  }

  Widget createCart(BuildContext context, int index) {
    final item = _cartItems[index];
    return Container(
      child: Card(
        child: Row(
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Image.asset(
                    item.image,
                  ),
                )),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(item.title,
                      textAlign: TextAlign.left,
                      maxLines: 2,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(
                      item.price.toInt().toString().replaceAllMapped(
                              new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                              (Match m) => '${m[1]}.') +
                          " VND",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red)),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () {
                      setState(() {
                        if (item.quantity > 1) {
                          item.quantity--;
                        }
                      });
                    },
                  ),
                  Text(item.quantity.toString()),
                  IconButton(
                    icon: const Icon(
                      Icons.add,
                    ),
                    onPressed: () {
                      setState(() {
                        item.quantity++;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  createCheckout(BuildContext context) {
    int total = 0;
    for (var item in _cartItems) {
      total += item.price.toInt() * item.quantity;
    }
    return Align(
        alignment: Alignment.topLeft,
        child: Container(
          padding: const EdgeInsets.only(left: 30),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                        "Tổng: " +
                            total.toString().replaceAllMapped(
                                new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                (Match m) => '${m[1]}.') +
                            " VND",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(255, 255, 255, 1))),
                  ],
                ),
              ),
              Container(
                height: AppBar().preferredSize.height * 0.8,
                margin: const EdgeInsets.only(right: 100),
                child: Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 240, 224, 233),
                      foregroundColor: Color(0xffF473B9),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Checkout()),
                      );
                    },
                    child: const Text('Thanh toán'),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
