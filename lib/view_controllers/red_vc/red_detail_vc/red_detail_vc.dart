import 'package:flutter/material.dart';
import 'package:flutter_networking/networking/model/notification_model.dart';

class RedDetailViewController extends StatelessWidget {
  RedDetailViewController({this.notifications});
  final Notifications notifications;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          '${notifications.name}',
        ),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView (
        padding: EdgeInsets.all(8),
        scrollDirection: Axis.vertical,
        child: Column (
          children: [
            ListTile(
              title: Text('${notifications.description}'),
            )
          ],
        ),
      ),
    );
  }
}