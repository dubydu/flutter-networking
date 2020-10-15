import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_networking/networking/repository/notification_repository.dart';
import 'package:flutter_networking/networking/model/notification_model.dart';
import 'package:flutter_networking/networking/api/response/notification_response.dart';
import 'package:flutter_networking/view_controllers/red_vc/red_vc.dart';

class NotificationBloc {
  NotificationRepository _notificationRepository;
  StreamController _notificationController;

  StreamSink<List<Notifications>> get notificationListSink => _notificationController.sink;
  Stream<List<Notifications>> get notificationListStream => _notificationController.stream;

  NotificationBloc() {
    _notificationController = StreamController<List<Notifications>>();
    _notificationRepository = NotificationRepository();
    fetchNotification();
  }

  fetchNotification() async {
    try {
      List<Notifications> notifications = await _notificationRepository.fetchNotification();
      print('Data: ~~~~~ $notifications');
      notificationListSink.add(notifications);
    } catch (error) {
      print('ERROR: $error');
    }
  }

  dispose() {
    _notificationController.close();
  }
}