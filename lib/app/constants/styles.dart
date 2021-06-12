import 'package:flutter/material.dart';
import 'package:hhf_next_gen/app/constants/app_colors.dart';
import '../constants/app_colors.dart' as appColors;

ButtonStyle globalButtonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(appColors.primaryColor),
    overlayColor: MaterialStateProperty.all<Color>(
      Colors.purple.shade600,
    ));
