import 'package:flutter/foundation.dart';
import '../models/pizza.dart';

class FavoritesProvider with ChangeNotifier {
  final Map<String, Pizza> _favoriteItems = {};

  Map<String, Pizza> get favoriteItems {
    return {..._favoriteItems};
  }

  bool isFavorite(String id) {
    return _favoriteItems.containsKey(id);
  }

  void toggleFavorite(Pizza pizza) {
    if (_favoriteItems.containsKey(pizza.id)) {
      _favoriteItems.remove(pizza.id);
    } else {
      _favoriteItems.putIfAbsent(pizza.id, () => pizza);
    }
    notifyListeners();
  }
}
