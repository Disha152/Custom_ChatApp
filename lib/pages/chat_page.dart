import 'package:chat_application/auth/auth_service.dart';
import 'package:chat_application/components/custom_textfield.dart';
import 'package:chat_application/services/chat/chat_service.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatPage extends StatelessWidget {
  // ... (your existing code)
  final String receiveEmail;
  final String receiverID;
  ChatPage({super.key, required this.receiveEmail, required this.receiverID});

  //text controller
  final TextEditingController _messageController = TextEditingController();

  //chat and auth srvices
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  //send message
  void sendMessage() async {
    //if there is something inside the textfield
    if (_messageController.text.isNotEmpty) {
      //send the message

      await _chatService.sendMessage(receiverID, _messageController.text);

      //clear the controller
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(receiveEmail)),
      body: Column(
        children: [
          // Display all messages using ListView.builder
          Expanded(
            child: _buildMessageList(),
          ),
          // User input
          _buildUserInput(),
        ],
      ),
    );
  }

  Widget _buildMessageList() {
    if (_authService.getCurrentUser() != null) {
      String senderID = _authService.getCurrentUser()!.uid;

      return StreamBuilder(
        stream: _chatService.getMessages(receiverID, senderID),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("Error");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // Use ListView.builder for dynamic message list
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              return _buildMessageItem(snapshot.data!.docs[index]);
            },
          );
        },
      );
    } else {
      return const Text("User not authenticated");
    }
  }

  Widget _buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    // Style each message using a Card widget
    //is current user
    bool isCurrentUser = data['senderID'] == _authService.getCurrentUser()!.uid;

    var alignment =
        isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;
    return Container(
      alignment :alignment,
      child: Column(
        crossAxisAlignment: isCurrentUser ? CrossAxisAlignment.end: CrossAxisAlignment.start,
        children: [
          
          Card(
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                data["message"],
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserInput() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              // Add a background color
              color: Colors.grey[300],
            ),
            child: CustomTextField(
              controller: _messageController,
              hintText: "Type a message",
              obscureText: false,
              icon: Icons.done_all_outlined,
            ),
          ),
        ),
        IconButton(
          onPressed: () => sendMessage(),
          icon: Icon(
            Icons.send,
            color: Colors.grey[800],
          ),
        ),
      ],
    );
  }
}
