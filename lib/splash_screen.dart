import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'home_page.dart'; // Import the home_page.dart file
import 'login.dart'; // Import the login.dart file

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Set full screen mode
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    // Animation controller
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // Animation curve
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    // Start the animation
    _controller.forward();

    // Navigate to home or login after delay
    Timer(Duration(seconds: 3), () async {
      var box = await Hive.openBox("userBox");

      if (box.get("sudahLogin") == true) {
        Get.off(() => HomePage());
      } else {
        Get.off(() => LoginPage());
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue, // Change to your desired background color
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Your logo here
              Image.asset(
                'assets/SUKAMAJU.png', // Make sure you have your logo image in the assets directory
                width: 100,
                height: 100,
              ),
              SizedBox(height: 20),
              Text(
                'Pemesanan Ruang Studi UNSUKA',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
