import 'package:flutter/material.dart';
import 'package:pharmacymanagementsystem/data/account/account-source.dart';
import '../crud_screen/add/add_account.dart';
import '../crud_screen/update/update_account.dart';
import '../data/preferences/shared_preferences.dart';
import '../model/account/account.dart';

class ManageAccountsScreen extends StatefulWidget {
  const ManageAccountsScreen({super.key});

  static String routeName = "account";

  @override
  State<ManageAccountsScreen> createState() => _ManageAccountsScreenState();
}

class _ManageAccountsScreenState extends State<ManageAccountsScreen> {
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
        title: Row(
          children: const [
            Text(
              'Manage Accounts',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
                letterSpacing: 1.5,
              ),
            ),
          ],
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF2B32B2), Color(0xFF1488CC)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              tileMode: TileMode.clamp,
            ),
          ),
        ),
        elevation: 0,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5,
                    offset: Offset(1, 1),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AddAccountScreen.routeName);
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 13),
                        child: Text(
                          'Add',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: accountList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                      elevation: 2,
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(
                                "${accountList[index].name} ${accountList[index].lastname}"),
                            subtitle: Text(accountList[index].email),
                            trailing: Wrap(
                              spacing: 12, // space between two icons
                              children: <Widget>[
                                IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () {
                                    tryRemoveAccount(accountList[index].id);
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () {
                                    SharedPreferencesHelper.putSelectedId(accountList[index].id);
                                    Navigator.pushNamed(
                                        context, AccountUpdateScreen.routeName);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ));
                },
              ),
            ),
            Column(
                children: accountList
                    .map((account) => ListTile(title: Text(account.name)))
                    .toList()),
          ],
        ),
      ),
    );
  }

  void tryRemoveAccount(String id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Delete'),
          content: const Text('Are you sure you want to delete this account?'),
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
                AccountSource.removeAccount(id).then((value) {
                  setState(() {
                    accountList.removeWhere((element) => element.id == id);
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Account deleted')),
                  );
                }, onError: (e) {
                  return ScaffoldMessenger.of(context).showSnackBar(
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
}
