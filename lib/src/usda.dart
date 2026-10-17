import 'package:http/http.dart' as http;
import 'dart:convert';

Future<dynamic> searchFoods(String foodName, String apiKey) async {
  final url = Uri.parse(
    'https://api.nal.usda.gov/fdc/v1/foods/search?api_key=$apiKey',
  );

  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'query': foodName,
      'dataType': ['Foundation', 'SR Legacy'],
      'pageSize': 1,
    }),
  );

  if (response.statusCode != 200) {
    throw Exception('USDA error: ${response.statusCode}');
  }
  final JsonData = const JsonEncoder.withIndent('  ').convert(jsonDecode(response.body));
  return JsonData;
}