import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_networking/custom_view/circular_indicator.dart';
import 'package:flutter_networking/networking/api/response/base/base_response.dart';
import 'package:flutter_networking/networking/bloc/notification_bloc.dart';
import 'package:flutter_networking/networking/model/notification_model.dart';
import 'package:flutter_networking/router.dart';
import 'package:flutter_networking/view_controllers/red_vc/red_detail_vc/red_detail_vc.dart';

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
  NotificationList _notificationList;

  void _push(BuildContext context, {Notifications notifications}) {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RedDetailViewController(notifications: notifications))
    );
  }

  @override
  void initState() {
    super.initState();
    _bloc = NotificationBloc();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<APIResponse<List<Notifications>>>(
      stream: _bloc.notificationListStream,
      builder: (contexts, snapshot) {
        if (snapshot.hasData) {
          switch (snapshot.data.status) {
            case APIStatus.LOADING:
              print("LOADING...");
              return CircularIndicator();
              break;
            case APIStatus.COMPLETED:
              return NotificationList(
                listNotifications: snapshot.data.data,
                onPush: (notification) =>
                    _push(context, notifications: notification),
              );
              break;
            case APIStatus.ERROR:
              print("FETCH API ERROR...");
              _bloc.fetchNotification();
              break;
          }
        }
        return Container();
      },
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
  final ValueChanged<Notifications> onPush;
  const NotificationList({Key key, this.listNotifications, this.onPush}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                contentPadding: EdgeInsets.only(left: 8, top: 0, right: 8, bottom: 0),
                title: Text(
                  '${data[index].name}',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 8, top: 0, right: 8, bottom: 0),
                  child: Text(
                    '${data[index].description}',
                    style: TextStyle(
                        color: Colors.black54
                    ),
                    maxLines: 2,
                  ),
              ),
              ButtonBar(
                alignment: MainAxisAlignment.start,
                children: [
                  FlatButton(
                    textColor: const Color(0xFF6200EE),
                    onPressed: () {
                      onPush(data[index]);
                    },
                    child: const Text('READ ARTICLE'),
                  ),
                ],
              ),
            ],
          )
        )
    );
  }
}