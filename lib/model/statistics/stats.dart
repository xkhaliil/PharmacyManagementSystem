// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Stats {
 final double salesFigure;
 final double medicamentQuantity;
  Stats({
    required this.salesFigure,
    required this.medicamentQuantity,
  });
 

  Stats copyWith({
    double? salesFigure,
    double? medicamentQuantity,
  }) {
    return Stats(
      salesFigure: salesFigure ?? this.salesFigure,
      medicamentQuantity: medicamentQuantity ?? this.medicamentQuantity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'salesFigure': salesFigure,
      'medicamentQuantity': medicamentQuantity,
    };
  }

  factory Stats.fromMap(Map<String, dynamic> map) {
    return Stats(
      salesFigure: map['salesFigure'] as double,
      medicamentQuantity: map['medicamentQuantity'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Stats.fromJson(String source) => Stats.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Stats(salesFigure: $salesFigure, medicamentQuantity: $medicamentQuantity)';

  @override
  bool operator ==(covariant Stats other) {
    if (identical(this, other)) return true;
  
    return 
      other.salesFigure == salesFigure &&
      other.medicamentQuantity == medicamentQuantity;
  }

  @override
  int get hashCode => salesFigure.hashCode ^ medicamentQuantity.hashCode;
}
