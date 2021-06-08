import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hhf_next_gen/app/models/patient.dart';

class SearchService {
  static Future<List<Patient?>> searchFirestorePatientByName(
      String query) async {
    // read the query string [0] as Ascii
    int ascii = query.codeUnitAt(0);
    final results = await FirebaseFirestore.instance
        .collection('patients')
        .where('firstName', isGreaterThanOrEqualTo: query[0])
        .where('firstName', isLessThan: String.fromCharCode(++ascii))
        .get();
    final List<Patient> retval =
        results.docs.map((e) => Patient.fromJson(e.data())).toList();
    return retval;
  }
}
