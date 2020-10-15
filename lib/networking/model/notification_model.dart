import 'dart:convert';

class Notifications {
  Notifications({
    this.id,
    this.name,
    this.description,
    this.image,
    this.price,
    this.discountAmount,
    this.status,
    this.categories,
  });

  final int id;
  final String name;
  final String description;
  final String image;
  final String price;
  final String discountAmount;
  final bool status;
  final List<Category> categories;

  factory Notifications.fromRawJson(String str) => Notifications.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Notifications.fromJson(Map<String, dynamic> json) => Notifications(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    image: json["image"],
    price: json["price"],
    discountAmount: json["discount_amount"],
    status: json["status"],
    categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "image": image,
    "price": price,
    "discount_amount": discountAmount,
    "status": status,
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
  };
}

class Category {
  Category({
    this.id,
    this.name,
  });

  final int id;
  final String name;

  factory Category.fromRawJson(String str) => Category.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}