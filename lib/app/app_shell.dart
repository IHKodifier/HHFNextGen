import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import the package
import 'package:responsive_builder/responsive_builder.dart';

class AppShell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          switch (sizingInformation.deviceScreenType) {
            case DeviceScreenType.desktop:
              return Container(
                color: Colors.purple,
                child: Text(
                  sizingInformation.deviceScreenType.toString(),
                  style: GoogleFonts.lato(
                    textStyle:
                        TextStyle(color: Colors.black, letterSpacing: .5),
                    fontSize: 28,
                  ),
                ),
              );
            // break;
            default:
              return Container(
                  color: Colors.yellow,
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          sizingInformation.deviceScreenType.toString(),
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                color: Colors.black, letterSpacing: .5),
                            fontSize: 28,
                          ),
                        )
                      ],
                    ),
                  ));
          }
        },
      ),
    );
  }
}
