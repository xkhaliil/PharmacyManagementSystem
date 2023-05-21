import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import '../../model/sale/sale.dart';

class SaleSource {
  static FirebaseFirestore db = FirebaseFirestore.instance;
  static const saleCollection = "sales";

  static Future<void> createSale(
    String medicamentId,
    String medicamentName,
    int quantity,
    double finalPrice,
  ) async {
    return db.collection(saleCollection).doc().set({
      'medicamentId': medicamentId,
      'medicamentName': medicamentName,
      'medicamentQuantity': quantity,
      'finalPrice': finalPrice,
      'date': DateTime.now()
    }).then((value) => debugPrint("added"));
  }

  static Future<List<Sale>> getAllSales() async {
    return db.collection(saleCollection).get().then(
          (sales) => sales.docs
              .map((element) => Sale(
                  id: element.id,
                  medicamentId: element.data()["medicamentId"],
                  medicamentName: element.data()["medicamentName"],
                  medicamentQuantity: element.data()["medicamentQuantity"],
                  finalPrice: element.data()["finalPrice"],
                  date: (element.data()["date"] as Timestamp).toDate()))
              .toList(),
          onError: (e) {
            print("Error while getAllSales: $e");
          },
        );
  }

  static Future<Sale> getSaleById(String id) async {
    return db.collection(saleCollection).doc(id).get().then(
      (DocumentSnapshot doc) {
        final element = doc.data() as Map<String, dynamic>;
        return Sale(
          id: doc.id,
          medicamentId: element["medicamentId"],
          medicamentName: element["medicamentName"],
          medicamentQuantity: element["medicamentQuantity"],
          finalPrice: element["finalPrice"],
          date: element["date"],
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
}
