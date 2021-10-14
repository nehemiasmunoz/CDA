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
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: color != null ? color : kPrimaryLightColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: child,
    );
  }
}
