import 'package:flutter/material.dart';
import 'package:rempah/ui/pages/homepage.dart';

class Aboutapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF1E3),
      appBar: AppBar(
        backgroundColor: const Color(0xFF697954),
        title: const Text(
          'Tentang Aplikasi',
          style: TextStyle(
            color: Color(0xFFF7EAD1),
            fontFamily: 'Poppins',
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF7D1708)),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Center(
                    child: Image.asset('assets/image/ta.png'),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Tentang Aplikasi',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF7D1708),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Aplikasi Klasifikasi Rempah adalah aplikasi mobile yang dirancang untuk mempermudah pengguna dalam mengenali berbagai jenis rempah-rempah tradisional Indonesia.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Fitur Utama :',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF7D1708),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FeatureItem('Melihat informasi rempah-rempah.'),
                      FeatureItem('Scan rempah untuk identifikasi cepat.'),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Center(
                    child: Text(
                      'Aplikasi ini dibangun dan dikembangkan sebagai bagian dari tugas praktikum mobile yang mana dengan aplikasi ini harapan dapat membantu pengguna dalam mengenali dan mempelajari rempah-rempah khas Indonesia.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: const Color(0xFF697954),
            height: 60,
            width: double.infinity,
            child: const Center(
              child: Text(
                '© 2024 SpiceLens',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Color(0xFFFDF1E3),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FeatureItem extends StatelessWidget {
  final String text;

  FeatureItem(this.text);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '• ',
          style: TextStyle(fontSize: 14, color: Colors.black),
        ),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontFamily: 'Poppins',
            ),
          ),
        ),
      ],
    );
  }
}
