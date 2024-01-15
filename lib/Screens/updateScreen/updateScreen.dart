import 'package:flutter/material.dart';
import 'package:store_app_flutter/Bloc/cubit.dart';
import 'package:store_app_flutter/Bloc/states.dart';
import 'package:store_app_flutter/constants/components.dart';
import 'package:store_app_flutter/Bloc/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:store_app_flutter/models/product_model.dart';

class UpdatePage extends StatelessWidget {
  UpdatePage({
    super.key,
  });

  static String id = 'updateScreen';
  var controllerTitle = TextEditingController();

  var controllerdesc = TextEditingController();
  var formKey = GlobalKey<FormState>();

  var controllerprice = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;

    return BlocConsumer<StoreCubit, StoreStates>(
        listener: (context, state) => () {
              if (state is StoreUpdateSuccess) {
                product = state.productModel;
                print(state.productModel.title);
                controllerTitle.text = product.title!;
                controllerdesc.text = product.dec!;
                controllerprice.text = product.price!;
              }
            },
        builder: (context, state) {
          var cubit = StoreCubit.get(context);

          return Scaffold(
            appBar: AppBar(title: Text('Update')),
            body: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        DefaultTextForm(
                            controller: controllerTitle,
                            labeltext: product.title,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'title is required';
                              }
                              // Add additional validation logic if needed
                              return null;
                            },
                            type: TextInputType.text,
                            prefix: Icons.abc),
                        SizedBox(
                          height: 15,
                        ),
                        DefaultTextForm(
                            controller: controllerdesc,
                            labeltext: product.dec,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'dec is required';
                              }
                              // Add additional validation logic if needed
                              return null;
                            },
                            type: TextInputType.text,
                            prefix: Icons.abc),
                        SizedBox(
                          height: 15,
                        ),
                        DefaultTextForm(
                            controller: controllerprice,
                            labeltext: product.price,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'Price is required';
                              }
                              // Add additional validation logic if needed
                              return null;
                            },
                            type: TextInputType.number,
                            prefix: Icons.abc),
                        SizedBox(
                          height: 15,
                        ),
                        DefaultButton(
                            text: 'Update',
                            function: () {
                              if (formKey.currentState!.validate()) {
                                cubit.updateProduct(
                                  title: controllerTitle.text,
                                  price: controllerprice.text,
                                  desc: controllerdesc.text,
                                  id: product.id,
                                );
                              }
                            }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
