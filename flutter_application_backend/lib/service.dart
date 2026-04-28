import 'dart:convert';
import 'package:http/http.dart' as http;
import 'roupa.dart';

class ApiService {
  static const String baseUrl = 'http://localhost:3000';

  Future<List<Roupa>> getRoupas() async {
    final uri = Uri.parse('$baseUrl/roupas/listar');

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => Roupa.fromJson(json)).toList();
    } else {
      throw Exception('Erro ao buscar roupas: ${response.statusCode}');
    }
  }
}
