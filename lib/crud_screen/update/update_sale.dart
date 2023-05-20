import 'package:flutter/material.dart';


class UpdateSaleScreen extends StatefulWidget {
  const UpdateSaleScreen({Key? key}) : super(key: key);
  static String routeName = "/update_sale";

  @override
  _UpdateSaleScreenState createState() => _UpdateSaleScreenState();
}

class _UpdateSaleScreenState extends State<UpdateSaleScreen> {
  TextEditingController medicamentIdController = TextEditingController();
  TextEditingController accountIdController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController salesmanNameController = TextEditingController();
  TextEditingController medicamentNameController = TextEditingController();
  TextEditingController medicamentCategoryController = TextEditingController();
  TextEditingController medicamentPriceController = TextEditingController();
  TextEditingController medicamentQuantityController = TextEditingController();
  TextEditingController finalPriceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Sale'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: medicamentIdController,
              decoration: InputDecoration(labelText: 'Medicament list'),
            ),
            TextField(
              controller: accountIdController,
              decoration: InputDecoration(labelText: 'Account ID'),
            ),
            TextField(
              controller: priceController,
              decoration: InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: salesmanNameController,
              decoration: InputDecoration(labelText: 'Salesman Name'),
            ),
            TextField(
              controller: medicamentNameController,
              decoration: InputDecoration(labelText: 'Medicament Name'),
            ),
            TextField(
              controller: medicamentCategoryController,
              decoration: InputDecoration(labelText: 'Medicament Category'),
            ),
            TextField(
              controller: medicamentPriceController,
              decoration: InputDecoration(labelText: 'Medicament Price'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: medicamentQuantityController,
              decoration: InputDecoration(labelText: 'Medicament Quantity'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: finalPriceController,
              decoration: InputDecoration(labelText: 'Final Price'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
               
              },
              child: Text('Update'),
            ),
          ],
        ),
      ),
    );
  }
  void test(){

    // Call the SaleSource updateSale method
  //   SaleSource.updateSale(updatedSale).then((_) {
  //     Navigator.pop(context);
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Sale updated successfully')),
  //     );
  //   }).catchError((error) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Failed to update sale')),
  //     );
  //   });
  // }
}
}