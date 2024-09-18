import 'package:store_app_thw/helper/api.dart';
import 'package:store_app_thw/models/product_model.dart';

class CategoriesServices {
  Future<List<dynamic>> getCategories({required String categoryName}) async {
    List<dynamic> data = await Api()
        .get(url: 'https://fakestoreapi.com/products/category/$categoryName');

    List<ProductModel> prouctsList = [];
    for (int i = 0; i < data.length; i++) {
      prouctsList.add(
        ProductModel.fromJson(data[i]),
      );
    }
    return prouctsList;
  }
}
