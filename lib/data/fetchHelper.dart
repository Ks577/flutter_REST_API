import 'dart:convert';
import 'package:http/http.dart' as http;
import 'const.dart';

class FetchHelper {
  final String baseUrl;
  final String request;
  final String parameters;
  final int limit;

  FetchHelper(
      {this.baseUrl = Consts.baseUrl,
      this.request = Consts.getGifRequest,
      this.parameters = '',
      this.limit = Consts.limit});

  Future<List<dynamic>> fetchGifs() async {
    // await Future.delayed(const Duration(seconds: 2),);
    final fulUrl =
        '$baseUrl$request?api_key=${Consts.myKey}&q=$parameters&limit=$limit&rating=g&lang=en';

    final response = await http.get(
      Uri.parse(fulUrl),
    );
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);

      var jsonData = json['data'];

      return jsonData;
    } else {
      throw Exception('Error');
    }
  }
}
