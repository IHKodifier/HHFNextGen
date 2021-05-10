import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hhf_next_gen/app/app.dart';
import 'package:hhf_next_gen/app/locator.dart';

void main() {
  registerAllServices();
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}
