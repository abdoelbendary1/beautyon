class PackageEntity {
  final String title;
  final String description;
  final String imageUrl;
  final double price;
  final double? discountedPrice;
  final double? discountPercentage;

  PackageEntity({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.price,
    this.discountedPrice,
    this.discountPercentage,
  });
}
