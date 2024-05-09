import 'package:contact_app/db/temp_db.dart';
import 'package:contact_app/models/contact_model.dart';
import 'package:flutter/material.dart';

class ContactFormScreen extends StatefulWidget {

  static const String routeName = '/contact_form';
   ContactFormScreen({super.key});

  @override
  State<ContactFormScreen> createState() => _ContactFormScreenState();
}

class _ContactFormScreenState extends State<ContactFormScreen> {
  final _nameTEcontroller = TextEditingController();
  final _mobileTEcontroller = TextEditingController();
  final _emailTEcontroller = TextEditingController();
  final _companyTEcontroller = TextEditingController();
  final _designationTEcontroller = TextEditingController();
  final _addressTEcontroller = TextEditingController();
  final _webTEcontroller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Contact"),
        backgroundColor: Colors.orange,
      ),
      body: Form(
        key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              TextFormField(
                validator: (value){
                  if(value == null || value.isEmpty){
                    return "Enter your name";
                  }
                  return null;
                },
                controller: _nameTEcontroller,
                decoration: const InputDecoration(
                  hintText: "Your Name",
                  prefixIcon: Icon(Icons.person)
                ),
              ),
              const SizedBox(height: 10,),
              TextFormField(
                validator: (value){
                  if(value == null || value.isEmpty){
                    return "Enter your mobile number";
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                controller: _mobileTEcontroller,
                decoration: const InputDecoration(
                    hintText: "Your mobile",
                    prefixIcon: Icon(Icons.call)
                ),
              ),
              const SizedBox(height: 10,),
              TextFormField(
                controller: _emailTEcontroller,
                decoration: const InputDecoration(
                    hintText: "Your email",
                    prefixIcon: Icon(Icons.email)
                ),
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 10,),
              TextFormField(
                controller: _designationTEcontroller,
                decoration: const InputDecoration(
                    hintText: "Your designation",
                    prefixIcon: Icon(Icons.bookmark)
                ),
              ),
              const SizedBox(height: 10,),
              TextFormField(
                controller: _addressTEcontroller,
                decoration: const InputDecoration(
                    hintText: "Your Address",
                    prefixIcon: Icon(Icons.location_on)
                ),
              ),
              const SizedBox(height: 10,),
              TextFormField(
                controller: _webTEcontroller,
                decoration: const InputDecoration(
                    hintText: "Your website",
                    prefixIcon: Icon(Icons.web)
                ),
              ),
              const SizedBox(height: 10,),
              TextFormField(
                controller: _companyTEcontroller,
                decoration: const InputDecoration(
                    hintText: "Your Company",
                    prefixIcon: Icon(Icons.construction)
                ),
              ),
              const SizedBox(height: 40,),
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white
                  ),
                  onPressed: (){
                    if(_formKey.currentState!.validate()){
                      final contact = ContactModel(
                        id: contactList.length + 1,
                          contactName: _nameTEcontroller.text,
                          mobile: _mobileTEcontroller.text,
                        address: _addressTEcontroller.text,
                        website: _webTEcontroller.text,
                        designation: _designationTEcontroller.text,
                        company: _companyTEcontroller.text
                      );
                      contactList.add(contact);
                      Navigator.pop(context);
                    }
                }, child: const Text("Save"),),
              )
            ],
      ),)
    );
  }
  @override
  void dispose() {
    _nameTEcontroller.dispose();
    _emailTEcontroller.dispose();
    _companyTEcontroller.dispose();
    _addressTEcontroller.dispose();
    _webTEcontroller.dispose();
    _mobileTEcontroller.dispose();
    _designationTEcontroller.dispose();
    super.dispose();
  }
}
