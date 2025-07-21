import 'package:fruits_hub/core/entities/review_entity_model.dart';

num getAvgRating(List<ReviewEntity> reviews) {
  if (reviews.isEmpty) return 0;

  double totalRating = 0;
  for (var review in reviews) {
    totalRating += review.rating;
  }

  return totalRating / reviews.length;
}
