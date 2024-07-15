import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart'; // Tambahkan ini untuk CupertinoIcons
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login.dart';
import 'home_screen.dart';
import 'profile_screen.dart';
import 'riwayat_pemesanan.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue, // Mengganti warna menjadi biru
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAll(() => LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.blue, 
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 50),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                  title: Text(
                    'Bagas Saputra',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(color: Colors.white),
                  ),
                  subtitle: Text(
                    '220103005',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.white54),
                  ),
                  trailing: const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(
                        'assets/Foto 2 - Adryan Nathanael, Penyanyi lagu Harapku. (Dok. Metronom Musik).jpg'),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
          Container(
            color: Colors.blue, // Mengganti warna menjadi biru
            child: Container(
              height: MediaQuery.of(context).size.height -
                  200, // Adjust the height as needed
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(200),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      crossAxisSpacing: 40,
                      mainAxisSpacing: 30,
                      children: [
                        _itemDashboard(
                            context,
                            'Profil',
                            Icons.person,
                            Colors.purple,
                            ProfileScreen()), // Ganti dengan halaman Profil
                        _itemDashboard(context, 'Pesan ruang',
                            Icons.room_service, Colors.teal, HomeScreen()),
                        _itemDashboard(
                            context,
                            'Riwayat Pesan',
                            Icons.history,
                            Colors.brown,
                            RiwayatPemesanan()), // Ganti dengan halaman Riwayat Pesan
                        _itemDashboard(context, 'Logout', Icons.exit_to_app,
                            Colors.indigo,
                            _logout), // Fungsi logout
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _itemDashboard(BuildContext context, String title, IconData iconData,
      Color background, dynamic onTap) {
    return GestureDetector(
      onTap: () {
        if (onTap is Widget) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => onTap),
          );
        } else if (onTap is VoidCallback) {
          onTap();
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 5),
              color: Theme.of(context).primaryColor.withOpacity(.2),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: background,
                shape: BoxShape.circle,
              ),
              child: Icon(iconData, color: Colors.white),
            ),
            const SizedBox(height: 8),
            Text(title.toUpperCase(),
                style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ),
    );
  }
}
