import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(title: const Text("Profile"), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 90,
              foregroundColor: Colors.amber,
              backgroundImage: NetworkImage(
                "https://img.freepik.com/premium-vector/vector-cute-girl-cartoon-illustration-logo-design_1241361-117.jpg",
              ),
            ),

            const SizedBox(height: 20),

            // Show Firebase email
            Text(
              user?.email ?? "No email found",
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
