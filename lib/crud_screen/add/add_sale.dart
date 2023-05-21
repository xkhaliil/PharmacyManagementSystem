import 'package:flutter/material.dart';
import 'package:pharmacymanagementsystem/data/category/category-source.dart';
import 'package:pharmacymanagementsystem/data/medicament/medicament-source.dart';
import 'package:pharmacymanagementsystem/data/sale/sale-source.dart';
import 'package:pharmacymanagementsystem/model/medicament/medicament.dart';

import '../../model/medicament/category.dart';

class AddSaleScreen extends StatefulWidget {
  const AddSaleScreen({Key? key}) : super(key: key);
  static String routeName = "/add_sale";

  @override
  _AddSaleScreenState createState() => _AddSaleScreenState();
}

class _AddSaleScreenState extends State<AddSaleScreen> {
  TextEditingController finalPriceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();

  Category? _selectedCategory;
  Medicament? _selectedMedicament;
  List<Category> categories = List.empty();
  List<Medicament> medicaments = List.empty();

  @override
  void initState() {
    super.initState();
    CategorySource.getAllCategories().then((value) => setState(() {
          categories = value;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Sale'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButtonFormField<Category>(
              decoration: const InputDecoration(labelText: 'Select Category'),
              onChanged: (value) => setState(() {
                _selectedCategory = value;
                updateMedicaments(value!.id);
              }),
              items: categories
                  .map((category) => DropdownMenuItem<Category>(
                        value: category,
                        child: Text(category.name),
                      ))
                  .toList(),
              validator: (value) {
                if (value == null) {
                  return 'Please select category';
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<Medicament>(
              decoration: const InputDecoration(labelText: 'Select Medicament'),
              onChanged: (value) => setState(() {
                _selectedMedicament = value;
              }),
              items: medicaments
                  .map((medicament) => DropdownMenuItem<Medicament>(
                        value: medicament,
                        child: Text(medicament.name),
                      ))
                  .toList(),
              validator: (value) {
                if (value == null) {
                  return 'Please select medicament';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextField(
              controller: quantityController,
              decoration: const InputDecoration(labelText: 'Quantity'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                finalPriceController.text = "${calculatePrice(value)} Dinars";
              },
            ),
            const SizedBox(height: 16),
            TextField(
              enabled: false,
              controller: finalPriceController,
              decoration: const InputDecoration(labelText: 'Total price'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                SaleSource.createSale(
                        _selectedMedicament!.id,
                        _selectedMedicament!.name,
                        int.parse(quantityController.text),
                        calculatePrice(quantityController.text))
                    .then((value) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Sale added.')),
                  );
                  Navigator.pop(context);
                }, onError: (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Failed.')),
                  );
                });
              },
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }

  double calculatePrice(String value) =>
      (_selectedMedicament?.price ?? 0) * double.parse(value);

  void updateMedicaments(String id) {
    MedicamentSource.getMedicamentByCategory(id).then((value) => setState(() {
          medicaments = value;
        }));
  }
}
