//! Send Proudct to here
//! show image and name
//!

import 'package:abo_bashir_market/core/utils/app_colors.dart';
import 'package:abo_bashir_market/core/utils/app_images.dart';
import 'package:abo_bashir_market/core/utils/app_sizes.dart';
import 'package:abo_bashir_market/features/product/data/models/clean/product.dart';
import 'package:flutter/material.dart';

class ProudctDetailsScreen extends StatelessWidget {
  final Product product;
  const ProudctDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.color15,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new)),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.edit_outlined),
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: AppColors.color15,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(50.0),
                  bottomRight: Radius.circular(50.0),
                ),
                // Optional gradient example:
                // gradient: LinearGradient(
                //   begin: Alignment.topCenter,
                //   end: Alignment.bottomCenter,
                //   stops: [0.1, 0.5],
                //   colors: [
                //     Colors.blueAccent.withOpacity(0.7),
                //     Colors.blueAccent.withOpacity(0.3),
                //   ],
                // ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(24)),
                  child: Image.network(
                    product.image!,
                    fit: BoxFit
                        .contain, // You can change to BoxFit.cover if preferred
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  (loadingProgress.expectedTotalBytes!)
                              : null,
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        AppImages.tea,
                        fit: BoxFit.contain,
                      );
                    },
                  ),
                ),
              ),
            ),
            // SizedBox(height: AppSizes.paddingMedium_16),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.paddingMedium_16,
                vertical: AppSizes.paddingSmall_8,
              ),
              child: Text(
                product.name,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.paddingMedium_16,
              ),
              child: Text(
                'طرد 24 قطعة',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
// Text(${product.category}),

            SizedBox(
              height: AppSizes.paddingMedium_16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.paddingLarge_24,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${product.oldPrice}',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          decoration: TextDecoration.lineThrough,
                          decorationColor: AppColors.hintColor,
                          decorationThickness: 2.0,
                          color: Colors.grey,
                          decorationStyle: TextDecorationStyle.solid,
                        ),
                  ),
                  Text(
                    '${product.currentPrice}ل.س',
                    style: Theme.of(context).textTheme.bodyLarge,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            ExpansionTile(
              title: Text('Classificaition'),
              children: [
                ListTile(
                  title: Text('data1'),
                  onTap: () {},
                ),
                ListTile(
                  title: Text('data2'),
                  onTap: () {},
                ),
                ListTile(
                  title: Text('data3'),
                  onTap: () {},
                )
              ],
              onExpansionChanged: (value) {
                print('Expanded');
              },
            ),
            Text('Product Amounts'),
          ],
        ),
      ),
    );
  }
}
