import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_demo/utils/classes/pair.dart';

class FirestoreService {
  //
  // collection refernce
  static final _db = FirebaseFirestore.instance;

  // set data and merge it with the current old data
  static Future setData(String path, dynamic data) async {
    //
    return await _db.doc(path).set(data, SetOptions(merge: true));
  }

  // update one or more fields
  static Future updateFields(String path, Map data) async {
    //
    return await _db.doc(path).update({...data});
  }

  // delete document
  static Future deleteDocument(String path) async {
    //
    return await _db.doc(path).delete();
  }

  // collection getter once
  static Future<Pair<List<T>, FirestoreSource>> getCollection<T>(
      String path, Function mapper) async {
    //
    var query = await _db.collection(path).get();

    return _getCastedCollection<T>(query, mapper);
  }

  // collection realtime listener
  static Stream<Pair<List<T>, FirestoreSource>> listenCollection<T>(
      String path, Function mapper) {
    //
    return _db
        .collection(path)
        .snapshots(includeMetadataChanges: true)
        .map((query) => _getCastedCollection<T>(query, mapper));
  }

  // get document once
  static Future<Pair<T, FirestoreSource>> getDocument<T>(
      String path, Function mapper) async {
    //
    var doc = await _db.doc(path).get();

    return _getCastedDocument<T>(doc, mapper);
  }

  // document real time listener
  static Stream<Pair<T, FirestoreSource>> listenDocument<T>(
      String path, Function mapper) {
    //
    return _db
        .doc(path)
        .snapshots(includeMetadataChanges: true)
        .map((doc) => _getCastedDocument<T>(doc, mapper));
  }

  // cast document snapshot to actual typed object or returrn missing
  static Pair<T, FirestoreSource> _getCastedDocument<T>(
      DocumentSnapshot doc, Function mapper) {
    //
    if (!doc.exists) {
      return Pair(first: null, second: FirestoreSource.MISSING);
    }

    if (!doc.metadata.isFromCache) {
      return Pair(
          first: mapper(doc.data()) as T, second: FirestoreSource.NETWORK);
    }

    return Pair(first: mapper(doc.data()) as T, second: FirestoreSource.CACHE);
  }

  // cast query snapshot to actual typed list or returrn missing
  static Pair<List<T>, FirestoreSource> _getCastedCollection<T>(
      QuerySnapshot query, Function mapper) {
    //
    if (query.size <= 0) {
      return Pair(first: [], second: FirestoreSource.MISSING);
    }

    if (!query.metadata.isFromCache) {
      return Pair(
          first: _castList<T>(query, mapper), second: FirestoreSource.NETWORK);
    }

    return Pair(
        first: _castList<T>(query, mapper), second: FirestoreSource.CACHE);
  }

  // helper function to return a typed list from query
  static List<T> _castList<T>(QuerySnapshot query, Function mapper) {
    return query.docs.map((doc) => mapper(doc.data()) as T).toList();
  }
}

enum FirestoreSource { CACHE, NETWORK, MISSING }
