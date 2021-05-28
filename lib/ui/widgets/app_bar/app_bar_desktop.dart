import 'package:flutter/material.dart';
import 'package:hhf_next_gen/ui/widgets/nav_menu/nav_menu.dart';

class AppBarDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      //  elevation:0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            // TODO insert role specific navbar here
            child: NavMenu(),
            flex: 2,
          ),
          // Text('Home'),
          Row(
            children: [
              Row(
                children: [
                  // TODO read from provider
                  Text(
                    'Nasir Mehmood',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          // color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Billing Officer',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: 12, fontStyle: FontStyle.italic),
                  ),
                ],
              ),
              SizedBox(
                width: 4,
              ),
              Icon(
                Icons.account_circle,
                size: 35,
                color: Theme.of(context).primaryColor,
              ),
            ],
          ),
        ],
      ),
      // toolbarHeight: 100,
      elevation: 5,
    );
  }
}
