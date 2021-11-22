import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hamtarot_app/model/qcard_model.dart';

abstract class Services {
  Future<List<Qcard>> getQcard();

  // Future<void> addQcard(String _name, String _question, int newqcard.id, Timestamp timestamp);

}

class QcardServices extends Services {
  @override
  Future<List<Qcard>> getQcard () async {
    QuerySnapshot snapshot =
      await FirebaseFirestore
      .instance
      .collection('ham_qcard')
      .get();

    AllQcard qcard = AllQcard.fromSnapshot(snapshot);
    return qcard.qcard;
  }

  // @override
  // Future<void> addQcard(String _name, String _question, int newqcard, Timestamp timestamp) async {
  //   CollectionReference addQcard =
  //       FirebaseFirestore.instance.collection('ham_qcardhistory');
  //         addQcard.add({
  //         'name': _name,
  //         'question': _question,
  //         'qcardid': newqcard,
  //         'timestamp': timestamp,
  //         });
  //   return;
  // }
}