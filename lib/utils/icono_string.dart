import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final _icons = <String, IconData>{
  'leaf': FontAwesomeIcons.leaf,
  'music': FontAwesomeIcons.music,
  'book': FontAwesomeIcons.book,
  'eye': FontAwesomeIcons.eye,
  'calculator': FontAwesomeIcons.calculator,
  'link': FontAwesomeIcons.link,
  'heart': FontAwesomeIcons.heart,
  'child': FontAwesomeIcons.child,
};

FaIcon getIcon(String nombreIcon) => FaIcon(
      _icons[nombreIcon],
      color: Colors.blue,
      size: 50.0,
    );
