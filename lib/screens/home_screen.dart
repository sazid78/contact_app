import 'package:contact_app/db/temp_db.dart';
import 'package:contact_app/screens/contact_details_screen.dart';
import 'package:contact_app/screens/new_contact.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        onPressed: (){
        Navigator.pushNamed(context, ContactFormScreen.routeName);
      },child:  Icon(Icons.add,color: Colors.white,),),
        appBar: AppBar(
          title: Text(
            "Contact List",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.orange,
        ),
        body: ListView.builder(
            itemCount: contactList.length,
            itemBuilder: (context, index) {
              final contact = contactList[index];
              return ListTile(
                onTap: (){
                  Navigator.pushNamed(context, ContactDetailsScreen.routeName, arguments: contact);
                },
                title: Text(contact.contactName),
                trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(contact.favorite
                        ? Icons.favorite
                        : Icons.favorite_border)),
              );
            }));
  }
}
