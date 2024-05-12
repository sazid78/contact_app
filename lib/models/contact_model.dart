const String tableContact = "tbl_contact";
const String tblContactColId = "id";
const String tblContactColName = "name";
const String tblContactColMobile = "mobile";
const String tblContactColEmail = "email";
const String tblContactColAddress = "address";
const String tblContactColWebsite = "website";
const String tblContactColImage = "image";
const String tblContactColCompany = "company";
const String tblContactColDesignation = "designation";
const String tblContactColFavorite = "favorite";

class ContactModel {
  int id;
  String contactName;
  String mobile;
  String email;
  String address;
  String website;
  String image;
  String company;
  String designation;
  bool favorite;

  ContactModel(
      {this.id = -1,
      required this.contactName,
      required this.mobile,
      this.email = "",
      this.address = "",
      this.website = "",
      this.image = "images/person.png",
      this.company = "",
      this.favorite = false,
      this.designation = ""});

  factory ContactModel.fromMap(Map<String, dynamic> map) => ContactModel(
        contactName: map[tblContactColName],
        mobile: map[tblContactColMobile],
        id: map[tblContactColId],
        email: map[tblContactColEmail],
        address: map[tblContactColAddress],
        website: map[tblContactColWebsite],
        designation: map[tblContactColDesignation],
        company: map[tblContactColCompany],
        image: map[tblContactColImage],
        favorite: map[tblContactColFavorite] == 0 ? false : true,
      );

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      tblContactColName: contactName,
      tblContactColMobile: mobile,
      tblContactColEmail: email,
      tblContactColAddress: address,
      tblContactColDesignation: designation,
      tblContactColWebsite: website,
      tblContactColFavorite: favorite ? 1 : 0,
      tblContactColImage: image,
      tblContactColCompany: company
    };
    if (id > 0) {
      map[tblContactColId] = id;
    }
    return map;
  }
}
