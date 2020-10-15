import 'dart:convert';

class Notifications {
  Notifications({
    this.id,
    this.releaseDatetime,
    this.title,
    this.body,
  });

  final int id;
  final String releaseDatetime;
  final String title;
  final String body;

  factory Notifications.fromRawJson(String str) => Notifications.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Notifications.fromJson(Map<String, dynamic> json) => Notifications(
    id: json["id"],
    releaseDatetime: json["release_datetime"],
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "release_datetime": releaseDatetime,
    "title": title,
    "body": body,
  };
}
