import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_networking/networking/api/response/base/base_response.dart';
import 'package:flutter_networking/networking/bloc/notification_bloc.dart';
import 'package:flutter_networking/networking/model/notification_model.dart';

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

  @override
  void initState() {
    super.initState();
    _bloc = NotificationBloc();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        child: StreamBuilder<APIResponse<List<Notifications>>> (
          stream: _bloc.notificationListStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              switch (snapshot.data.status) {
                case APIStatus.LOADING:
                  print("LOADING...");
                  break;
                case APIStatus.COMPLETED:
                  return NotificationList(listNotifications: snapshot.data.data);
                  break;
                case APIStatus.ERROR:
                  print("FETCH API ERROR...");
                  _bloc.fetchNotification();
                  break;
              }
            }
            return Container();
          },
        ),
        onRefresh: () => _bloc.fetchNotification()
    );
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}

class NotificationList extends StatelessWidget {
  final List<Notifications> listNotifications;

  const NotificationList({Key key, this.listNotifications}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
        body: SingleChildScrollView(
          padding: EdgeInsets.all(8.0),
          scrollDirection: Axis.vertical,
          child: Column (
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _buildCells(context, listNotifications),
          )
        ),
    );
  }

  List<Widget> _buildCells(BuildContext context, List<Notifications> data) {
    return List.generate(data.length, (index) =>
        Container(
          padding: const EdgeInsets.all(12.0),
          margin: EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 12),
          color: Colors.white,
          child: Column(
            children: [
              ListTile(
                title: Text(
                  '${data[index].name}',
                  style: TextStyle(
                      color: Colors.black
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 0, top: 5, right: 0, bottom: 5),
                  child: Text(
                    '${data[index].description}',
                    style: TextStyle(
                        color: Colors.black54
                    ),
                  ),
              )
            ],
          )
        )
    );
  }
}