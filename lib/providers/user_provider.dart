import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../services/api_service.dart';

/// Provider para manejar el estado de los usuarios
class UserProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();

  List<User> _users = [];
  bool _isLoading = false;
  String? _errorMessage;

  // Getters
  List<User> get users => _users;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get hasError => _errorMessage != null;

  /// Carga la lista de usuarios desde la API
  Future<void> loadUsers() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _users = await _apiService.fetchUsers();
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString().replaceAll('Exception: ', '');
      _users = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Reintenta cargar los usuarios (útil después de un error)
  Future<void> retryLoadUsers() async {
    await loadUsers();
  }

  /// Busca un usuario por su ID en la lista local
  User? getUserById(int id) {
    try {
      return _users.firstWhere((user) => user.id == id);
    } catch (e) {
      return null;
    }
  }

  /// Limpia el mensaje de error
  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}
