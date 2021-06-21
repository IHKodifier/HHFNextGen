import 'package:flutter/material.dart';

class NewPatient extends StatefulWidget {
  const NewPatient({Key? key}) : super(key: key);

  @override
  _NewPatientState createState() => _NewPatientState();
}

class _NewPatientState extends State<NewPatient> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController address1Controller = TextEditingController();
  TextEditingController address2Controller = TextEditingController();
  TextEditingController cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
      content: Container(
        width: MediaQuery.of(context).size.width*0.5,
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            
            children: [
              Icon(
                Icons.add_a_photo,
                size: 50,
              ),
              TextField(
                controller: firstNameController,
                decoration: InputDecoration(hintText: 'firstName'),
              ),
              TextField(
                controller: lastNameController,
                decoration: InputDecoration(hintText: 'lastName'),
              ),
              TextField(
                controller: ageController,
                decoration: InputDecoration(hintText: 'age'),
              ),
              TextField(
                controller: phoneNumberController,
                decoration: InputDecoration(hintText: 'phone Number'),
              ),
              TextField(
                controller: address1Controller,
                decoration: InputDecoration(hintText: 'address Line 1'),
              ),
              TextField(
                controller: address2Controller,
                decoration: InputDecoration(hintText: 'address Line 2'),
              ),
              TextField(
                controller: cityController,
                decoration: InputDecoration(hintText: 'City'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
