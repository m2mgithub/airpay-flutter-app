import 'package:flutter/material.dart';
import 'package:airpay/src/theme/index.dart';
import 'package:contacts_service/contacts_service.dart';

class ContactList extends StatefulWidget {
  const ContactList({ Key? key }) : super(key: key);

  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  List<Contact> contacts = [];

  @override
  void initState() {
    getAllContacts();
    super.initState();
  }

  getAllContacts() async {
    List<Contact> _contacts = (await ContactsService.getContacts(withThumbnails: false)).toList();
    setState(() {
      contacts = _contacts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: contacts.length,
      itemBuilder: (context, index) {
        var contact = contacts[index];
        return GestureDetector(
          onTap: () => Navigator.pushNamed(context, 'enter_amount'),
            child: ListTile(
            leading: CircleAvatar(
              backgroundColor: kOrangeMain,
              child: Text(
                contact.initials(),
                style: TextStyle(
                  color: Colors.white
                )
              )
            ),
            title: Text(
              '${contact.displayName}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.black87
              ),
            ),
            subtitle: Text(
              '0712345678',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
                color: Colors.black87
              ),
            ),
          ),
        );
      },
    );
  }
}