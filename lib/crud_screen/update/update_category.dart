import 'package:flutter/material.dart';
import 'package:pharmacymanagementsystem/data/category/category-source.dart';
import 'package:pharmacymanagementsystem/model/medicament/category.dart';


import '../../data/preferences/shared_preferences.dart';

class CategoryUpdateScreen extends StatefulWidget {
  const CategoryUpdateScreen({Key? key}) : super(key: key);
  static String routeName = "/updateCategory";

  @override
  State<CategoryUpdateScreen> createState() => _CategoryUpdateScreenState();
}

class _CategoryUpdateScreenState extends State<CategoryUpdateScreen> {
  final _formKey = GlobalKey<FormState>();
  final _categoryNameController = TextEditingController();

  Category? category;
  String? id;

  @override
  void initState() {
    super.initState();
    SharedPreferencesHelper.getSelectedId().then((categoryId) {
      id = categoryId;
      return CategorySource.getCategoryById(categoryId);
    }).then((category) {
      setState(() {
        this.category = category;
        _categoryNameController.text = category.name;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Update Category'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _categoryNameController,
                  decoration: const InputDecoration(
                    hintText: 'Enter category name',
                    labelText: 'Category Name',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter category name';
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      CategorySource.updateCategory(
                              id!,
                              _categoryNameController.text)
                          .then((value) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Category updated'),
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
