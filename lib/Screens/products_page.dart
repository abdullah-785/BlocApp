import 'package:bloc_app/Screens/Models/products_model.dart';

import './products_bloc/products_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 1;
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Text(
              "Products",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10,
            ),
            BlocBuilder<ProductsBloc, ProductsState>(builder: (context, state) {
              if (state is ProductsLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is ProductsLoadedState) {
                return SizedBox(
                  width: width,
                  height: height,
                  child: ListView.builder(
                      itemCount: state.productModel.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            width: width,
                            height: 150,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image(
                                        width: 100,
                                        height: 150,
                                        fit: BoxFit.cover,
                                        image: NetworkImage(state
                                            .productModel[index].image
                                            .toString())),
                                  ),
                                ),
                                // Column(
                                //   children: [
                                //     Text(state.productModel[index].title
                                //         .toString())
                                //   ],
                                // )
                              ],
                            ),
                          ),
                        );
                      }),
                );
              } else if (state is ProductsErrorState) {
                return Center(
                  child: Text(state.errorMessage),
                );
              }
              return const SizedBox();
            }),
          ],
        ),
      ),
    ));
  }
}
