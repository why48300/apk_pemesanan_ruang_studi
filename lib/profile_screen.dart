import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
        elevation: 0, 
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.indigo],
          ),
        ),
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20),
                child: Card(
                elevation: 4,  
                  child: Column(
                    children: <Widget>[
                  SizedBox(height: 20),
                    CircleAvatar(
                    radius: 50,
                      backgroundImage: AssetImage('assets/gambar/foto.jpg'), 
                  ),
                  SizedBox(height: 10),
                  
                      ListTile(
                        leading: Icon(Icons.person, color: Colors.blue),
                      title: Text('Nama: Bagus Saputra',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.credit_card, color: Colors.blue),
                      title: Text('NIM: 220103100',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.class_, color: Colors.blue),
                      title: Text('Kelas: TI22A3',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.school, color: Colors.blue),
                      title: Text('Program Studi: S1-Teknik Informatika',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                    SizedBox(height: 20), 
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Implement your edit profile logic here
                    print('Edit profile tapped!');
                  },
                  style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.blue, 
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  ),
                  child: Text('Edit Profile'),
                ),
              ),
              SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

