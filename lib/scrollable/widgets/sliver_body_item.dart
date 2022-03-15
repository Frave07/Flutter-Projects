import 'package:flutter/material.dart';
import 'package:flutter_projects/scrollable/models/product_model.dart';


class SliverBodyItem extends StatelessWidget {

  final List<ProductModel> listProducts;

  const SliverBodyItem({Key? key, required this.listProducts}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, i) {

          final product = listProducts[i];

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              children: [

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    children: [

                      Expanded(
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
                      ),
                      const SizedBox(width: 10.0),
                      Container(
                        height: 100,
                        width: 130,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16.0),
                          child: Image.asset(product.image, fit: BoxFit.cover,),
                        ),
                      )

                    ],
                  ),
                ),

                if(i == listProducts.length - 1) ...[

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
        childCount: listProducts.length
      )
    );
  }
}