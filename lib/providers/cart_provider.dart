import 'package:flutter/foundation.dart';
import '../models/pizza.dart';

class CartItem {
  final String id;
  final Pizza pizza;
  int quantity;

  CartItem({
    required this.id,
    required this.pizza,
    this.quantity = 1,
  });
}

class CartProvider with ChangeNotifier {
  final Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.pizza.price * cartItem.quantity;
    });
    return total;
  }

  void addItem(Pizza pizza) {
    if (_items.containsKey(pizza.id)) {
      // increase quantity
      _items.update(
        pizza.id,
        (existingCartItem) => CartItem(
          id: existingCartItem.id,
          pizza: existingCartItem.pizza,
          quantity: existingCartItem.quantity + 1,
        ),
      );
    } else {
      // add new item
      _items.putIfAbsent(
        pizza.id,
        () => CartItem(
          id: DateTime.now().toString(),
          pizza: pizza,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String pizzaId) {
    _items.remove(pizzaId);
    notifyListeners();
  }

  void removeSingleItem(String pizzaId) {
    if (!_items.containsKey(pizzaId)) {
      return;
    }
    if (_items[pizzaId]!.quantity > 1) {
      _items.update(
          pizzaId,
          (existingCartItem) => CartItem(
                id: existingCartItem.id,
                pizza: existingCartItem.pizza,
                quantity: existingCartItem.quantity - 1,
              ));
    } else {
      _items.remove(pizzaId);
    }
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}
