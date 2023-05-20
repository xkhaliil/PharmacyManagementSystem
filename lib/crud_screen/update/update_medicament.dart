import 'package:flutter/material.dart';

import 'package:pharmacymanagementsystem/data/medicament/medicament-source.dart';



import '../../data/preferences/shared_preferences.dart';
import '../../model/medicament/medicament.dart';

class MedicamentUpdateScreen extends StatefulWidget {
    const MedicamentUpdateScreen({Key? key}) : super(key: key);

  static String routeName = "/updateMedicament";

  @override
  State<MedicamentUpdateScreen> createState() => _MedicamentUpdateScreenState();
}

class _MedicamentUpdateScreenState extends State<MedicamentUpdateScreen> {
  final _formKey = GlobalKey<FormState>();
  final _medicamentNameController = TextEditingController();
  final _medicamentPriceController = TextEditingController();
 


  Medicament? medicament;
  String? medicamentId;

    
  @override
  void initState() {
    super.initState();
    SharedPreferencesHelper.getSelectedId().then((medicamentId) {
      this.medicamentId = medicamentId;
      return Future.wait([
        MedicamentSource.getMedicamentById(medicamentId),
        
      ]);
    }).then((results) {
      setState(() {
        this.medicament = results[0] as Medicament?;
        _medicamentNameController.text = medicament?.name ?? '';
        _medicamentPriceController.text = medicament?.price.toString() ?? '';
        
        
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Medicament'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _medicamentNameController,
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
                controller: _medicamentPriceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Enter medicament price',
                  labelText: 'Medicament Price',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter medicament price';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid price';
                  }
                  return null;
                },
              ),
             SizedBox(height: 16.0),
              
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final name = _medicamentNameController.text;
                    final price = double.parse(_medicamentPriceController.text);
                    MedicamentSource.updateMedicament(
                      medicamentId!,
                      name,
                      price,
                      "selectedCategoryId",
                    ).then((value) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Medicament updated'),
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
      ),
    );
  }
}