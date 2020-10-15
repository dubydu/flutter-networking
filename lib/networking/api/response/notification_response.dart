import 'dart:convert';
import 'package:flutter_networking/networking/api/response/base/base_response.dart';
import 'package:flutter_networking/networking/model/notification_model.dart';

class NotificationResponse {
  NotificationResponse({this.results});
  List<Notifications> results;

  NotificationResponse.fromJson(Map<String, dynamic> json) {
    results = new List<Notifications>();
    json['data'].forEach((v) {
      results.add(new Notifications.fromJson(v));
    });
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.results.map((v) => v.toJson()).toList();
    return data;
  }
}
