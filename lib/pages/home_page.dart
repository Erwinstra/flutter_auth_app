import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var user = FirebaseAuth.instance.currentUser!.email;

    return Scaffold(
      appBar: AppBar(
        leading: RotatedBox(
          quarterTurns: 2,
          child: IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
          ),
        ),
        backgroundColor: Colors.cyan,
      ),
      body: Center(
        child: Text(
          'LOGGED IN AS: $user',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
