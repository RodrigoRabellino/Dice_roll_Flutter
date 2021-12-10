import 'package:flutter/material.dart';

class HistroyPage extends StatefulWidget {
  const HistroyPage({Key? key}) : super(key: key);

  @override
  _HistroyPageState createState() => _HistroyPageState();
}

class _HistroyPageState extends State<HistroyPage> {
  List historyList = [
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
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.clear_rounded),
        onPressed: () => setState(() {
          historyList = [];
        }),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => _itemBuilder(context, index),
        itemCount: historyList.length,
      ),
    );
  }

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
}
