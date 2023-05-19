import 'package:flutter/material.dart';
import 'package:pharmacymanagementsystem/data/account/account-source.dart';
import 'package:pharmacymanagementsystem/model/account/account.dart';
import 'package:pharmacymanagementsystem/model/account/role.dart';

import '../../data/preferences/shared_preferences.dart';

class AccountUpdateScreen extends StatefulWidget {
  const AccountUpdateScreen({Key? key}) : super(key: key);
  static String routeName = "/updateAccount";

  @override
  State<AccountUpdateScreen> createState() => _AccountUpdateScreenState();
}

class _AccountUpdateScreenState extends State<AccountUpdateScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  Role _selectedRole = Role.employee;

  Account? account;
  String? id;

  @override
  void initState() {
    super.initState();
    SharedPreferencesHelper.getSelectedId().then((accountId) {
      id = accountId;
      return AccountSource.getAccountById(accountId);
    }).then((account) {
      setState(() {
        this.account = account;
        _nameController.text = account.name;
        _lastnameController.text = account.lastname;
        _emailController.text = account.email;
        _phoneNumberController.text = account.phone;
        _selectedRole = account.role;
      });
    });
  }

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
                  controller: _lastnameController,
                  decoration: const InputDecoration(
                    hintText: 'Enter your lastname',
                    labelText: 'Lastname',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your lastname';
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
                      AccountSource.updateAccount(
                              id!,
                              _nameController.text,
                              _lastnameController.text,
                              _emailController.text,
                              _phoneNumberController.text,
                              _passwordController.text,
                              _selectedRole.name)
                          .then((value) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Account updated'),
                          ),
                        );
                      });
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
