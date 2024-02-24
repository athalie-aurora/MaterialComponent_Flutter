import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'colors.dart';
import 'model/product.dart';
import 'model/products_repository.dart';
import 'supplemental/asymmetric_view.dart'; // Import AsymmetricView

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            semanticLabel: 'menu',
          ),
          onPressed: () {
            print('Menu button');
          },
        ),
        title: const Text('SHRINE'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.search,
              semanticLabel: 'search',
            ),
            onPressed: () {
              print('Search button');
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.tune,
              semanticLabel: 'filter',
            ),
            onPressed: () {
              print('Filter button');
            },
          ),
        ],
      ),
      // Menggunakan AsymmetricView untuk tata letak asimetris
      body: AsymmetricView(
        products: ProductsRepository.loadProducts(Category.all),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     _scrollController.animateTo(
      //       0,
      //       duration: const Duration(milliseconds: 500),
      //       curve: Curves.easeInOut,
      //     );
      //   },
      //   child: const Icon(Icons.arrow_upward),
      // ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _scrollController.animateTo(
            0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        },
        child: const Icon(Icons.arrow_upward),
        foregroundColor: kShrineBrown900,
        backgroundColor: kShrineBlue100,
      ),

    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
