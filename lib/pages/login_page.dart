import 'package:chat_application/auth/auth_service.dart';
import 'package:chat_application/components/custom_button.dart';
import 'package:chat_application/components/custom_textfield.dart';
import 'package:chat_application/pages/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key, this.onTap}) : super(key: key);


  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    void login(BuildContext context) async {
      //authentication
      final authService = AuthService();
      //try login
      try{
        await authService.signInWithEmailPassword(
            emailController.text, passwordController.text
        );
         Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
      }catch(e){
        //show error message
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(e.toString()))
        );
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

            const SizedBox(height: 30),
            //login button
            CustomButton(
              text: "Login",
              onTap:()=> login(context),
            ),

            //register now
            const SizedBox(height: 8),

            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text("Don't have an account ?",
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.primary,
                  )),
            
            InkWell(
              onTap: onTap,
              child: const Text(
                'Go to Register Page',
                style: TextStyle(
                  color: Colors.blue, // You can customize the text color
                  
                ),
              ),
            ),
            ]),
          ],
        ));
  }
}
