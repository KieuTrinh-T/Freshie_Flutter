import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_first_project/category.dart';
import 'package:flutter_first_project/profile.dart';
import 'signIn.dart';
import 'cart.dart';
import 'signUp.dart';
import 'checkout.dart';
import 'home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Freshie';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: _title,
        home: MyStatefulWidget(),
        theme: ThemeData(
          primarySwatch: Colors.lightBlue,
          primaryColor: Color(0xff3AB0FF),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xff3AB0FF),
            foregroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.white),
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          buttonBarTheme: ButtonBarThemeData(
            alignment: MainAxisAlignment.center,
            buttonTextTheme: ButtonTextTheme.accent,
          ),
          buttonTheme: ButtonThemeData(
            buttonColor: Color(0xff3AB0FF),
            textTheme: ButtonTextTheme.primary,
          ),
          fontFamily: 'Roboto',
        ));
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static bool _isfavortie = false;

  late final PageController pageController;

  ScrollController _scrollController = ScrollController();
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static List<Widget> _widgetOptions = <Widget>[
    Home(),
    Category(),
    Cart(),
    SignUp(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    pageController = PageController(initialPage: 0, viewportFraction: 0.85);
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
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
    pageController.dispose();
    super.dispose();
  }

  bool _searchBoolean = false;

  bool showBtmAppBr = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar(
          context, _widgetOptions.elementAt(_selectedIndex).toString()),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      floatingActionButtonLocation: showBtmAppBr
          ? FloatingActionButtonLocation.centerDocked
          : FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 103, 191, 249),
        onPressed: () {},
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: AnimatedContainer(
        child: BottomAppBar(
          notchMargin: 8.0,
          shape: const CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  _onItemTapped(0);
                },
                icon: Icon(CupertinoIcons.home,
                    color: _selectedIndex == 0
                        ? Color(0xffF473B9)
                        : Color.fromARGB(255, 233, 211, 234)),
              ),
              IconButton(
                onPressed: () {
                  _onItemTapped(1);
                },
                icon: Icon(
                  CupertinoIcons.list_bullet,
                  color: _selectedIndex == 1
                      ? Color(0xffF473B9)
                      : Color.fromARGB(255, 233, 211, 234),
                ),
              ),
              const SizedBox(
                width: 50,
              ),
              IconButton(
                onPressed: () {
                  _onItemTapped(2);
                },
                icon: Icon(CupertinoIcons.cart,
                    color: _selectedIndex == 2
                        ? Color(0xffF473B9)
                        : Color.fromARGB(255, 233, 211, 234)),
              ),
              IconButton(
                onPressed: () {
                  _onItemTapped(3);
                },
                icon: Icon(CupertinoIcons.bell,
                    color: _selectedIndex == 3
                        ? Color(0xffF473B9)
                        : Color.fromARGB(255, 233, 211, 234)),
              ),
            ],
          ),
        ),
        duration: const Duration(
          milliseconds: 800,
        ),
        curve: Curves.easeInOutSine,
        height: showBtmAppBr ? 70 : 0,
      ),
      // bottomNavigationBar: SizedBox(
      //   height: MediaQuery.of(context).size.height * 0.08,
      //   child: BottomNavigationBar(
      //     items: const <BottomNavigationBarItem>[
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.home_outlined),
      //         label: 'Trang chủ',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.shop_2_outlined),
      //         label: 'Danh mục',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.shopping_cart_outlined),
      //         label: 'Giỏ hàng',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.notifications_active_outlined),
      //         label: 'Thông báo',
      //       ),
      //     ],
      //     currentIndex: _selectedIndex,
      //     unselectedItemColor: Color.fromARGB(255, 181, 192, 213),
      //     selectedItemColor: Color(0xffF473B9),
      //     onTap: _onItemTapped,
      //   ),
      // )
    );
  }

  createAppBar(BuildContext context, String title) {
    return AppBar(
      title: _searchBoolean ? _searchTextField() : Text(title),
      actions: [
        !_searchBoolean
            ? IconButton(
                onPressed: () {
                  setState(() {
                    _searchBoolean = true;
                  });
                },
                icon: const Icon(Icons.search),
              )
            : IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                  setState(() {
                    _searchBoolean = false;
                  });
                }),
        PopUpMen(
          menuList: [
            PopupMenuItem(
              child: ListTile(
                leading: Icon(
                  CupertinoIcons.person,
                ),
                title: Text("Tài khoản"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EditProfileUI(),
                    ),
                  );
                },
              ),
            ),
            PopupMenuItem(
              child: ListTile(
                leading: Icon(
                  CupertinoIcons.gift,
                ),
                title: Text("Quà tặng"),
              ),
            ),
            PopupMenuDivider(),
            PopupMenuItem(
              child: ListTile(
                leading: Icon(
                  CupertinoIcons.info,
                ),
                title: Text("Cài đặt"),
              ),
            ),
            PopupMenuItem(
              child: ListTile(
                leading: Icon(
                  Icons.delivery_dining,
                ),
                title: Text("Tra cứu đơn hàng"),
              ),
            ),
            PopupMenuItem(
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                ),
                title: Text("Hỗ trợ"),
              ),
            ),
            PopupMenuItem(
              child: ListTile(
                leading: Icon(
                  Icons.logout,
                ),
                title: Text("Đăng xuất"),
                onTap: () => DialogUtils.showCustomDialog(
                  context,
                  title: "Bạn có muốn đăng xuất không?",
                  okBtnText: "Đăng xuất",
                  cancelBtnText: "Hủy",
                  okBtnFunction: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignIn(),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
          icon: CircleAvatar(
            backgroundImage: const NetworkImage(
              'https://media.licdn.com/dms/image/C5603AQGbE5TJ2oIv8A/profile-displayphoto-shrink_800_800/0/1659545503635?e=1677715200&v=beta&t=ritmxaCu8sHikpk1cenNY34dQTaSq0j-JDZ8yE7yD3Q',
            ),
            child: Container(),
          ),
        ),
      ],
    );
  }

  Widget _searchTextField() {
    return TextField(
      autofocus: true, //Display the keyboard when TextField is displayed
      cursorColor: Colors.white,
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
      textInputAction:
          TextInputAction.search, //Specify the action button on the keyboard
      decoration: InputDecoration(
        //Style of TextField
        enabledBorder: UnderlineInputBorder(
            //Default TextField border
            borderSide: BorderSide(color: Colors.white)),
        focusedBorder: UnderlineInputBorder(
            //Borders when a TextField is in focus
            borderSide: BorderSide(color: Colors.white)),
        hintText:
            'Nhập tên sản phẩm bạn muốn tìm', //Text that is displayed when nothing is entered.
        hintStyle: TextStyle(
          //Style of hintText
          color: Colors.white60,
          fontSize: 16,
        ),
      ),
    );
  }
}

class FabExt extends StatelessWidget {
  const FabExt({
    Key? key,
    required this.showFabTitle,
  }) : super(key: key);

  final bool showFabTitle;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {},
      label: AnimatedContainer(
        duration: const Duration(seconds: 2),
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            const Icon(CupertinoIcons.cart),
            SizedBox(width: showFabTitle ? 12.0 : 0),
            AnimatedContainer(
              duration: const Duration(seconds: 2),
              child: showFabTitle ? const Text("Go to cart") : const SizedBox(),
            )
          ],
        ),
      ),
    );
  }
}

class DialogUtils {
  static DialogUtils _instance = new DialogUtils.internal();

  DialogUtils.internal();

  factory DialogUtils() => _instance;

  static void showCustomDialog(BuildContext context,
      {required String title,
      String okBtnText = "Ok",
      String cancelBtnText = "Cancel",
      required Function okBtnFunction}) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text(title),
            content: Text(""),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.close, color: Colors.blueAccent),
                onPressed: () => Navigator.pop(context),
              ),
              IconButton(
                  icon: Icon(Icons.check, color: Colors.red),
                  onPressed: () {
                    okBtnFunction();
                  }),
            ],
          );
        });
  }
}
