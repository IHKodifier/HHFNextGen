import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hhf_next_gen/app/console_utility.dart';
import 'package:hhf_next_gen/app/constants/styles.dart';
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
  late OverlayEntry newPatientOverlayEntry;
  List<bool> financingType = [
    false,
    false,
  ];
  bool isBusy = false;
  String _query = '';
  var caseStatusitems = [
    'Exploratory',
    'Initiated',
  ];
  String selectedState = 'Exploratory';
  var caseServiceitemsList = [
    // TODO grab panel services from firestore
    'Septal Closures',
    'Valve Replacements',
    'Fractures of Upper Limbs',
    'Fractures of Lower Limbs',
    'External Fixators',
    'Diagnostics',
    'Gastric Ligation',
  ];
  String selectedService = '';
  GlobalKey nameFieldKey = GlobalKey();
  late Offset nameFieldPosition;

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
      body: Center(
        child: Container(
          height: double.infinity,
          width: MediaQuery.of(context).size.width * .75,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Container(
              height: double.infinity,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Form(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    nameTextField(),
                    SizedBox(height: 20),
                    // Tooltip(
                    //   message: 'create New Patient',
                    //   child: FloatingActionButton(
                    //     onPressed: newPatientDoalogue,
                    //     backgroundColor: Colors.white,
                    //     elevation: 5,
                    //     child: Icon(
                    //       Icons.add,
                    //       size: 50,
                    //       color: Colors.red,
                    //     ),
                    //   ),
                    // ),
                    buildFinancingTypeToggleButtons(context),

                    SizedBox(
                      height: 20,
                    ),
                    guesstimatedCostTextField(),
                    SizedBox(height: 20),
                    // guesstimatedCostTextField(),
                    buildStatusDropDown(),
                    selectedState == 'Initiated'
                        ? buildServiceDropDown()
                        : Container(),
                    SizedBox(height: 40),

                    buildButtonBar(),
                  ],
                )),
              ),
            ),
          ),
        ),
      ),
    );
  }

  DropdownButton<String> buildStatusDropDown() {
    return DropdownButton<String>(
        value: null,
        hint: Text('Select Case Status'),
        onChanged: (String? newValue) {
          setState(() {
            selectedState = newValue!;

            ConUtils.printLog('selected value equals $newValue');
          });
        },
        items: caseStatusitems
            .map(
              (e) => DropdownMenuItem<String>(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(e),
                ),
                value: e,
              ),
            )
            .toList());
  }

  ToggleButtons buildFinancingTypeToggleButtons(BuildContext context) {
    return ToggleButtons(
      onPressed: (index) {
        setState(() {
          financingType[index] = !financingType[index];
          index == 0 ? financingType[1] = false : financingType[0] = false;
        });
      },
      renderBorder: true,
      borderRadius: BorderRadius.circular(12),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Surgical Procedure',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(fontSize: 18)),
              FaIcon(
                FontAwesomeIcons.procedures,
                size: 35,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
          child: Column(
            children: [
              Text('Cash Subsistence',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(fontSize: 18)),
              FaIcon(
                FontAwesomeIcons.coins,
                size: 35,
              )
            ],
          ),
        ),
      ],
      isSelected: financingType,
      selectedColor: Theme.of(context).accentColor,
      fillColor: Theme.of(context).primaryColor,
      hoverColor: Theme.of(context).accentColor,
    );
  }

  TextField guesstimatedCostTextField() {
    return TextField(
      // controller: ,
      decoration: InputDecoration(
        hintText: 'GUESS-timated Cost in PKR',
        labelText: 'GUESS-timated Cost',
        contentPadding: EdgeInsets.only(left: 25),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  TextField nameTextField() {
    return TextField(
      onChanged: initiatePatientSearchByName,
      key: nameFieldKey,
      decoration: InputDecoration(
        prefix: Icon(Icons.search),
        hintText: 'Start typing patient name',
        labelText: 'Patient Name',
        contentPadding: EdgeInsets.only(left: 25),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  Widget buildButtonBar() {
    return ButtonBar(
      buttonHeight: 80,
      buttonMinWidth: 200,
      layoutBehavior: ButtonBarLayoutBehavior.padded,
      buttonPadding: EdgeInsets.all(8),
      alignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: 250,
          child: ElevatedButton.icon(
              onPressed: () {},
              style: globalButtonStyle.copyWith(),
              icon: Icon(
                Icons.restart_alt,
                size: 50,
              ),
              label: Text('Reset')),
        ),
        Container(
          width: 250,
          child: ElevatedButton.icon(
              onPressed: () {},
              style: globalButtonStyle,
              icon: Icon(
                Icons.save,
                size: 50,
              ),
              label: Text('Save')),
        ),
      ],
    );
  }

  Widget resultsPanel(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .75,
      color: Colors.blueGrey[100],
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
    isBusy = false;
  }

  buildResultsGrid() {
    if (_query.length < 3) {
      /// if [displayResults.length]==0 build [addButton]
      /// and no results text
      if (displayResults.length == 0) {
        // return buildAddButton();
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildNoResultsFoundText(),
            // buildAddButton()
          ],
        );
      } else {}
    } else if (_query.length >= 3) {
      if (displayResults.length == 0) {
        // return buildAddButton();
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [buildNoResultsFoundText(), buildAddButton()],
        );
      } else {}
    }

    if (displayResults.length == 0 && _query.length != 0) {
      return Center(
        child: buildNoResultsFoundText(),
      );
    } else if (this._query.length >= 3 && displayResults.length == 0) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'No Matching results found for  $_query',
            style: Theme.of(context).textTheme.headline6,
          ),
          buildAddButton(),
          TextButton(
              onPressed: () {},
              // icon: Icon(Icons.add),
              child: Text('create \"${this._query}\"')),
        ],
      );
    }
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

  Text buildNoResultsFoundText() {
    return Text(
      'No Matching results found for $_query',
      style: Theme.of(context).textTheme.headline6,
    );
  }

  FloatingActionButton buildAddButton() {
    return FloatingActionButton(
      onPressed: newPatientDoalogue,
      backgroundColor: Colors.white,
      elevation: 5,
      child: Icon(
        Icons.add,
        size: 50,
        color: Colors.red,
      ),
    );
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
      // isSearching = false;
    });
  }

  Future<void> serverSideSearch() async {
    setState(() {
      displayResults.clear();
    });

    //TODO grab patients from firebase using services and manage usong riverpod

    /// grab results from firestore

    var result =
        await SearchService.searchFirestorePatientByName(_query.toUpperCase());
    setState(() {
      isBusy = true;
      serverResults = result;
      displayResults = serverResults;
    });
  }

  void doLOcalSearch() {
    //only do the local search
    _query = _query.toLowerCase();
    _query = _query.replaceRange(0, 1, _query[0].toUpperCase());
    this._query = _query;

    localResults.clear();
    serverResults.forEach((patient) {
      if (patient!.firstName.startsWith(_query)) {
        setState(() {
          // isSearching = true;
          localResults.add(patient);
          displayResults = localResults;
        });
      }
    });
  }

  void newPatientDoalogue() {
    RenderBox? renderBox =
        nameFieldKey.currentContext!.findRenderObject() as RenderBox?;
    nameFieldPosition = renderBox!.localToGlobal(Offset.zero);
    overlayState = Overlay.of(context)!;
    newPatientOverlayEntry = OverlayEntry(
        builder: (_) => Positioned(
            // top: 50,
            top: nameFieldPosition.dy + renderBox.size.height + 20,
            left: 50,
            right: 50,
            child: SizedBox(
              // height: 50,
              width: 50,
              // color: Colors.deepPurple,
              // child: newPatientDoalogue,
            )));

    // overlayEntry.remove();

    // AlertDialog dialog = NewPatientDialog();
    // showDialog(context: context, builder: (_) => dialog);
  }

  Future<void> showOverLay() async {
    RenderBox? renderBox =
        nameFieldKey.currentContext!.findRenderObject() as RenderBox?;
    nameFieldPosition = renderBox!.localToGlobal(Offset.zero);
    overlayState = Overlay.of(context)!;
    overlayEntry = OverlayEntry(
        builder: (_) => Positioned(
            // top: 50,
            top: nameFieldPosition.dy + renderBox.size.height + 10,
            left: 50,
            right: 50,
            child: SizedBox(
              // height: 50,
              width: 50,
              // color: Colors.deepPurple,
              child: resultsPanel(context),
            )));

    overlayState.insert(overlayEntry);
    // await Future.delayed(Duration(milliseconds: 500));
    // overlayEntry.remove();
  }

  buildServiceDropDown() {
    return DropdownButton<String>(
        // DropdownButtonHideUnderline:
        value: null,
        hint: Text('Select Case Status'),
        onChanged: (String? newValue) {
          setState(() {
            selectedService = newValue!;

            ConUtils.printLog('selected Service equals $newValue');
          });
        },
        items: caseServiceitemsList
            .map(
              (e) => DropdownMenuItem<String>(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(e),
                ),
                value: e,
              ),
            )
            .toList());
  }
}
