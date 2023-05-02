// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Medicament {
  final String id;
  final String name;
  final double price;
  final Category category;
  Medicament({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
  });

  Medicament copyWith({
    String? id,
    String? name,
    double? price,
    Category? category,
  }) {
    return Medicament(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      category: category ?? this.category,
    );
  }

  @override
  String toString() {
    return 'Medicament(id: $id, name: $name, price: $price, category: $category)';
  }

  @override
  bool operator ==(covariant Medicament other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.price == price &&
      other.category == category;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      price.hashCode ^
      category.hashCode;
  }
}
