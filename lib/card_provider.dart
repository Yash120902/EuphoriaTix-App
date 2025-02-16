import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> cart = [];

  void addProduct(Map<String, dynamic> concertDetail) {
    cart.add(concertDetail);
    notifyListeners();
  }

  void removeProduct(Map<String, dynamic> concertDetail) {
    cart.remove(concertDetail);
    notifyListeners();
  }
}
