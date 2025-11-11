class ServiceProviderModel {
  final String name;
  final String category;
  final String priceRange;
  final int experience;
  final double rating;
  final int reviewsCount;
  final String location;
  final String about;
  final List<String> services;

  ServiceProviderModel({
    required this.name,
    required this.category,
    required this.priceRange,
    required this.experience,
    required this.rating,
    required this.reviewsCount,
    required this.location,
    required this.about,
    required this.services,
  });
}