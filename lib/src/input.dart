import 'dart:io';

Future<String?> askFoodName() async {
  stdout.write('Enter a food name: ');

  final foodName = stdin.readLineSync()?.trim();

  if (foodName == null || foodName.isEmpty) {
    return null;
  }

  return foodName;
}
