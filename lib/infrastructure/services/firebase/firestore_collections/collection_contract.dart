import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/instance_manager.dart';
import 'package:photoshare/domain/contracts/entity_contract.dart';

import '../cloud_firestore.dart';

abstract class CollectionContract<T extends EntityContract> {
  CollectionContract() {
    _collectionRef = firestoreService
        .collectionReference(
          collectionPath,
        )
        .withConverter(
          fromFirestore: fromFirestoreConverter,
          toFirestore: toFirestoreConverter,
        );
  }

  @protected
  late CollectionReference<T> _collectionRef;

  @protected
  CollectionReference<T> get collectionRef => _collectionRef;

  @protected
  String get collectionPath;

  @protected
  CloudFirestoreService get firestoreService => Get.find();

  @protected
  T fromFirestoreConverter(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  );

  @protected
  Map<String, Object?> toFirestoreConverter(
    T value,
    SetOptions? options,
  );

  @protected
  Map<String, Object?> convertDateFields(Map<String, Object?> json) {
    return json.map<String, Object?>((key, value) {
      late Object? newValue;
      if (value is Timestamp) {
        newValue = value.toDate();
      } else {
        newValue = value;
      }
      return MapEntry<String, Object?>(key, newValue);
    });
  }

  Future<void> create(T data) async {
    await collectionRef.add(data);
  }

  Future<T?> read(String uid) async {
    final doc = await collectionRef.doc(uid).get();
    return doc.data();
  }

  Future<void> update(T data) async {
    await collectionRef.doc(data.docId).set(data);
  }

  Future<void> delete(T data) async {
    await collectionRef.doc(data.docId).delete();
  }
}
