import 'package:flutter/material.dart';
import 'package:store_app_flutter/Bloc/cubit.dart';
import 'package:store_app_flutter/Bloc/states.dart';
import 'package:store_app_flutter/Helpers/Local/cache_helper/cache_helper.dart';
import 'package:store_app_flutter/Helpers/Network/dioHelper.dart';
import 'package:store_app_flutter/Screens/Home/homeScreen.dart';
import 'package:store_app_flutter/Screens/updateScreen/updateScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app_flutter/models/product_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await cacheHelper.init();

  bool isdark = cacheHelper.getData(key: 'isDark');
  runApp(Store(
    isdark,
  ));
}

class Store extends StatelessWidget {
  Store(this.isdark);
  final bool isdark;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StoreCubit(StoreInitialState())
        ..changeMode(fromShared: isdark)
        ..getProducts(),
      child: BlocConsumer<StoreCubit, StoreStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return MaterialApp(
              theme: ThemeData(
                  textTheme: TextTheme(),
                  applyElevationOverlayColor: true,
                  brightness: Brightness.light,
                  scaffoldBackgroundColor: Colors.white,
                  appBarTheme: AppBarTheme(
                    color: Colors.white,
                    titleTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                    elevation: 0.0,
                    iconTheme: IconThemeData(color: Colors.black),
                  )),
              darkTheme: ThemeData(
                  textTheme: TextTheme(),
                  primaryTextTheme: TextTheme(),
                  applyElevationOverlayColor: true,
                  brightness: Brightness.light,
                  scaffoldBackgroundColor: Color(0xff313737),
                  appBarTheme: AppBarTheme(
                    color: Colors.black,
                    titleTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                    elevation: 0.0,
                    iconTheme: IconThemeData(color: Colors.white),
                  )),
              themeMode: StoreCubit.get(context).isDark
                  ? ThemeMode.dark
                  : ThemeMode.light,
              debugShowCheckedModeBanner: false,
              routes: {
                HomePage.id: (context) => HomePage(),
                UpdatePage.id: (context) => UpdatePage(
                      product: ProductModel(),
                    ),
              },
              initialRoute: HomePage.id);
        },
      ),
    );
  }
}
