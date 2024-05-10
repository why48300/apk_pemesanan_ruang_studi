import 'package:flutter/material.dart';
import 'package:pemesanan_ruang_studi/booking_screen.dart';
import 'room.dart';

class HomeScreen extends StatelessWidget {
  final List<Room> rooms = [
    Room(name: 'Ruang 1', capacity: 4, available: true, chairs: 10, tables: 5),
    Room(name: 'Ruang 2', capacity: 6, available: false, chairs: 10, tables: 5),
    Room(name: 'Ruang 3', capacity: 8, available: true, chairs: 10, tables: 5),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ruang Studi Tersedia'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.indigo], // Warna latar belakang gradient
          ),
        ),
        child: ListView.builder(
          itemCount: rooms.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 5, // Ketebalan shadow card
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5), // Margin card
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Border radius card
              ),
              child: ListTile(
                leading: Icon(
                  Icons.meeting_room, // Icon ruang
                  color: Colors.blue, // Warna icon
                ),
                title: Text(
                  rooms[index].name,
                  style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)), // Warna teks judul
                ),
                subtitle: Row(
                  children: [
                    Icon(
                      Icons.people, // Icon kapasitas
                      color: const Color.fromARGB(255, 0, 0, 0), // Warna icon
                    ),
                    SizedBox(width: 5), // Spasi antara icon dan teks
                    Text(
                      'Kapasitas: ${rooms[index].capacity}',
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)), // Warna teks subtitle
                    ),
                  ],
                ),
                trailing: rooms[index].available
                    ? Icon(Icons.check_circle, color: Colors.green) // Icon ruang tersedia
                    : Icon(Icons.cancel, color: Colors.red), // Icon ruang tidak tersedia
                onTap: () {
                  if (rooms[index].available) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookingScreen(room: rooms[index]),
                      ),
                    );
                  }
                },
              ),
            );
          },
        ),
      ),
    );
  }
}