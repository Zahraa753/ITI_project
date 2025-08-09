import 'package:flutter/material.dart';
import 'package:flutter_application_1/products_pages/API_model.dart';
import 'package:flutter_application_1/controller/product/cubit/products_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class staggededr_view extends StatefulWidget {
  const staggededr_view({super.key});

  @override
  State<staggededr_view> createState() => _staggededr_viewState();
}

class _staggededr_viewState extends State<staggededr_view> {
  late ApiAcs productmodelAPI;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(),
      child: BlocConsumer<ProductsCubit, ProductsState>(
        listener: (context, state) {
          if (state is ProductsError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Error: ${state.message}')));
          }
          if (state is ProductsSuccess) {
            productmodelAPI = state.productModelAPI;
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xFFFEC500),
              title: Row(
                spacing: 5,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 10),
                  Icon(Icons.menu),
                  Text(
                    'Product List',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Cairo',
                    ),
                  ),
                ],
              ),
            ),
            body: state is ProductsLoading
                ? Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    child: StaggeredGrid.count(
                      mainAxisSpacing: 10,
                      crossAxisCount: 3,
                      children: [
                        for (
                          int i = 0;
                          i < productmodelAPI.products.length;
                          i++
                        )
                          StaggeredGridTile.fit(
                            crossAxisCellCount: 1,
                            child: Card(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.network(
                                    productmodelAPI.products[i].thumbnail,
                                  ),
                                  Text(productmodelAPI.products[i].title),
                                  Text(
                                    '\$${productmodelAPI.products[i].price}',
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}
