import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'home_page.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
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
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Image.asset(
                    'assets/gambar/LOGO-removebg-preview.png', // Ganti dengan path gambar logo Anda
                    width: 100,
                    height: 100,
                  ),
                ),
                // TextField untuk NIM
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Nim',
                    filled: true,
                    fillColor: Colors.white, // Warna latar belakang input
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Icon(Icons.person), // Icon NIM
                  ),
                ),
                SizedBox(height: 20),
                // TextField untuk Password
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
                
                ElevatedButton(
                    onPressed: () {
                      Get.to(() => HomePage());
                    },
                    child: Lottie.asset('assets/lottie/arrow.json',
                        height: 50, width: 50)),

                ElevatedButton(
                  onPressed: () {
                    // Navigasi ke home_page.dart saat tombol login ditekan
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => HomePage()),
                    // );
                    Get.to(() => HomePage());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // Warna tombol
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20), // Padding tombol
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.blue, // Warna teks tombol
                      fontSize: 18,
                    ),
                  ),
                ),

                GestureDetector(
                    onTap: () {
                      Get.to(() => HomePage());
                    },
                    child: Lottie.asset('assets/lottie/attention.json',
                        height: 50, width: 50)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}