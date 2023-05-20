import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pharmacymanagementsystem/model/sale/sale.dart';

class SaleSource {
  static FirebaseFirestore db = FirebaseFirestore.instance;
  static const saleCollection = "sales";

  static Future<void> createSale(
    String id,
    String medicamentId,
    String accountId,
    double price,
    String salesmanName,
    String medicamentName,
    String medicamentCategory,
    String medicamentPrice,
    String medicamentQuantity,
    String finalPrice,
  ) async {
    return db.collection(saleCollection).doc(id).set({
      'medicamentId': medicamentId,
      'accountId': accountId,
      'price': price,
      'salesmanName': salesmanName,
      'medicamentName': medicamentName,
      'medicamentCategory': medicamentCategory,
      'medicamentPrice': medicamentPrice,
      'medicamentQuantity': medicamentQuantity,
      'finalPrice': finalPrice,
    });
  }

  static Future<List<Sale>> getAllSales() async {
    return db.collection(saleCollection).get().then(
      (sales) => sales.docs
          .map((element) => Sale(
                id: element.id,
                medicamentId: element.data()["medicamentId"],
                accountId: element.data()["accountId"],
                price: element.data()["price"].toDouble(),
                salesmanName: element.data()["salesmanName"],
                medicamentName: element.data()["medicamentName"],
                medicamentCategory: element.data()["medicamentCategory"],
                medicamentPrice: element.data()["medicamentPrice"],
                medicamentQuantity: element.data()["medicamentQuantity"],
                finalPrice: element.data()["finalPrice"],
              ))
          .toList(),
      onError: (e) => print("Error while getAllSales: $e"),
    );
  }

  static Future<Sale> getSaleById(String id) async {
    return db.collection(saleCollection).doc(id).get().then(
      (DocumentSnapshot doc) {
        final element = doc.data() as Map<String, dynamic>;
        return Sale(
          id: doc.id,
          medicamentId: element["medicamentId"],
          accountId: element["accountId"],
          price: element["price"].toDouble(),
          salesmanName: element["salesmanName"],
          medicamentName: element["medicamentName"],
          medicamentCategory: element["medicamentCategory"],
          medicamentPrice: element["medicamentPrice"],
          medicamentQuantity: element["medicamentQuantity"],
          finalPrice: element["finalPrice"],
        );
      },
      onError: (e) {
        print("Error while getSaleById: $e");
      },
    );
  }

  static Future<void> removeSale(String id) async {
    return db.collection(saleCollection).doc(id).delete();
  }

  static Future<void> updateSale(
    String id,
    String medicamentId,
    String accountId,
    double price,
    String salesmanName,
    String medicamentName,
    String medicamentCategory,
    String medicamentPrice,
    String medicamentQuantity,
    String finalPrice,
  ) async {
    final data = {
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
    return db
        .collection(saleCollection)
        .doc(id)
        .set(data, SetOptions(merge: true));
  }
}