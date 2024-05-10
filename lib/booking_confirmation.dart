import 'package:flutter/material.dart';
import 'booking.dart';
import 'home_page.dart'; // Import home_page.dart di sini

class BookingConfirmationScreen extends StatelessWidget {
  final Booking booking;

  BookingConfirmationScreen({required this.booking});

  @override
  Widget build(BuildContext context) {
    String formattedTime =
        '${booking.usageTime.hour}:${booking.usageTime.minute.toString().padLeft(2, '0')}';

    return Scaffold(
      appBar: AppBar(
        title: Text('Konfirmasi Pemesanan'),
      ),
      backgroundColor: Color.fromARGB(255, 0, 179, 255), // Tambahkan latar belakang di sini
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 100,
            ),
            SizedBox(height: 20),
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
                        Icons.person,
                        color: Colors.blue, // Warna ikon
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Nama Pemesan: ${booking.bookerName}',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(
                        Icons.room,
                        color: Colors.blue, // Warna ikon
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Nama Ruang: ${booking.room.name}',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(
                        Icons.date_range,
                        color: Colors.blue, // Warna ikon
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Tanggal Pemesanan: ${booking.usageTime.day}/${booking.usageTime.month}/${booking.usageTime.year}',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        color: Colors.blue, // Warna ikon
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Waktu Pemesanan: $formattedTime',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(
                        Icons.school,
                        color: Colors.blue, // Warna ikon
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Mata Kuliah: ${booking.course}',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(
                        Icons.class_,
                        color: Colors.blue, // Warna ikon
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Kelas: ${booking.classRoom}',
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
                // Lakukan operasi penyimpanan atau kirim data ke server
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()), // Rute yang menuju ke home_page.dart
                );
              },
              child: Text('Kembali ke Beranda'),
            ),
          ],
        ),
      ),
    );
  }
}
