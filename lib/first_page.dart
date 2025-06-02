import 'package:flutter/material.dart';
import 'home_page.dart';
import 'Search_scree.dart';
import 'Add_friends.dart';
import 'chat_page.dart';

void main() => runApp(MaterialApp(
  theme: ThemeData(fontFamily: 'Manrope'),
  home: mainPage(),
));
class mainPage extends StatefulWidget {
  const mainPage({super.key});

  @override
  State<mainPage> createState() => _homePageState();
}

class _homePageState extends State<mainPage> {
  int mainContent = 0;

  final List<Widget>_pages =[
    homePage(),
    searchPage(),
    friendPage(),
    messagePage(),
  ];
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages [mainContent],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: mainContent,
        onTap: (index){
          setState(() {
            mainContent = index;
          });
        },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Friends'),
            BottomNavigationBarItem(icon: Icon(Icons.messenger_outline_rounded), label: 'Messages')
          ],
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Color(0xFF2B2B2B),
          unselectedItemColor: Color(0xFF898989)

      )
    );
  }
}
