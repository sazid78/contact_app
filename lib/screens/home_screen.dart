import 'package:contact_app/provider/contact_provider.dart';
import 'package:contact_app/screens/contact_details_screen.dart';
import 'package:contact_app/screens/new_contact.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  bool isFirst = true;

  @override
  void didChangeDependencies() {
    if(isFirst){
      Provider.of<ContactProvider>(context,listen: false).getAllContacts();
    }
    isFirst = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          setState(() {
            selectedIndex = index;
          });
          _getContacts();
        },
        currentIndex: selectedIndex,
        selectedItemColor: Colors.white,
        backgroundColor: Colors.orange,
          items: const [
             BottomNavigationBarItem(icon: Icon(Icons.person),label: "All"),
            BottomNavigationBarItem(icon: Icon(Icons.favorite),label: "Favorite"),
          ]
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Consumer<ContactProvider>(
        builder: (context, provider, child) => FloatingActionButton(
          backgroundColor: Colors.orange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          onPressed: ()  {
            Navigator.pushNamed(context, ContactFormScreen.routeName);
        },child:  const Icon(Icons.add,color: Colors.white,),),
      ),
        appBar: AppBar(
          title: const Text(
            "Contact List",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.orange,
        ),
        body: Consumer<ContactProvider>(
          builder:(context, provider, child) => ListView.builder(
              itemCount: provider.contactList.length,
              itemBuilder: (context, index) {
                final contact = provider.contactList[index];
                return Dismissible(
                  key: UniqueKey(),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    padding: EdgeInsets.only(right: 20),
                    color: Colors.red,
                    child: const Icon(Icons.delete,color: Colors.white,),
                  ),
                  confirmDismiss: showConfirmationDialog,
                  onDismissed: (_){
                    provider.deleteContact(contact.id);
                  },
                  child: ListTile(
                    onTap: (){
                      Navigator.pushNamed(context, ContactDetailsScreen.routeName, arguments: contact);
                    },
                    title: Text(contact.contactName),
                    trailing: IconButton(
                        onPressed: () async {
                          final value = contact.favorite ? 0 : 1;
                        },
                        icon: Icon(contact.favorite
                            ? Icons.favorite
                            : Icons.favorite_border),color: Colors.orange,),
                  ),
                );
              }),
        ));
  }

  void _getContacts()  {
    if(selectedIndex == 0){
      Provider.of<ContactProvider>(context,listen: false).getAllContacts();
    } else{
      Provider.of<ContactProvider>(context,listen: false).getAllFavoriteContacts();
    }
  }

  Future<bool?> showConfirmationDialog(DismissDirection direction){
    return showDialog(context: context, builder: (context) => AlertDialog(
      title: const Text("Delete Contact"),
      content: Text("Are you sure to delete this content?"),
      actions: [
        OutlinedButton(onPressed: (){
          Navigator.pop(context,false);
        }, child: Text("NO")),
        OutlinedButton(onPressed: (){
          Navigator.pop(context,true);
        }, child: Text("YES"))
      ],
    ));
  }
}
