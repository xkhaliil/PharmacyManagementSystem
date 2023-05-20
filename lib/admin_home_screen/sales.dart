import 'package:flutter/material.dart';
import 'package:pharmacymanagementsystem/data/sale/sale-source.dart';
import '../crud_screen/add/add_sale.dart';
import '../crud_screen/update/update_sale.dart';
import '../data/preferences/shared_preferences.dart';
import '../model/sale/sale.dart';

class ManageSalesScreen extends StatefulWidget {
  const ManageSalesScreen({Key? key});

  static String routeName = "sale";

  @override
  State<ManageSalesScreen> createState() => _ManageSalesScreenState();
}

class _ManageSalesScreenState extends State<ManageSalesScreen> {
  List<Sale> saleList = [];

  @override
  void initState() {
    super.initState();
    SaleSource.getAllSales().then((sales) {
      setState(() {
        saleList = sales;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Manage Sales',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'Montserrat',
            letterSpacing: 1.5,
          ),
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
                         Navigator.pushNamed(context, AddSaleScreen.routeName);
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
                itemCount: saleList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 2,
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            "${saleList[index].medicamentName}",
                          ),
                          subtitle: Text(
                            "${saleList[index].salesmanName}",
                          ),
                          trailing: Wrap(
                            spacing: 12, // space between two icons
                            children: <Widget>[
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  tryRemoveSale(saleList[index].id);
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () {
                                  SharedPreferencesHelper.putSelectedId(
                                      saleList[index].id);
                                  // Navigator.pushNamed(context,SaleUpdateScreen.routeName, );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void tryRemoveSale(String id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Delete'),
          content: const Text('Are you sure you want to delete this sale?'),
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
                SaleSource.removeSale(id).then((_) {
                  setState(() {
                    saleList.removeWhere((sale) => sale.id == id);
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Sale deleted')),
                  );
                }).catchError((e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Failed to delete sale')),
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
