class CartItem {
  final String id;
  final String title;
  final int quantity;
  final String imgUrl;
  final double price;
  final String description;
  final String content;

  const CartItem({
    required this.imgUrl,
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
    required this.description,
    required this.content,
    required category,
  });

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
