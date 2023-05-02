// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Sale {
  final String id;
  final String medicamentId;
  final String accountId;
  final double price;
  final String salesmanName;
  final String medicamentName;
  final String medicamentCategory;
  final String medicamentPrice;
  final String medicamentQuantity;
  final String finalPrice;
  Sale({
    required this.id,
    required this.medicamentId,
    required this.accountId,
    required this.price,
    required this.salesmanName,
    required this.medicamentName,
    required this.medicamentCategory,
    required this.medicamentPrice,
    required this.medicamentQuantity,
    required this.finalPrice,
  });

  Sale copyWith({
    String? id,
    String? medicamentId,
    String? accountId,
    double? price,
    String? salesmanName,
    String? medicamentName,
    String? medicamentCategory,
    String? medicamentPrice,
    String? medicamentQuantity,
    String? finalPrice,
  }) {
    return Sale(
      id: id ?? this.id,
      medicamentId: medicamentId ?? this.medicamentId,
      accountId: accountId ?? this.accountId,
      price: price ?? this.price,
      salesmanName: salesmanName ?? this.salesmanName,
      medicamentName: medicamentName ?? this.medicamentName,
      medicamentCategory: medicamentCategory ?? this.medicamentCategory,
      medicamentPrice: medicamentPrice ?? this.medicamentPrice,
      medicamentQuantity: medicamentQuantity ?? this.medicamentQuantity,
      finalPrice: finalPrice ?? this.finalPrice,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'medicamentId': medicamentId,
      'accountId': accountId,
      'price': price,
      'salesmanName': salesmanName,
      'medicamentName': medicamentName,
      'medicamentCategory': medicamentCategory,
      'medicamentPrice': medicamentPrice,
      'medicamentQuantity': medicamentQuantity,
      'finalPrice': finalPrice,
    };
  }

  factory Sale.fromMap(Map<String, dynamic> map) {
    return Sale(
      id: map['id'] as String,
      medicamentId: map['medicamentId'] as String,
      accountId: map['accountId'] as String,
      price: map['price'] as double,
      salesmanName: map['salesmanName'] as String,
      medicamentName: map['medicamentName'] as String,
      medicamentCategory: map['medicamentCategory'] as String,
      medicamentPrice: map['medicamentPrice'] as String,
      medicamentQuantity: map['medicamentQuantity'] as String,
      finalPrice: map['finalPrice'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Sale.fromJson(String source) => Sale.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Sale(id: $id, medicamentId: $medicamentId, accountId: $accountId, price: $price, salesmanName: $salesmanName, medicamentName: $medicamentName, medicamentCategory: $medicamentCategory, medicamentPrice: $medicamentPrice, medicamentQuantity: $medicamentQuantity, finalPrice: $finalPrice)';
  }

  @override
  bool operator ==(covariant Sale other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.medicamentId == medicamentId &&
      other.accountId == accountId &&
      other.price == price &&
      other.salesmanName == salesmanName &&
      other.medicamentName == medicamentName &&
      other.medicamentCategory == medicamentCategory &&
      other.medicamentPrice == medicamentPrice &&
      other.medicamentQuantity == medicamentQuantity &&
      other.finalPrice == finalPrice;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      medicamentId.hashCode ^
      accountId.hashCode ^
      price.hashCode ^
      salesmanName.hashCode ^
      medicamentName.hashCode ^
      medicamentCategory.hashCode ^
      medicamentPrice.hashCode ^
      medicamentQuantity.hashCode ^
      finalPrice.hashCode;
  }
}
