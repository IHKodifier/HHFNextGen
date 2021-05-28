import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class JobInbox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 900,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(4),
            child: Card(
              color: Colors.white70,
              child: ListTile(
                title: Text('Setup appointment for interview'),
                subtitle: Text('Noreen bibi'),
                leading: Icon(
                  Icons.perm_contact_calendar,
                  size: 55,
                  color: Theme.of(context).primaryColor,
                ),
                trailing: Text('27 seconds ago'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text('Setup appointment for interview'),
              subtitle: Text('Kiramat ullah'),
              leading: Icon(
                Icons.perm_contact_calendar,
                size: 55,
                color: Theme.of(context).primaryColor,
              ),
              trailing: Text('35 m ago'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text('Setup appointment for interview'),
              subtitle: Text('Noor gul '),
              leading: Icon(
                Icons.perm_contact_calendar,
                size: 55,
                color: Theme.of(context).primaryColor,
              ),
              trailing: Text('4 h ago'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text('Setup appointment for interview'),
              subtitle: Text('Nazir Mughal '),
              leading: Icon(
                Icons.perm_contact_calendar,
                size: 55,
                color: Theme.of(context).primaryColor,
              ),
              trailing: Text('2 d ago'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text('Setup appointment for interview'),
              subtitle: Text('Sakina Bibi'),
              leading: Icon(
                Icons.perm_contact_calendar,
                size: 55,
                color: Theme.of(context).primaryColor,
              ),
              trailing: Text('11 d ago'),
            ),
          ),
        ],
      ),
    );
  }
}
