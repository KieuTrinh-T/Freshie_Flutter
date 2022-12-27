import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:sidebarx/sidebarx.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);
  Title? title = Title(color: Colors.black, child: Text('Trang chủ'));

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String buttonname = 'Click Me';
  int currentIndex = 0;
  bool _searchBoolean = false;

  //Search Text Field widget

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // remove debug banner
      home: Scaffold(
        body: Center(
            child: currentIndex == 0
                ? ListView(
                    children: [
                      ImageSlideshow(
                        width: double.infinity,
                        height: 200,
                        initialPage: 0,
                        indicatorColor: Colors.blue,
                        indicatorBackgroundColor: Colors.grey,
                        isLoop: true,
                        onPageChanged: (value) {
                          print('Page changed: $value');
                        },
                        autoPlayInterval: 3000,
                        children: [
                          Image.asset(
                            'assets/images/banner1.jpg',
                            fit: BoxFit.cover,
                          ),
                          Image.asset(
                            'assets/images/banner2.jpg',
                            fit: BoxFit.cover,
                          ),
                          Image.asset(
                            'assets/images/banner3.jpg',
                            fit: BoxFit.cover,
                          ),
                          Image.asset(
                            'assets/images/banner4.jpg',
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                      GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 4,
                        crossAxisSpacing: 2,
                        mainAxisSpacing: 2,
                        children: List.generate(navbuttons.length, (index) {
                          return Center(
                            child: SelectButton(navbutton: navbuttons[index]),
                          );
                        }),
                      ),
                      Container(
                        width: double.infinity,
                        height: 200,
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'FlashSale',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.lightBlueAccent),
                                  ),
                                ),
                              ],
                            ),
                            GridView.count(
                              shrinkWrap: true,
                              crossAxisCount: 3,
                              crossAxisSpacing: 2,
                              mainAxisSpacing: 2,
                              children:
                                  List.generate(flashsales.length, (index) {
                                return Center(
                                  child:
                                      FlashSale(flashsale: flashsales[index]),
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 200,
                        color: Colors.white,
                        margin: EdgeInsets.only(top: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Sản phẩm mới nhất',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.pinkAccent),
                                  ),
                                ),
                              ],
                            ),
                            GridView.count(
                              shrinkWrap: true,
                              crossAxisCount: 3,
                              crossAxisSpacing: 2,
                              mainAxisSpacing: 2,
                              children: List.generate(newests.length, (index) {
                                return Center(
                                  child: Newest(newest: newests[index]),
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 200,
                        color: Colors.white,
                        margin: EdgeInsets.only(top: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Sản phẩm bán chạy',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.pinkAccent),
                                  ),
                                ),
                              ],
                            ),
                            GridView.count(
                              shrinkWrap: true,
                              crossAxisCount: 3,
                              crossAxisSpacing: 2,
                              mainAxisSpacing: 2,
                              children:
                                  List.generate(bestsellers.length, (index) {
                                return Center(
                                  child: Bestseller(
                                      bestseller: bestsellers[index]),
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        color: Colors.white,
                        margin: EdgeInsets.only(top: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Dành cho bạn',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.pinkAccent),
                                  ),
                                ),
                              ],
                            ),
                            GridView.count(
                              shrinkWrap: true,
                              crossAxisCount: 2,
                              crossAxisSpacing: 2,
                              mainAxisSpacing: 2,
                              children: List.generate(foryous.length, (index) {
                                return Center(
                                  child: ForYou(foryou: foryous[index]),
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                : currentIndex == 1
                    ? ListView(
                        children: [
                          DefaultTabController(
                              length: 4,
                              child: Column(children: [
                                Container(
                                  color: Colors.white,
                                  child: TabBar(
                                    labelColor: Colors.pinkAccent,
                                    unselectedLabelColor: Colors.grey,
                                    indicatorColor: Colors.pinkAccent,
                                    tabs: [
                                      Tab(
                                        text: 'Skin care',
                                      ),
                                      Tab(text: 'Makeup'),
                                      Tab(text: 'Hair care'),
                                      Tab(text: 'Perfume'),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 500,
                                  child: TabBarView(
                                    children: [
                                      // Skin care tab
                                      GridView.count(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 2,
                                        mainAxisSpacing: 2,
                                        children: List.generate(
                                            skincares.length, (index) {
                                          return Center(
                                            child: SkinCare(
                                                skincare: skincares[index]),
                                          );
                                        }),
                                      ),

                                      // Makeup tab
                                      GridView.count(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 2,
                                        mainAxisSpacing: 2,
                                        children: List.generate(makeups.length,
                                            (index) {
                                          return Center(
                                            child:
                                                MakeUp(makeup: makeups[index]),
                                          );
                                        }),
                                      ),

                                      // Hair care tab
                                      GridView.count(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 2,
                                        mainAxisSpacing: 2,
                                        children: List.generate(
                                            haircares.length, (index) {
                                          return Center(
                                            child: HairCare(
                                                haircare: haircares[index]),
                                          );
                                        }),
                                      ),

                                      // Perfume tab
                                      GridView.count(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 2,
                                        mainAxisSpacing: 2,
                                        children: List.generate(perfumes.length,
                                            (index) {
                                          return Center(
                                            child: Perfume(
                                                perfume: perfumes[index]),
                                          );
                                        }),
                                      ),
                                    ],
                                  ),
                                ),
                              ]))
                        ],
                      )
                    : currentIndex == 2
                        ? ListView(
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.green, // background
                                  onPrimary: Colors.white, // foreground
                                ),
                                onPressed: () {
                                  setState(() {
                                    buttonname = 'Notification';
                                  });
                                },
                                child: Text(buttonname),
                              ),
                            ],
                          )
                        : ListView(
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.red, // background
                                  onPrimary: Colors.white, // foreground
                                ),
                                onPressed: () {
                                  setState(() {
                                    buttonname = 'Profile';
                                  });
                                },
                                child: Text(buttonname),
                              ),
                            ],
                          )),
      ),
    );
  }
}

// button list
class navbutton {
  final String title;
  final String image;
  const navbutton({required this.title, required this.image});
}

const List<navbutton> navbuttons = const <navbutton>[
  const navbutton(title: 'Deal xịn', image: 'assets/images/Deals_xin.png'),
  const navbutton(title: 'Đơn hàng', image: 'assets/images/Order.png'),
  const navbutton(title: 'Tích điểm', image: 'assets/images/Point.png'),
  const navbutton(title: 'MyVoucher', image: 'assets/images/MyVoucher.png'),
];

class SelectButton extends StatelessWidget {
  final navbutton;
  const SelectButton({Key? key, this.navbutton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            navbutton.image,
            width: 50,
            height: 50,
          ),
          Text(navbutton.title),
        ],
      ),
    );
  }
}

// flashsale list
class flashsale {
  final String Price;
  final String productImage;
  const flashsale({required this.Price, required this.productImage});
}

const List<flashsale> flashsales = const <flashsale>[
  const flashsale(
      Price: '100.000đ', productImage: 'assets/images/flashsale1.jpg'),
  const flashsale(
      Price: '200.000đ', productImage: 'assets/images/flashsale2.png'),
  const flashsale(
      Price: '300.000đ', productImage: 'assets/images/flashsale3.png'),
];

class FlashSale extends StatelessWidget {
  final flashsale;
  const FlashSale({Key? key, this.flashsale}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            flashsale.productImage,
            width: 100,
            height: 100,
          ),
          Text(
            flashsale.Price,
            style: TextStyle(
              color: Colors.pinkAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
          Image.asset(
            'assets/images/daban.png',
            width: 100,
            height: 10,
          )
        ],
      ),
    );
  }
}

// newest list
class newest {
  final String productName;
  final String productImage;
  const newest({required this.productName, required this.productImage});
}

const List<newest> newests = const <newest>[
  const newest(
      productName: 'Kem chống nắng Eucerin',
      productImage: 'assets/images/newest1.jpg'),
  const newest(
      productName: 'Serum Balance Vitamin C',
      productImage: 'assets/images/newest2.png'),
  const newest(
      productName: 'Mặt nạ đất sét Kiehl',
      productImage: 'assets/images/newest3.png'),
];

class Newest extends StatelessWidget {
  final newest;
  const Newest({Key? key, this.newest}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            newest.productImage,
            width: 100,
            height: 80,
          ),
          Text(
            newest.productName,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

// bestseller list
class bestseller {
  final String productName;
  final String productImage;
  final String sold;
  const bestseller(
      {required this.productName,
      required this.productImage,
      required this.sold});
}

const List<bestseller> bestsellers = const <bestseller>[
  const bestseller(
      productName: 'Kem chống nắng Eucerin',
      productImage: 'assets/images/newest1.jpg',
      sold: 'Đã bán 100'),
  const bestseller(
      productName: 'Serum Balance Vitamin C',
      productImage: 'assets/images/newest2.png',
      sold: 'Đã bán 200'),
  const bestseller(
      productName: 'Mặt nạ đất sét Kiehl',
      productImage: 'assets/images/newest3.png',
      sold: 'Đã bán 300'),
];

class Bestseller extends StatelessWidget {
  final bestseller;
  const Bestseller({Key? key, this.bestseller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            bestseller.productImage,
            width: 100,
            height: 80,
          ),
          Text(
            bestseller.productName,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          Text(
            bestseller.sold,
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

//for you list
class foryou {
  final String productName;
  final String productImage;
  final double productPrice;
  final String productDiscount;
  final String sold;
  final double productRating;
  final int productRatingCount;
  const foryou(
      {required this.productName,
      required this.productImage,
      required this.productPrice,
      required this.productDiscount,
      required this.sold,
      required this.productRating,
      required this.productRatingCount});
}

const List<foryou> foryous = const <foryou>[
  const foryou(
      productName: 'Kem chống nắng Eucerin',
      productImage: 'assets/images/newest1.jpg',
      productPrice: 100000,
      productDiscount: '-10%',
      sold: 'Đã bán 100',
      productRating: 4.5,
      productRatingCount: 100),
  const foryou(
      productName: 'Serum Balance Vitamin C',
      productImage: 'assets/images/newest2.png',
      productPrice: 200000,
      productDiscount: '-20%',
      sold: 'Đã bán 200',
      productRating: 4.0,
      productRatingCount: 200),
  const foryou(
      productName: 'Mặt nạ đất sét Kiehl',
      productImage: 'assets/images/newest3.png',
      productPrice: 300000,
      productDiscount: '-30%',
      sold: 'Đã bán 300',
      productRating: 3.5,
      productRatingCount: 300),
];

class ForYou extends StatelessWidget {
  final foryou;
  const ForYou({Key? key, this.foryou}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Expanded(
            flex: 6,
            child: Container(
                width: 180,
                height: 180,
                child: Stack(
                  children: [
                    Image.asset(
                      foryou.productImage,
                      width: 170,
                      height: 170,
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        width: 40,
                        height: 20,
                        color: Colors.pinkAccent,
                        child: Center(
                          child: Text(
                            foryou.productDiscount,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ))),
        Expanded(
          flex: 1,
          child: Container(
            width: 180,
            height: 20,
            child: Text(
              foryou.productName,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            width: 180,
            height: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  foryou.sold,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 15,
                    ),
                    Text(
                      foryou.productRating.toString(),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      '(${foryou.productRatingCount})',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            width: 180,
            height: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  foryou.productPrice
                          .toInt()
                          .toString()
                          .toString()
                          .replaceAllMapped(
                              new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                              (Match m) => '${m[1]}.') +
                      "đ",
                  style: TextStyle(
                      color: Colors.pink,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: IconButton(
                    icon: Icon(
                      Icons.favorite_border,
                      color: Colors.black,
                      size: 20,
                    ),
                    onPressed: () {},
                  ),
                ),
                Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.black,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}

// category list
// skincare list
class skincare {
  final String title;
  final String image;
  const skincare({required this.title, required this.image});
}

const List<skincare> skincares = const <skincare>[
  const skincare(title: 'Kem chống nắng', image: 'assets/images/skincare1.png'),
  const skincare(title: 'Tẩy trang', image: 'assets/images/skincare2.png'),
  const skincare(title: 'Sữa rửa mặt', image: 'assets/images/skincare3.jpg'),
  const skincare(title: 'Toner', image: 'assets/images/skincare4.png'),
  const skincare(title: 'Kem dưỡng', image: 'assets/images/skincare5.jpg'),
  const skincare(title: 'Mặt nạ', image: 'assets/images/skincare6.jpg'),
  const skincare(title: 'Serum', image: 'assets/images/skincare7.png'),
  const skincare(title: 'Tất cả', image: 'assets/images/skincare8.png'),
];

class SkinCare extends StatelessWidget {
  final skincare;
  const SkinCare({Key? key, this.skincare}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        children: [
          Image.asset(
            skincare.image,
            width: 50,
            height: 50,
          ),
          Text(
            skincare.title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

// makeup list
class makeup {
  final String title;
  final String image;
  const makeup({required this.title, required this.image});
}

const List<makeup> makeups = const <makeup>[
  const makeup(title: 'Trang điểm mặt', image: 'assets/images/makeup1.png'),
  const makeup(title: 'Trang điểm mắt', image: 'assets/images/makeup2.png'),
  const makeup(title: 'Trang điểm môi', image: 'assets/images/makeup3.jpg'),
  const makeup(title: 'Dụng cụ trang điểm', image: 'assets/images/makeup4.png'),
  const makeup(title: 'Tất cả', image: 'assets/images/makeup5.png'),
];

class MakeUp extends StatelessWidget {
  final makeup;
  const MakeUp({Key? key, this.makeup}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        children: [
          Image.asset(
            makeup.image,
            width: 50,
            height: 50,
          ),
          Text(
            makeup.title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

// haircare list
class haircare {
  final String title;
  final String image;
  const haircare({required this.title, required this.image});
}

const List<haircare> haircares = const <haircare>[
  const haircare(title: 'Dầu gội', image: 'assets/images/haircare1.jpg'),
  const haircare(title: 'Dầu xả', image: 'assets/images/haircare2.png'),
  const haircare(title: 'Kem dưỡng tóc', image: 'assets/images/haircare3.jpg'),
  const haircare(title: 'Tất cả', image: 'assets/images/haircare4.png'),
];

class HairCare extends StatelessWidget {
  final haircare;
  const HairCare({Key? key, this.haircare}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        children: [
          Image.asset(
            haircare.image,
            width: 50,
            height: 50,
          ),
          Text(
            haircare.title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

// perfume  list
class perfume {
  final String title;
  final String image;
  const perfume({required this.title, required this.image});
}

const List<perfume> perfumes = const <perfume>[
  const perfume(title: 'Nước hoa nữ', image: 'assets/images/perfume1.png'),
  const perfume(title: 'Nước hoa nam', image: 'assets/images/perfume2.jpg'),
  const perfume(title: 'Nước hoa unisex', image: 'assets/images/perfume3.jpg'),
  const perfume(title: 'Tất cả', image: 'assets/images/perfume4.jpg'),
];

class Perfume extends StatelessWidget {
  final perfume;
  const Perfume({Key? key, this.perfume}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        children: [
          Image.asset(
            perfume.image,
            width: 50,
            height: 50,
          ),
          Text(
            perfume.title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
