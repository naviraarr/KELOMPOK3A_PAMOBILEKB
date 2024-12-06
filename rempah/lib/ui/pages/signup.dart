import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rempah/provider/auth.dart';
import 'package:rempah/ui/pages/signin.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _loading = false;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _ctrlEmail = TextEditingController();
  final TextEditingController _ctrlUsername = TextEditingController();
  final TextEditingController _ctrlPassword = TextEditingController();

  handleSubmit() async {
    if (!_formKey.currentState!.validate()) return;
    final email = _ctrlEmail.value.text;
    final username = _ctrlUsername.value.text;
    final password = _ctrlPassword.value.text;
    setState(() => _loading = true);
    try {
      await Auth().regis(email, password, username);
      setState(() => _loading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: const Text(
            'Registrasi berhasil! Silakan login.',
            style: TextStyle(
              fontFamily: 'Poppins',
            ),
          ),
        ),
      );
      Navigator.pushReplacementNamed(context, '/login');
    } on FirebaseAuthException catch (e) {
      setState(() => _loading = false);
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text(
            'Kata Sandi Terlalu Lemah.',
            style: TextStyle(
              fontFamily: 'Poppins',
            ),
          )),
        );
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Email Sudah Terdaftar.',
              style: TextStyle(
                fontFamily: 'Poppins',
              ),
            ),
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF3DD),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                child: Image.asset(
                  'assets/image/image-1.png',
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      'SIGN UP',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF7D1708),
                      ),
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      controller: _ctrlEmail,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Silakan Masukkan Email Anda';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFFD2B48C),
                        hintText: 'Email',
                        hintStyle: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                        ),
                        suffixIcon:
                            const Icon(Icons.email, color: Color(0xFF7D1708)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                        errorStyle: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: _ctrlUsername,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Silakan Masukkan Username Anda';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFFD2B48C),
                        hintText: 'Username',
                        hintStyle: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                        ),
                        suffixIcon: const Icon(Icons.person_sharp,
                            color: Color(0xFF7D1708)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                        errorStyle: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: _ctrlPassword,
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Silakan Masukkan Password Anda';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFFD2B48C),
                        hintText: 'Password',
                        hintStyle: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                        ),
                        suffixIcon:
                            const Icon(Icons.lock, color: Color(0xFF7D1708)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                        errorStyle: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 15),
                    ElevatedButton(
                      onPressed: () => handleSubmit(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orangeAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                      ),
                      child: _loading
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                          : const Text(
                              "Sign Up",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Color(0xFF7D1708),
                              ),
                            ),
                    ),
                    const SizedBox(height: 15),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignIn()),
                        );
                      },
                      child: const Text(
                        "Already have an account? Login.",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Color(0xFF7D1708),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
