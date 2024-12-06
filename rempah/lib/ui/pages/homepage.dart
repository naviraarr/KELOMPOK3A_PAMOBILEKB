import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rempah/ui/pages/about.dart';
import 'package:rempah/ui/pages/aboutus.dart';
import 'package:rempah/ui/pages/detailpage.dart';
import 'package:rempah/ui/pages/scanpage.dart';
import 'package:rempah/ui/pages/settingspage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeContent(),
    ScanPage(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8E8C4),
      body: _pages[_currentIndex],
      bottomNavigationBar:
          _currentIndex == 0 ? _buildBottomNavigationBar() : null,
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          backgroundColor: const Color(0xFF697954),
          unselectedItemColor: Colors.white,
          selectedItemColor: const Color(0xFFC1A276),
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Color(0xFF7D1708)),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.document_scanner, color: Color(0xFF7D1708)),
              label: 'Scan',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings, color: Color(0xFF7D1708)),
              label: 'Pengaturan',
            ),
          ],
          selectedLabelStyle: const TextStyle(
            fontFamily: 'Poppins',
          ),
          unselectedLabelStyle: const TextStyle(
            fontFamily: 'Poppins',
          ),
        ),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return const Scaffold(
        body: Center(child: Text('Tidak Ditemukan User')),
      );
    }

    final userRef =
        FirebaseFirestore.instance.collection('users').doc(user.uid);

    return FutureBuilder<DocumentSnapshot>(
      future: userRef.get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data == null) {
          return const Center(child: Text('Data User Tidak Ditemukan'));
        }

        var userData = snapshot.data!;
        String userName = userData['username'] ?? 'User';
        String userEmail = userData['email'] ?? 'Email Tidak Tersedia';

        return Scaffold(
          backgroundColor: const Color(0xFFF8E8C4),
          appBar: AppBar(
            backgroundColor: const Color(0xFFF8E8C4),
            elevation: 0,
            leading: Builder(
              builder: (context) => IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: Color(0xFF7D1708),
                  size: 30,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.emoji_people_sharp,
                  color: Color(0xFF7D1708),
                  size: 25,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DeveloperTeamPage(),
                    ),
                  );
                },
              ),
            ],
          ),
          drawer: Drawer(
            backgroundColor: const Color(0xFFF7EAD1),
            child: Column(
              children: [
                UserAccountsDrawerHeader(
                  currentAccountPicture: const CircleAvatar(
                    radius: 50,
                    backgroundColor: Color(0xFFFDF1E3),
                    child: Icon(
                      Icons.person,
                      size: 40,
                      color: Color(0xFF7D1708),
                    ),
                  ),
                  accountName: Text(
                    userName,
                    style: const TextStyle(fontFamily: 'Poppins'),
                  ),
                  accountEmail: Text(
                    userEmail,
                    style: const TextStyle(fontFamily: 'Poppins'),
                  ),
                  decoration: const BoxDecoration(color: Color(0xFF697954)),
                ),
                ListTile(
                  leading: const Icon(Icons.error_outline),
                  title: const Text(
                    'Tentang Aplikasi',
                    style: TextStyle(fontFamily: 'Poppins'),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Aboutapp()),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text(
                    'Keluar',
                    style: TextStyle(fontFamily: 'Poppins'),
                  ),
                  onTap: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.of(context).pushReplacementNamed('/login');
                  },
                ),
              ],
            ),
          ),
          body: Column(
            children: [
              const SizedBox(height: 10),
              Container(
                width: MediaQuery.of(context).size.width,
                color: const Color(0xFFC1A276),
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi, $userName',
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF7D1708),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Temukan Keajaiban Rempah Nusantara dan Dunia, Semua dalam Genggaman Anda!',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        color: Color(0xFF7D1708),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  padding: const EdgeInsets.all(16.0),
                  children: [
                    buildItemCard(
                      context,
                      'Jahe',
                      'assets/image/jahe.png',
                      const Jahe(),
                    ),
                    buildItemCard(
                      context,
                      'Kunyit',
                      'assets/image/kunyit.png',
                      const Kunyit(),
                    ),
                    buildItemCard(
                      context,
                      'Lengkuas',
                      'assets/image/lengkuas.png',
                      Lengkuas(),
                    ),
                    buildItemCard(
                      context,
                      'Kencur',
                      'assets/image/kencur.png',
                      Kencur(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildItemCard(BuildContext context, String title, String imagePath,
      [Widget? navigationTarget]) {
    return GestureDetector(
      onTap: () {
        if (navigationTarget != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => navigationTarget),
          );
        }
      },
      child: Card(
        elevation: 2,
        color: const Color(0xFFC1A276),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              height: 80,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                color: Color(0xFF7D1708),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
