
import 'dart:convert';

import 'package:hive_flutter/adapters.dart';

part 'cart_item_model.g.dart';

@HiveType(typeId: 0)
class CartItemModel extends HiveObject{

  @HiveField(0)
  final int productId;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String image;

  @HiveField(3)
  final String price;

  @HiveField(4)
  final int quantity;

  @HiveField(5)
  final String? color;

  @HiveField(6)
  final String? discount;

  @HiveField(7)
  final int? discountedPrice;

  CartItemModel({
    required this.productId,
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
    this.color,
    this.discount,
    this.discountedPrice,
  });

  CartItemModel copyWith({
    int? productId,
    String? name,
    String? image,
    String? price,
    int? quantity,
    String? color,
    String? discount,
    int? discountedPrice,
  }) {
    return CartItemModel(
      productId: productId ?? this.productId,
      name: name ?? this.name,
      image: image ?? this.image,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      color: color ?? this.color,
      discount: discount ?? this.discount,
      discountedPrice: discountedPrice ?? this.discountedPrice,
    );
  }

  
  factory CartItemModel.fromJson(String str) => CartItemModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CartItemModel.fromMap(Map<String, dynamic> json) => CartItemModel(
        productId: json["product_id"],
        name: json["name"],
        image: json["image"],
        price: json["price"],
        quantity: json["quantity"],
        color: json["color"],
        discount: json["discount"],
        discountedPrice: json["discounted_price"],
      );

  Map<String, dynamic> toMap() => {
        "product_id": productId,
        "name": name,
        "image": image,
        "price": price,
        "quantity": quantity,
        "color": color,
        "discount": discount,
        "discounted_price": discountedPrice,
      };

}
