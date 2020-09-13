import 'dart:async';

import 'package:secohand/firebase_repository/firebase_repository.dart';
import 'package:secohand/firebase_repository/src/models/models.dart';

abstract class PhonesRepository {
  Future<void> addNewPhone(PhoneInfo data);

  // Future<void> deletePhone(PhoneInfo data);

  Stream<List<PhoneInfo>> approvedPhones(String id);

  // Future<void> updatePhone(PhoneInfo data);
}