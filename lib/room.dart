class Room {
  final String name;
  final int capacity;
  final bool available;
  final int chairs; // Menambah properti untuk jumlah kursi
  final int tables; // Menambah properti untuk jumlah meja

  Room({
    required this.name,
    required this.capacity,
    required this.available,
    required this.chairs, // Menambah parameter pada konstruktor
    required this.tables, // Menambah parameter pada konstruktor
  });
}