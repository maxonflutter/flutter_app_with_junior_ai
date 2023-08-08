import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class CartItem extends Equatable {
  final String id;
  final String title;
  final int quantity;
  final double price;
  final String imageUrl;

  CartItem({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
    required this.imageUrl,
  });

  CartItem copyWith({
    String? id,
    String? title,
    int? quantity,
    double? price,
    String? imageUrl,
  }) {
    return CartItem(
      id: id ?? this.id,
      title: title ?? this.title,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  double get totalCost => quantity * price;

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      quantity: json['quantity'] ?? 0,
      price: json['price'] ?? 0.0,
      imageUrl: json['imageUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'quantity': quantity,
        'price': price,
        'imageUrl': imageUrl,
      };

  static List<CartItem> sampleData = [
    CartItem(
      id: Uuid().v4(),
      title: 'Sample Item 1',
      quantity: 2,
      price: 10.0,
      imageUrl: 'https://source.unsplash.com/random/?product',
    ),
    CartItem(
      id: Uuid().v4(),
      title: 'Sample Item 2',
      quantity: 1,
      price: 20.0,
      imageUrl: 'https://source.unsplash.com/random/?product',
    ),
  ];

  @override
  List<Object?> get props => [id, title, quantity, price, imageUrl];
}