import 'room.dart';

class Booking {
  final Room room;
  final DateTime time;
  final String bookerName;
  final String course;
  final String classRoom;
  final DateTime usageTime;

  Booking({
    required this.room,
    required this.time,
    required this.bookerName,
    required this.course,
    required this.classRoom,
    required this.usageTime,
  });
}
