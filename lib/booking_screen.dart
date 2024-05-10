import 'package:flutter/material.dart';
import 'package:pemesanan_ruang_studi/pesan_ruang.dart';
import 'room.dart';

class BookingScreen extends StatelessWidget {
  final Room room;

  BookingScreen({required this.room});

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
            colors: [Colors.blue, Colors.indigo], // Warna latar belakang gradient
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
                  color: Colors.white, // Warna latar belakang kotak
                  borderRadius: BorderRadius.circular(10), // Bentuk tepi kotak
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.room,
                          color: Colors.blue, // Warna ikon
                        ),
                        SizedBox(width: 10),
                        Text(
                          room.name,
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(
                          Icons.group,
                          color: Colors.blue, // Warna ikon
                        ),
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
                        Icon(
                          Icons.chair,
                          color: Colors.blue, // Warna ikon
                        ),
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
                        Icon(
                          Icons.table_chart,
                          color: Colors.blue, // Warna ikon
                        ),
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
                  style: TextStyle(color: Colors.white), // Warna teks tombol
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // Warna tombol
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}