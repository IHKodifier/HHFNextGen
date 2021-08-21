import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:hhf_next_gen/app/tools/utilities.dart';
import 'package:hhf_next_gen/app/locator.dart';
import 'package:hhf_next_gen/app/models/patient.dart';
import 'package:hhf_next_gen/app/services/search_service.dart';
import 'package:hhf_next_gen/ui/views/new_case/new_patient.dart';

class NewFinancingCase extends StatefulWidget {
  const NewFinancingCase({Key? key}) : super(key: key);

  @override
  _NewFinancingCaseState createState() => _NewFinancingCaseState();
}

class _NewFinancingCaseState extends State<NewFinancingCase> {
  List<Patient?> displayResults = List.generate(0, (index) => null);
  List<bool> financingType = [
    false,
    false,
  ];
  bool isBusy = false;
  String _query = '';
  String selectedService = '';
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
  SearchService searchService = servicelocator<SearchService>();
  GlobalKey nameFieldKey = GlobalKey();
  late Offset nameFieldPosition;
  late OverlayState overlayState;
  late OverlayEntry overlayEntry;
  bool hasPatientSelection = false;
  late Patient? selectedPatient = null;

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
          width: MediaQuery.of(context).size.width * .45,
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

                    /// uncommentinhg line below will cause error.
                    /// TODO: need to attack this with state managemet
                    // hasPatientSelection? buildSelectedPatient():Container(),

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

                    // buildButtonBar(),
                  ],
                )),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget nameTextField() {
    return Material(
      child: Container(
        // width: MediaQuery.of(context).size.width*.35,
        child: TypeAheadField<Patient?>(
          suggestionsCallback: (pattern) async {
            return await searchService.searchPatient(pattern);
          },
          itemBuilder: buildPatientCard,
          noItemsFoundBuilder: (_) => Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'No matching patients found in the database...',
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(fontSize: 18, fontStyle: FontStyle.italic),
                ),
                IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (context) => NewPatient(),
                      );
                    },
                    icon: FaIcon(
                      FontAwesomeIcons.plusCircle,
                      size: 50,
                    )),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Tap the  button above to create new patient',
                  style: Theme.of(context).textTheme.caption!.copyWith(
                        fontSize: 18,
                        // fontStyle: FontStyle.italic,
                      ),
                ),
              ],
            ),
          ),
          onSuggestionSelected: (patientSuggestion) {
            setState(() {
              selectedPatient = patientSuggestion ?? null as Patient;
              hasPatientSelection = true;
            });

            Utilities.log(
                '${selectedPatient!.firstName} was selected from Search');
          },
          textFieldConfiguration: TextFieldConfiguration(
            autofocus: true,
            style: DefaultTextStyle.of(context).style.copyWith(fontSize: 18),
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              prefix: Icon(Icons.search),
              hintText: 'Start typing patient name',
              labelText: 'Patient Name',
              contentPadding: EdgeInsets.only(left: 25),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void startSearch(String query) async {
    displayResults = await searchService.searchPatient(query);
    overlayState = Overlay.of(context)!;
    buildResultsOverlay();
    overlayState.insert(overlayEntry);
    print('working');
    setState(() {});
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

  DropdownButton<String> buildStatusDropDown() {
    return DropdownButton<String>(
        value: selectedState,
        hint: Text('Select Case Status'),
        onChanged: (String? newValue) {
          setState(() {
            selectedState = newValue!;

            Utilities.log('selected value equals $newValue');
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

  buildServiceDropDown() {
    return DropdownButton<String>(
        // DropdownButtonHideUnderline:
        value: selectedService,
        hint: Text('Select Case Status'),
        onChanged: (String? newValue) {
          setState(() {
            selectedService = newValue!;

            Utilities.log('selected Service equals $newValue');
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

  buildResultsOverlay() {
    RenderBox? renderBox =
        nameFieldKey.currentContext!.findRenderObject() as RenderBox?;
    nameFieldPosition = renderBox!.localToGlobal(Offset.zero);
    overlayEntry = OverlayEntry(
        builder: (_) => Positioned(
            // top: 50,
            top: nameFieldPosition.dy + renderBox.size.height + 10,
            left: 50,
            right: 50,
            child: SizedBox(
                // height: 100,
                // width: 50,
                child: Container(
              color: Colors.blueGrey.shade200,
              child: buildResultsGrid(),
            )
                // child: newPatientDoalogue,
                )));
  }

  buildZeroResults() {
    return Column(
      children: [
        Text(
          'No Matching results found for $_query',
          style: Theme.of(context).textTheme.headline6,
        ),
        FloatingActionButton(
          // onPressed: newPatientDoalogue,
          onPressed: () {},
          backgroundColor: Colors.white,
          elevation: 5,
          child: Icon(
            Icons.add,
            size: 50,
            color: Colors.red,
          ),
        ),
      ],
    );
  }

  buildResultsGrid() {
    return GridView.extent(
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        maxCrossAxisExtent: 250,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 4.0,
        primary: false,
        shrinkWrap: true,
        children: displayResults.map(
          (patient) {
            return buildPatientCard(context, patient!);
          },
        ).toList());
  }

  Widget buildPatientCard(BuildContext context, Patient? patient) {
    Utilities.log(patient!.firstName);
    return Container(
      width: 50,
      child: ListTile(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.center,
        leading: CircleAvatar(
          backgroundColor: Colors.blueGrey.shade200,
          radius: 40,
        ),

        title: Text(
          patient.firstName,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
          ),
        ),

        subtitle: Text(
          patient.lastName,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
          ),
        ),

        trailing: Text('${patient.age.toString()} yrs'),
      ),
    );
  }

  buildSelectedPatient() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'selectedPatient: ',
          style: Theme.of(context).textTheme.caption,
        ),
        buildPatientCard(context, selectedPatient),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'remove',
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    fontStyle: FontStyle.italic,
                    color: Colors.blueGrey,
                  ),
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    selectedPatient = null as Patient;
                    hasPatientSelection = false;
                  });
                },
                icon: FaIcon(FontAwesomeIcons.times)),
          ],
        ),
      ],
    );
  }
}
