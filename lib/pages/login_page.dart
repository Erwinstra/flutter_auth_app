// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:auth_app/components/my_button.dart';
import 'package:auth_app/components/my_textfield.dart';
import 'package:auth_app/components/square_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var showLoginPage = true;

  // error message function
  void errorMessage(String msg) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.red,
          title: Text(
            msg,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }

  void signUserIn() async {
    // loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );

    try {
      // firebase sign in method
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passController.text,
      );
      // pop the loading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // pop the loading circle
      Navigator.pop(context);

      // error message to user
      errorMessage('Invalid Email');

      // print error code
      print('error: ${e.code}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 10),

              // Icon App
              const Icon(
                Icons.redeem,
                size: 80,
              ),

              const SizedBox(height: 20),

              // Travelers! Welcome to Flashle
              const Text(
                'Travelers! Welcome to Flashle',
                style: TextStyle(fontSize: 20),
              ),

              const SizedBox(height: 20),

              // Input Email
              MyTextField(
                hintText: 'Email',
                controller: emailController,
                obsecureText: false,
              ),

              const SizedBox(height: 10),

              // Input Password
              MyTextField(
                hintText: 'Password',
                controller: passController,
                obsecureText: true,
              ),

              const SizedBox(height: 10),

              // Forgot Password?
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Sign In button
              MyButton(text: 'Sign In', onTap: signUserIn),

              const SizedBox(height: 20),

              // Or continue with
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text('Or continue with'),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              // Google & Apple Logo
              const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SquareTile(
                    imagePath: 'lib/images/google.png',
                  ),
                  SizedBox(width: 10),
                  SquareTile(
                    imagePath: 'lib/images/apple.png',
                  ),
                ],
              ),

              const SizedBox(height: 25),

              // Not a member? Register Now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Not a member?'),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      'Register now',
                      style: TextStyle(
                          color: Colors.cyan, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
