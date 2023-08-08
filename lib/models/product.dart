import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Product extends Equatable {
  final String id;
  final String name;
  final double price;
  final List<Color> colorOptions;
  final String description;
  final String imageUrl;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.colorOptions,
    required this.description,
    required this.imageUrl,
  });

  @override
  List<Object> get props => [id, name, price, colorOptions, description, imageUrl];

  Product copyWith({
    String? id,
    String? name,
    double? price,
    List<Color>? colorOptions,
    String? description,
    String? imageUrl,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      colorOptions: colorOptions ?? this.colorOptions,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      price: json['price'] ?? 0.0,
      colorOptions: (json['colorOptions'] as List).map((color) => Color(color)).toList() ?? [],
      description: json['description'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'price': price,
        'colorOptions': colorOptions.map((color) => color.value).toList(),
        'description': description,
        'imageUrl': imageUrl,
      };

  static List<Product> sampleData = [
    Product(
      id: Uuid().v4(),
      name: 'Sample Product 1',
      price: 99.99,
      colorOptions: [Colors.red, Colors.blue, Colors.green],
      description: 'This is a sample product.',
      imageUrl: 'https://source.unsplash.com/random/?product',
    ),
    Product(
      id: Uuid().v4(),
      name: 'Sample Product 2',
      price: 49.99,
      colorOptions: [Colors.yellow, Colors.purple, Colors.orange],
      description: 'This is another sample product.',
      imageUrl: 'https://source.unsplash.com/random/?product',
    ),
  ];
}