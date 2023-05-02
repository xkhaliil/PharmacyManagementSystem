import 'package:flutter/material.dart';
import 'package:pharmacymanagementsystem/model/account/account.dart';
import 'package:pharmacymanagementsystem/model/account/role.dart';



class AccountRemoveScreen extends StatefulWidget {
  const AccountRemoveScreen({Key? key}) : super(key: key);
  static String routeName = "/removeAccount";

  @override
  _AccountRemoveScreenState createState() => _AccountRemoveScreenState();
}

class _AccountRemoveScreenState extends State<AccountRemoveScreen> {
  final _formKey = GlobalKey<FormState>();
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
        title: Text('Remove Account'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
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
                items:
                    _accounts.map<DropdownMenuItem<Account>>((Account account) {
                  return DropdownMenuItem<Account>(
                    value: account,
                    child: Text('${account.name} ${account.surname}'),
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
                          title: Text('Confirm Delete'),
                          content: Text(
                              'Are you sure you want to delete this account?'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(false);
                              },
                              child: Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  _accounts.remove(_selectedAccount);
                                  _selectedAccount = null;
                                });
                                Navigator.of(context).pop(true);
                              },
                              child: Text('Delete'),
                            ),
                          ],
                        );
                      },
                    ).then((confirmed) {
                      if (confirmed == true) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Account deleted')),
                        );
                      }
                    });
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
