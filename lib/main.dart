import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hhf_next_gen/app/app.dart';
import 'package:hhf_next_gen/app/tools/utilities.dart';
import 'package:hhf_next_gen/app/locator.dart';

Future<void> main() async {
  try {
    registerAllServices();
    await Firebase.initializeApp();
  } catch (e) {
    Utilities.log(e.toString());
  }

  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}
