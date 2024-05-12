import 'package:contact_app/app.dart';
import 'package:contact_app/provider/contact_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ContactProvider(),
      child: const MyApp()));
}




