import 'package:flutter/material.dart';
import 'booking.dart';

class RiwayatPemesanan extends StatelessWidget {
  static List<Booking> _bookings = []; 

  static void add(Booking booking) {
    _bookings.add(booking);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat Pemesanan'),
      ),
      body: _bookings.isEmpty
          ? Center(child: Text('Tidak ada riwayat pemesanan'))
          : ListView.builder(
              itemCount: _bookings.length,
              itemBuilder: (context, index) {
                final booking = _bookings[index];
                String formattedTime =
                    '${booking.usageTime.hour}:${booking.usageTime.minute.toString().padLeft(2, '0')}';
                return Card(
                  child: ListTile(
                    title: Text('Ruang: ${booking.room.name}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Pemesan: ${booking.bookerName}'),
                        Text('Kelas: ${booking.classRoom}'),
                        Text('Mata Kuliah: ${booking.course}'),
                        Text(
                            'Waktu: ${booking.usageTime.day}/${booking.usageTime.month}/${booking.usageTime.year} $formattedTime'),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
