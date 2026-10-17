import "dart:io";
import '../lib/src/input.dart';
import '../lib/src/usda.dart';

Future<void> main() async {
  final apiKey = Platform.environment['USDA_API_KEY'];

  if (apiKey == null || apiKey.isEmpty) {
    print("USDA API key not set...");
    return;
  }

  final foodName = await askFoodName();

  if (foodName == null || foodName.isEmpty) {
    print("No food name entered...");
    return;
  }

  try {
    final JsonData = await searchFoods(foodName, apiKey);
    print(JsonData);
  } catch (e) {
    print("Error: $e");
  }
}