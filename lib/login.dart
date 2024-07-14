import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'home_page.dart'; // Import halaman home_page.dart
import 'register.dart'; // Import halaman register.dart

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _nimController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _login() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      var box = await Hive.openBox('userBox');

      if (_nimController.text == "123" && _passwordController.text == "123") {
        Get.off(() => HomePage());
        box.put('sudahLogin', true);
      } else {
        Get.snackbar("info", "gagal login");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 0, 170, 255),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10.0, left: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Tambahkan gambar logo di sini
                Center(
                  child: Image(
                    image: AssetImage(
                        'assets/SUKAMAJU.png'), // Ganti dengan path gambar logo Anda
                    width: 100,
                    height: 100,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Selamat Datang Kembali',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200.0),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color: Colors.white,
              ),
              height: double.infinity,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(
                            height:
                                MediaQuery.of(context).viewInsets.bottom == 0
                                    ? 100
                                    : 50),
                        TextFormField(
                          controller: _nimController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Masukkan NIM";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            label: Text(
                              'Nomor Induk Mahasiswa',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 0, 191, 255),
                              ),
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: _passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Masukkan Password";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            label: Text(
                              'Password',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 0, 195, 255),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const SizedBox(height: 70),
                        GestureDetector(
                          onTap: () {
                            // Navigasi ke halaman HomePage
                            _login();
                          },
                          child: Container(
                            height: 55,
                            width: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Color.fromARGB(255, 0, 170, 255),
                            ),
                            child: const Center(
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 80),
                        Align(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Don't have account?",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  // Navigasi ke halaman RegisterPage
                                  Get.to(() => RegisterPage());
                                },
                                child: const Text(
                                  "Sign up",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
