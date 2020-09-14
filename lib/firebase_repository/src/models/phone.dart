import 'package:meta/meta.dart';
import '../entities/entities.dart';

@immutable
class PhoneInfo {
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
  final bool charger;
  final String screen;
  final String image;
  final bool approved;
  final int price;

  PhoneInfo(
      {String id,
      this.name,
      this.number,
      this.village,
      this.company,
      this.model,
      this.old,
      this.ram,
      this.memory,
      this.battery,
      this.charger,
      this.screen,
      this.image,
      this.approved=false,
      this.price}) : this.id = id;

  PhoneInfo copyWith(
      {String id,
  String name,
  String number,
  String village,
  String company,
  String model,
  int old,
  int ram,
  int memory,
  int battery,
  bool charger,
  String screen,
  String image,
  bool approved,
  int price,}) {
    return PhoneInfo(
        id: id ?? this.id,
        name:  name ?? this.name,
        number: number ?? this.number,
        village: village ?? this.village,
        company: company ?? this.company,
        model: model ?? this.model,
        old: old ?? this.old,
        ram: ram ?? this.ram,
        memory: memory ?? this.memory,
        battery: battery ?? this.battery,
        charger: charger ?? this.charger,
        screen: screen ?? this.screen,
        approved: approved ?? this.approved,
        price: price ?? this.price
         );
  }

  @override
  String toString() {
    return "Order($id, $name, $company, $model, $old)";
  }

  PhoneEntity toEntity() {
    return PhoneEntity(id, name, number, village, company, model, old, ram , memory , battery, charger, screen,image, approved, price);
  }

  static PhoneInfo fromEntity(PhoneEntity entity) {
    return PhoneInfo(
        id: entity.id,
        name : entity.name,
        number: entity.number,
        village: entity.village,
        company: entity.company,
        model: entity.model,
        old: entity.old,
        ram: entity.ram,
        memory: entity.memory,
        battery: entity.battery,
        charger: entity.charger,
        screen: entity.screen,
        image: entity.image,
        approved: entity.approved,
        price: entity.price,
        );
  }
}
