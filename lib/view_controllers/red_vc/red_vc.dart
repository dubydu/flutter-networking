import 'package:flutter/material.dart';
import 'package:flutter_networking/networking/bloc/notification_bloc.dart';

class RedReviewController extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Red',
          ),
          backgroundColor: Colors.red,
        ),
      body: RedReviewList(),
    );
  }
}

class RedReviewList extends StatefulWidget {
  @override
  _RedReviewList createState() => _RedReviewList();
}

class _RedReviewList extends State<RedReviewList> {
  NotificationBloc _bloc;
  List<String> _listMyObject;

  void _setupData() {
    _listMyObject = [];
    for(var i = 0; i < 15; i++) {
      _listMyObject.add('Oeschinen Lake Campground ${i + 1}');
    }
  }

  @override
  void initState() {
    super.initState();
    _bloc = NotificationBloc();
    _bloc.fetchNotification();
  }

  @override
  Widget build(BuildContext context) {
    _setupData();
    return Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.all(8.0),
          scrollDirection: Axis.vertical,
          child: Column (
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _buildCells(context, _listMyObject),
          ),
        )
    );
  }

  List<Widget> _buildCells(BuildContext context, List<String> data) {
    return List.generate(data.length, (index) =>
        Container(
          height: 45,
          color: index % 2 == 0 ? Colors.deepPurple : Colors.amberAccent,
        )
    );
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}