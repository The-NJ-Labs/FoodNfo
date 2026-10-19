import 'dart:io';
import 'package:openfoodfacts/openfoodfacts.dart';
import '../lib/src/input.dart';
import '../lib/src/openfoodfacts.dart';

Future<void> main() async {
  final foodName = await askFoodName();

  OpenFoodAPIConfiguration.userAgent = UserAgent(
    name: 'FoodNfo',
    version: '0.2',
    system: Platform.operatingSystem,
  );

  if (foodName == null || foodName.isEmpty) {
    print('No product name entered.');
    return;
  }

  try {
    final product = await findThatFreakinProduct(foodName);

    if (product == null) {
      print('No product found...');
      return;
    }

    print('\nSelected product:');
    print('Name: ${product.productName}');
    print('Brand: ${product.brands}');
    print('Barcode: ${product.barcode}');
    print('Country: ${product.countries}');
    print('Ingredients: ${product.ingredientsText}');
  } catch (e) {
    print('Search failed: $e');
  }
}
