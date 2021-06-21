import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hhf_next_gen/app/models/patient.dart';

class SearchService {
  late List<Patient?> fireList = [];
  late List<Patient?> localList = [];
  late List<Patient?> returnList = [];
  Future<List<Patient?>> searchPatient(String query) async {
    print(query.length.toString());
    switch (query.length) {
      case 0:
        returnList = <Patient>[];
        return returnList;
        // ignore: dead_code
        break;
      case 1:
        // do server search
        fireList = await searchFirestorePatientByName(query);
        returnList=[];
        returnList = fireList;
        return returnList;
        break;

      case 2:
        return searchPatientBySubString(query);
        break;
      default:
        return searchPatientBySubString(query);
        break;
    }
    // return returnList;
  }

  static Future<List<Patient?>> searchFirestorePatientByName(
      String query) async {
    // read the query string [0] as Ascii
    int ascii = query.codeUnitAt(0);
    final results = await FirebaseFirestore.instance
        .collection('patients')
        .where('firstName', isGreaterThanOrEqualTo: query[0].toUpperCase())
        .where('firstName', isLessThan: String.fromCharCode(++ascii))
        .get();
    final List<Patient> retval =
        results.docs.map((e) => Patient.fromJson(e.data())).toList();
    return retval;
  }

  List<Patient?> searchPatientBySubString(String query) {
    String tempquery;
    tempquery = query.toLowerCase();
    tempquery = query.replaceRange(0, 1, query[0].toUpperCase());
    // this._query = _query;

    returnList=[];
    fireList.forEach((patient) {
      if (patient!.firstName.startsWith(tempquery)) {
        // isSearching = true;
        returnList.add(patient);
      }
    });

    return returnList;
  }
}
