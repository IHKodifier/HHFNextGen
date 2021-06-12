import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hhf_next_gen/app/console_utility.dart';
import 'package:hhf_next_gen/app/models/patient.dart';
import 'package:hhf_next_gen/app/services/search_service.dart';
import 'package:hhf_next_gen/ui/views/new_case/new_case_dialog.dart';

class NewFinancingCase extends StatefulWidget {
  const NewFinancingCase({Key? key}) : super(key: key);

  @override
  _NewFinancingCaseState createState() => _NewFinancingCaseState();
}

class _NewFinancingCaseState extends State<NewFinancingCase> {
  List<Patient?> serverResults = List.generate(0, (index) => null);
  List<Patient?> localResults = List.generate(0, (index) => null);
  List<Patient?> displayResults = List.generate(0, (index) => null);
  late OverlayState overlayState;
  late OverlayEntry overlayEntry;
  bool isSearching = false;
  String _query = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ' New Case...',
          style: Theme.of(context).textTheme.headline6,
        ),
        centerTitle: true,
        iconTheme: Theme.of(context)
            .iconTheme
            .copyWith(color: Theme.of(context).primaryColor),
      ),
      body: Container(
        height: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Form(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    onChanged: initiatePatientSearchByName,
                    decoration: InputDecoration(
                      prefix: Icon(Icons.search),
                      hintText: 'search by name',
                      contentPadding: EdgeInsets.only(left: 25),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // OutlinedButton.icon(onPressed: (){}, icon: Icon(Icons.add), label: Text('Create new Patient ')),
                  Tooltip(
                    message: 'create New Patient',
                    child: FloatingActionButton(
                      onPressed: newPatientDoalogue,
                      backgroundColor: Colors.white,
                      elevation: 5,
                      child: Icon(
                        Icons.add,
                        size: 50,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  isSearching ? resultsPanel(context) : Container(),
                ],
              )),
            ),
          ),
        ),
      ),
    );
  }

  Widget resultsPanel(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .65,
      color: Colors.blueGrey[50],
      child: buildResultsGrid(),
    );
  }

  initiatePatientSearchByName(String query) async {
    showOverLay();

    setState(() {
      this._query = query;
    });

    switch (_query.length) {
      case 0:
        resetResultsPanel();

        break;
      case 1:
        // do server search
        serverSideSearch();
        break;
      case 2:
        // do local search
        doLOcalSearch();
        break;
      default:
        doLOcalSearch();
    }
  }

  buildResultsGrid() {
    // if (displayResults.length == 0) {
    //   return Center(
    //     child: Text(
    //       'No Matching results found for \"$_query\"',
    //       style: Theme.of(context).textTheme.headline6,
    //     ),
    //   );
    // } else if (this._query.length > 0 && displayResults.length == 0) {
    //   return Column(
    //     children: [
    //       Text(
    //         'No Matching results found for \"$_query\"',
    //         style: Theme.of(context).textTheme.headline6,
    //       ),
    //       ElevatedButton.icon(
    //           onPressed: () {},
    //           icon: Icon(Icons.add),
    //           label: Text('create \"${this._query}\"')),
    //     ],
    //   );
    // }
    return GridView.extent(
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        maxCrossAxisExtent: 250,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 4.0,
        primary: false,
        shrinkWrap: true,
        children: displayResults.map(
          (patient) {
            return buildPatientCard(patient!);
          },
        ).toList());
  }

  Widget buildPatientCard(Patient patient) {
    ConUtils.printLog(patient.firstName);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 2.0,
      child: Stack(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Image.network('https://i.pravatar.cc/'),
          Positioned(
            left: 0,
            right: 0,
            top: 8,
            child: CircleAvatar(
              backgroundColor: Colors.blueGrey.shade200,
              radius: 40,
            ),
          ),
          Positioned(
            left: 10,
            right: 10,
            bottom: 65,
            child: Text(
              patient.firstName,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
              ),
            ),
          ),
          Positioned(
            left: 10,
            right: 10,
            bottom: 35,
            child: Text(
              patient.lastName,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
              ),
            ),
          ),

          Positioned(
            child: Text('45 yrs'),
            bottom: 4,
            right: 12,
          )
        ],
      ),
    );
  }

  resetResultsPanel() {
    setState(() {
      serverResults = [];
      localResults = [];
      displayResults = [];
      // displayResults.add(Patient(patientId: patientId, firstName: firstName, lastName: lastName))
      isSearching = false;
    });
  }

  Future<void> serverSideSearch() async {
    //TODO grab patients from firebase using services

    //grab results from firestore

    var result =
        await SearchService.searchFirestorePatientByName(_query.toUpperCase());
    setState(() {
      isSearching = true;
      serverResults = result;
      displayResults.clear();
      displayResults = serverResults;
    });
  }

  void doLOcalSearch() {
    //only do the local search
    _query = _query.toLowerCase();
    _query = _query.replaceRange(0, 1, _query[0].toUpperCase());
    this._query = _query;

    // query = query[0].toUpperCase();
    localResults.clear();
    // displayResults.clear();
    serverResults.forEach((patient) {
      if (patient!.firstName.startsWith(_query)) {
        setState(() {
          isSearching = true;
          localResults.add(patient);
          displayResults = localResults;
        });
      }
    });
  }

  addButton(String name) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 2.0,
      child: Column(
        children: [
          Icon(
            Icons.add,
            size: 45,
          ),
          Text('Create \n ${this._query}'),
        ],
      ),
    );
  }

  void newPatientDoalogue() {
    AlertDialog dialog = NewPatientDialog();
    showDialog(context: context, builder: (_) => dialog);
  }

  Future<void> showOverLay() async {
    overlayState = Overlay.of(context)!;
    overlayEntry = OverlayEntry(
        builder: (_) => Positioned(
            top: 50,
            left: 50,
            right: 50,
            child: SizedBox(
              height: 50,
              width: 50,
              // color: Colors.deepPurple,
              child: resultsPanel(context),
            )));

    overlayState.insert(overlayEntry);
    await Future.delayed(Duration(milliseconds: 500));
    overlayEntry.remove();
  }
}
