import 'package:flutter/material.dart';
import 'package:rempah/ui/pages/homepage.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DeveloperTeamPage(),
    );
  }
}

class DeveloperTeamPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF1E3),
      appBar: AppBar(
        backgroundColor: const Color(0xFF697954),
        title: const Text(
          'Tentang Pengembang',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Color(0xFFF7EAD1),
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
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                  const Text(
                    'TIM PENGEMBANG',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF7D1708),
                    ),
                  ),
                  const Text(
                    'KELOMPOK 3',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: [
                        DeveloperCard(
                          name: "Navira Arditha Aulia",
                          id: "2209106010",
                          imageUrl: 'assets/image/navira.png',
                        ),
                        DeveloperCard(
                          name: "Aprisa Idma Mutiara",
                          id: "2209106001",
                          imageUrl: 'assets/image/aprisa.jpg',
                        ),
                        DeveloperCard(
                          name: "Narupa Rangga Goroguta",
                          id: "2209106004",
                          imageUrl: 'assets/image/narupa.jpg',
                        ),
                        DeveloperCard(
                          name: "Juniver Veronika Lili",
                          id: "2209106013",
                          imageUrl: 'assets/image/juni.jpg',
                        ),
                      ],
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

class DeveloperCard extends StatelessWidget {
  final String name;
  final String id;
  final String? imageUrl;

  DeveloperCard({required this.name, required this.id, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey.shade300,
          backgroundImage: imageUrl != null ? AssetImage(imageUrl!) : null,
          child: imageUrl == null
              ? Icon(Icons.person, size: 40, color: Colors.grey.shade600)
              : null,
        ),
        const SizedBox(height: 8),
        Text(
          name,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        Text(
          id,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black54,
            fontFamily: 'Poppins',
          ),
        ),
      ],
    );
  }
}
