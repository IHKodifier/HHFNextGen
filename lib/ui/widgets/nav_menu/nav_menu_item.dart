import 'package:flutter/material.dart';

class NavMenuItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final String routeName;

  const NavMenuItem({
    Key? key,
    required this.title,
    required this.icon,
    required this.routeName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       Icon(icon,color: Theme.of(context).primaryColor,
       size: 30,),
        // Text(title, style: Theme.of(context).textTheme.subtitle2),
        
      ],
    );
  }
}
