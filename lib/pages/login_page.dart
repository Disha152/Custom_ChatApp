import 'package:chat_application/components/custom_textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(Icons.message,
                size: 60, color: Theme.of(context).colorScheme.primary),

            const SizedBox(height: 10),

            //welcome back message
            Text("Welcome,you have been missed !",
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.primary,
                )),

            const SizedBox(height: 25),

            //email textfield
            CustomTextField(
                hintText: "Email Address",
                icon: Icons.email,
                obscureText: false,
                controller: emailController),

            const SizedBox(height: 10),

            //password textfield
            CustomTextField(
                hintText: "Password",
                icon: Icons.key,
                obscureText: true,
                controller: passwordController),

            //login button

            //register now
          ],
        ));
  }
}
