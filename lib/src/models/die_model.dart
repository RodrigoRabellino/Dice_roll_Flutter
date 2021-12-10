import 'package:flutter/material.dart';

class Die {
  String name, icon;
  int value;
  Die({required this.name, required this.icon, required this.value});
}

List<Die> diceList = [
  Die(name: "D4", value: 4, icon: "icon"),
  Die(name: "D6", value: 6, icon: "icon"),
  Die(name: "D8", value: 8, icon: "icon"),
  Die(name: "D10", value: 10, icon: "icon"),
  Die(name: "D12", value: 12, icon: "icon"),
  Die(name: "D20", value: 20, icon: "icon"),
  Die(name: "D100", value: 100, icon: "icon"),
  Die(name: "Fate", value: 6, icon: "icon"),
];
