import 'package:flutter/material.dart';
import 'package:store_app_flutter/Bloc/cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:store_app_flutter/Bloc/states.dart';
import 'package:store_app_flutter/Screens/updateScreen/updateScreen.dart';
import 'package:store_app_flutter/models/product_model.dart';

class HomePage extends StatelessWidget {
  HomePage({
    super.key,
  });
  static String id = 'HomePage';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StoreCubit, StoreStates>(
        listener: (context, state) => () {},
        builder: (context, state) {
          var cubit = StoreCubit.get(context);
          var products = StoreCubit.get(context).products;

          return Scaffold(
              appBar: AppBar(
                  centerTitle: true,
                  leading: Icon(Icons.arrow_back),
                  actions: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.shop)),
                    IconButton(
                        onPressed: () {
                          cubit.changeMode();
                        },
                        icon: Icon(Icons.brightness_4_rounded)),
                  ],
                  title: const Text('Home')),
              body: Conditional.single(
                conditionBuilder: (context) => products.isNotEmpty,
                context: context,
                fallbackBuilder: (context) =>
                    Center(child: CircularProgressIndicator()),
                widgetBuilder: (BuildContext context) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(top: 70, left: 16, right: 16),
                    child: GridView.builder(
                      clipBehavior: Clip.none,
                      physics: BouncingScrollPhysics(),
                      itemCount: cubit.products.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.1,
                          crossAxisSpacing: 10.2,
                          mainAxisSpacing: 70.5),
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          _navigateTo(context, products, index);
                        },
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              child: Container(
                                //    clipBehavior: Clip.antiAliasWithSaveLayer,

                                decoration: BoxDecoration(boxShadow: [
                                  BoxShadow(
                                    blurRadius: 10,
                                    color: Colors.grey.withOpacity(0.5),
                                    offset: Offset(10, 5),
                                    spreadRadius: 0,
                                  )
                                ]),
                                child: Card(
                                  elevation: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0, vertical: 15),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          '${products[index].title}',
                                          style: TextStyle(
                                              height: 1.1,
                                              color: Colors.grey,
                                              overflow: TextOverflow.ellipsis,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                          maxLines: 2,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                                r'$ '
                                                '${products[index].price}',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16)),
                                            IconButton(
                                                onPressed: () {},
                                                icon: Icon(
                                                  Icons.favorite,
                                                  color: cubit.islike
                                                      ? Colors.red
                                                      : Colors.grey,
                                                ))
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                                '${products[index].rating?.rate}',
                                                style: TextStyle(
                                                    color: Colors.green[600],
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18)),
                                            SizedBox(width: 10),
                                            Text(' rating...',
                                                style: TextStyle(
                                                    color: Colors.amber,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 20,
                              bottom: 130,
                              child: Image.network(
                                '${products[index].img}',
                                height: 100,
                                width: 100,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ));
        });
  }

  void _navigateTo(
      BuildContext context, List<ProductModel> products, int index) {
    Navigator.pushNamed(context, UpdatePage.id, arguments: products[index]);
  }
}
