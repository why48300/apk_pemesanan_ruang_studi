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
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
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
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      widget.room.imagePath,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Isi Form Pemesanan:',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(height: 20),
                  _buildInputBox(
                    label: 'Nama Pemesan',
                    icon: Icons.person,
                    onChanged: (value) {
                      _bookerName = value;
                    },
                  ),
                  SizedBox(height: 10),
                  _buildInputBox(
                    label: 'Kelas',
                    icon: Icons.school, 
                    onChanged: (value) {
                      _classRoom = value;
                    },
                  ),
                  SizedBox(height: 10),
                  _buildInputBox(
                    label: 'Mata Kuliah',
                    icon: Icons.book,
                    onChanged: (value) {
                      _course = value;
                    },
                  ),
                  SizedBox(height: 10),
                  _buildInputBox(
                    label: 'Tanggal',
                    icon: Icons.date_range,
                    onPressed: () {
                      _selectDate(context);
                    },
                    trailingIcon: Icons.calendar_today,
                    valueText: _selectedDate == null
                        ? 'Belum Dipilih'
                        : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}', 
                    readOnly: true,
                    onChanged: (String value) {}, 
                  ),
                  SizedBox(height: 10),
                  _buildInputBox(
                    label: 'Waktu',
                    icon: Icons.access_time,
                    onPressed: () {
                      _selectTime(context);
                    },
                    trailingIcon: Icons.access_time_filled,
                    valueText: _selectedTime == null
                        ? 'Belum Dipilih'
                        : '${_selectedTime!.hour}:${_selectedTime!.minute}', 
                    readOnly: true,
                    onChanged: (String value) {}, 
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _selectedDate == null || _selectedTime == null
                        ? null
                        : () {
                            _confirmBooking(context);
                          },
                    child: Text(
                      'Konfirmasi',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlueAccent,
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
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

  Widget _buildInputBox({
    required String label,
    required IconData icon,
    VoidCallback? onPressed,
    IconData? trailingIcon,
    String valueText = '',
    bool readOnly = false, 
    required ValueChanged<String> onChanged,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white),
          SizedBox(width: 10),
          Expanded(
            child: TextFormField(
              style: TextStyle(color: Colors.white),
              onChanged: onChanged,
              readOnly: readOnly,
              onTap: onPressed, 
              decoration: InputDecoration(
                labelText: label,
                labelStyle: TextStyle(color: Colors.white),
                suffixIcon: onPressed != null
                    ? IconButton(
                        onPressed: onPressed,
                        icon: Icon(trailingIcon, color: Colors.white),
                      )
                    : null,
                border: InputBorder.none,
              ),
              controller: TextEditingController(text: valueText),
            ),
          ),
          if (valueText.isNotEmpty) ...[
            SizedBox(width: 10),
            Text(
              valueText,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ],
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
