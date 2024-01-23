import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String senderID;
  final String receiverID;
  final String senderEmail;
  final Timestamp timeStamp;
  final String message;

  Message({
    required this.senderID,
    required this.receiverID,
    required this.senderEmail,
    required this.timeStamp,
    required this.message,
  });
  

  //convert to a map
  Map<String,dynamic> toMap() {
    return {
      'senderID': senderID,
      'receiverID': receiverID,
      'senderEmail': senderEmail,
      'timeStamp': timeStamp,
      'message': message,
    };
    }
  
}
