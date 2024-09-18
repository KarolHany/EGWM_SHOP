import 'package:store_app_thw/helper/api.dart';
import 'package:store_app_thw/models/product_model.dart';


class AllProductsServices {
  Future<List<ProductModel>> getAllProducts() async {
  List<dynamic> data = await  Api().get( url: 'https://fakestoreapi.com/products');
    List<ProductModel> prouctsList = [];
    for (int i = 0; i < data.length; i++) {
      prouctsList.add(
        ProductModel.fromJson(data[i]),
      );
    }
    return prouctsList;
  }
}
