import 'package:chat_application/auth/auth_service.dart';
import 'package:chat_application/components/custom_button.dart';
import 'package:chat_application/components/custom_textfield.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key, required this.onTap});

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmpasswordController = TextEditingController();
   
   void register(BuildContext context) async {
  //authentication
  final authService = AuthService();
  //try register
  if (passwordController.text == confirmpasswordController.text) {
    try {
      await authService.signUpWithEmailPassword(
          emailController.text, passwordController.text);
    } catch (e) {
      //show error message
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  } else {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Password does not match")));
  }
}


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
            Text("Let's create an account for you!",
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

            const SizedBox(height: 10),

            //confirm password
            CustomTextField(
                hintText: "Confirm Password",
                icon: Icons.key,
                obscureText: true,
                controller: confirmpasswordController),

            const SizedBox(height: 25),
            //login button
            CustomButton(
              text: "Register",
              onTap: () => register(context),
            ),

            //register now
            const SizedBox(height: 8),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account ?",
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.primary,
                    )),
                TextButton(
                  onPressed: () {
                    onTap();
                  },
                  child: const Text("LogIn",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                      )),
                ),
              ],
            ),
          ],
        ));
  }
}
