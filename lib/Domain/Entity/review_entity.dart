class ReviewEntity {
  final String userName;
  final String comment;
  final String imageUrl;
  final String date;
  final int rating;

  ReviewEntity({
    required this.userName,
    required this.comment,
    required this.imageUrl,
    required this.date,
    required this.rating,
  });
}
