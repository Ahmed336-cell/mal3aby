import 'package:cloud_firestore/cloud_firestore.dart';

class Pitch{
  String?pitchName;
  String? pitchGovernement;
  String ?address;
  String?mapLink;
  String?typeOfPitch;
  String?price;
  String?OwnerId;
  List<String>?imageList;
  String? pitchId;
  String?ownerName;
  String?phoneNumber;
  Pitch({this.pitchName, this.pitchGovernement, this.address, this.mapLink,
    this.typeOfPitch, this.price , this.OwnerId , this.imageList , this.pitchId,
  this.ownerName,this.phoneNumber
  });
  Map<String, dynamic> toMap() {
    return {
      'pitchName': pitchName,
      'pitchGovernement': pitchGovernement,
      'address': address,
      'mapLink': mapLink,
      'price': price,
      'typeOfPitch': typeOfPitch,
      'ownerId':OwnerId,
      'imageList':imageList,
      'pitchId':pitchId,
      'ownerName':ownerName,
      'phoneNumber':phoneNumber
    };
  }

  factory Pitch.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;

    if (data == null) {
      throw Exception("DocumentSnapshot data is null!");
    }

    return Pitch(
        pitchName: data['pitchName'],
        pitchGovernement: data['pitchGovernement'],
        address: data['address'],
        mapLink: data['mapLink'],
        typeOfPitch: data['typeOfPitch'],
        price: data['price'],
        OwnerId: data['ownerId'],
        imageList: (data['imageList'] as List<dynamic>).map<String>((image) => image.toString()).toList(),
        pitchId: data['pitchId'],
        phoneNumber: data['phoneNumber'],
      ownerName: data["ownerName"]
    );
  }


}
