// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'dart:convert';

import 'package:flutter/foundation.dart';

class Medicament {
  final String id;
  final String name;
  final double price;
  final String idCategory;
  Medicament({
    required this.id,
    required this.name,
    required this.price,
    required this.idCategory,
  });
 

  Medicament copyWith({
    String? id,
    String? name,
    double? price,
    String? idCategory,
  }) {
    return Medicament(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      idCategory: idCategory ?? this.idCategory,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'price': price,
      'idCategory': idCategory,
    };
  }

  factory Medicament.fromMap(Map<String, dynamic> map) {
    return Medicament(
      id: map['id'] as String,
      name: map['name'] as String,
      price: map['price'] as double,
      idCategory: map['idCategory'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Medicament.fromJson(String source) => Medicament.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Medicament(id: $id, name: $name, price: $price, idCategory: $idCategory)';
  }

  @override
  bool operator ==(covariant Medicament other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.price == price &&
      other.idCategory == idCategory;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      price.hashCode ^
      idCategory.hashCode;
  }
}
