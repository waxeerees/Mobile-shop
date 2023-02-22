import 'package:meta/meta.dart';

class ItemData {
  final String id;
  final String title;
  final int score;
  final int quantity;
  final String imgUrl;
  final double price;
  final String description;
  final String content;
  final String category;

  ItemData({
    required this.id,
    required this.title,
    required this.score,
    required this.imgUrl,
    required this.quantity,
    required this.price,
    required this.description,
    required this.content,
    required this.category,
  });

  static ItemData fromJson(Map<String, dynamic> json) => ItemData(
      imgUrl: json['imgUrl'],
      id: json['id'],
      title: json['title'],
      score: json['title'],
      quantity: json['quantity'],
      price: json['price'],
      description: json['description'],
      content: json['content'],
      category: json['category']);
}

class ProductItem {
  final String id;
  final String title;
  final int quantity;
  final String imgUrl;
  final double price;
  final String description;
  final String content;
  final String category;

  const ProductItem({
    required this.imgUrl,
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
    required this.description,
    required this.content,
    required this.category,
  });

  ProductItem copy({
    String? id,
    String? title,
    int? quantity,
    String? imgUrl,
    double? price,
    String? description,
    String? content,
    String? category,
  }) =>
      ProductItem(
        id: id ?? this.id,
        title: title ?? this.title,
        quantity: quantity ?? this.quantity,
        imgUrl: imgUrl ?? this.imgUrl,
        price: price ?? this.price,
        description: description ?? this.description,
        content: content ?? this.content,
        category: category ?? this.category,
      );

  static ProductItem fromJson(Map<String, dynamic> json) => ProductItem(
      imgUrl: json['imgUrl'],
      id: json['id'],
      title: json['title'],
      quantity: json['quantity'],
      price: json['price'],
      description: json['description'],
      content: json['content'],
      category: json['category']);
}

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final String imgUrl;
  final double price;
  final String description;
  final String content;
  final String category;

  const CartItem({
    required this.imgUrl,
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
    required this.description,
    required this.content,
    required this.category,
  });

  CartItem copy({
    String? id,
    String? title,
    int? quantity,
    String? imgUrl,
    double? price,
    String? description,
    String? content,
    String? category,
  }) =>
      CartItem(
        id: id ?? this.id,
        title: title ?? this.title,
        quantity: quantity ?? this.quantity,
        imgUrl: imgUrl ?? this.imgUrl,
        price: price ?? this.price,
        description: description ?? this.description,
        content: content ?? this.content,
        category: category ?? this.category,
      );

  static CartItem fromJson(Map<String, dynamic> json) => CartItem(
      imgUrl: json['imgUrl'],
      id: json['id'],
      title: json['title'],
      quantity: json['quantity'],
      price: json['price'],
      description: json['description'],
      content: json['content'],
      category: json['category']);
}
