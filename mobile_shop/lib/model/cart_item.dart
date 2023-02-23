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
  });
}
