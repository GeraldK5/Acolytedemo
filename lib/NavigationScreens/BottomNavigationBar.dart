import 'package:acolyte/NavigationScreens/BottomNavigationScreens/Chart.dart';
import 'package:acolyte/NavigationScreens/BottomNavigationScreens/Home.dart';
import 'package:acolyte/NavigationScreens/BottomNavigationScreens/Investment.dart';
import 'package:acolyte/NavigationScreens/BottomNavigationScreens/Savings.dart';
import 'package:acolyte/NavigationScreens/BottomNavigationScreens/Settings.dart';
import 'package:acolyte/NavigationScreens/Services/notificationIcon.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  int selected;
  BottomNavBar({super.key, required this.selected});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late int _currentIndex = widget.selected;
  final List<Widget> pages = [
    Home(),
    Savings(),
    Chat(),
    Investment(),
    Settings()
  ];
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: _currentIndex == 0
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 40.0, // specify the width of the container
                      height: 40.0, // specify the height of the container
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        'images/profile.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      'Hello Demo',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )
                  ],
                )
              : _currentIndex == 1
                  ? Text("Savings Summary")
                  : _currentIndex == 2
                      ? Text("Chat")
                      : _currentIndex == 3
                          ? Text("Investment")
                          : Text("Setings"),
          actions: [
            _currentIndex == 0
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: InkWell(
                          onTap: () {},
                          child: notificationIcon(
                            icon: Icons.notifications,
                          ),
                        ),
                      ),
                    ],
                  )
                : SizedBox(),
          ],
        ),
        body: pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            selectedItemColor: Color(0XFF3d4ee6),
            unselectedItemColor: const Color.fromARGB(255, 212, 212, 212),
            showUnselectedLabels: true,
            onTap: (value) {
              setState(() {
                _currentIndex = value; // Update the selected index
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.savings), label: 'Savings'),
              BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chats'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.attach_money), label: 'Invest'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'Settings')
            ]),
      ),
    );
  }
}
