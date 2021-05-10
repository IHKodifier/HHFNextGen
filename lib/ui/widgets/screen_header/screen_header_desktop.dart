import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hhf_next_gen/app/console_utility.dart';
import 'package:intl/intl.dart';

class ScreenHeaderDesktop extends StatelessWidget {
  const ScreenHeaderDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          color: Theme.of(context).brightness == Brightness.dark
              ? Theme.of(context).primaryColorDark
              : Theme.of(context).primaryColor,
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
        ),
        Container(
          height: 100,
          padding: EdgeInsets.only(bottom: 12),
          color: Colors.white38,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.home,
                        size: 35,
                        color: Colors.black,
                      ),
                      onPressed: null),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: Text('Home',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w500)),
                  ),
                ],
              ),
              Column(
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.people,
                        size: 35,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        ConUtils.printLog('Stakholders has been clicked');
                      }),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: Text('Stake holders',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w500)),
                  ),
                ],
              ),
              Column(
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.notifications,
                        size: 35,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        ConUtils.printLog('notifications has been clicked');
                      }),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: Text('Notifications',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w500)),
                  ),
                ],
              ),
              Column(
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.pie_chart,
                        size: 35,
                        color: Colors.black,
                      ),
                      onPressed: null),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: Text('reports',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w500)),
                  ),
                ],
              ),
              Column(
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.settings,
                        size: 35,
                        color: Colors.black,
                      ),
                      onPressed: null),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: Text('Settings',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w500)),
                  ),
                ],
              ),
              Column(
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.umbrella_sharp,
                        size: 45,
                        color: Colors.black,
                      ),
                      onPressed: null),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: Text('Personalize',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w500)),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
