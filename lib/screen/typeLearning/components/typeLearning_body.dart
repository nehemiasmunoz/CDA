import 'package:centro_actividades/models/models.dart';
import 'package:centro_actividades/services/services.dart';
import 'package:flutter/material.dart';
import 'package:centro_actividades/utils/icono_string.dart';
import 'package:provider/provider.dart';

class TypeLearningBody extends StatefulWidget {
  TypeLearningBody({Key? key, required this.learnings}) : super(key: key);

  final List<LearningStyleModel> learnings;

  @override
  State<TypeLearningBody> createState() => _TypeLearningBodyState();
}

class _TypeLearningBodyState extends State<TypeLearningBody> {
  //Animacion de items
  var _listItems = <Widget>[];
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();

  var future = Future(() {});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    for (var i = 0; i < widget.learnings.length; i++) {
      future = future.then((_) {
        return Future.delayed(Duration(milliseconds: 100), () {
          _listItems.add(_buildCard(size, i, widget.learnings[i]));
          _listKey.currentState!.insertItem(i);
        });
      });
    }
    return AnimatedList(
        key: _listKey,
        initialItemCount: _listItems.length,
        itemBuilder: (_, index, animation) {
          return GestureDetector(
            onTap: () {
              Provider.of<ActivityQuery>(context, listen: false)
                  .changeLearning(widget.learnings[index].code);
              Navigator.pushNamed(context, 'activities');
            },
            child: SlideTransition(
              position: CurvedAnimation(
                curve: Curves.easeOut,
                parent: animation,
              ).drive((Tween<Offset>(
                begin: Offset(1, 0),
                end: Offset(0, 0),
              ))),
              child: _listItems[index],
            ),
          );
        });
    // ListView.builder(
    //   itemCount: widget.learnings.length,
    //   itemBuilder: (BuildContext context, index) {
    //     return GestureDetector(
    //         onTap: () {
    //           Provider.of<ActivityQuery>(context, listen: false)
    //               .changeLearning(widget.learnings[index].code);
    //           Navigator.pushNamed(context, 'activities');
    //         },
    //         child: _buildCard(size, index, widget.learnings[index]));
    //   },
    // );
  }

  Container _buildCard(Size size, int index, LearningStyleModel learning) {
    return Container(
      constraints: BoxConstraints(minHeight: 100.0),
      height: size.height * 0.14,
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 2.5),
          ),
        ],
      ),
      child: Row(
        children: [
          getIcon(learning.icon),
          Spacer(),
          Container(
            width: 200.0,
            child: Text(
              learning.name,
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
