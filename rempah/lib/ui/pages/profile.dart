import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final TextEditingController _ctrlNama = TextEditingController();
  final TextEditingController _ctrlNoHP = TextEditingController();
  String? _selectedGender;

  @override
  void dispose() {
    _ctrlNama.dispose();
    _ctrlNoHP.dispose();
    super.dispose();
  }

  Future<void> _uploadData() async {
    if (_ctrlNama.text.isEmpty ||
        _ctrlNoHP.text.isEmpty ||
        _selectedGender == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Kolom Tidak Boleh Kosong")),
      );
      return;
    }

    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Pengguna Tidak Login")),
        );
        return;
      }

      final uid = user.uid;

      await FirebaseFirestore.instance
          .collection('personal_data')
          .doc(uid)
          .set({
        'name': _ctrlNama.text,
        'phone': _ctrlNoHP.text,
        'gender': _selectedGender,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Sukses Menyimpan Data")),
      );
    } catch (e) {
      print("Upload Data Error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Gagal Menyimpan Data: $e")),
      );
    }
  }

  Future<void> _loadData() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Pengguna Tidak Login")),
        );
        return;
      }

      final uid = user.uid;

      final doc = await FirebaseFirestore.instance
          .collection('personal_data')
          .doc(uid)
          .get();

      if (doc.exists) {
        final data = doc.data()!;
        setState(() {
          _ctrlNama.text = data['name'] ?? '';
          _ctrlNoHP.text = data['phone'] ?? '';
          _selectedGender = data['gender'];
        });
      }
    } catch (e) {
      print("Loading Data Error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Gagal Mengambil Data: $e")),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF697954),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF697954),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF7D1708)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'My Profile',
          style: TextStyle(color: Color(0xFFFDF1E3), fontFamily: 'Poppins'),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              color: const Color(0xFF697954),
              child: const Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Color(0xFFFDF1E3),
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: Color(0xFF7D1708),
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            Container(
              height: 590,
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Color(0xFFFDF1E3),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    "Nama",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF7D1708),
                      fontFamily: 'Poppins',
                    ),
                  ),
                  TextField(
                    controller: _ctrlNama,
                    style: const TextStyle(fontFamily: 'Poppins'),
                    decoration: const InputDecoration(
                      hintText: "Masukkan nama Anda",
                      hintStyle: TextStyle(
                        color: Color(0xFF7D1708),
                        fontFamily: 'Poppins',
                      ),
                      border: UnderlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Jenis Kelamin",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF7D1708),
                      fontFamily: 'Poppins',
                    ),
                  ),
                  Row(
                    children: [
                      Radio<String>(
                        value: "Laki-laki",
                        groupValue: _selectedGender,
                        onChanged: (value) {
                          setState(() {
                            _selectedGender = value;
                          });
                        },
                      ),
                      const Text("Laki-laki",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF7D1708),
                            fontFamily: 'Poppins',
                          )),
                      Radio<String>(
                        value: "Perempuan",
                        groupValue: _selectedGender,
                        onChanged: (value) {
                          setState(() {
                            _selectedGender = value;
                          });
                        },
                      ),
                      const Text("Perempuan",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF7D1708),
                            fontFamily: 'Poppins',
                          )),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Nomor HP",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF7D1708),
                      fontFamily: 'Poppins',
                    ),
                  ),
                  TextField(
                    controller: _ctrlNoHP,
                    style: const TextStyle(fontFamily: 'Poppins'),
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      hintText: "Masukkan nomor HP Anda",
                      hintStyle: TextStyle(
                        color: Color(0xFF7D1708),
                        fontFamily: 'Poppins',
                      ),
                      border: UnderlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: _uploadData,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF8E8C4),
                      ),
                      child: const Text("Simpan Data",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF7D1708),
                            fontFamily: 'Poppins',
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
