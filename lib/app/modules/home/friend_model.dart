import 'package:cloud_firestore/cloud_firestore.dart';

class FriendModel{
  late String name;
  late String uid;
  late String profilePictureUrl;
  late GeoPoint? location;

  FriendModel();

  FriendModel? fromDocumentSnapshot (DocumentSnapshot snapshot){
    try{
      location = snapshot.get('location');
    }catch(e){
      print("ERRO: $e");
    }

    if(location != null){
      name = snapshot.get('name');
      uid = snapshot.id;
      profilePictureUrl = snapshot.get('profilePictureUrl');
      return this;
    }else{
      return null;
    }
  }

  Map<String, dynamic> toFirestore() {
    return {
      "name": name,
      "profilePictureUrl": profilePictureUrl,
      'location': location
    };
  }


}