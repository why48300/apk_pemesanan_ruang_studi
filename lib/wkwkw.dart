import 'package:flutter/material.dart';
import 'booking.dart';
import 'home_page.dart';

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
        backgroundColor: Colors.blue,
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
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.person,
                          color: Colors.blue,
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
                          Icons.class_,
                          color: Colors.blue,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Kelas: ${booking.classRoom}',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(
                          Icons.school,
                          color: Colors.blue,
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
                          Icons.room,
                          color: Colors.blue,
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
                          color: Colors.blue,
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
                          color: Colors.blue,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Waktu Pemesanan: $formattedTime',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle: TextStyle(
                    fontSize: 16,
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                child: Text(
                  'Kembali ke Beranda',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}