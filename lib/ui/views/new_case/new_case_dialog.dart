// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:hhf_next_gen/app/console_utility.dart';

// class NewPatientDialog extends AlertDialog {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   TextEditingController firstNameController = TextEditingController();
//   TextEditingController lastNameController = TextEditingController();
//   TextEditingController ageController = TextEditingController();
//   TextEditingController phoneNumberController = TextEditingController();
//   TextEditingController address1Controller = TextEditingController();
//   TextEditingController address2Controller = TextEditingController();
//   TextEditingController cityController = TextEditingController();

//   late final localContext;
//   NewPatientDialog({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     localContext = context;
//     return AlertDialog(
//       title: Text('Create New Patient'),
//       elevation: 24,
//       actionsPadding: EdgeInsets.symmetric(horizontal: 32),
//       actions: [
//         TextButton.icon(
//             onPressed: () {}, icon: Icon(Icons.cancel), label: Text('Cancel')),
//         ElevatedButton.icon(
//             onPressed: onSave, icon: Icon(Icons.save), label: Text('Save')),
//       ],
//       content: Form(
//         key: _formKey,
//         autovalidateMode: AutovalidateMode.always,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Icon(
//               Icons.add_a_photo,
//               size: 50,
//             ),
//             TextField(
//               controller: firstNameController,
//               decoration: InputDecoration(hintText: 'firstName'),
//             ),
//             TextField(
//               controller: lastNameController,
//               decoration: InputDecoration(hintText: 'lastName'),
//             ),
//             TextField(
//               controller: ageController,
//               decoration: InputDecoration(hintText: 'age'),
//             ),
//             TextField(
//               controller: phoneNumberController,
//               decoration: InputDecoration(hintText: 'phone Number'),
//             ),
//             TextField(
//               controller: address1Controller,
//               decoration: InputDecoration(hintText: 'address Line 1'),
//             ),
//             TextField(
//               controller: address2Controller,
//               decoration: InputDecoration(hintText: 'address Line 2'),
//             ),
//             TextField(
//               controller: cityController,
//               decoration: InputDecoration(hintText: 'City'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> onSave() async {
//     if (_formKey.currentState!.validate()) {
//       final counter = await FirebaseFirestore.instance
//           .collection('patients')
//           .doc('--Counter--')
//           .get()
//           .then((value) => value.data()!['counter']);
//       String firstName = firstNameController.text;
//       firstNameController.text[0].toUpperCase();
//       lastNameController.text[0].toUpperCase();
//       FirebaseFirestore.instance.collection('patients').add({
//         'firstName': firstNameController.text,
//         'lastName': lastNameController.text,
//         'age': ageController.text,
//         'phoneNumber': phoneNumberController.text,
//         'addressLine1': address1Controller.text,
//         'addressLine2': address1Controller.text,
//         'city': cityController.text,
//         'patientId': 'P-00${counter + 1}'
//       }).then((value) {
//         ConUtils.printLog(
//             'new patient with id P-00${counter + 1} written\n firestore uid = $value');
//         FirebaseFirestore.instance
//             .collection('patients')
//             .doc('--Counter--')
//             .set({'counter': counter + 1}).then((value) => ConUtils.printLog(
//                 'counter incremented to the new value of${counter + 1}'));
//         ConUtils.printLog(value.toString());
//         Navigator.of(localContext).pop();
//       });
//     }
//   }
// }
