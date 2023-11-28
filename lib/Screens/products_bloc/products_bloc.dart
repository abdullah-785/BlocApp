import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bloc_app/Screens/Models/products_model.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsLoadedEvents, ProductsState> {
  ProductsBloc() : super(ProductsLoadingState()) {
    on<ProductsLoadedEvents>((event, emit) async {
      try {
        emit(ProductsLoadingState());
        var response =
            await http.get(Uri.parse("https://fakestoreapi.com/products"));

        if (response.statusCode == 200) {
          emit(ProductsLoadedState(
              productModel: productsModelFromJson(response.body)));
        } else {
          throw Exception("Failed to load");
        }
      } catch (e) {
        emit(ProductsErrorState(errorMessage: e.toString()));
      }
    });
  }
}
