import 'package:centro_actividades/models/models.dart';
import 'package:centro_actividades/screen/screens.dart';
import 'package:centro_actividades/screen/widgets/widgets.dart';
import 'package:centro_actividades/services/services.dart';
import 'package:centro_actividades/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ActivitiesScreen extends StatelessWidget {
  ActivitiesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final activities =
        Provider.of<ActivityQuery>(context).callActivityServices(context);
    final activityQuery = Provider.of<ActivityQuery>(context);

    List<ActivityModel> newActivities = activities.filterActivities(
        activityQuery.course, activityQuery.learning);

    print(newActivities);
    if (activities.isLoading) return LoadingScreen();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Actividades',
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ),
      body: activities.newActivities.length < 1
          ? Center(
              child: Text('Aun no hay actividades Asignadas'),
            )
          : ListView.builder(
              itemCount: activities.newActivities.length,
              itemBuilder: (BuildContext context, index) {
                return _buildCard(
                  size: size,
                  index: index,
                  data: activities.newActivities,
                );
              },
            ),
      endDrawer: DrawerActivities(),
    );
  }
}

class _buildCard extends StatelessWidget {
  const _buildCard({
    Key? key,
    required this.size,
    required this.index,
    required this.data,
  }) : super(key: key);

  final Size size;
  final int index;
  final List<ActivityModel> data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'basicActivity', arguments: data[index]);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            gradient: LinearGradient(
              colors: [kPrimaryColor, kPrimaryLightColor],
            ),
          ),
          padding: EdgeInsets.all(10.0),
          width: size.width * 1,
          height: size.height * 0.2,
          child: _buildContent(data: data, index: index),
        ),
      ),
    );
  }
}

class _buildContent extends StatelessWidget {
  const _buildContent({Key? key, required this.data, required this.index})
      : super(key: key);
  final int index;
  final List<ActivityModel> data;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          data[index].type,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          data[index].instructions,
          style: TextStyle(
            fontSize: 13.0,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
