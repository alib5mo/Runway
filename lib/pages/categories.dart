import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:run_way/model/product_model.dart';
import 'package:run_way/pages/product_details.dart';

import 'package:run_way/widget/custom_appbar.dart';
import 'package:run_way/widget/first_secthion.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<ProductModel> products = [
    ProductModel(
      name: "Top man black ",
      image: "assets/model/image 1.png",
      price: '\$10.99',
    ),
    ProductModel(
      name: "Deep gray essential regul..",
      image: "assets/model/image 2.png",
      price: '\$10.99',
    ),
    ProductModel(
      name: "Top man black with Trous..",
      image: "assets/model/image 3.png",
      price: '\$10.99',
    ),
    ProductModel(
      name: "Gray coat and white T-sh..",
      image: "assets/model/image 4.png",
      price: '\$10.99',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Men",
        leading: "assets/svg/arrow-left.svg",
        actions: "assets/svg/Vector.svg",
        onTap: () => Navigator.pop(context),
      ),
      body: Column(
        children: [
          //filter section
          FirstSecthion(),
          Gap(13),

          //product section
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1 / 2,
                  crossAxisCount: 2,

                  crossAxisSpacing: 13,
                ),
                itemCount: products.length,
                itemBuilder: (context, i) {
                  final item = products[i];
                  return InkWell(
                    onTap:
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetails(item: item),
                          ),
                        ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 250,
                          child: Center(child: Image.asset(item.image)),
                        ),
                        Gap(13),
                        Text(
                          maxLines: 1,
                          item.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Gap(6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            Text(
                              '${item.price}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            SvgPicture.asset('assets/svg/heart.svg'),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
