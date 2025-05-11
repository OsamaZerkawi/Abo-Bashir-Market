import 'package:abo_bashir_market/config/routes/router.dart';
import 'package:abo_bashir_market/constants/constants.dart';
import 'package:abo_bashir_market/core/utils/app_colors.dart';
import 'package:abo_bashir_market/core/utils/app_images.dart';
import 'package:abo_bashir_market/core/utils/app_sizes.dart';
import 'package:abo_bashir_market/features/product/data/models/clean/product.dart';
import 'package:abo_bashir_market/features/product/presentation/cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

int _isSelected = 0;

class HouseScreen extends StatelessWidget {
  const HouseScreen({super.key});
  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    // return Scaffold(
    //   body: Column(
    //     // mainAxisAlignment: MainAxisAlignment.start,
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       Padding(
    //         padding: EdgeInsets.symmetric(
    //           horizontal: AppSizes.paddingMedium_16,
    //         ),
    //         child: SearchBar(
    //           leading: IconButton(
    //             icon: Icon(Icons.search),
    //             //! Make the search here
    //             onPressed: () {},
    //             color: isDarkMode ? Colors.white : Colors.black,
    //           ),
    //           hintText: 'بحث',
    //           hintStyle: WidgetStateProperty.resolveWith<TextStyle>((states) {
    //             return TextStyle(
    //               color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
    //               fontSize: AppSizes.textMedium_16,
    //               // fontFamily: 'YourArabicFont', // Optional: Custom font
    //             );
    //           }),
    //           padding: WidgetStateProperty.all(
    //             EdgeInsets.symmetric(
    //               horizontal: 10,
    //             ),
    //           ),
    //         ),
    //       ),

    //       // Text('عرض الكل'),
    //       // buildLabel('المنتجات'),
    //     ],
    //   ),
    // );
    // Call getAllProducts after first frame
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   context.read<ProductCubit>().getAllProducts(
    //         pageNumber: 1,
    //         items: 10,
    //         column: 'name',
    //         direction: ApiKey.asc,
    //       );
    // });

    return Scaffold(
        body: BlocConsumer<ProductCubit, ProductState>(
            listener: (context, state) {
      if (state is ProductGetAllSuccess) {
      } else if (state is ProductGetAllError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('erroro forget me'),
          ),
        );
      } else if (state is ProductGetAllLoading) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('يلا عم يحمل يباشا'),
          ),
        );
      }
    }, builder: (context, state) {
      if (state is ProductGetAllSuccess) {
        // return ListView.builder(
        //   itemCount: state.products.length,
        //   itemBuilder: (context, index) {
        //     return _ShoeCard(
        //       name: state.products[index].name,
        //       price: state.products[index].currentPrice,
        //       imagePath: state.products[index].image,
        //     );
        //   },
        // );
        return Text('data');
        // return Column(
        //   children: [
        //     SizedBox(height: 40),
        //     Padding(
        //       padding: EdgeInsets.symmetric(
        //         horizontal: AppSizes.paddingMedium_16,
        //       ),
        //       child: SearchBar(
        //         elevation: WidgetStateProperty.all(4),
        //         shadowColor: WidgetStatePropertyAll(Colors.amber),
        //         leading: IconButton(
        //           icon: Icon(Icons.search),
        //           //! Make the search here
        //           onPressed: () {},
        //           color: isDarkMode ? Colors.white : Colors.black,
        //         ),
        //         hintText: 'adfaf',
        //         hintStyle: WidgetStateProperty.resolveWith<TextStyle>((states) {
        //           return TextStyle(
        //             color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
        //             fontSize: AppSizes.textMedium_16,
        //             // fontFamily: 'YourArabicFont', // Optional: Custom font
        //           );
        //         }),
        //         padding: WidgetStateProperty.all(
        //           EdgeInsets.symmetric(
        //             horizontal: 10,
        //           ),
        //         ),
        //       ),
        //     ),
        //     // GridView.builder(
        //     //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //     //     crossAxisCount: 2,
        //     //     childAspectRatio: 0.7, // Adjust this for better card proportions
        //     //     mainAxisSpacing: 15,
        //     //     crossAxisSpacing: 15,
        //     //   ),
        //     //   padding: EdgeInsets.all(15),
        //     //   itemCount: state.products.length,
        //     //   itemBuilder: (context, index) {
        //     //     return _ShoeCard(
        //     //       name: state.products[index].name,
        //     //       price: state.products[index].currentPrice,
        //     //       imagePath: state.products[index].image,
        //     //       product: state.products[index],
        //     //     );
        //     //   },
        //     // ),
        //   ],
        // );
      } else if (state is ProductGetAllLoading) {
        return Center(
            child: CircularProgressIndicator(
          color: AppColors.primaryColor,
        ));
      } else if (state is ProductGetAllError) {
        return Text('get all error');
      }

      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.paddingMedium_16,
                ),
                child: SearchBar(
                  elevation: WidgetStatePropertyAll(0),
                  leading: IconButton(
                    icon: Icon(Icons.search),
                    //! Make the search here
                    onPressed: () {},
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                  hintText: 'بحث',
                  hintStyle:
                      WidgetStateProperty.resolveWith<TextStyle>((states) {
                    return TextStyle(
                      color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
                      fontSize: AppSizes.textMedium_16,
                      // fontFamily: 'YourArabicFont', // Optional: Custom font
                    );
                  }),
                  padding: WidgetStateProperty.all(
                    EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              //! Categories
              SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return _buildProductCategory(
                      index: index,
                      name: 'الفئة',
                    );
                  },
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18.0,
                ),
                child: Text(
                  'المنتجات',
                  style: kHeadingStyle(context),
                ),
              ),

              SizedBox(
                height: 400,
                width: MediaQuery.sizeOf(context).width,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,

                    childAspectRatio:
                        0.7, // Adjust this for better card proportions
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                  ),
                  padding: EdgeInsets.all(15),
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return _ShoeCard(
                      // name: 'شاي',
                      // price: 1000,
                      // imagePath: AppImages.noImage,
                      product: Product(
                        id: 20,
                        name: 'شاي',
                        currentPrice: 100,
                        oldPrice: 120,
                        category: "مشروبات",
                        image: AppImages.avatarImage,
                      ),
                    );
                  },
                ),
              ),
              // SizedBox(height: 100),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('End'),
                ),
              ),
              // GridView.builder(
              //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount: 2,
              //     childAspectRatio: 0.7, // Adjust this for better card proportions
              //     mainAxisSpacing: 15,
              //     crossAxisSpacing: 15,
              //   ),
              //   padding: EdgeInsets.all(15),
              //   itemCount: state.products.length,
              //   itemBuilder: (context, index) {
              //     return _ShoeCard(
              //       name: state.products[index].name,
              //       price: state.products[index].currentPrice,
              //       imagePath: state.products[index].image,
              //       product: state.products[index],
              //     );
              //   },
              // ),
            ],
          ),
        ),
      );
      // return Center(
      //   child: ElevatedButton(
      //     onPressed: () {},
      //     // () async {
      //     //   await BlocProvider.of<ProductCubit>(context).getAllProducts(
      //     //     pageNumber: 1,
      //     //     items: 10,
      //     //     column: ApiKey.name,
      //     //     direction: ApiKey.asc,
      //     //   );
      //     // },
      //     child: Text('Get all products'),
      //   ),
      // );
    }));
  }
}

class _ShoeCard extends StatelessWidget {
  // final String name;
  // final int price;
  // final String? imagePath;
  final Product product;

  const _ShoeCard({
    // required this.name,
    // required this.price,
    // required this.imagePath,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(productDetailsScreenID, extra: product);
        // showDialog(
        //   context: context,
        //   builder: (BuildContext context) {
        //     return AlertDialog(
        //       title: const Text('Alert'),
        //       content: SizedBox(
        //         height: 100,
        //         width: 100,
        //         child: Column(
        //           children: [
        //             // Text('This is a basic alert dialog. ${product.name}'),
        //           ],
        //         ),
        //       ),
        //       actions: [
        //         TextButton(
        //           child: const Text('OK'),
        //           onPressed: () {
        //             Navigator.of(context).pop();
        //           },
        //         ),
        //       ],
        //     );
        //   },
        // );
      },
      child: Card(
        elevation: 0,
        color: AppColors.color15,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(
              width: 0.4,
            )),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 100,
                width: 100,
                child: Image.network(
                  product.image!,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      AppImages.tea,
                    );
                  },
                  // loadingBuilder: (context, child, loadingProgress) =>
                  // CircularProgressIndicator(),
                ),
              ),
              SizedBox(height: 8),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  product.name,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: AppSizes.textExtraLarge_24),
                ),
              ),
              // Text(
              //   product.category,
              //   style: const TextStyle(color: Colors.grey),
              // ),
              SizedBox(height: 10),
              Row(
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Text(
                        '${product.oldPrice}',
                        style: const TextStyle(
                          decoration: TextDecoration.lineThrough,
                          decorationColor: AppColors.hintColor,
                          decorationThickness: 2.0,
                          color: Colors.grey,
                          decorationStyle: TextDecorationStyle.solid,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      '${product.currentPrice}',
                      style: TextStyle(
                        fontSize: AppSizes.textExtraLarge_24,
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Icon(
                    Icons.mode_edit_rounded,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ],
              ),

              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildProductCategory({
  required Object index,
  required String name,
}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 18),
    margin: EdgeInsets.symmetric(horizontal: 14, vertical: 4),
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: _isSelected == index ? AppColors.primaryColor : AppColors.color9,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Text(
      name,
      style: TextStyle(
        color: Colors.black,
      ),
    ),
  );
}
