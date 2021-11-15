import 'package:flutter/cupertino.dart';
import 'package:roll_dice/main.dart';
import 'package:roll_dice/src/pages/home_page.dart';

Map<String, WidgetBuilder> getAppRoutes() {
  return {
    "/": (context) => const HomePage(),
    "rollDice": (context) => const RollDice(),
  };
}
