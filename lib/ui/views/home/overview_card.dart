import 'package:flutter/material.dart';

class OverViewCard extends StatelessWidget {
  final String title;
  final String paramValue;
  final String units;

  const OverViewCard(
      {Key? key,
      required this.title,
      required this.paramValue,
      required this.units})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 120,
      child: Card(
        elevation: 10,
        margin: EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontWeight: FontWeight.w800),
              ),
              Text(
                paramValue,
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontWeight: FontWeight.w800),
              ),
              Text(
                units,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
