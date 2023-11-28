import 'package:bloc_app/Screens/home_page.dart';
import 'package:bloc_app/Screens/products_bloc/products_bloc.dart';
import 'package:bloc_app/Screens/products_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => ProductsBloc()..add(ProductsLoadedEvents()),
        child: ProductsPage(),
      ),
    );
  }
}
