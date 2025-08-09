import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Developers extends StatelessWidget {
  const Developers({super.key});

  final String linkedInUrl =
      "https://www.linkedin.com/in/al-zahraa-elghandour-449620249?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app";

  Future<void> _launchURL() async {
    final Uri uri = Uri.parse(linkedInUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $linkedInUrl';
    }
  }

  final String linkedInUrl1 =
      "https://www.linkedin.com/in/menna-mohammed-a35ba4336?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app";

  Future<void> _launchURL1() async {
    final Uri uri = Uri.parse(linkedInUrl1);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $linkedInUrl1';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                SizedBox(width: 20),
                Icon(Icons.person_3_rounded, size: 80, color: Colors.amber),
                Column(
                  children: [
                    Text(
                      "AL-Zahraa Hassan Mohammed",
                      style: TextStyle(fontSize: 15),
                    ),
                    GestureDetector(
                      onTap: _launchURL,
                      child: Text(
                        "LinkedIn profile",
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(width: 20),
                Icon(Icons.person_3_rounded, size: 80, color: Colors.amber),
                Column(
                  children: [
                    Text(
                      "  Manna Allah Mohammed",
                      style: TextStyle(fontSize: 15),
                    ),
                    GestureDetector(
                      onTap: _launchURL1,
                      child: Text(
                        " LinkedIn profile",
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
