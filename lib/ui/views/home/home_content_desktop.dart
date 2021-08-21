import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hhf_next_gen/app/models/enums.dart';
import 'package:hhf_next_gen/app/services/role_based_access/access_resource_identifier.dart';
import 'package:hhf_next_gen/app/tools/class_info.dart';
import 'package:hhf_next_gen/app/tools/utilities.dart';
import 'package:hhf_next_gen/app/constants/styles.dart';
import 'package:hhf_next_gen/app/locator.dart';
import 'package:hhf_next_gen/app/providers/providers.dart';
import 'package:hhf_next_gen/app/routing/router.dart';
import 'package:hhf_next_gen/app/services/navigation_service.dart';
import 'package:hhf_next_gen/app/constants/theme.dart';
import 'package:hhf_next_gen/app/routing/routenames.dart' as routes;
import 'package:hhf_next_gen/ui/views/home/home_welcome_note.dart';
import 'package:hhf_next_gen/ui/views/home/job_inbox.dart';
import 'package:hhf_next_gen/ui/views/home/project_overview.dart';
import 'package:hhf_next_gen/ui/widgets/access_secured_widget.dart';
import 'package:hhf_next_gen/ui/widgets/search_bar/searchbar.dart';

class HomeContentDesktop extends StatelessWidget {
  HomeContentDesktop({Key? key}) : super(key: key);
  final classInfo = ClassInfo(name: 'HomeContentDesktop', version: '1.0.0');
  final accessResource = AccessResource(
      resourceId: 'PatientProfile',
      resourceType: ResourceType.Entity,
      resourceName: 'Patient Profile');

  @override
  Widget build(BuildContext context) {
    return AccessSecuredWidget(
      child: _buildchild(context),
      verbose: false,
      accessResource: accessResource,
    );
  }

  Material _buildchild(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Home',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.account_circle,
                        size: 50,
                      ),
                      Consumer(builder:
                          (BuildContext context, WidgetRef ref, Widget? child) {
                        final auth = ref.watch(authProvider);
                        return Text(auth.authenticatedUser!.email!);
                      }),
                      SearchBar(),
                    ],
                  ),
                ],
              ),
              Container(
                height: 500,
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('financingCases')
                      .snapshots(),
                  // initialData: initialData ,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      return ListView.builder(
                          itemCount: snapshot.data.docs.length,
                          itemBuilder: (BuildContext context, int index) {
                            if (index == 0) {
                              return Column(
                                children: [
                                  Center(
                                    child: Container(
                                      margin: EdgeInsets.all(12),
                                      height: 50,
                                      width: MediaQuery.of(context).size.width *
                                          0.18,
                                      child: ElevatedButton.icon(
                                          style: globalButtonStyle,
                                          onPressed: createNewCase,
                                          icon: Icon(
                                            Icons.add,
                                            size: 45,
                                          ),
                                          label: Text('New Case')),
                                    ),
                                  ),
                                  Card(
                                    elevation: 5,
                                    child: ListTile(
                                      leading: Icon(
                                        Icons.account_circle_rounded,
                                        size: 45,
                                      ),
                                      title: Text(
                                        snapshot.data.docs[index]['patientId'],
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2!
                                            .copyWith(color: Colors.black),
                                      ),
                                      subtitle: Text(
                                        snapshot.data.docs[index]['createdBy'],
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2!
                                            .copyWith(color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            } else {
                              return Card(
                                elevation: 5,
                                child: ListTile(
                                  leading: Icon(
                                    Icons.account_circle_rounded,
                                    size: 45,
                                  ),
                                  title: Text(
                                    snapshot.data.docs[index]['patientId'],
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(color: Colors.black),
                                  ),
                                  subtitle: Text(
                                    snapshot.data.docs[index]['createdBy'],
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(color: Colors.black),
                                  ),
                                ),
                              );
                            }
                          });
                      // return Text('xcvxcvxffd');
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> createNewCase() async {
    //  await FirebaseFirestore.instance
    //       .collection('financingCases')
    //       .add({'createdBy': 'Firestore', 'patientId': 'Kamzor Khan'});

    final navigator = servicelocator<NavigationService>();
    navigator.navigateTo(routes.NewCaseRoute);
  }

  buildNavBar(BuildContext context) {
    return Navigator(
      key: servicelocator<NavigationService>().navigatorKey,
      onGenerateRoute: generateRoute,
      initialRoute: routes.HomeRoute,
    );
  }
}
