import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:logging/logging.dart';

abstract class BaseFirestoreApi {
  final FirebaseFirestore instance;
  final String path;
  final Logger logger;

  BaseFirestoreApi(
      {@required this.path, @required this.instance, Logger logger})
      : assert(path != null && path.isNotEmpty),
        assert(instance != null),
        logger = logger ?? Logger("BaseFirestoreApi");

  /// id ile birlikte
  @protected
  Future<Map<String, dynamic>> getData(String id) async {
    assert(id != null && id.isNotEmpty);

    final doc = await instance.collection(path).doc(id);

    final reference = await doc.get();
    final exists = reference.exists;

    if (!exists) {
      logger.shout("getData() : id firestoreda bulunamadı");
      return null;
    }

    final withID = reference.data()..update("id", (value) => reference.id);

    logger.info("getData() : $withID");
    return withID;
  }

  @protected
  Future<List<Map<String, dynamic>>> getsDatas(List<String> ids) async {
    assert(ids != null && ids.isNotEmpty);

    final dataList = <Map<String, dynamic>>[];

    await Future.forEach(ids, (id) async {
      final data = await getData(id);
      if (data != null) {
        dataList.add(data);
      }
    });

    if (dataList.isEmpty) {
      logger.shout(
          "getsDatas() dataList boş, büyük ihtimal firebaseden çekilemedi");
      return null;
    }
    logger.info("getsDatas() : $dataList");
    return dataList;
  }

  /// id ile birlikte ;)
  @protected
  Future<String> addData(Map<String, dynamic> data) async {
    assert(data != null);
    if (data == null) return null;

    final reference = await instance.collection(path).add(data);
    final id = reference.id;

    final snapshot = await reference.get();
    final exists = snapshot.exists;

    if (!exists) {
      logger.shout("addData() : data yaratılamamış gibi gözüküyor");
      return null;
    }

    final isUpdated = await updateData(id, data);

    if (isUpdated == null) {
      logger.shout("addData() : id güncellemesi yapılamadı");
    }

    logger.info("addData() : ${snapshot.data()}");
    return id;
  }

  @protected
  Future<bool> updateData(String id, Map<String, dynamic> newData) async {
    assert(id != null && id.isNotEmpty);
    assert(newData != null);

    if (id == null && newData == null) return null;

    final doc = await instance.collection(path).doc(id);

    final reference = await doc.get();
    final exists = reference.exists;
    newData["id"] = reference.id;

    if (!exists) {
      logger.shout("updateData() veri bulunamadı");
      return false;
    }

    await doc.set(newData);
    logger.info("updateData() : ${reference.data()}");
    return true;
  }

  @protected
  Future<bool> removeData(String id) async {
    assert(id != null && id.isNotEmpty);

    final doc = await instance.collection(path).doc(id);
    await doc.delete();

    final reference = await doc.get();
    final exists = reference.exists;

    if (exists) {
      logger.shout("removeData() silinmeye çalışan data hala firestoreda");
      return false;
    }

    logger.info("removedData() : ${reference.data()}");
    return true;
  }
}
