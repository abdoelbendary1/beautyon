class SalonEntity {
  final String name;
  final String services;
  final String location;
  final String workingHours;
  final bool isOpen;
  final int rating;

  SalonEntity({
    required this.name,
    required this.services,
    required this.location,
    required this.workingHours,
    required this.isOpen,
    required this.rating,
  });
}
