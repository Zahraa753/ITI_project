import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("About"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),

            // Logo (icon-based)
            const Icon(
              Icons.account_circle,
              size: 100,
              color: Color(0xFFFEC500),
            ),
            const SizedBox(height: 20),

            // App name
            const Text(
              "My Products App",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            // Description
            const Text(
              "This app is designed to make your choises easier by providing our products "
              "and a smooth user experience. Developed with Flutter,BLoc and Firebase.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 30),

            // Contact
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.email, color: Color(0xFFFEC500)),
                SizedBox(width: 8),
                Text(
                  "Zahraahassan075@gmail.com",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
