import 'package:flutter/material.dart';
import 'package:roll_dice/src/pages/dice_page.dart';
import 'package:roll_dice/src/pages/history_page.dart';
import 'package:roll_dice/src/pages/user_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = [
    const DicePage(),
    const HistroyPage(),
    const UserPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Roll Dice"),
      ),
      body: _myAnimationSwitcher(),
      bottomNavigationBar: _myBottomNav(),
    );
  }

  void _onTapItem(int item) => setState(() {
        _selectedIndex = item;
      });

  Widget _myBottomNav() {
    return BottomNavigationBar(
      onTap: _onTapItem,
      currentIndex: _selectedIndex,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.dangerous), label: "Dice"),
        BottomNavigationBarItem(icon: Icon(Icons.list), label: "History"),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle), label: "User"),
      ],
    );
  }

  Widget _myAnimationSwitcher() {
    return Center(
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: _widgetOptions.elementAt(_selectedIndex),
        switchInCurve: Curves.easeInOut,
      ),
    );
  }
}

Widget _historyWidget() {
  return Container(
    key: const Key("history_widget"),
    width: 100,
    height: 60,
    color: Colors.green,
  );
}

Widget _userWidget() {
  return Container(
    key: const Key("user_widget"),
    width: 100,
    height: 60,
    color: Colors.red,
  );
}
