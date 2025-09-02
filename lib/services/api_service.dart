import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class ApiService {
  Future<List<User>> fetchUsers() async {
    final response = await http.get(Uri.parse("https://reqres.in/api/users"));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<dynamic> usersJson = jsonData['data'];

      return usersJson.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception("Error al cargar usuarios");
    }
  }
}
