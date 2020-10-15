import 'dart:convert';
import 'package:flutter_networking/networking/model/notification_model.dart';

class NotificationResponse {
  NotificationResponse({this.results});
  List<Notifications> results;

  NotificationResponse.fromJson(Map<String, dynamic> json) {
    results = new List<Notifications>();
    json['results'].forEach((v) {
      results.add(new Notifications.fromJson(v));
    });
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['results'] = this.results.map((v) => v.toJson()).toList();
    return data;
  }
}
