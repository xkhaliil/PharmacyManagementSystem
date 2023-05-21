import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pharmacymanagementsystem/model/medicament/medicament.dart';

class MedicamentSource {
  static FirebaseFirestore db = FirebaseFirestore.instance;
  static const medicamentCollection = "medicaments";

  static Future<void> createMedicament(
       String name, double price, String idCategory) async {
    return db.collection(medicamentCollection).doc().set({
      "name": name,
      "price": price,
      "idCategory": idCategory,
    });
  }

  static Future<List<Medicament>> getAllMedicaments() async {
    return db.collection(medicamentCollection).get().then(
      (medicaments) => medicaments.docs
          .map((element) => Medicament(
                id: element.id,
                name: element.data()["name"],
                price: element.data()["price"].toDouble(),
                idCategory: element.data()["idCategory"],
              ))
          .toList(),
      onError: (e) => print("Error while getAllMedicaments: $e"),
    );
  }

  static Future<Medicament> getMedicamentById(String id) async {
    return db.collection(medicamentCollection).doc(id).get().then(
      (DocumentSnapshot doc) {
        final element = doc.data() as Map<String, dynamic>;
        return Medicament(
          id: doc.id,
          name: element["name"],
          price: element["price"].toDouble(),
          idCategory: element["idCategory"],
        );
      },
      onError: (e) {
        print("Error while getMedicamentById: $e");
      },
    );
  }

  static Future<void> removeMedicament(String id) async {
    return db.collection(medicamentCollection).doc(id).delete();
  }

  static Future<void> updateMedicament(
      String id, String name, double price, String idCategory) async {
    final data = {
      "name": name,
      "price": price,
      "idCategory": idCategory,
    };
    return db
        .collection(medicamentCollection)
        .doc(id)
        .set(data, SetOptions(merge: true));
  }
}