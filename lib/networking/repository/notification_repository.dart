import 'package:flutter_networking/networking/api/response/base/base_response.dart';
import 'package:flutter_networking/networking/networking_manager.dart';
import 'package:flutter_networking/networking/model/notification_model.dart';
import 'package:flutter_networking/networking/api/response/notification_response.dart';

class NotificationRepository {
  final String path = 'news';

  NetworkingManager _networkingManager = NetworkingManager();

  Future<List<Notifications>> fetchNotification() async {
    final response = await _networkingManager.get("$path");
    return NotificationResponse.fromJson(response).results;
  }
}