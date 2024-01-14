import 'package:flutter/material.dart';
import 'package:store_app_flutter/Bloc/cubit.dart';
import 'package:store_app_flutter/Bloc/states.dart';
import 'package:store_app_flutter/Helpers/Network/dioHelper.dart';
import 'package:store_app_flutter/Screens/Home/homeScreen.dart';
import 'package:store_app_flutter/Screens/updateScreen/updateScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app_flutter/models/product_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  runApp(const Store());
}

class Store extends StatelessWidget {
  const Store({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StoreCubit(StoreInitialState())..getProducts(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            HomePage.id: (context) => HomePage(),
            UpdatePage.id: (context) => UpdatePage(
                  product: ProductModel(),
                ),
          },
          initialRoute: HomePage.id),
    );
  }
}
