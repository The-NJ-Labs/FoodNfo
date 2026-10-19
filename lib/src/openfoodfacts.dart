import 'dart:io';
import 'package:openfoodfacts/openfoodfacts.dart';

Future<Product?> findThatFreakinProduct(String query) async{
  final config = ProductSearchQueryConfiguration(
    parametersList: <Parameter>[
      SearchTerms(terms: [query]),
      PageSize(size: 10),
    ],
    fields: [
      ProductField.NAME,
      ProductField.BRANDS,
      ProductField.BARCODE,
      ProductField.QUANTITY,
      ProductField.COUNTRIES_TAGS,
      ProductField.INGREDIENTS_TEXT,
    ],
    language: OpenFoodFactsLanguage.ENGLISH,
    version: ProductQueryVersion.v3_5,

  );
  final result = await OpenFoodAPIClient.searchProducts(
    null,
    config,
  ); 

  final products = result.products ?? [];
  
  if (products.isEmpty){
    print("No Product Found...");
    return null;
  }
  print("Matching Products:\n");
  
  for (var i = 0; i < products.length; i++) {
    final product = products[i];
  


    print(
      '${i + 1}. ${product.productName ?? "Unnamed product"}'
      ' | ${product.brands ?? "Unknown brand"}'
      ' | ${product.quantity ?? "Unknown size"}'
      ' | ${product.countriesTags ?? "Unknown Country"}'
      ' | Barcode: ${product.barcode ?? "N/A"}',
    );
  }
  stdout.write("\n choose a product no. (0 to cancel): ");
  
  final choice = int.tryParse(stdin.readLineSync()?.trim() ?? '');
  if (choice == null || choice < 1 || choice > products.length){
    return null;
  }

  return products[choice - 1];
}