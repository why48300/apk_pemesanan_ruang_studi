import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:pemesanan_ruang_studi/home_page.dart';
import 'package:pemesanan_ruang_studi/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () async {
      var box = await Hive.openBox("userBox");

      if (box.get("sudahLogin") == true) {
        Get.off(() => HomePage());
      } else {
        Get.off(() => LoginPage());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset('assets/lottie/attention.json', height: 50),
      ),
    );
  }
}
