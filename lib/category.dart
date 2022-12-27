import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'profile.dart';
import 'main.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  late final PageController CategoryPageController;
  ScrollController _categoryscrollController = ScrollController();
  int pageNo = 0;

  Timer? carasouelTmer;

  Timer getTimer() {
    return Timer.periodic(const Duration(seconds: 3), (timer) {
      if (pageNo == 4) {
        pageNo = 0;
      }
      CategoryPageController.animateToPage(
        pageNo,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOutCirc,
      );
      pageNo++;
    });
  }

  @override
  void initState() {
    CategoryPageController =
        PageController(initialPage: 0, viewportFraction: 0.85);
    carasouelTmer = getTimer();
    _categoryscrollController.addListener(() {
      if (_categoryscrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        showBtmAppBr = false;
        setState(() {});
      } else {
        showBtmAppBr = true;
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    CategoryPageController.dispose();
    super.dispose();
  }

  bool showBtmAppBr = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _categoryscrollController,
          child: Column(
            children: [
              const SizedBox(
                height: 10.0,
              ),
              SizedBox(
                height: 250,
                child: PageView.builder(
                  controller: CategoryPageController,
                  onPageChanged: (index) {
                    pageNo = index;
                    setState(() {});
                  },
                  itemBuilder: (_, index) {
                    return AnimatedBuilder(
                      animation: CategoryPageController,
                      builder: (ctx, child) {
                        return child!;
                      },
                      child: GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Bạn đã chọn ${index + 1} "),
                            ),
                          );
                        },
                        onPanDown: (d) {
                          carasouelTmer?.cancel();
                          carasouelTmer = null;
                        },
                        onPanCancel: () {
                          carasouelTmer = getTimer();
                        },
                        child: Container(
                          margin: const EdgeInsets.only(
                              right: 8, left: 5, top: 24, bottom: 12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24.0),
                            image: DecorationImage(
                              image: NetworkImage(
                                "https://img.freepik.com/free-vector/cosmetics-ad-composition_1284-25633.jpg?w=1480&t=st=1672036806~exp=1672037406~hmac=9e917c1ac9f408427ff56c6dd3123ea8e72f5eed540d466334f1f7f37866cb0f",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: 5,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  5,
                  (index) => GestureDetector(
                    child: Container(
                      margin: const EdgeInsets.all(2.0),
                      child: Icon(
                        Icons.circle,
                        size: 12.0,
                        color: pageNo == index
                            ? Colors.lightBlue.shade200
                            : Colors.grey.shade300,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 10.0,
                  ),
                  const Text(
                    "DANH MỤC SẢN PHẨM",
                    style: TextStyle(
                      color: Colors.pinkAccent,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5.0,
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ButtonBar(
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'HAIRCARE',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'SKINCARE',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'MAKEUP',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'PERFUME',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Nổi bật \n____________',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15,
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'Mới nhất \n____________',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'Bán chạy \n____________',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'Giá \n____________',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 1.0,
              ),
              const SizedBox(
                height: 15.0,
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: GridB(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PopUpMen extends StatelessWidget {
  final List<PopupMenuEntry> menuList;
  final Widget? icon;
  const PopUpMen({Key? key, required this.menuList, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      itemBuilder: ((context) => menuList),
      icon: icon,
    );
  }
}

class GridB extends StatefulWidget {
  const GridB({Key? key}) : super(key: key);

  @override
  State<GridB> createState() => _GridBState();
}

class _GridBState extends State<GridB> {
  bool _isFavorite = false;
  int _isFavoriteIndex = 0;
  final List<Map<String, dynamic>> gridMap = [
    {
      "title": "Kem dưỡng da Neccessaire",
      "price": "360.000\đ",
      "images":
          "https://images.unsplash.com/photo-1620916566398-39f1143ab7be?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
    },
    {
      "title": "Gel Rửa Mặt Dịu Nhẹ Curology",
      "price": "290.000\đ",
      "images":
          "https://images.unsplash.com/photo-1556228720-195a672e8a03?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
    },
    {
      "title": "Tinh chất The Ordinary",
      "price": "210.000\đ",
      "images":
          "https://images.unsplash.com/photo-1615354650192-e5a5bd9aa169?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=705&q=80",
    },
    {
      "title": "Toner Good Skin Club",
      "price": "260.000\đ",
      "images":
          "https://images.unsplash.com/photo-1620756236308-65c3ef5d25f3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80",
    },
    {
      "title": "Kem dưỡng Batch Whitening",
      "price": "360.000\đ",
      "images":
          "https://images.unsplash.com/photo-1593551496699-2d98ae303a2d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
    },
    {
      "title": "Toner Istree Plus Skin",
      "price": "250.000\đ",
      "images":
          "https://images.unsplash.com/photo-1616986953793-2e6159b78580?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2187&q=80",
    },
    {
      "title": "Set dưỡng da Neauthy",
      "price": "2.600.000\đ",
      "images":
          "https://images.unsplash.com/photo-1601049413574-214d105b26e4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1473&q=80",
    },
    {
      "title": "Nước hoa Coco Chanel",
      "price": "1.160.000\đ",
      "images":
          "https://images.unsplash.com/photo-1541643600914-78b084683601?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=704&q=80",
    },
    {
      "title": "Son Lancôme Red Lipstick",
      "price": "610.000\đ",
      "images":
          "https://images.unsplash.com/photo-1542452255191-c85a98f2c5d1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
    },
    {
      "title": "Nước hoa Black Coco",
      "price": "3.160.000\đ",
      "images":
          "https://images.unsplash.com/photo-1594035910387-fea47794261f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
    },
    {
      "title": "Kem dưỡng Batch Plus",
      "price": "360.000\đ",
      "images":
          "https://images.unsplash.com/photo-1594311431552-1cde4f4d1891?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
    },
    {
      "title": "Son dưỡng Clinique Red",
      "price": "260.000\đ",
      "sale": "20%",
      "images":
          "https://images.unsplash.com/photo-1586495777744-4413f21062fa?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=715&q=80",
    },
  ];

  void setFavorite(int index) {
    setState(() {
      _isFavorite = !_isFavorite;
      _isFavoriteIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 8.0,
        mainAxisExtent: 340,
      ),
      itemCount: gridMap.length,
      itemBuilder: (_, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              15.0,
            ),
            color: Colors.grey.shade100,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
                child: Image.network(
                  "${gridMap.elementAt(index)['images']}",
                  height: 190,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${gridMap.elementAt(index)['title']}",
                      style: Theme.of(context).textTheme.subtitle1!.merge(
                            const TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      "${gridMap.elementAt(index)['price']}",
                      style: Theme.of(context).textTheme.subtitle2!.merge(
                            TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.pinkAccent.shade100,
                            ),
                          ),
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 18.0,
                        ),
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 18.0,
                        ),
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 18.0,
                        ),
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 18.0,
                        ),
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 18.0,
                        ),
                        const SizedBox(
                          width: 6.0,
                        ),
                        Text(
                          "(5)",
                          style: Theme.of(context).textTheme.subtitle2!.merge(
                                const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                        ),
                        const SizedBox(
                          height: 4.0,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              setFavorite(index);
                            });
                          },
                          icon: Icon(
                              _isFavoriteIndex == index && _isFavorite
                                  ? CupertinoIcons.heart_fill
                                  : CupertinoIcons.heart,
                              color: _isFavoriteIndex == index && _isFavorite
                                  ? Colors.red
                                  : Colors.grey),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            CupertinoIcons.cart,
                          ),
                        ),
                        Text(
                          "3.5k đã bán",
                          style: Theme.of(context).textTheme.subtitle2!.merge(
                                const TextStyle(
                                  fontSize: 11.0,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.grey,
                                ),
                              ),
                        ),
                        const SizedBox(
                          height: 4.0,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
