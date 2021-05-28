import 'package:flutter/material.dart';
import 'package:hhf_next_gen/app/constants/app_colors.dart';

ButtonStyle globalButtonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.red.shade800),
    overlayColor: MaterialStateProperty.all<Color>(
      Colors.purple.shade600,
    ));
