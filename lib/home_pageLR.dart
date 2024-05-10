import 'package:flutter/material.dart';
import 'login.dart';
import 'register.dart';

class HomePageLR extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/gambar/LOGO---RIGHT-TEXT-removebg-preview.png', // Path ke gambar/logo AppBar Anda
              height: 50, // Sesuaikan dengan kebutuhan
            ),
            SizedBox(width: 8), // Spasi antara gambar dan teks
            Text('Login/Register'),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.indigo], // Warna latar belakang gradient
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/gambar/LOGO---BOTTOM-TEXT-removebg-preview.png', // Path ke gambar/logo Anda
                height: 100, // Sesuaikan dengan kebutuhan
                width: 1000, // Sesuaikan dengan kebutuhan
              ),
              SizedBox(height: 20),
              Text(
                'Sistem Pemesanan Ruang Studi\nUniversitas Duta Bangsa',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // Warna tombol
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20), // Padding tombol
                ),
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.blue, // Warna teks tombol
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // Warna tombol
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20), // Padding tombol
                ),
                child: Text(
                  'Register',
                  style: TextStyle(
                    color: Colors.blue, // Warna teks tombol
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}