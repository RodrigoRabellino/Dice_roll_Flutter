import 'dart:math';

import 'package:flutter/material.dart';
import 'package:roll_dice/src/classes/die_class.dart';

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> with ChangeNotifier {
  final _diceList = [
    {"dieName": "D4", "value": 4, "icon": "icon"},
    {"dieName": "D6", "value": 6, "icon": "icon"},
    {"dieName": "D8", "value": 8, "icon": "icon"},
    {"dieName": "D10", "value": 10, "icon": "icon"},
    {"dieName": "D12", "value": 12, "icon": "icon"},
    {"dieName": "D20", "value": 20, "icon": "icon"},
    {"dieName": "D100", "value": 100, "icon": "icon"},
    {"dieName": "FATE", "value": 6, "icon": "icon"},
  ];
  var _rollResult = {"dieName": "", "result": 0, "value": 0, "multi": 1};
  var _multi = 1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragDown: (DragDownDetails details) => _verticalDrag(details),
      child: InkWell(
        onLongPress: _clearAll,
        splashColor: Colors.red[200],
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            _setResults(),
            _diceGridView(),
            _setMultiWidget(),
          ],
        ),
      ),
    );
  }

  Widget _setMultiWidget() {
    return Expanded(
        flex: 1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                splashColor: Colors.redAccent[400],
                onPressed: () => setState(() => _multi = 1),
                icon: const Icon(Icons.clear)),
            IconButton(
                splashColor: Colors.amber[600],
                onPressed: () => _multi > 1 ? setState(() => _multi--) : _multi,
                icon: const Icon(Icons.remove)),
            SizedBox(
              height: 80,
              width: 80,
              child: Card(
                child: Text(
                  "$_multi",
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 60),
                ),
              ),
            ),
            IconButton(
                splashColor: Colors.lightBlue[400],
                onPressed: () =>
                    _multi < 20 ? setState(() => _multi++) : _multi,
                icon: const Icon(Icons.add)),
            IconButton(
                splashColor: Colors.limeAccent[400],
                onPressed: () =>
                    _multi < 15 ? setState(() => _multi = _multi + 5) : _multi,
                icon: const Text("+5")),
          ],
        ));
  }

  Widget _diceGridView() {
    return Expanded(
        flex: 2,
        child: Padding(
          padding: const EdgeInsets.only(top: 3.0, right: 5, left: 5),
          child: GridView.count(crossAxisCount: 4, children: _setDiceList()),
        ));
  }

  void _verticalDrag(details) {
    // if (_rollResult["dieName"] != "") {
    //   print("$_rollResult in antes");
    //   _rollDie(_rollResult);
    //   print("$_rollResult in despois");
    // }
    print(details);
  }

  List<Widget> _setDiceList() {
    List<Widget> list = [];

    for (var die in _diceList) {
      list.add(InkWell(
        splashColor: Colors.deepPurple[400],
        onTap: () => _rollDie(die),
        onLongPress: () => _iconLongPress(die),
        child: Card(
          child: Column(
            children: [
              const IconButton(
                iconSize: 45,
                onPressed: null, //() => _rollDie(die),
                disabledColor: Colors.white,
                icon: Icon(Icons.add_box_outlined),
              ),
              Text(
                die["dieName"].toString(),
                style: const TextStyle(fontSize: 15),
              ),
            ],
          ),
        ),
      ));
    }
    return list;
  }

  void _iconLongPress(die) => setState(() {
        _multi = 2;
        _rollDie(die);
      });

  void _clearAll() => setState(() {
        _rollResult = {"dieName": "", "result": 0, "value": 0, "multi": 1};
        _multi = 1;
      });

  Widget _setResults() {
    return Expanded(
        flex: 1,
        child: (_rollResult["dieName"] == "")
            ? const Text("come on, roll some dice!!",
                style: TextStyle(fontSize: 30))
            : Column(
                children: [
                  Text(
                    "Roll ${_rollResult["multi"].toString()} ${_rollResult["dieName"].toString()}:",
                    style: const TextStyle(fontSize: 35),
                  ),
                  Text(
                    _rollResult["result"].toString(),
                    style: const TextStyle(fontSize: 35),
                  ),
                ],
              ));
  }

  void _rollDie(die) {
    final rng = Random();
    final result = (rng.nextInt(die["value"]) + 1) * _multi;
    setState(() {
      _rollResult = {
        "dieName": die["dieName"],
        "result": result,
        "value": die["value"],
        "multi": _multi
      };
    });
    notifyListeners();
  }
}
