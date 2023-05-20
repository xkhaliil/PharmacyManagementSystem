import 'package:flutter/material.dart';
import 'package:pharmacymanagementsystem/data/medicament/medicament-source.dart';

class AddMedicamentScreen extends StatefulWidget {
  const AddMedicamentScreen({Key? key}) : super(key: key);

  static String routeName = "/addMedicament";

  @override
  _AddMedicamentScreenState createState() => _AddMedicamentScreenState();
}

class _AddMedicamentScreenState extends State<AddMedicamentScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Medicament'),
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
                  hintText: 'Enter medicament name',
                  labelText: 'Medicament Name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter medicament name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _priceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Enter medicament price',
                  labelText: 'Medicament Price',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter medicament price';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              const Text('Category'),
              DropdownButtonFormField<String>(
              onChanged: (value) => "s",
                items: getCategoryDropdownItems(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select category';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    MedicamentSource.createMedicament(
                      _nameController.text,
                      double.parse(_priceController.text),
                      "dwe",
                    ).then((value) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Medicament added')),
                      );
                      clearText();
                    }, onError: (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Failed')),
                      );
                    });
                  }
                },
                child: const Text('Add Medicament'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> getCategoryDropdownItems() {
    // Replace this with your actual implementation to fetch categories
    List<String> categories = [
      'Category 1',
      'Category 2',
      'Category 3',
    ];

    return categories
        .map((category) => DropdownMenuItem<String>(
              value: category,
              child: Text(category),
            ))
        .toList();
  }

  void clearText() {
    _nameController.clear();
    _priceController.clear();
   
  }
}
