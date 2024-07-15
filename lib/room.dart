class Room {
  final String name;
  final int capacity;
  final bool available;
  final int chairs;
  final int tables;
  final String imagePath; 

  Room({
    required this.name,
    required this.capacity,
    required this.available,
    required this.chairs,
    required this.tables,
    required this.imagePath, 
  });
}

Room room1 = Room(
  name: 'Ruang 1',
  capacity: 20,
  available: true,
  chairs: 20,
  tables: 10,
  imagePath: 'assets/Ruang1.jpg',
);

Room room3 = Room(
  name: 'Ruang 3',
  capacity: 30,
  available: true,
  chairs: 30,
  tables: 15,
  imagePath: 'assets/Ruang2.jpg',
);
