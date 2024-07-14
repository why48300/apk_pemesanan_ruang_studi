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
          image: DecorationImage(
            image: AssetImage('assets/Ruang3.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          itemCount: rooms.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 8,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue.shade300, Colors.indigo.shade600],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  leading: Icon(
                    Icons.meeting_room,
                    color: Colors.white,
                    size: 30,
                  ),
                  title: Text(
                    rooms[index].name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Row(
                    children: [
                      Icon(Icons.people, color: Colors.white),
                      SizedBox(width: 5),
                      Text(
                        'Kapasitas: ${rooms[index].capacity}',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                  trailing: rooms[index].available
                      ? Icon(Icons.check_circle, color: Colors.green, size: 30)
                      : Icon(Icons.cancel, color: Colors.red, size: 30),
                  onTap: () {
                    if (rooms[index].available) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              BookingScreen(room: rooms[index], index: index),
                        ),
                      );
                    }
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
