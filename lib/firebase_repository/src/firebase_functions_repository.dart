import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:secohand/firebase_repository/firebase_repository.dart';
import 'entities/entities.dart';

int priceHelper(int price){
  if(price<1000){
    return 0;
  } else if(price<2000){
    return 12;
  } else if(price<5000){
    return 25;
  } else if(price<10000){
    return 510;
  } return 10;
}

class FirebasePhoneRepository implements PhonesRepository {
  final phonesCollection = FirebaseFirestore.instance.collection('phones');

  @override
  Future<void> addNewPhone(PhoneInfo data) {
    return phonesCollection.add(data.toEntity().toDocument());
  }

  @override
  Stream<List<PhoneInfo>> approvedPhones(
      List<String> companyName, List<int> priceRange, int oldFilter) {
        print('called with companies = $companyName and price $priceRange and months $oldFilter');
    return phonesCollection.snapshots().map((snapshot) {
      return snapshot.docs
          .where((element) =>
              element.data()['approved'] == true &&
              (companyName.length > 0
                  ? companyName.contains(element.data()['company'])
                  : true) &&
              (priceRange.length > 0
                  ? priceRange.contains(priceHelper(element.data()['price']))
                  : true) &&
              (oldFilter!=null
                  ? element.data()['old']<oldFilter
                  : true))
          .map((doc) => PhoneInfo.fromEntity(PhoneEntity.fromSnapshot(doc)))
          .toList();
    });
  }

  @override
  Future<String> uploadImage(path, data)  async {
    StorageReference ref = FirebaseStorage().ref().child(path);
    StorageUploadTask uploadTask = ref.putFile(data);

    var dowurl = await (await uploadTask.onComplete).ref.getDownloadURL();
    String url = dowurl.toString();

    return url;
}
}
