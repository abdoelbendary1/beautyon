/* class ServiceEntity {
  final String? title;
  final String? location;
  final String? date;
  final String? imageUrl;
  final int? typeCount;
  final double? rating;

  ServiceEntity({
    this.title,
    this.location,
    this.date,
    this.imageUrl,
    this.rating,
    this.typeCount = 0,
  });
} */

class ServiceEntity {
  final String? title;
  final List<String>? imageUrls;
  final double? price;
  final String? imageUrl;
  final String? location;
  final int? typeCount;
  final double? discountedPrice;
  final double? rating;
  final String? date;

  final int? reviewsCount;
  final String? description;
  final List<String>? keyTopics;

  ServiceEntity({
    this.title,
    this.date,
    this.imageUrls,
    this.price,
    this.discountedPrice,
    this.rating,
    this.reviewsCount = 0,
    this.description,
    this.keyTopics,
    this.imageUrl,
    this.location,
    this.typeCount,
  });
}
