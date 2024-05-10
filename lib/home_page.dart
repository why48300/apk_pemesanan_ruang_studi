import 'package:flutter/material.dart';
import 'package:pemesanan_ruang_studi/home_pageLR.dart';
import 'home_screen.dart';
import 'riwayat_pemesanan.dart';
import 'profile_screen.dart';  // Pastikan ini mengarah ke file yang tepat

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/gambar/foto.jpg'), // Ganti dengan path gambar profil Anda
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Bagus Saputra', // Ganti dengan nama Anda
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profil'),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen())),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Beranda'),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage())),
            ),
            ListTile(
              leading: Icon(Icons.history),
              title: Text('Riwayat Pemesanan'),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => RiwayatPemesanan(bookings: []))),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HomePageLR())),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.indigo],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen())),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white, padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                child: Text('Pesan Ruang Studi', style: TextStyle(color: Colors.blue, fontSize: 18)),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => RiwayatPemesanan(bookings: []))),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white, padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                child: Text('Riwayat Pendaftaran', style: TextStyle(color: Colors.blue, fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
