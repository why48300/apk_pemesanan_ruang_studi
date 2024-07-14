import 'package:flutter/material.dart';
import 'package:pemesanan_ruang_studi/pesan_ruang.dart';
import 'room.dart';

class BookingScreen extends StatelessWidget {
  final Room room;
  final int index;

  BookingScreen({required this.room, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pesan ${room.name}'),
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
              Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (index == 0 || index == 2)
                      ClipRRect(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(10)),
                        child: Image.asset(
                          index == 0
                              ? 'assets/Ruang_.jpg'
                              : 'assets/Ruang2.jpg',
                          height: 150,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.room, color: Colors.blue),
                              SizedBox(width: 10),
                              Text(
                                room.name,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(Icons.group, color: Colors.blue),
                              SizedBox(width: 10),
                              Text(
                                'Kapasitas: ${room.capacity} orang',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(Icons.chair, color: Colors.blue),
                              SizedBox(width: 10),
                              Text(
                                'Jumlah Kursi: ${room.chairs}',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(Icons.table_chart, color: Colors.blue),
                              SizedBox(width: 10),
                              Text(
                                'Jumlah Meja: ${room.tables}',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PesanRuangScreen(room: room),
                    ),
                  );
                },
                child: Text(
                  'Pesan',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors
                      .lightBlueAccent, // Warna tombol baru yang lebih terang
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        5), // Border radius tombol yang tidak melengkung
                  ),
                  elevation: 5, // Bayangan tombol
                  textStyle:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  shadowColor: Colors.black.withOpacity(0.5), // Warna bayangan
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
