import 'dart:ui';

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
    activities.filterActivities(activityQuery.course, activityQuery.learning);

    //Animacion de items
    var _listItems = <Widget>[];
    final GlobalKey<AnimatedListState> _listKey = GlobalKey();

    var future = Future(() {});

    for (var i = 0; i < activities.newActivities.length; i++) {
      future = future.then((_) {
        return Future.delayed(Duration(milliseconds: 100), () {
          _listItems.add(
              _buildCard(size: size, index: i, data: activities.newActivities));
          _listKey.currentState!.insertItem(i);
        });
      });
    }

    if (activities.isLoading) return LoadingScreen();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Actividades',
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: activities.newActivities.length < 1
          ? Center(
              child: Text('Aun no hay actividades Asignadas'),
            )
          : AnimatedList(
              key: _listKey,
              initialItemCount: _listItems.length,
              itemBuilder: (_, index, animation) {
                return SlideTransition(
                  position: CurvedAnimation(
                    curve: Curves.easeOut,
                    parent: animation,
                  ).drive((Tween<Offset>(
                    begin: Offset(1, 0),
                    end: Offset(0, 0),
                  ))),
                  child: _listItems[index],
                );
              }),

      // ListView.builder(
      //     itemCount: activities.newActivities.length,
      //     itemBuilder: (BuildContext context, index) {
      //       return _buildCard(
      //         size: size,
      //         index: index,
      //         data: activities.newActivities,
      //       );
      //     },
      //   ),
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
            image: DecorationImage(
                image: AssetImage(data[index].imagepath), fit: BoxFit.fill),
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
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
        // Container(
        //   padding: EdgeInsets.all(5.0),
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(5.0),
        //     color: Colors.blue[900],
        //   ),
        //   child: Text(
        //     data[index].code,
        //     style: TextStyle(color: Colors.white),
        //   ),
        // ),
        Container(
          padding: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.blue[900],
          ),
          child: Text(
            data[index].content[0].concept,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.blue[900],
          ),
          child: Text(
            data[index].title,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
