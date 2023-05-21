import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:pharmacymanagementsystem/data/sale/sale-source.dart';
import 'package:pharmacymanagementsystem/model/sale/sale.dart';
import 'package:collection/collection.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({Key? key}) : super(key: key);

  static String routeName = "/statistics";

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  List<Sale> sales = List.empty();
  String totalSale = "";
  String salesToday = "";
  String salesYesterday = "";
  Map<String, String> topSales = {};

  @override
  void initState() {
    super.initState();
    SaleSource.getAllSales().then((value) => setState(() {
          sales = value;
          totalSale = calculateTotalSales();
          salesToday = calculateSalesToday();
          salesYesterday = calculateSalesYesterday();
          calculateTopSales();
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Statistics'),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Total Sales',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "$totalSale Dinars",
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'Daily Sales',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 120,
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 2),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Today',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "$salesToday Dinars",
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 120,
                      margin: const EdgeInsets.only(left: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 2),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Yesterday',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "$salesYesterday Dinars",
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              const Text(
                'Top Selling Products',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                height: 240,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 2),
                      blurRadius: 6,
                    ),
                  ],
                  color: Colors.white,
                ),
                child: ListView(
                  children: sorted(topSales).keys
                      .mapIndexed((i, e) => _buildTopSellingProductItem(
                          name: e, sales: topSales[e] ?? "", imageUrl: "https://picsum.photos/200?random=$e"))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopSellingProductItem(
      {required String name, required String sales, required String imageUrl}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.network(
              imageUrl,
              width: 64,
              height: 64,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Sales: $sales',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String calculateTotalSales() => sales
      .map((e) => e.finalPrice)
      .toList()
      .reduce((a, b) => a + b)
      .toString();

  String calculateSalesToday() => sales
      .toList()
      .where((element) => sameDay(element.date))
      .map((e) => e.finalPrice)
      .reduce((a, b) => a + b)
      .toString();

  String calculateSalesYesterday() {
    var yesterdaysSales =
        sales.where((element) => yesterday(element.date)).toList();
    if (yesterdaysSales.isNotEmpty) {
      return yesterdaysSales
          .map((e) => e.finalPrice)
          .reduce((a, b) => a + b)
          .toString();
    } else {
      return "0";
    }
  }

  bool sameDay(DateTime date) =>
      date.day == DateTime.now().day &&
      date.year == DateTime.now().year &&
      date.month == DateTime.now().month;

  bool yesterday(DateTime date) =>
      date.day == DateTime.now().subtract(const Duration(days: 1)).day &&
      date.year == DateTime.now().year &&
      date.month == DateTime.now().month;

  calculateTopSales() => sales
          .groupListsBy((element) => element.medicamentName)
          .forEach((key, values) {
        topSales[key] = values
            .map<int>((element) => element.medicamentQuantity)
            .reduce((a, b) => a + b)
            .toString();
      });

  Map<String, String> sorted(Map<String, String> map) {
    return SplayTreeMap.from(map, (a, b) => map[b]!.compareTo(map[a]!));
  }
}
