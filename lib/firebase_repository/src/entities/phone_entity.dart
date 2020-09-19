import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';

//* This will be used to interact with Firebase, convert to/from Firebase form.
class PhoneEntity {
  final String id;
  final String name;
  final String number;
  final String village;
  final String company;
  final String model;
  final int old;
  final int ram;
  final int memory;
  final int battery;
  final int warranty;
  final bool charger;
  final String screen;
  final String image;
  final bool approved;
  final int price;

  PhoneEntity(
      this.id,
      this.name,
      this.number,
      this.village,
      this.company,
      this.model,
      this.old,
      this.ram,
      this.memory,
      this.battery,
      this.warranty,
      this.charger,
      this.screen,
      this.image,
      this.approved,
      this.price);

  Map<String, Object> toJson() {
    return {
      "id": id,
      "name": name,
      "number": number,
      "village": village,
      "company": company,
      "model": model,
      "old": old,
      "ram": ram,
      "memory": memory,
      "battery": battery,
      "warranty": warranty,
      "charger": charger,
      "screen": screen,
      "image": image,
      "approved": approved,
      "price": price
    };
  }

  @override
  String toString() {
    return "PhoneEntity($name, $company, $model, $old)";
  }

  static PhoneEntity fromJson(Map<String, Object> json) {
    return PhoneEntity(
      json["id"] as String,
      json["name"] as String,
      json["number"] as String,
      json["village"] as String,
      json["company"] as String,
      json["model"] as String,
      json["old"] as int,
      json["ram"] as int,
      json["memory"] as int,
      json["battery"] as int,
      json["warranty"] as int,
      json["charger"] as bool,
      json["screen"] as String,
      json["image"] as String,
      json["approved"] as bool,
      json["price"] as int,
    );
  }

  static PhoneEntity fromSnapshot(DocumentSnapshot snap) {
    return PhoneEntity(
        snap.id,
        snap.data()['name'],
        snap.data()['number'],
        snap.data()['village'],
        snap.data()['company'],
        snap.data()['model'],
        snap.data()['old'],
        snap.data()['ram'],
        snap.data()['memory'],
        snap.data()['battery'],
        snap.data()['warranty'],
        snap.data()['charger'],
        snap.data()['screen'],
        snap.data()['image'],
        snap.data()['approved'],
        snap.data()['price']);
  }

  Map<String, Object> toDocument() {
    return {
      "name": name,
      "number": number,
      "village": village,
      "company": company,
      "model": model,
      "old": old,
      "ram": ram,
      "memory": memory,
      "battery": battery,
      "warranty": warranty,
      "charger": charger,
      "screen": screen,
      "image": image,
      "approved": approved,
      "price": price
    };
  }
}
