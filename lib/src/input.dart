import 'dart:io';

Future<String?> askFoodName() async {
  stdout.write('Enter a food name: ');

  final foodName = stdin.readLineSync()?.trim();
  

  if (foodName == null || foodName.isEmpty) {
    return null;
  }
  
  return foodName;
}

// Future<String?> askFoodCat() async {
//   stdout.write('Enter a food category: ');
//   final foodCat = stdin.readLineSync()?.trim();

//     if (foodCat == null || foodCat.isEmpty) {
//       return null;
//     }
    
//     return foodCat;
// }