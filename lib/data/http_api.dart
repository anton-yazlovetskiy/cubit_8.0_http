import 'dart:convert';

import 'package:cubit_8_http/data/user_model.dart';
import 'package:http/http.dart' as http;

class UserResponce {
  Future<List<User>> getUsers() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/user1s'));

    //if (response.statusCode == 200) {
    print(response.statusCode);
    final List<dynamic> userjson = json.decode(response.body);
    return userjson.map((json) => User.fromJson(json)).toList();
    // } else {
    //   throw Exception('Error get http');
    // }
  }
}
