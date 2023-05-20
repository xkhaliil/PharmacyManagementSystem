import 'package:flutter/material.dart';
import 'package:pharmacymanagementsystem/data/medicament/medicament-source.dart';
import 'package:pharmacymanagementsystem/model/medicament/medicament.dart';
import '../crud_screen/add/add_medicament.dart';
import '../crud_screen/update/update_medicament.dart';
import '../data/preferences/shared_preferences.dart';

class ManageMedicamentsScreen extends StatefulWidget {
  const ManageMedicamentsScreen({Key? key}) : super(key: key);

  static String routeName = "medicament";

  @override
  State<ManageMedicamentsScreen> createState() => _ManageMedicamentsScreenState();
}

class _ManageMedicamentsScreenState extends State<ManageMedicamentsScreen> {
  List<Medicament> medicamentList = [];

  @override
  void initState() {
    super.initState();
    MedicamentSource.getAllMedicaments().then((medicaments) {
      setState(() {
        medicamentList = medicaments;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Manage Medicaments',
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
                        Navigator.pushNamed(context, AddMedicamentScreen.routeName);
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 13),
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
                itemCount: medicamentList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 2,
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(medicamentList[index].name),
                          trailing: Wrap(
                            spacing: 12,
                            children: <Widget>[
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  tryRemoveMedicament(medicamentList[index].id);
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () {
                                  SharedPreferencesHelper.putSelectedId(medicamentList[index].id);
                                   Navigator.pushNamed(context, MedicamentUpdateScreen.routeName);
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

  void tryRemoveMedicament(String id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Delete'),
          content: const Text('Are you sure you want to delete this medicament?'),
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
                MedicamentSource.removeMedicament(id).then((value) {
                  setState(() {
                    medicamentList.removeWhere((element) => element.id == id);
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Medicament deleted')),
                  );
                }).catchError((e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Failed')),
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
