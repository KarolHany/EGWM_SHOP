import 'package:store_app_thw/helper/api.dart';

class AllCategoriesServices {
  Future<List<dynamic>> getAllCategories() async {
    List<dynamic> data = await  Api().get(url: 'https://fakestoreapi.com/products/categories');
      return data;
    } 
  }

