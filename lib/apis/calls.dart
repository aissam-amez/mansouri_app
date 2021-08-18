import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mansouri/apis/routes.dart';

Future getProductsFromApi() async {
  final response = await http
      .get(Uri.parse(BASE_TEST), headers: {"Access-Control-Allow-Origin": "*"});

  if (response.statusCode == 200) {
    return json.decode(response.body);
  }
  return 'خطأ في الإتصال بالمعلومات';
}
