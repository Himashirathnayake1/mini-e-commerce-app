import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesProvider extends ChangeNotifier {
  final List<int> _favoriteIds = [];

  List<int> get favoriteIds => _favoriteIds;

  bool isFavorite(int productId) {
    return _favoriteIds.contains(productId);
  }

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();

    final ids = prefs.getStringList('favorites') ?? [];

    _favoriteIds.clear();

    _favoriteIds.addAll(
      ids.map((e) => int.parse(e)),
    );

    notifyListeners();
  }

  Future<void> toggleFavorite(int productId) async {
    if (_favoriteIds.contains(productId)) {
      _favoriteIds.remove(productId);
    } else {
      _favoriteIds.add(productId);
    }

    final prefs = await SharedPreferences.getInstance();

    await prefs.setStringList(
      'favorites',
      _favoriteIds.map((e) => e.toString()).toList(),
    );

    notifyListeners();
  }
}