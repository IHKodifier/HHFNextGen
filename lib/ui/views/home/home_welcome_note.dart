import 'package:flutter/material.dart';

class HomeWelcomeNote extends StatelessWidget {
  const HomeWelcomeNote({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Welcome User!',
          style: Theme.of(context).textTheme.headline3,
        ),
        Text(
          'Today Looks a BUSY Day ahead',
          style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 20),
        ),
      ],
    );
  }
}
