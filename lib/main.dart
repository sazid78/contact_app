import 'package:contact_app/screens/contact_details_screen.dart';
import 'package:contact_app/screens/home_screen.dart';
import 'package:contact_app/screens/new_contact.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Contact App",
      theme: ThemeData(
        colorSchemeSeed: Colors.orange,
        // primaryColor: Colors.orange,
        useMaterial3: true
      ),
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName : (context) => const HomeScreen(),
        ContactDetailsScreen.routeName : (context) => const ContactDetailsScreen(),
        ContactFormScreen.routeName : (context) => const ContactFormScreen(),
      },
    );
  }
}


