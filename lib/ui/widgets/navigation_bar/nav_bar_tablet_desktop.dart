import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hhf_next_gen/ui/widgets/navigation_bar/nav_bar_item.dart';
import 'package:hhf_next_gen/ui/widgets/navigation_bar/nav_bar_logo.dart';
import 'package:intl/intl.dart';

class NavigationBarTabletDesktop extends StatelessWidget {
  const NavigationBarTabletDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      color: Colors.red[800],
      height: 58,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 96),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  '${DateFormat.yMMMMEEEEd().format(DateTime.now())}',
                  style: GoogleFonts.pangolin(
                    textStyle: Theme.of(context).textTheme.headline4,
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      'Aamra Abbasi',
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.raleway(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    Text(
                      'Case Registrar',
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.raleway(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              CircleAvatar(
                maxRadius: 20,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.account_circle,
                  size: 40,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
