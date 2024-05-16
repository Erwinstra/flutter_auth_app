// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:auth_app/components/my_button.dart';
import 'package:auth_app/components/my_textfield.dart';
import 'package:auth_app/components/square_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var confirmPassController = TextEditingController();

  void errorMessage(String msg) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.red,
          title: Text(
            msg,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }

  void signUserUp() async {
    if (passController.text == confirmPassController.text) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passController.text,
      );
    } else {
      errorMessage('Password doesn\'t match!');
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
                Icons.energy_savings_leaf_outlined,
                size: 80,
              ),

              const SizedBox(height: 10),

              // Travelers! Let's create an ID for You!
              const Text(
                'Travelers! Let\'s create an ID for You!',
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

              // Input Confirm Password
              MyTextField(
                hintText: 'Confirm Password',
                controller: confirmPassController,
                obsecureText: true,
              ),

              const SizedBox(height: 20),

              // Sign Up button
              MyButton(text: 'Sign Up', onTap: signUserUp),

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

              // Already have an account? Login Here
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account?'),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      'Login Here',
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
