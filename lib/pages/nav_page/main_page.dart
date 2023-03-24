import 'package:flutter/material.dart';
import 'package:travel_app/pages/nav_page/bar_item.dart';
import 'package:travel_app/pages/nav_page/home_page.dart';
import 'package:travel_app/pages/nav_page/my_page.dart';
import 'package:travel_app/pages/nav_page/search_pages.dart';
class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages=[
    HomePage(),
    BarItemPage(),
    SearchPage(),
    MyPage(),
  ];
  int currentIndex=0;
  void onTap(int index){
     setState(() {
       currentIndex=index;
     });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 0,
        selectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showUnselectedLabels: false,
        showSelectedLabels: false,
        elevation: 0,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.apps),label:"Home"),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart_sharp),label:"Bar"),
          BottomNavigationBarItem(icon: Icon(Icons.search),label:"Search"),
          BottomNavigationBarItem(icon: Icon(Icons.person),label:"My"),
        ],
      ),
      body: pages[currentIndex]
    );
  }
}
