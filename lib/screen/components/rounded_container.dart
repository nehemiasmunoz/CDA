import 'package:centro_actividades/utils/constant.dart';
import 'package:flutter/material.dart';

class RoundedContainer extends StatelessWidget {
  final Widget child;
  final Color? color;
  const RoundedContainer({
    Key? key,
    required this.child,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 8.0),
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: size.width * 0.9,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient:
              LinearGradient(colors: [kPrimaryColor, kPrimaryLightColor])),
      child: child,
    );
  }
}
