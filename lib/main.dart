// import 'package:bloc_app/Screens/home_page.dart';
// import 'package:bloc_app/Screens/products_bloc/products_bloc.dart';
// import 'package:bloc_app/Screens/products_page.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// void main() {
//   runApp(
//     const MyApp(),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: BlocProvider(
//         create: (context) => ProductsBloc()..add(ProductsLoadedEvents()),
//         child: ProductsPage(),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class DynamicStack extends StatefulWidget {
  @override
  _DynamicStackState createState() => _DynamicStackState();
}

class _DynamicStackState extends State<DynamicStack> {
  List<Widget> dynamicWidgets = [];

  void addDynamicWidget() {
    dynamicWidgets.add(
      Positioned(
        // You can customize the position of the added widget within the Stack
        top: dynamicWidgets.length * 50.0,
        left: dynamicWidgets.length * 50.0,
        child: Container(
          width: 100.0,
          height: 50.0,
          color: Colors.blue,
          child: Center(
            child: Text('Widget ${dynamicWidgets.length + 1}'),
          ),
        ),
      ),
    );

    // Trigger a rebuild to reflect the changes
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dynamic Stack Example'),
      ),
      body: Stack(
        children: [
          // Your other widgets here
          Positioned(
            bottom: 10.0,
            right: 10.0,
            child: ElevatedButton(
              onPressed: () {
                addDynamicWidget();
              },
              child: Text('Add Widget'),
            ),
          ),
          // Your other widgets here
          ...dynamicWidgets,
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: DynamicStack(),
  ));
}
