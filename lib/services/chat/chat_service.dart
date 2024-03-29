import 'package:chat_application/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatService {
  //get instance of firestore and auth
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //get user stream

  /*
  List<Map<String,dynamic> = 
  [{
    'email':test@gmail.com,
    'id': ..
  },
  {
   'email' : text@gmail.com,
   'id': ..
  }]
*/

  Stream<List<Map<String, dynamic>>> getUsersStream() {
    return _firestore.collection("Users").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        //go through each individual user
        final user = doc.data();

        //return user
        return user;
      }).toList();
    });
  }

//send message
  Future<void> sendMessage(String recieverID, meassage) async {
    //get current user info
    final String currentUserID = _auth.currentUser!.uid;
    final String currentUserEmail = _auth.currentUser!.email!;
    final Timestamp timestamp = Timestamp.now();

    //create a new message
    Message newMessage = Message(
        senderID: currentUserID,
        receiverID: recieverID,
        senderEmail: currentUserEmail,
        timeStamp: timestamp,
        message: meassage);

    //construct chat roomId for the two users (sorted to ensure uniqueness)
    List<String> ids = [currentUserID, recieverID];
    ids.sort();
    String chatRoomID = ids.join('_');

    //add new message to database
    await _firestore
        .collection("chat_rooms")
        .doc(chatRoomID)
        .collection("messages")
        .add(newMessage.toMap());
  }

//get messages
  Stream<QuerySnapshot> getMessages(String userID, otherUserID) {
  // Construct a chatroom ID for two users
  List<String> ids = [userID, otherUserID];
  ids.sort();
  String chatRoomID = ids.join('_');

  return _firestore
      .collection("chat_rooms")
      .doc(chatRoomID)
      .collection("messages")
      .orderBy('timeStamp', descending: false)  // Update this line
      .snapshots();
}

}
