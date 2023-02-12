import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/widgets/cusrom_buttom.dart';

import '../services/update_product.dart';
import '../widgets/cusrom_text_field.dart';

class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({super.key});
  static String id = 'UpdateProductPage';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, desc, image, price;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Update Product',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 90,
                ),
                CustomTextField(
                  onchanged: (data) {
                    productName = data;
                  },
                  hintText: 'Product Name',
                ),
                SizedBox(
                  height: 16,
                ),
                CustomTextField(
                  onchanged: (data) {
                    desc = data;
                  },
                  hintText: 'Descripton',
                ),
                SizedBox(
                  height: 16,
                ),
                CustomTextField(
                  inpotTybe: TextInputType.number,
                  onchanged: (data) {
                    price = data;
                  },
                  hintText: 'Price',
                ),
                SizedBox(
                  height: 16,
                ),
                CustomTextField(
                  onchanged: (data) {
                    image = data;
                  },
                  hintText: 'Image',
                ),
                SizedBox(
                  height: 50,
                ),
                CustomButton(
                  nameButton: 'Update',
                  onTap: () async {
                    isLoading = true;
                    setState(() {});
                    try {
                      await updateProdact(product);

                      print('succes');
                    } catch (e) {
                      print(e.toString());
                    }
                    isLoading = false;
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProdact(ProductModel product) async {
    await UpdateProductServices().updateProduct(
        title: productName == null ? product.title : productName!,
        price: price == null ? product.price.toString() : price!,
        desc: desc == null ? product.description : desc!,
        image: image == null ? product.image : image!,
        category: product.category,
        id: product.id);
  }
}
