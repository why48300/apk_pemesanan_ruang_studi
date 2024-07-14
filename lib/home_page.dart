import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'login.dart';
import 'home_screen.dart';
import 'profile_screen.dart'; // Import halaman profil
import 'riwayat_pemesanan.dart'; // Import halaman riwayat pemesanan

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 50),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                  title: Text('Nathaniel Ardiyan Putra',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(color: Colors.white)),
                  subtitle: Text('220103101',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: Colors.white54)),
                  trailing: const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(
                        'assets/Foto 2 - Adryan Nathanael, Penyanyi lagu Harapku. (Dok. Metronom Musik).jpg'),
                  ),
                ),
                const SizedBox(height: 30)
              ],
            ),
          ),
          Container(
            color: Theme.of(context).primaryColor,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(200))),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 40,
                mainAxisSpacing: 30,
                children: [
                  itemDashboard(
                      context,
                      'Setting',
                      CupertinoIcons.graph_circle,
                      Colors.green,
                      HomeScreen()), // Ganti dengan halaman Setting
                  itemDashboard(
                      context,
                      'Profil',
                      CupertinoIcons.person_2,
                      Colors.purple,
                      ProfileScreen()), // Ganti dengan halaman Profil
                  itemDashboard(
                      context,
                      'Riwayat Pesan',
                      CupertinoIcons.chat_bubble_2,
                      Colors.brown,
                      RiwayatPemesanan(
                          bookings: [])), // Ganti dengan halaman Riwayat Pesan
                  itemDashboard(
                      context,
                      'Logout',
                      CupertinoIcons.money_dollar_circle,
                      Colors.indigo,
                      HomePage()), // Ganti dengan fungsi logout atau halaman Logout
                  itemDashboard(
                      context,
                      'Pesan ruang',
                      CupertinoIcons.add_circled,
                      Colors.teal,
                      HomeScreen()), // Ganti dengan halaman Pesan Ruang
                ],
              ),
            ),
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }

  Widget itemDashboard(BuildContext context, String title, IconData iconData,
      Color background, Widget page) {
    return GestureDetector(
      onTap: () async {
        if (title == 'Logout') {
          var box = await Hive.openBox('userBox');
          await box.put("sudahLogin", false);
          Get.off(() => LoginPage());
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
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
                  blurRadius: 5)
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: background,
                  shape: BoxShape.circle,
              ),
                child: Icon(iconData, color: Colors.white)),
            const SizedBox(height: 8),
            Text(title.toUpperCase(),
                style: Theme.of(context).textTheme.titleMedium)
          ],
        ),
      ),
    );
  }
}
