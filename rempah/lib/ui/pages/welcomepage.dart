import 'package:flutter/material.dart';
import 'package:rempah/ui/pages/signup.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF3DD),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'WEL',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 48,
                        color: Color(0xFFC2771C),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: 'COME',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 48,
                        color: Color(0xFF7D1708),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUp()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                backgroundColor: const Color(0xFFBFA373),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'GET STARTED!',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 13,
                  color: Color(0xFF7D1708),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
