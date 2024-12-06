import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rempah/controller.dart';
import 'package:rempah/firebase_options.dart';
import 'package:rempah/ui/pages/homepage.dart';
import 'package:rempah/ui/pages/scanpage.dart';
import 'package:rempah/ui/pages/signin.dart';
import 'package:rempah/ui/pages/signup.dart';
import 'package:rempah/ui/pages/welcomepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PredictionProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const AuthGate(),
        routes: {
          '/welcome': (context) => const WelcomePage(),
          '/signup': (context) => const SignUp(),
          '/home': (context) => const HomePage(),
          '/login': (context) => const SignIn(),
          '/scan': (context) => const ScanPage(),
        },
      ),
    );
  }
}

/// Widget untuk memantau autentikasi
class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Tampilkan layar loading saat memeriksa status autentikasi
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasData) {
          return const HomePage();
        }
        return const WelcomePage();
      },
    );
  }
}
