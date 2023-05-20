import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pharmacymanagementsystem/model/medicament/category.dart';

class CategorySource {
  static FirebaseFirestore db = FirebaseFirestore.instance;
  static const categoryCollection = "categories";

  static Future<void> createCategory(String name) async {
    return db.collection(categoryCollection).doc().set({
      "name": name,
    });
  }

  static Future<List<Category>> getAllCategories() async {
    return db.collection(categoryCollection).get().then(
      (categories) => categories.docs
          .map((element) => Category(
                id: element.id,
                name: element.data()["name"],
              ))
          .toList(),
      onError: (e) => print("Error while getAllCategories: $e"),
    );
  }

  static Future<Category> getCategoryById(String id) async {
    return db.collection(categoryCollection).doc(id).get().then(
      (DocumentSnapshot doc) {
        final element = doc.data() as Map<String, dynamic>;
        return Category(
          id: doc.id,
          name: element["name"],
        );
      },
      onError: (e) {
        print("Error while getCategoryById: $e");
      },
    );
  }

  static Future<void> removeCategory(String id) async {
    return db.collection(categoryCollection).doc(id).delete();
  }

  static Future<void> updateCategory(String id, String name) async {
    final data = {
      "name": name,
    };
    return db.collection(categoryCollection).doc(id).set(data, SetOptions(merge: true));
  }
}



