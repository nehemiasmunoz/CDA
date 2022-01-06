import 'package:centro_actividades/models/activities/evidence_query.dart';
import 'package:centro_actividades/models/activity_model.dart';
import 'package:centro_actividades/screen/activities/components/activity_content.dart';
import 'package:centro_actividades/screen/activities/components/button_resource.dart';
import 'package:centro_actividades/screen/activities/components/evidence_type.dart';
import 'package:centro_actividades/screen/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BasicActivity extends StatelessWidget {
  const BasicActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final ActivityModel dataActivity =
        ModalRoute.of(context)!.settings.arguments as ActivityModel;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: SafeArea(
        child: Card(
          elevation: 2.0,
          margin: EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              width: size.width * 1,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 13.0),
                    child: Text(
                      dataActivity.title.toUpperCase(),
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        leadingDistribution:
                            TextLeadingDistribution.proportional,
                      ),
                    ),
                  ),
                  EvidenceTypeBar(
                    evidenceList: dataActivity.evidencetype,
                  ),
                  FadeInImage(
                    height: 150.0,
                    width: size.width * 9,
                    fit: BoxFit.cover,
                    placeholder: AssetImage('assets/loading.gif'),
                    image: AssetImage(dataActivity.imagepath),
                  ),
                  ActivityContent(data: dataActivity),
                  if (Provider.of<EvidenceQuery>(context).evidence != 'AU')
                    ButtonResource(),
                  OutlinedButton.icon(
                    // permitira agregar la actividad actual a una lista de actividades pendientes
                    onPressed: () {},
                    icon: Icon(Icons.add),
                    label: Text('Agregar a la lista'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      endDrawer: DrawerActivities(),
    );
  }
}
