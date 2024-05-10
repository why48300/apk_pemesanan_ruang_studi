import 'package:flutter/material.dart';
import 'room.dart';
import 'booking.dart';
import 'booking_confirmation.dart';
import 'riwayat_pemesanan.dart'; 

class PesanRuangScreen extends StatefulWidget {
  final Room room;

  PesanRuangScreen({required this.room});

  @override
  _PesanRuangScreenState createState() => _PesanRuangScreenState();
}

class _PesanRuangScreenState extends State<PesanRuangScreen> {
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  String _bookerName = '';
  String _course = '';
  String _classRoom = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pesan ${widget.room.name}'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade100, Colors.blue.shade200],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    'Detail Ruang:',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
                  ),
                  SizedBox(height: 40),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.blue),
                      SizedBox(width: 10),
                      Text(
                        'Nama Ruang: ${widget.room.name}',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.people, color: Colors.blue),
                      SizedBox(width: 10),
                      Text(
                        'Kapasitas: ${widget.room.capacity}',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Nama Pemesan',
                      icon: Icon(Icons.person, color: Colors.blue),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _bookerName = value;
                      });
                    },
                  ),
                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Mata Kuliah',
                      icon: Icon(Icons.book, color: Colors.blue),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _course = value;
                      });
                    },
                  ),
                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Kelas',
                      icon: Icon(Icons.class_, color: Colors.blue),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _classRoom = value;
                      });
                    },
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.date_range, color: Colors.blue),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          _selectedDate == null
                              ? 'Pilih Tanggal'
                              : 'Tanggal Dipilih: ${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _selectDate(context);
                        },
                        child: Text(
                          'Pilih Tanggal',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.access_time, color: Colors.blue),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          _selectedTime == null
                              ? 'Pilih Waktu'
                              : 'Waktu Dipilih: ${_selectedTime!.hour}:${_selectedTime!.minute}',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _selectTime(context);
                        },
                        child: Text(
                          'Pilih Waktu',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _selectedDate == null || _selectedTime == null
                        ? null
                        : () {
                            _confirmBooking(context);
                          },
                    child: Text(
                      'Konfirmasi Pesanan',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  void _confirmBooking(BuildContext context) {
    if (_bookerName.isNotEmpty &&
        _course.isNotEmpty &&
        _classRoom.isNotEmpty &&
        _selectedDate != null &&
        _selectedTime != null) {
      DateTime selectedDateTime = DateTime(
        _selectedDate!.year,
        _selectedDate!.month,
        _selectedDate!.day,
        _selectedTime!.hour,
        _selectedTime!.minute,
      );
      Booking booking = Booking(
        room: widget.room,
        time: DateTime.now(),
        bookerName: _bookerName,
        course: _course,
        classRoom: _classRoom,
        usageTime: selectedDateTime,
      );
      RiwayatPemesanan.add(booking); 
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BookingConfirmationScreen(
            booking: booking,
          ),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Peringatan'),
            content: Text('Mohon lengkapi semua informasi.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
}
