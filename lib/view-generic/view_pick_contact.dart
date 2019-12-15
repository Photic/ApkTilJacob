import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';

class PickContact extends StatefulWidget {
  PickContact({Key key}) : super(key: key);

  @override
  _PickContactState createState() => _PickContactState();
}

class _PickContactState extends State<PickContact> {
  List<Contact> contacts = List<Contact>();

  Future<void> _getContacts() async {
    Iterable<Contact> contacts = await ContactsService.getContacts();
    setState(() {
      contacts.forEach((person) {
        this.contacts.add(person);
      });
    });
  }

  @override
  void initState() {
    _getContacts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        child: Stack(
          children: <Widget>[
            ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Text(contacts[index].displayName),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
