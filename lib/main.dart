import 'package:flutter/material.dart';
import 'package:store_app_flutter/Screens/Home/homeScreen.dart';
import 'package:store_app_flutter/Screens/updateScreen/updateScreen.dart';

void main() {
  runApp(const Store());
}

class Store extends StatelessWidget {
  const Store({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          HomePage.id: (context) => const HomePage(),
          UpdatePage.id: (context) => const UpdatePage(),
        },
        initialRoute: HomePage.id);
  }
}
