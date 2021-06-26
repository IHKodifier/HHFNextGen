import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hhf_next_gen/app/locator.dart';
import 'package:hhf_next_gen/app/models/patient.dart';
import 'package:hhf_next_gen/app/services/firestore_service.dart';

class NewPatient extends StatefulWidget {
  const NewPatient({Key? key}) : super(key: key);

  @override
  _NewPatientState createState() => _NewPatientState();
}

class _NewPatientState extends State<NewPatient> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final selectedGender;
  List<bool> genderSelections = [false, false];
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController address1Controller = TextEditingController();
  TextEditingController address2Controller = TextEditingController();
  TextEditingController cityController = TextEditingController();
  // late int patientCounter;

  FirestoreService firestoreService = servicelocator<FirestoreService>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
      title: Align(
        alignment: Alignment.center,
        child: Text(
          'Create New Patient',
          style: Theme.of(context).textTheme.headline4!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      content: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.always,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.add_a_photo,
                  size: 45,
                ),
                TextField(
                  controller: firstNameController,
                  decoration: InputDecoration(
                    hintText: 'firstName',
                    // icon: FaIcon(FontAwesomeIcons.user),
                  ),
                ),
                TextField(
                  controller: lastNameController,
                  decoration: InputDecoration(hintText: 'lastName'),
                ),
                TextField(
                  controller: ageController,
                  decoration: InputDecoration(
                    hintText: 'age',
                    //  icon: FaIcon(FontAwesomeIcons.user),
                  ),
                ),
                buildGender(),
                TextField(
                  controller: phoneNumberController,
                  decoration: InputDecoration(
                      hintText: 'phone Number',
                      icon: FaIcon(FontAwesomeIcons.phone)),
                ),
                TextField(
                  controller: address1Controller,
                  decoration: InputDecoration(
                      hintText: 'address Line 1',
                      icon: FaIcon(FontAwesomeIcons.building)),
                ),
                TextField(
                  controller: address2Controller,
                  decoration: InputDecoration(
                      hintText: 'address Line 2',
                      icon: FaIcon(FontAwesomeIcons.road)),
                ),
                TextField(
                  controller: cityController,
                  decoration: InputDecoration(
                      hintText: 'City', icon: FaIcon(FontAwesomeIcons.city)),
                ),
              ],
            ),
          ),
        ),
      ),
      actions: [
        TextButton.icon(
            onPressed: resetForm,
            icon: FaIcon(FontAwesomeIcons.readme),
            label: Text('Reset')),
        TextButton.icon(
            onPressed: () {},
            icon: FaIcon(FontAwesomeIcons.ban),
            label: Text('Cancel')),
        ElevatedButton.icon(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                firstNameController.text[0].toUpperCase();
                lastNameController.text[0].toUpperCase();
              

                firestoreService
                    .createNewPatient(Patient.fromJson({
                      'patientId': '99',
                      'firstName': firstNameController.text,
                      'lastName': lastNameController.text,
                      'age': int.parse(ageController.text),
                      'phoneNumber': phoneNumberController.text,
                      'adr1': address1Controller.text,
                      'adr2': address2Controller.text,
                      'isMale': resolveGender(),
                      'city': cityController.text,  
                    }))
                    .then((value) => Navigator.of(context).pop());
              }
            },
            icon: FaIcon(FontAwesomeIcons.save),
            label: Text('Save')),
      ],
      actionsPadding: EdgeInsets.all(8),
    );
  }

  buildGender() {
    return ToggleButtons(
      hoverColor: Colors.red.shade300,
      borderRadius: BorderRadius.circular(6),
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              FaIcon(
                FontAwesomeIcons.male,
                size: 45,
              ),
              Text('Male'),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              FaIcon(
                FontAwesomeIcons.female,
                size: 45,
              ),
              Text('Female')
            ],
          ),
        ),
      ],
      isSelected: genderSelections,
      renderBorder: true,
      onPressed: (index) {
        setState(() {
          for (int buttonIndex = 0;
              buttonIndex < genderSelections.length;
              buttonIndex++) {
            if (buttonIndex == index) {
              genderSelections[buttonIndex] = true;
            } else {
              genderSelections[buttonIndex] = false;
            }
          }
        });
      },
    );
  }

  void resetForm() {
    // _formKey.currentState!.reset();
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
              title: Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.exclamationCircle,
                    size: 40,
                  ),
                  Expanded(child: Text(' This will clear all the data ?')),
                ],
              ),
              content: Text('Are you sure?'),
              actions: [
                TextButton(
                    onPressed: () {
                      firstNameController.clear();
                      lastNameController.clear();
                      ageController.clear();
                      address1Controller.clear();
                      address2Controller.clear();
                      cityController.clear();
                      phoneNumberController.clear();
                      Navigator.of(context).pop();
                      // TODO clear the gender selection
                    },
                    child: Text('Yes, clear the form')),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('No, keep the data !!')),
              ],
            ));
  }

  bool resolveGender() {
    if (genderSelections[0] == false && genderSelections[1] == false) {
      throw Exception('Gender not selected');
    } else {
      if (genderSelections[0] == true) {
        return true;
      } else {
        return false;
      }
    }
  }
}
