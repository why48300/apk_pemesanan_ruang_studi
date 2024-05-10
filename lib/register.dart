import 'package:flutter/material.dart';
import 'package:pemesanan_ruang_studi/home_pageLR.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
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
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // TextField untuk Nama Lengkap
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Nama Lengkap',
                    filled: true,
                    fillColor: Colors.white, // Warna latar belakang input
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Icon(Icons.person), // Icon Nama Lengkap
                  ),
                ),
                SizedBox(height: 20),
                // TextField untuk NIM
                TextField(
                  decoration: InputDecoration(
                    labelText: 'NIM',
                    filled: true,
                    fillColor: Colors.white, // Warna latar belakang input
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Icon(Icons.credit_card), // Icon NIM
                  ),
                ),
                SizedBox(height: 20),

                TextField(
                  decoration: InputDecoration(
                    labelText: 'Kelas',
                    filled: true,
                    fillColor: Colors.white, // Warna latar belakang input
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Icon(Icons.class_), // Icon NIM
                  ),
                ),
                SizedBox(height: 20),
                
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Prodi',
                    filled: true,
                    fillColor: Colors.white, // Warna latar belakang input
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Icon(Icons.school), // Icon NIM
                  ),
                ),
                SizedBox(height: 20),

                TextField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    filled: true,
                    fillColor: Colors.white, // Warna latar belakang input
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Icon(Icons.lock), // Icon Password
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 20),
                // Tombol Register
                ElevatedButton(
                  onPressed: () {
                    // Implementasi logika pendaftaran di sini
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePageLR()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // Warna tombol
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20), // Padding tombol
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
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
      ),
    );
  }
}

