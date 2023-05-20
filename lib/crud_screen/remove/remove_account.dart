import 'package:flutter/material.dart';
import 'package:pharmacymanagementsystem/model/account/account.dart';
import 'package:pharmacymanagementsystem/model/account/role.dart';

import '../../data/account/account-source.dart';

class AccountRemoveScreen extends StatefulWidget {
  const AccountRemoveScreen({Key? key}) : super(key: key);
  static String routeName = "/removeAccount";

  @override
  State<AccountRemoveScreen> createState() => _AccountRemoveScreenState();
}

class _AccountRemoveScreenState extends State<AccountRemoveScreen> {
  final _formKey = GlobalKey<FormState>();
  Account? _selectedAccount;
  List<Account> accountList = List.empty();

  @override
  @mustCallSuper
  void initState() {
    super.initState();
    AccountSource.getAllAccounts().then((accounts) {
      setState(() {
        accountList = accounts;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Remove Account'),
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
                  });
                },
                items: accountList
                    .map<DropdownMenuItem<Account>>((Account account) {
                  return DropdownMenuItem<Account>(
                    value: account,
                    child: Text('${account.name} ${account.lastname}'),
                  );
                }).toList(),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_selectedAccount != null) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Confirm Delete'),
                          content: const Text(
                              'Are you sure you want to delete this account?'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(false);
                              },
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(true);
                                AccountSource.removeAccount(
                                        _selectedAccount!.id)
                                    .then((value) {
                                  setState(() {
                                    accountList.remove(_selectedAccount);
                                    _selectedAccount = null;
                                  });
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Account deleted')),
                                  );
                                }, onError: (e) {
                                  return ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                    const SnackBar(content: Text('Failed.')),
                                  );
                                });
                              },
                              child: const Text('Delete'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: Text('Delete Account'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
