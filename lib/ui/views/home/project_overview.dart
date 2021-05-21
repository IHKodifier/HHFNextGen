import 'package:flutter/material.dart';
import 'package:hhf_next_gen/ui/views/home/overview_card.dart';

class ProjectOverview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'ProjectOverview',
          style: Theme.of(context).textTheme.headline4,
        ),
        SizedBox(
          height: 20,
        ),
        Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.center,
          children: [
            OverViewCard(
              title: 'Donations to date',
              paramValue: '267,395,800',
              units: 'PKR',
            ),
            OverViewCard(
              title: 'Donations this year ',
              paramValue: '11,500,000',
              units: 'PKR',
            ),
            OverViewCard(
              title: 'Cases to date',
              paramValue: '11,587',
              units: 'cases',
            ),
            OverViewCard(
              title: 'Cases this year',
              paramValue: '542',
              units: 'cases',
            ),
            OverViewCard(
              title: 'Cases this month',
              paramValue: '37',
              units: 'PKR',
            ),
            OverViewCard(
              title: 'Payments this month',
              paramValue: '63,580',
              units: 'PKR',
            ),
            Container(
              width: 250,
              height: 120,
              child: Card(
                elevation: 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'add a  metric',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontWeight: FontWeight.w800),
                    ),
                    Icon(
                      Icons.add,
                      size: 50,
                    ),
                  ],
                ),
              ),
            ),
          
          ],
        ),
      ],
    );
  }
}
