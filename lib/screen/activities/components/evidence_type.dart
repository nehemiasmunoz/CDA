import 'package:centro_actividades/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EvidenceTypeBar extends StatelessWidget {
  const EvidenceTypeBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Card(
      child: Container(
        width: size.width * 0.75,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {},
              icon: FaIcon(
                FontAwesomeIcons.microphone,
                color: kPrimaryColor,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: FaIcon(
                FontAwesomeIcons.fileAlt,
                color: kPrimaryColor,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: FaIcon(
                FontAwesomeIcons.video,
                color: kPrimaryColor,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: FaIcon(
                FontAwesomeIcons.robot,
                color: kPrimaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
