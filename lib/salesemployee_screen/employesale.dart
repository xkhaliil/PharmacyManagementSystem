import 'package:flutter/material.dart';
import 'package:pharmacymanagementsystem/data/sale/sale-source.dart';
import '../crud_screen/add/add_sale.dart';
import '../model/sale/sale.dart';

class EmployeeManageSalesScreen extends StatefulWidget {
  const EmployeeManageSalesScreen({super.key});

  static String routeName = "E-sale";

  @override
  State<EmployeeManageSalesScreen> createState() => _EmployeeManageSalesScreenState();
}

class _EmployeeManageSalesScreenState extends State<EmployeeManageSalesScreen> {
  List<Sale> saleList = List.empty();

  @override
  void initState() {
    super.initState();
    updateSales();
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
                        Navigator.pushNamed(context, AddSaleScreen.routeName)
                            .then((value) => updateSales());
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
                            saleList[index].medicamentName,
                          ),
                          subtitle: Text(
                            saleList[index].finalPrice.toString(),
                          ),
                          trailing: Wrap(
                            spacing: 12, // space between two icons
                            
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

  updateSales() {
    SaleSource.getAllSales().then((sales) {
      setState(() {
        saleList = sales;
      });
    });
  }
}
