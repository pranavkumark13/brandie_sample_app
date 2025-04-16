import 'package:brandie_sample/screen/home_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/local_image.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 2;
  List<Widget> screens = [
    const Center(
      child: Text('Screen 1'),
    ),
    const Center(
      child: Text('Screen 2'),
    ),
    const HomeScreen(),
    const Center(
      child: Text('Screen 3'),
    ),
    const Center(
      child: Text('Screen 4'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        elevation: 0,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.white.withOpacity(0.7),
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: _getBottomBars(),
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }

  List<BottomNavigationBarItem> _getBottomBars() {
    List<BottomNavigationBarItem> bars = [];
    List<String> sources = [
      './assets/images/rocket.png',
      './assets/images/search.png',
      './assets/images/home.png',
      './assets/images/chat.png',
      './assets/images/profile.png'
    ];
    for (var source in sources) {
      bars.add(BottomNavigationBarItem(
        icon: LocalImage(path: source),
        label: '',
      ));
    }

    return bars;
  }
}
