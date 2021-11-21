import 'package:cloud_firestore/cloud_firestore.dart';

class CloudFirestoreService {
  const CloudFirestoreService();

  FirebaseFirestore get _instance => FirebaseFirestore.instance;

  String docPathBuilder(List<String> pathStack) {
    final buffer = StringBuffer();
    buffer.writeAll(pathStack, '/');
    return buffer.toString();
  }

  CollectionReference<Map<String, dynamic>> collectionReference(String path) {
    return _instance.collection(path);
  }

  Future<DocumentReference<Map<String, dynamic>>> createDocOnCollection(
    String collectionPath,
    Map<String, dynamic> data,
  ) async {
    return await collectionReference(collectionPath).add(data);
  }

  Future<void> updateDoc(String docPath, Map<String, dynamic> data) async {
    await _instance.doc(docPath).set(data);
  }
}
