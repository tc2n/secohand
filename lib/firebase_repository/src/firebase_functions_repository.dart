import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:secohand/firebase_repository/firebase_repository.dart';
import 'entities/entities.dart';

class FirebasePhoneRepository implements PhonesRepository {
  final phonesCollection = FirebaseFirestore.instance.collection('phones');

  @override
  Future<void> addNewPhone(PhoneInfo data) {
    return phonesCollection.add(data.toEntity().toDocument());
  }

  @override
  Stream<List<PhoneInfo>> approvedPhones(String id) {
    return phonesCollection.snapshots().map((snapshot) {
      return snapshot.docs
          .where((element) => element.data()['approved'] == true)
          .map((doc) => PhoneInfo.fromEntity(PhoneEntity.fromSnapshot(doc)))
          .toList();
    });
  }
}
