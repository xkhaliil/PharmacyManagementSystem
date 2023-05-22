import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pharmacymanagementsystem/model/account/account.dart';
import '../../model/account/role.dart';

class AccountSource {
  static FirebaseFirestore db = FirebaseFirestore.instance;
  static const accountCollection = "account";

  static Future<void> createAccount(
    String name,
    String lastname,
    String email,
    String phone,
    String password,
    String role,
  ) async {
    return FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      var uid = value.user?.uid;
      if (uid != null) {
        db.collection(accountCollection).doc().set({
          "name": name,
          "lastname": lastname,
          "email": email,
          "phone": phone,
          "password": password,
          "role": role,
          "uid": uid,
        }).then((value) {
          return value;
        }, onError: (e) {
          return Future.error(Exception("Error while creating account: $e"));
        });
      } else {
        Future.error(Exception("Impossible to create an account"));
      }
    });
  }

  static Future<List<Account>> getAllAccounts() async {
    return db.collection(accountCollection).get().then(
          (accounts) => accounts.docs
              .map((element) => Account(
                  id: element.id,
                  uid: element.data()["uid"],
                  name: element.data()["name"],
                  lastname: element.data()["lastname"],
                  email: element.data()["email"],
                  phone: element.data()["phone"],
                  password: "",
                  role: Role.values.byName(element.data()["role"])))
              .toList(),
          onError: (e) => print("Error while getAllAccounts: $e"),
        );
  }

  static Future<Account> getAccountById(String id) async => db
          .collection(accountCollection)
          .doc(id)
          .get()
          .then((DocumentSnapshot doc) {
        final element = doc.data() as Map<String, dynamic>;
        return Account(
            id: doc.id,
            uid: element["uid"],
            name: element["name"],
            lastname: element["lastname"],
            email: element["email"],
            phone: element["phone"],
            password: "",
            role: Role.values.byName(element["role"]));
      }, onError: (e) {
        print("error while getAccountById: $e");
      });

  static Future<void> removeAccount(String id) async => db
      .collection(accountCollection)
      .doc(id)
      .delete()
      .then((value) => FirebaseAuth.instance.currentUser?.delete());

  static Future<void> updateAccount(
    String id,
    String name,
    String lastname,
    String email,
    String phone,
    String password,
    String role,
  ) async {
    final data = {
      "name": name,
      "lastname": lastname,
      "email": email,
      "phone": phone,
      "password": password,
      "role": role,
    };
    return await db
        .collection(accountCollection)
        .doc(id)
        .set(data, SetOptions(merge: true));
  }
}
