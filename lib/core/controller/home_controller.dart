import 'package:get/get.dart';
import 'package:pos/core/constant/products.dart';
import 'package:pos/core/model/product_model.dart';
import 'package:pos/core/model/record.dart';

class HomeController extends GetxController {
  var productList = <ProductModel>[].obs;
  var selectedProductList = <ProductModel>[].obs;
  var total = 0.obs;
  var recordList = <RecordModel>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  fetchProducts() {
    productList.addAll(dummyProducts);
  }

  addProduct(ProductModel model) {
    final index = selectedProductList.indexWhere((p) => p.code == model.code);
    if (index >= 0) {
      selectedProductList[index] = model;
    } else {
      selectedProductList.add(model);
    }
    calculateTotal();
    productList.refresh();
  }

  removeProduct(ProductModel model) {
    selectedProductList.remove(model);
    final index = productList.indexWhere((p) => p.code == model.code);
    if (index >= 0) {
      productList[index].count = 0;
      productList.refresh();
    }
    calculateTotal();
  }

  calculateTotal() {
    total.value = 0;
    for (var val in selectedProductList) {
      total.value += (val.price) * (val.count);
    }
  }

  addRecord() {
    RecordModel model = RecordModel(
        products: selectedProductList,
        total: total.value,
        date: DateTime.now().toString());
    recordList.add(model);
    clearAllData();
  }

  clearAllData() {
    selectedProductList.value = [];
    total.value = 0;
    for (var val in productList) {
      val.count = 0;
    }
  }
}
