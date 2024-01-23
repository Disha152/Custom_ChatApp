import 'package:chat_application/auth/auth_service.dart';
import 'package:chat_application/chat/chat_service.dart';
import 'package:chat_application/components/custom_drawer.dart';
import 'package:chat_application/components/user_tile.dart';
import 'package:chat_application/pages/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key});

  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  void logout() {
    // Use the already created instance of AuthService
    _authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
            // Logout button
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
      drawer: const CustomDrawer(),
      body: _buildUserList()
    );
  }

  // Build a list of users except for the current logged-in user
  Widget _buildUserList() {
    return StreamBuilder<List<Map<String, dynamic>>>(
      stream: _chatService.getUsersStream(),
      builder: (context, snapshot) {
        // Error
        if (snapshot.hasError) {
          return const Text("Error");
        }
        // Loading...
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading...");
        }
        // Return ListView
        List<Map<String, dynamic>>? users = snapshot.data;
        return ListView(
          children: users!
              .map<Widget>((userData) => _buildUserListItem(userData, context))
              .toList(),
        );
      },
    );
  }

  // Build individual list tile for user
  Widget _buildUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    // Display all users except the current user
    return UserTile(
      text: userData["email"],
      onTap: () {
        // Tapped on a user -> go to chat page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChatPage(receiveEmail: userData["email"],)),
        );
      },
    );
  }
}