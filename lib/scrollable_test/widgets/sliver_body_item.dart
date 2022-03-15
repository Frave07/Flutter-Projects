import 'package:flutter/material.dart';
import 'package:flutter_projects/scrollable_test/models/product_model.dart';


class SliverBodyItem extends StatelessWidget {

  final List<ProductModel> listProduct;

  const SliverBodyItem({Key? key, required this.listProduct}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          
          final product = listProduct[index];

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 7,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(product.name, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.white)),
                              const SizedBox(height: 8.0),
                              Text(product.description, maxLines: 4, style: TextStyle(fontWeight: FontWeight.w300, color: Colors.white)),
                              const SizedBox(height: 8.0),
                              Text(product.price, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500, color: Colors.white)),
                              const SizedBox(height: 8.0),
                            ],
                          ),
                        )
                      ),
                      Container(
                        height: 140,
                        width: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.blue
                        ),
                      )
                    ],
                  ),
                ),
                if(index == listProduct.length - 1) ...[

                  const SizedBox(height: 32.0),
                  Container(
                    height: .5,
                    color: Colors.white.withOpacity(.3),
                  )

                ]
              ],
            ),
          );
        },
        childCount: listProduct.length
      ),
    );
  }
}