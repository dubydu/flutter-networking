import 'dart:async';
import 'package:flutter_networking/networking/api/response/base/base_response.dart';
import 'package:flutter_networking/networking/repository/notification_repository.dart';
import 'package:flutter_networking/networking/model/notification_model.dart';

class NotificationBloc {
  NotificationRepository _notificationRepository;
  StreamController _notificationController;

  StreamSink<APIResponse<List<Notifications>>> get notificationListSink => _notificationController.sink;
  Stream<APIResponse<List<Notifications>>> get notificationListStream => _notificationController.stream;

  NotificationBloc() {
    _notificationController = StreamController<APIResponse<List<Notifications>>>();
    _notificationRepository = NotificationRepository();
    fetchNotification();
  }

  fetchNotification() async {
    notificationListSink.add(APIResponse.loading('Fetching Notifications List Success'));
    try {
      List<Notifications> notifications = await _notificationRepository.fetchNotification();
      notificationListSink.add(APIResponse.completed(notifications));
    } catch (error) {
      notificationListSink.add(APIResponse.error('Fetching Notifications List Error'));
      print('ERROR: $error');
    }
  }

  dispose() {
    _notificationController.close();
  }
}