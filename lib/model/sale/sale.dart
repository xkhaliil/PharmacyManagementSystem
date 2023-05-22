// ignore_for_file: public_member_api_docs, sort_constructors_first

class Sale {
  final String id;
  final String medicamentId;
  final String medicamentName;
  final int medicamentQuantity;
  final double finalPrice;
  final DateTime date;

  Sale({
    required this.id,
    required this.medicamentId,
    required this.medicamentName,
    required this.medicamentQuantity,
    required this.finalPrice,
    required this.date,
  });
}
