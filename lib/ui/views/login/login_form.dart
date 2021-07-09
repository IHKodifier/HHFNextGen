// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:hhf_next_gen/ui/widgets/email_formfield.dart';
// import 'package:hhf_next_gen/ui/widgets/password_formfield.dart';

// class LoginForm extends StatefulWidget {
//   const LoginForm({Key? key}) : super(key: key);

//   @override
//   _LoginFormState createState() => _LoginFormState();
// }

// class _LoginFormState extends State<LoginForm> {
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();

//   final _formKey = GlobalKey<FormState>();
//   // String email;
//   // String password;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 500,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 8),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                 keyboardType: TextInputType.emailAddress,
//                 // onSaved: (newValue) => email = newValue,
//                 onChanged: (value) {},
//                 validator: (value) {},
//                 decoration: InputDecoration(
//                     labelText: "Email",
//                     hintText: "Enter your email",
//                     // If  you are using latest version of flutter then lable text and hint text shown like this
//                     // if you r using flutter less then 1.20.* then maybe this is not working properly
//                     floatingLabelBehavior: FloatingLabelBehavior.always,
//                     suffixIcon: Icon(Icons.email)),
//               ),
//               SizedBox(height: 10),
//               TextFormField(
//                 keyboardType: TextInputType.emailAddress,
//                 // onSaved: (newValue) => email = newValue,
//                 onChanged: (value) {},
//                 validator: (value) {},
//                 decoration: InputDecoration(
//                     labelText: "Email",
//                     hintText: "Enter your email",
//                     // If  you are using latest version of flutter then lable text and hint text shown like this
//                     // if you r using flutter less then 1.20.* then maybe this is not working properly
//                     floatingLabelBehavior: FloatingLabelBehavior.always,
//                     suffixIcon: FaIcon(FontAwesomeIcons.key)),
//               ),
//               SizedBox(height: 20),
             
//               SizedBox(height: 50),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
