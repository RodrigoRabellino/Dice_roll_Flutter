import 'dart:ui';

import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final List _userDice = [
    {},
    {},
    {},
    {},
    {},
    {},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _createList(),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lime,
          onPressed: () => _addDie,
          child: const Icon(Icons.add)),
    );
  }

  Widget _createList() {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: ListView.builder(
          itemBuilder: (context, idex) => _itemBuilder(context, idex),
          itemCount: _userDice.length),
    );
  }

  void _addDie() => setState(() => _userDice.add({}));

  Widget _itemBuilder(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.only(right: 7.5),
      child: InkWell(
          onTap: () {},
          splashColor: Colors.lime,
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(50), bottomRight: Radius.circular(50)),
          child: _item()),
    );
  }

  Widget _item() {
    return Padding(
      padding: const EdgeInsets.only(right: 2.5, top: 2.5, bottom: 2.5),
      child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        decoration: _boxDecoration(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: const [],
              ),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.ac_unit))
          ],
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return const BoxDecoration(
        color: Colors.green,
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.topLeft,
            colors: [Colors.green, Colors.teal, Colors.green]),
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(50), bottomRight: Radius.circular(50)));
  }
}
