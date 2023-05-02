import 'package:pharmacymanagementsystem/model/account/role.dart';

class Account {
  final String id;
  late final String name;
  final String surname;
  final String email;
  final String password;
  final String phoneNumber;
  final Role role;
  Account({
    required this.id,
    required this.name,
    required this.surname,
    required this.email,
    required this.password,
    required this.phoneNumber,
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
      name: name ?? this.name,
      surname: surname ?? this.surname,
      email: email ?? this.email,
      password: password ?? this.password,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      role: role ?? this.role,
    );
  }

  @override
  String toString() {
    return 'Account(id: $id, name: $name, surname: $surname, email: $email, password: $password, phoneNumber: $phoneNumber, role: $role)';
  }

  @override
  bool operator ==(covariant Account other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.surname == surname &&
      other.email == email &&
      other.password == password &&
      other.phoneNumber == phoneNumber &&
      other.role == role;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      surname.hashCode ^
      email.hashCode ^
      password.hashCode ^
      phoneNumber.hashCode ^
      role.hashCode;
  }
}
