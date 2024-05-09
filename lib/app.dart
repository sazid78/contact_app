import 'package:contact_app/screens/contact_details_screen.dart';
import 'package:contact_app/screens/home_screen.dart';
import 'package:contact_app/screens/new_contact.dart';
import 'package:flutter/material.dart';

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
          useMaterial3: true,
          inputDecorationTheme: InputDecorationTheme(
              hintStyle: TextStyle(
                  color: Colors.grey.shade500
              ),
              filled: true,
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10)
              )
          )
      ),
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName : (context) => const HomeScreen(),
        ContactDetailsScreen.routeName : (context) => const ContactDetailsScreen(),
        ContactFormScreen.routeName : (context) =>  ContactFormScreen(),
      },
    );
  }
}