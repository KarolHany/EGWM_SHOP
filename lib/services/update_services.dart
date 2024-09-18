import 'package:store_app_thw/helper/api.dart';
import 'package:store_app_thw/models/product_model.dart';

class UpdateServices {
Future<ProductModel> updateProduct({
  required String title,
  required String price,
  required String desc,
  required int id,
  required String image,
  required String category,
}) async {
  print('product id = $id');
  Map<String, dynamic> data = await Api().put(
    url: 'https://fakestoreapi.com/products/$id',
    body: {
      'title': title,
      'price': price,
      'description': desc,
      'image': image,
      'category': category,
    },
  );
  return ProductModel.fromJson(data);
}
}

