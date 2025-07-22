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
    imageUrl: null,
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
