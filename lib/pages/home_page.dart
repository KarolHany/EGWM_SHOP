import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app_thw/components/card.dart';
import 'package:store_app_thw/models/product_model.dart';
import 'package:store_app_thw/pages/electronics_product_page.dart';
import 'package:store_app_thw/pages/jewelery_product_page.dart';
import 'package:store_app_thw/pages/product_details_page.dart';
import 'package:store_app_thw/components/profile.dart';
import 'package:store_app_thw/pages/womens_clothes.dart';
import 'package:store_app_thw/services/all_products_services.dart';

class HomePage extends StatefulWidget {
  static String id = 'HomePage';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int indexC = 0; // Controls which page to display

  // Method to build the main page (all products)
  Widget buildAllProductsPage() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
      child: FutureBuilder<List<ProductModel>>(
        future: AllProductsServices().getAllProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<ProductModel> products = snapshot.data!;
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

  // Method to build the women's clothing page
  Widget buildClothesPage() {
    return WomensClothes();
  }

  Widget buildElectronicsPage() {
    return ElectronicsProductPage();
  }

  Widget buildJeweleryPage() {
    return JeweleryProductPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, // Change the color of the menu icon here
        ),
        backgroundColor: Colors.deepPurple.shade100,
        elevation: 0,
        title: indexC == 1
            ? const Text(
                'WOMENS CLOTHES',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              )
            : indexC == 2
                ? const Text(
                    'ELECTRONICS',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : indexC == 3
                    ? const Text(
                        'JEWELERY',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : const Text(
                        'EGWM SHOP',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FontAwesomeIcons.cartShopping,
              color: Colors.white,
            ),
          )
        ],
      ),
      drawer: Profile(),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Colors.deepPurple.shade200,
        animationDuration: const Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            indexC = index; // Update index on tap
          });
        },
        items: const [
          Icon(
            Icons.home,
            color: Colors.white,
          ),
          Icon(
            FontAwesomeIcons.shopify,
            color: Colors.white,
          ),
          Icon(
            FontAwesomeIcons.tv,
            color: Colors.white,
          ),
          Icon(
            FontAwesomeIcons.gem,
            color: Colors.white,
          ),
          Icon(
            Icons.settings,
            color: Colors.white,
          ),
        ],
      ),
      body: indexC == 0
          ? buildAllProductsPage()
          : indexC == 1
              ? buildClothesPage()
              : indexC == 2
                  ? buildElectronicsPage()
                  : indexC == 3
                      ? buildJeweleryPage()
                      : null, // Switch between pages based on the index
    );
  }
}
