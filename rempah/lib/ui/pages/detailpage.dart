import 'package:flutter/material.dart';

class Jahe extends StatelessWidget {
  const Jahe({super.key});

  @override
  Widget build(BuildContext context) {
    final responsif = MediaQuery.of(context);
    final lebar = responsif.size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFFBE7C6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFD2B48C),
        elevation: 0, // Menghilangkan bayangan AppBar
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF7D180E), // Warna panah merah
          ),
          onPressed: () {
            Navigator.pop(context); // Aksi kembali
          },
        ),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            color: const Color(0xFFD2B48C),
            width: lebar,
            height: 220,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 110),
              Center(
                child: Image.asset(
                  "assets/image/jahedp.png",
                  width: lebar * 0.6, // Lebar gambar 60% dari lebar layar
                  height: 231,
                ),
              ),
              const SizedBox(height: 15),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  "Jahe",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF7D1708),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  "Jahe adalah sejenis tanaman yang termasuk dalam keluarga Zingiberaceae. Tanaman ini memiliki aroma yang khas dan rasa yang pedas dan berdaging, serta daun yang panjang dan ramping. Jahe berasal dari Asia Tenggara dan telah menjadi bagian dari budaya dan tradisi di berbagai negara di dunia.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    color: Color(0xFF7D1708),
                  ),
                ),
              ),
              Spacer(),
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
        ],
      ),
    );
  }
}

class Kunyit extends StatelessWidget {
  const Kunyit({super.key});

  @override
  Widget build(BuildContext context) {
    final responsif = MediaQuery.of(context);
    final lebar = responsif.size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFFBE7C6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFD2B48C),
        elevation: 0, // Menghilangkan bayangan AppBar
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF7D180E), // Warna panah merah
          ),
          onPressed: () {
            Navigator.pop(context); // Aksi kembali
          },
        ),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            color: const Color(0xFFD2B48C),
            width: lebar,
            height: 220,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 90),
              Center(
                child: Image.asset(
                  "assets/image/kunyitdp.png",
                  width: lebar * 0.6, // Lebar gambar 60% dari lebar layar
                  height: 231,
                ),
              ),
              const SizedBox(height: 25),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  "Kunyit",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF7D1708),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  "Kunyit adalah tanaman herbal yang biasa digunakan sebagai bahan dalam memasak. Tanaman ini memiliki nama latin “Curcuma Longa” dan berasal dari keluarga Zingiberaceae. Kunyit Memiliki rasa dan aroma yang khas, serta warna yang kuning intens.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    color: Color(0xFF7D1708),
                  ),
                ),
              ),
              const Spacer(),
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
        ],
      ),
    );
  }
}

class Lengkuas extends StatelessWidget {
  const Lengkuas({super.key});

  @override
  Widget build(BuildContext context) {
    final responsif = MediaQuery.of(context);
    final lebar = responsif.size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFFBE7C6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFD2B48C),
        elevation: 0, // Menghilangkan bayangan AppBar
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF7D180E), // Warna panah merah
          ),
          onPressed: () {
            Navigator.pop(context); // Aksi kembali
          },
        ),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            color: const Color(0xFFD2B48C),
            width: lebar,
            height: 220,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 90),
              Center(
                child: Image.asset(
                  "assets/image/lengkuasdp.png",
                  width: lebar * 0.6, // Lebar gambar 60% dari lebar layar
                  height: 212,
                ),
              ),
              const SizedBox(height: 25),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  "Lengkuas",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF7D1708),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  "Lengkuas adalah tanaman yang berasal dari keluarga Zingiberaceae, yang sama dengan jahe, kunyit. Tanaman ini memiliki akar yang mirip dengan jahe, namun lebih keras dan memiliki aroma yang lebih tajam.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    color: Color(0xFF7D1708),
                  ),
                ),
              ),
              const Spacer(),
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
        ],
      ),
    );
  }
}

class Kencur extends StatelessWidget {
  const Kencur({super.key});

  @override
  Widget build(BuildContext context) {
    final responsif = MediaQuery.of(context);
    final lebar = responsif.size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFFBE7C6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFD2B48C),
        elevation: 0, // Menghilangkan bayangan AppBar
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF7D180E), // Warna panah merah
          ),
          onPressed: () {
            Navigator.pop(context); // Aksi kembali
          },
        ),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            color: const Color(0xFFD2B48C),
            width: lebar,
            height: 220,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 125),
              Center(
                child: Image.asset(
                  "assets/image/kencurdp.png",
                  width: lebar * 0.6, // Lebar gambar 60% dari lebar layar
                  height: 167,
                ),
              ),
              const SizedBox(height: 25),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  "Kencur",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF7D1708),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  "Kencur adalah tanaman herbal yang tumbuh subur di daerah tropis, terutama di Asia Tenggara dan India. Tanaman ini memiliki nama latin “Kaempferia Galanga”. Kencur memiliki aroma yang khas dan rasa pedas, sehingga sering digunakan sebagai penyedap makanan.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    color: Color(0xFF7D1708),
                  ),
                ),
              ),
              const Spacer(),
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
        ],
      ),
    );
  }
}
