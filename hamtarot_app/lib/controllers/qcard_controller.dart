import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hamtarot_app/model/qcard_model.dart';
import 'package:hamtarot_app/services/qcard_services.dart';

class QcardController {
  final Services service;
  List<Qcard> qcard = List.empty();

  StreamController<bool> onSyncController = StreamController();
  Stream<bool> get onSync => onSyncController.stream;

  QcardController(this.service);

  Future<List<Qcard>> fectQcard() async {
    onSyncController.add(true);
    qcard = await service.getQcard();
    onSyncController.add(false);
    return qcard;
    
  } 

  // Future<void> addQcard(String name, String question, int qcardid, Timestamp timestamp) async {
  //   await service.addQcard(name, question, qcardid, timestamp);
  // }
}
