import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {

  NetworkHelper({required this.url});

  final String url;

  Future<dynamic> getData() async {
    http.Response response = await http.get(Uri.parse(url));
    print(response.body);
    String data = response.body;
    return jsonDecode(data);

  }




}