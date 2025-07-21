import 'package:fruits_hub/core/entities/product_entity.dart';

ProductEntity getDummyProduct() {
  return ProductEntity(
    reviews: [],
    name: 'Apple',
    code: 'AP123',
    description: 'Fresh and juicy apple',
    price: 1.99,
    isFeatured: true,
    expirationMonths: 6,
    numberOfcalories: 95,
    unitAmount: 1,
    sellingCount: 100,
    isOrganic: true,
    imageUrl:
        'https://hips.hearstapps.com/hmg-prod/images/red-apple-cortland-royalty-free-image-1659451218.jpg?crop=0.858xw:0.858xh;0.0691xw,0.0743xh&resize=980:*',
  );
}

List<ProductEntity> getDummyProducts() {
  return [
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
  ];
}
