import 'package:flutter/material.dart';
import 'login.dart';
import 'register.dart';

class HomePageLR extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image(
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            image: AssetImage('assets/1666851020-TiBti.jpg'),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/SUKAMAJU.png', // Path ke gambar/logo Anda
                  height: 100, // Sesuaikan dengan kebutuhan
                ),
                SizedBox(height: 20),
                Text(
                  'Pemesanan Ruang Studi\nUniversitas Sukamaju',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color:
                        Color.fromARGB(255, 255, 255, 255), // Warna teks putih
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(
                          255, 255, 255, 255), // Warna tombol
                      padding:
                          EdgeInsets.symmetric(vertical: 20), // Padding tombol
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10), // Membuat kotak
                      ),
                    ),
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Color.fromARGB(
                            255, 0, 200, 255), // Warna teks tombol
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(
                          255, 255, 255, 255), // Warna tombol
                      padding:
                          EdgeInsets.symmetric(vertical: 20), // Padding tombol
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10), // Membuat kotak
                      ),
                    ),
                    child: Text(
                      'Register',
                      style: TextStyle(
                        color: Color.fromARGB(
                            255, 0, 200, 255), // Warna teks tombol
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

