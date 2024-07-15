import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'auth_provider.dart';
import 'home_page.dart';
import 'register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var loadAuth = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          _buildBackground(),
          _buildWelcomeText(),
          _buildFormContainer(loadAuth),
        ],
      ),
    );
  }

  Widget _buildBackground() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 0, 170, 255),
      ),
    );
  }

  Widget _buildWelcomeText() {
    return const Padding(
      padding: EdgeInsets.only(top: 10.0, left: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image(
              image: AssetImage('assets/SUKAMAJU.png'),
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
    );
  }

  Widget _buildFormContainer(AuthProvider loadAuth) {
    return Padding(
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
                      height: MediaQuery.of(context).viewInsets.bottom == 0
                          ? 100
                          : 50),
                  _buildTextField(
                      controller: email,
                      label: 'Email',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Masukkan Email";
                        }
                        return null;
                      }),
                  _buildTextField(
                      controller: password,
                      label: 'Password',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Masukkan Password";
                        }
                        return null;
                      }),
                  const SizedBox(height: 10),
                  const SizedBox(height: 70),
                  _buildLoginButton(loadAuth),
                  const SizedBox(height: 40),
                  _buildSignupLink(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      {required TextEditingController controller,
      required String label,
      required String? Function(String?) validator}) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        label: Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 0, 191, 255),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton(AuthProvider loadAuth) {
    return GestureDetector(
      onTap: () {
        if (_formKey.currentState!.validate()) {
          loadAuth.login(email.text, password.text).then((success) {
            if (success) {
              Get.off(() => HomePage());
            } else {
              Get.snackbar("info", "gagal login");
            }
          });
        }
      },
      child: Container(
        height: 55,
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: const Color.fromARGB(255, 0, 170, 255),
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
    );
  }

  Widget _buildSignupLink() {
    return Align(
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
    );
  }
}
