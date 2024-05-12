import 'package:contact_app/db/db_helper.dart';
import 'package:contact_app/models/contact_model.dart';
import 'package:flutter/material.dart';

class ContactProvider extends ChangeNotifier{
  List<ContactModel> contactList = [];
  final DbHelper helper = DbHelper();

  Future<int> insert(ContactModel contactModel) async{
    final rowId = await helper.insert(contactModel);
    contactModel.id = rowId;
    contactList.add(contactModel);
    notifyListeners();
    return rowId;
  }

  Future<void> getAllContacts() async{
    contactList = await helper.getAllContacts();
    notifyListeners();
  }

  Future<void> getAllFavoriteContacts() async{
    contactList = await helper.getAllFavoriteContacts();
    notifyListeners();
  }

  void deleteContact(int id) async{
    await helper.deleteContact(id);
  }
}