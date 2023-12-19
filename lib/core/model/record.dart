import 'package:pos/core/model/product_model.dart';

class RecordModel {
  List<ProductModel> products;
  int total;
  String date;

  RecordModel({
    required this.products,
    required this.total,
    required this.date,
  });
}
