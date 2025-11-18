import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';

/// Servicio para consumir la API de usuarios
class ApiService {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';

  /// Obtiene la lista completa de usuarios desde la API
  ///
  /// Retorna una lista de objetos [User]
  /// Lanza una excepción si hay error en la conexión o en el servidor
  Future<List<User>> fetchUsers() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/users'),
        headers: {'Content-Type': 'application/json'},
      ).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw Exception(
              'Tiempo de espera agotado. Verifica tu conexión a internet.');
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        return jsonData.map((json) => User.fromJson(json)).toList();
      } else {
        throw Exception('Error al cargar usuarios: ${response.statusCode}');
      }
    } catch (e) {
      // Re-lanzar la excepción para que sea manejada por el provider
      throw Exception('Error de conexión: ${e.toString()}');
    }
  }

  /// Obtiene un usuario específico por su ID
  ///
  /// [userId]: ID del usuario a obtener
  /// Retorna un objeto [User]
  Future<User> fetchUserById(int userId) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/users/$userId'),
        headers: {'Content-Type': 'application/json'},
      ).timeout(
        const Duration(seconds: 10),
      );

      if (response.statusCode == 200) {
        return User.fromJson(json.decode(response.body));
      } else {
        throw Exception('Usuario no encontrado');
      }
    } catch (e) {
      throw Exception('Error al obtener usuario: ${e.toString()}');
    }
  }
}
