// import 'package:flutter/material.dart';
// import 'package:hhf_next_gen/app/console_utility.dart';
// import 'package:hhf_next_gen/app/models/patient.dart';
// import 'package:hhf_next_gen/app/services/search_service.dart';

// class NewFinancingCase extends StatefulWidget {
//   const NewFinancingCase({Key? key}) : super(key: key);

//   @override
//   _NewFinancingCaseState createState() => _NewFinancingCaseState();
// }

// class _NewFinancingCaseState extends State<NewFinancingCase> {
//   List<Patient?> firestoreQueryResult = List.generate(0, (index) => null);
//   List<Patient?> filteredQueryResult = List.generate(0, (index) => null);
//   String _query = '';
//   bool resultsPanelVisible = false;

//   Widget resultsPanel(BuildContext context) {
//     return Container(
//       height: MediaQuery.of(context).size.height * .65,
//       color: Colors.amber[100],
//       child: (firestoreQueryResult.length == 0 && this._query.length > 1)
//           ? buildLocalGrid()
//           : buildServerGrid(),
//     );
//   }

//   showResultPanel() {
//     resultsPanelVisible = true;
//   }

//   hideResultsPanel() {
//     resultsPanelVisible = false;
//   }

//   initiatePatientSearchByName(String query) async {
//     this._query = query;
//     if (query.isEmpty) {
//       setState(() {
//         firestoreQueryResult = [];
//         filteredQueryResult = [];
//         hideResultsPanel();
//       });
//     } else if (query.length == 1) {
// //TODO grab patients from firebase using services

//       //grab results from firestore
//       var result =
//           await SearchService.searchFirestorePatientByName(query.toUpperCase());
//       setState(() {
//         firestoreQueryResult = result;
//         showResultPanel();
//       });
//     } else if (query.length > 1) {
//       //only do the local search
//       query = query.toLowerCase();
//       query = query.replaceRange(0, 1, query[0].toUpperCase());

//       // query = query[0].toUpperCase();
//       filteredQueryResult.clear();
//       firestoreQueryResult.forEach((patient) {
//         if (patient!.firstName.startsWith(query)) {
//           setState(() {
//             filteredQueryResult.add(patient);
//           });
//         }
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           ' New Case...',
//           style: Theme.of(context).textTheme.headline6,
//         ),
//         centerTitle: true,
//         iconTheme: Theme.of(context)
//             .iconTheme
//             .copyWith(color: Theme.of(context).primaryColor),
//       ),
//       body: Container(
//         height: double.infinity,
//         child: Padding(
//           padding: EdgeInsets.all(16),
//           child: Container(
//             height: double.infinity,
//             width: double.infinity,
//             child: SingleChildScrollView(
//               child: Form(
//                   child: Column(
//                 children: [
//                   TextField(
//                     onChanged: initiatePatientSearchByName,
//                     decoration: InputDecoration(
//                       prefix: Icon(Icons.search),
//                       hintText: 'search by name',
//                       contentPadding: EdgeInsets.only(left: 25),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(4),
//                       ),
//                     ),
//                   ),
//                   resultsPanelVisible ? resultsPanel(context) : Container(),
//                 ],
//               )),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   buildServerGrid() {
//     if (firestoreQueryResult.length == 0 && this._query.length < 3) {
//       return Center(
//         child: Column(
//           children: [
//             Text(
//               'No Matching results found',
//               style: Theme.of(context).textTheme.headline6,
//             ),
//             ElevatedButton.icon(
//                 onPressed: () {}, icon: Icon(Icons.add), label: Text('New')),
//           ],
//         ),
//       );
//     } else {
//       return GridView.extent(
//           padding: EdgeInsets.only(left: 10.0, right: 10.0),
//           // crossAxisCount: 4,
//           maxCrossAxisExtent: 250,
//           crossAxisSpacing: 4.0,
//           mainAxisSpacing: 4.0,
//           primary: false,
//           shrinkWrap: true,
//           children: firestoreQueryResult.map((patient) {
//             return buildPatientCard(patient!);
//           }).toList());
//     }
//   }

//   buildLocalGrid() {
//     if (this._query.length < 3 && firestoreQueryResult.length == 0) {
//       return Center(
//         child: Text(
//           'No Matching results found',
//           style: Theme.of(context).textTheme.headline6,
//         ),
//       );
//     } else if (this._query.length >= 3 && firestoreQueryResult.length == 0) {
//       return Column(
//         children: [
//           Text(
//             'No Matching results found',
//             style: Theme.of(context).textTheme.headline6,
//           ),
//           ElevatedButton.icon(
//               onPressed: () {},
//               icon: Icon(Icons.add),
//               label: Text('create \"${this._query}\"')),
//         ],
//       );
//     }
//     return GridView.extent(
//         padding: EdgeInsets.only(left: 10.0, right: 10.0),
//         maxCrossAxisExtent: 250,
//         crossAxisSpacing: 4.0,
//         mainAxisSpacing: 4.0,
//         primary: false,
//         shrinkWrap: true,
//         children: filteredQueryResult.map((patient) {
//           return buildPatientCard(patient!);
//         }).toList());
//   }

//   Widget buildPatientCard(Patient patient) {
//     ConUtils.printLog(patient.firstName);
//     return Card(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
//       elevation: 2.0,
//       child: Stack(
//         // mainAxisAlignment: MainAxisAlignment.start,
//         // crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           // Image.network('https://i.pravatar.cc/'),
//           Positioned(
//             left: 0,
//             right: 0,
//             top: 8,
//             child: CircleAvatar(
//               backgroundColor: Colors.blueGrey.shade200,
//               radius: 40,
//             ),
//           ),
//           Positioned(
//             left: 10,
//             right: 10,
//             bottom: 65,
//             child: Text(
//               patient.firstName,
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 20.0,
//               ),
//             ),
//           ),
//           Positioned(
//             left: 10,
//             right: 10,
//             bottom: 35,
//             child: Text(
//               patient.lastName,
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 20.0,
//               ),
//             ),
//           ),

//           Positioned(
//             child: Text('45 yrs'),
//             bottom: 4,
//             right: 12,
//           )
//         ],
//       ),
//     );
//   }
// }
