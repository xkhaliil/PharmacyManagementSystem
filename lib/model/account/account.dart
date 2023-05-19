import 'package:pharmacymanagementsystem/model/account/role.dart';

class Account {
  final String id;
  final String uid;
  late final String name;
  final String lastname;
  final String email;
  final String password;
  final String phone;
  final Role role;
  Account({
    required this.id,
    required this.uid,
    required this.name,
    required this.lastname,
    required this.email,
    required this.password,
    required this.phone,
    required this.role,
  });

  Account copyWith({
    String? id,
    String? name,
    String? surname,
    String? email,
    String? password,
    String? phoneNumber,
    Role? role,
  }) {
    return Account(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      name: name ?? this.name,
      lastname: surname ?? this.lastname,
      email: email ?? this.email,
      password: password ?? this.password,
      phone: phoneNumber ?? this.phone,
      role: role ?? this.role,
    );
  }

  @override
  String toString() {
    return 'Account(id: $id, uid: $uid,name: $name, surname: $lastname, email: $email, password: $password, phoneNumber: $phone, role: $role)';
  }

  @override
  bool operator ==(covariant Account other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.uid == uid &&
      other.name == name &&
      other.lastname == lastname &&
      other.email == email &&
      other.password == password &&
      other.phone == phone &&
      other.role == role;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      uid.hashCode ^
      name.hashCode ^
      lastname.hashCode ^
      email.hashCode ^
      password.hashCode ^
      phone.hashCode ^
      role.hashCode;
  }
}
