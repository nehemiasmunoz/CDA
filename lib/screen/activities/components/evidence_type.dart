import 'package:centro_actividades/models/models.dart';
import 'package:centro_actividades/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EvidenceTypeBar extends StatelessWidget {
  EvidenceTypeBar({Key? key, required this.evidenceList}) : super(key: key);

  List<Evidencetype> evidenceList;

  @override
  Widget build(BuildContext context) {
    bool audio = false;
    bool text = false;
    bool imagen = false;
    bool video = false;
    bool auto = false;

    evidenceList.forEach((element) {
      if (element.code == 'AU') auto = true;
      if (element.code == 'VI') video = true;
      if (element.code == 'IM') imagen = true;
      if (element.code == 'TE') text = true;
      if (element.code == 'AUD') audio = true;
    });
    return Card(
      child: Container(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (audio)
              IconButton(
                onPressed: () {},
                icon: FaIcon(
                  FontAwesomeIcons.microphone,
                  color: kPrimaryColor,
                ),
              ),
            if (text)
              IconButton(
                onPressed: () {},
                icon: FaIcon(
                  FontAwesomeIcons.fileAlt,
                  color: kPrimaryColor,
                ),
              ),
            if (video)
              IconButton(
                onPressed: () {},
                icon: FaIcon(
                  FontAwesomeIcons.video,
                  color: kPrimaryColor,
                ),
              ),
            if (imagen)
              IconButton(
                onPressed: () {},
                icon: FaIcon(
                  FontAwesomeIcons.image,
                  color: kPrimaryColor,
                ),
              ),
            if (auto)
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
