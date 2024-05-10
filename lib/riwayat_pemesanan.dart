import 'package:flutter/material.dart';
import 'booking.dart';

class RiwayatPemesanan extends StatelessWidget {
  static List<Booking> _bookings = []; // Buat daftar pemesanan

  RiwayatPemesanan({required List<Booking> bookings}) {
    _bookings = bookings; // Inisialisasi daftar pemesanan
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat Pemesanan'),
      ),
      body: _bookings.isEmpty
          ? Center(
              child: Text('Tidak ada riwayat pemesanan.'),
            )
          : ListView.builder(
              itemCount: _bookings.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Nama Pemesan: ${_bookings[index].bookerName}'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Mata Kuliah: ${_bookings[index].course}'),
                      Text('Kelas: ${_bookings[index].classRoom}'),
                      Text('Waktu Pemakaian: ${_bookings[index].usageTime}'),
                    ],
                  ),
                );
              },
            ),
    );
  }

  // Metode statis untuk menambah pemesanan
  static void add(Booking confirmedBooking) {
    _bookings.add(confirmedBooking);
  }
}
