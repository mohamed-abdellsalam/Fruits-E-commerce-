import 'dart:io';

import 'package:fruits_hub/core/models/review_model.dart';

class ProductModel {
  final String name;
  final String code;
  final String description;
  final double price;
  final File image;
  final bool isFeatured;
  String? imageUrl;
  final int expirationMonths;
  final bool isOrganic;
  final int numberOfcalories;
  final int unitAmount;
  final num avgRating = 0;
  final int ratingCount = 0;
  final List<ReviewModel> reviews;
  final int sellingCount;

  ProductModel({
    required this.sellingCount,
    required this.reviews,
    required this.expirationMonths,
    required this.numberOfcalories,
    required this.unitAmount,
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.image,
    required this.isFeatured,
    this.isOrganic = false,
    this.imageUrl,
  });
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'],
      code: json['code'],
      description: json['description'],
      price: json['price'],
      imageUrl: json['imageUrl'],
      isFeatured: json['isFeatured'],
      expirationMonths: json['expirationMonths'],
      numberOfcalories: json['numberOfcalories'],
      unitAmount: json['unitAmount'],
      isOrganic: json['isOrganic'] ?? false,
      reviews: (json['reviews'] as List)
          .map((e) => ReviewModel.fromJson(e))
          .toList(),
      image: File(json['image']),
      sellingCount: json['sellingCount'],
    );
  }
  toJson() {
    return {
      'name': name,
      'code': code,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'isFeatured': isFeatured,
      'expirationMonths': expirationMonths,
      'numberOfcalories': numberOfcalories,
      'unitAmount': unitAmount,
      'isOrganic': isOrganic,
      'reviews': reviews.map((e) => e.toJson()).toList(),
    };
  }
}
