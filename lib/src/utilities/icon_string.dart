import 'package:flutter/material.dart';

final _icons = <String, IconData>{
  "icon_d4": Icons.widgets_rounded,
  "icon_d6": Icons.widgets_rounded,
  "icon_d8": Icons.widgets_rounded,
  "icon_d10": Icons.widgets_rounded,
  "icon_d12": Icons.widgets_rounded,
  "icon_d20": Icons.widgets_rounded,
  "icon_d100": Icons.widgets_rounded,
  "icon_fate": Icons.widgets_rounded,
};

//final _colors =<String, Color>{};

Icon getIcon(String iconName) => Icon(
      _icons[iconName],
      color: Colors.indigo,
    );
