import 'package:flutter/material.dart';

class ContactFormScreen extends StatefulWidget {
  static const String routeName = '/contact_form';
  const ContactFormScreen({super.key});

  @override
  State<ContactFormScreen> createState() => _ContactFormScreenState();
}

class _ContactFormScreenState extends State<ContactFormScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("New contact Screen"),),
    );
  }
}
