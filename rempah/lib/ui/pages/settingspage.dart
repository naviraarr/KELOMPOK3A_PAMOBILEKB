import 'package:flutter/material.dart';
import 'package:rempah/ui/pages/bantuan.dart';
import 'package:rempah/ui/pages/homepage.dart';
import 'package:rempah/ui/pages/profile.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7EAD1),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Pengaturan',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Color(0xFFFDF1E3),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF697954),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF7D1708),
          ),
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
              padding: const EdgeInsets.only(top: 20),
              child: ListView(
                children: [
                  ListTile(
                    leading: const Icon(
                      Icons.manage_accounts_rounded,
                      size: 30,
                    ),
                    title: const Text(
                      'Pengguna',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Profile()),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  ListTile(
                    leading: const Icon(
                      Icons.help_outlined,
                      size: 30,
                    ),
                    title: const Text(
                      'Pusat Bantuan',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BantuanDukungan()),
                      );
                    },
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
