import 'package:flutter/material.dart';
import 'package:rempah/ui/pages/settingspage.dart';

class BantuanDukungan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF1E3),
      appBar: AppBar(
        backgroundColor: const Color(0xFF697954),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF7D1708)),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SettingsPage()),
            );
          },
        ),
        title: const Text(
          'Pusat Bantuan',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFFFDF1E3),
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ContactItem(
                    icon: Icons.phone,
                    label: '+123-456-7890',
                  ),
                  const Divider(thickness: 1, color: Colors.black26),
                  ContactItem(
                    icon: Icons.email,
                    label: 'hello@reallygreatsite.com',
                  ),
                  const Divider(thickness: 1, color: Colors.black26),
                  ContactItem(
                    icon: Icons.favorite,
                    label: '@reallygreatsite',
                  ),
                  const Divider(thickness: 1, color: Colors.black26),
                  ContactItem(
                    icon: Icons.language,
                    label: 'www.reallygreatsite.com',
                  ),
                  const Divider(thickness: 1, color: Colors.black26),
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

class ContactItem extends StatelessWidget {
  final IconData icon;
  final String label;

  ContactItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 28,
          color: Colors.black87,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }
}
