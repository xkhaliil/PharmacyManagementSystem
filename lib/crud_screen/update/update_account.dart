import 'package:flutter/material.dart';
import 'package:pharmacymanagementsystem/model/account/account.dart';
import 'package:pharmacymanagementsystem/model/account/role.dart';

class AccountUpdateScreen extends StatefulWidget {
  const AccountUpdateScreen({Key? key}) : super(key: key);
  static String routeName = "/updateAccount";

  @override
  _AccountUpdateScreenState createState() => _AccountUpdateScreenState();
}

class _AccountUpdateScreenState extends State<AccountUpdateScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  Role _selectedRole = Role.employee;
  final List<Account> _accounts = [
    Account(
      id: "sqdqsdqd",
      name: 'John',
      surname: 'Doe',
      email: "jhon@email.com",
      password: "1234567890",
      phoneNumber: "1231231",
      role: Role.admin,
    ),
  ];
  Account? _selectedAccount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Update Account'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownButton<Account>(
                  value: _selectedAccount,
                  onChanged: (Account? value) {
                    setState(() {
                      _selectedAccount = value;
                      _nameController.text = value!.name;
                      _surnameController.text = value.surname;
                      _emailController.text = value.email;
                      _passwordController.text = value.password;
                      _phoneNumberController.text = value.phoneNumber;
                      _selectedRole = value.role;
                    });
                  },
                  items: _accounts
                      .map<DropdownMenuItem<Account>>((Account account) {
                    return DropdownMenuItem<Account>(
                      value: account,
                      child: Text('${account.name} ${account.surname}'),
                    );
                  }).toList(),
                ),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    hintText: 'Enter your name',
                    labelText: 'Name',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _surnameController,
                  decoration: const InputDecoration(
                    hintText: 'Enter your surname',
                    labelText: 'Surname',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your surname';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: 'Enter your email',
                    labelText: 'Email',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    } else if (!value.contains('@')) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Enter your password',
                    labelText: 'Password',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _phoneNumberController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    hintText: 'Enter your phone number',
                    labelText: 'Phone number',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),
                DropdownButton<Role>(
                  value: _selectedRole,
                  onChanged: (Role? value) {
                    setState(() {
                      _selectedRole = value!;
                    });
                  },
                  items: Role.values.map<DropdownMenuItem<Role>>((Role role) {
                    return DropdownMenuItem<Role>(
                      value: role,
                      child: Text(role.toString().split('.').last),
                    );
                  }).toList(),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Account updated'),
                        ),
                      );
                    }
                  },
                  child: const Text('Update'),
                ),
              ],
            ),
          ),
        ));
  }
}
