import 'package:flutter/material.dart';
import 'package:store_app_thw/components/card.dart';
import 'package:store_app_thw/pages/product_details_page.dart';
import 'package:store_app_thw/services/categories_services.dart';

class ElectronicsProductPage extends StatelessWidget {
  const ElectronicsProductPage({super.key});
  static String id = 'ElectronicsProductPage';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
      child: FutureBuilder<List<dynamic>>(
        future: CategoriesServices()
            .getCategories(categoryName: "electronics"),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<dynamic> products = snapshot.data!;
            return GridView.builder(
              itemCount: products.length,
              clipBehavior: Clip.none,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
                crossAxisSpacing: 30,
                mainAxisSpacing: 40,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      ProductDetailPage.id,
                      arguments: products[index],
                    );
                  },
                  child: CustomCard(
                    product: products[index],
                  ),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
