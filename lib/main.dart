import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:store_app_flutter/Bloc/cubit.dart';
import 'package:store_app_flutter/Bloc/states.dart';
import 'package:store_app_flutter/Helpers/Local/cache_helper/cache_helper.dart';
import 'package:store_app_flutter/Helpers/Network/dioHelper.dart';
import 'package:store_app_flutter/Screens/Home/homeScreen.dart';
import 'package:store_app_flutter/Screens/updateScreen/updateScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app_flutter/constants/themes.dart';
import 'package:store_app_flutter/models/product_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await cacheHelper.init();

  bool? isdark = cacheHelper.getData(key: 'isDark');
  runApp(Store(
    isdark ?? true,
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
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: StoreCubit.get(context).isDark
                  ? ThemeMode.dark
                  : ThemeMode.light,
              debugShowCheckedModeBanner: false,
              routes: {
                HomePage.id: (context) => HomePage(),
                UpdatePage.id: (context) => UpdatePage(),
              },
              initialRoute: HomePage.id);
        },
      ),
    );
  }
}
