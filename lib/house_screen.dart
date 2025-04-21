import 'package:abo_bashir_market/constants/constants.dart';
import 'package:abo_bashir_market/features/product/presentation/cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HouseScreen extends StatelessWidget {
  const HouseScreen({super.key});



  @override
  Widget build(BuildContext context) {
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
        return ListView.builder(
          itemCount: state.products.length,
          itemBuilder: (context, index) {
            return _ShoeCard(
              name: state.products[index].name,
              price: state.products[index].currentPrice,
              // imagePath: state.products[index].image,
            );
          },
        );
      } else if (state is ProductGetAllLoading) {
        return   Center(
                child: CircularProgressIndicator(
              color: kPrimaryColor,
            ));
      } else if (state is ProductGetAllError) {
        return Text('get all error');
      }
      return Center(
        child: ElevatedButton(
          onPressed: () {},
          // () async {
          //   await BlocProvider.of<ProductCubit>(context).getAllProducts(
          //     pageNumber: 1,
          //     items: 10,
          //     column: ApiKey.name,
          //     direction: ApiKey.asc,
          //   );
          // },
          child: Text('Get all products'),
        ),
      );
    })

        // SingleChildScrollView(
        //   padding: const EdgeInsets.all(16.0),
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       const SizedBox(height: 16),
        //       const TextField(
        //         decoration: InputDecoration(
        //           prefixIcon: Icon(Icons.search),
        //           hintText: 'ابحث عن المنتجات',
        //           border: OutlineInputBorder(
        //             borderRadius: BorderRadius.all(Radius.circular(12)),
        //           ),
        //         ),
        //       ),
        //       const SizedBox(height: 16),
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //         children: [
        //           _BrandButton(label: 'نايك', isSelected: true),
        //           _BrandButton(label: 'بوما'),
        //           _BrandButton(label: 'أندر آرمور'),
        //           _BrandButton(label: 'أديداس'),
        //         ],
        //       ),
        //       const SizedBox(height: 16),
        //       _SectionTitle(title: 'المنتجات'),
        //       _ShoeCard(name: 'نايك جوردان', price: '493.00'),
        //       _ShoeCard(name: 'نايك آير ماكس', price: '897.99'),
        //       const SizedBox(height: 16),
        //       _SectionTitle(title: 'الوافدون الجدد'),
        //       SizedBox(
        //         height: 40,
        //         width: 40,
        //         child: ListView.builder(
        //           itemCount: 10,
        //           itemBuilder: (context, index) {
        //             return Text('data');
        //           },
        //         ),
        //       ),
        //       _ShoeCard(name: 'نايك آير جوردان', price: '849.69'),
        //     ],
        //   ),
        // ),
        );
  }
}

class _BrandButton extends StatelessWidget {
  final String label;
  final bool isSelected;

  const _BrandButton({required this.label, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Color(0xFF5BE15F) : Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
 
  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(onPressed: () {}, child: const Text('عرض الكل')),
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class _ShoeCard extends StatelessWidget {
  final String name;
  final int price;
  // final String? imagePath;

  const _ShoeCard({
    required this.name,
    required this.price,
    // required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Placeholder(fallbackHeight: 100),
            // Container(
            //   child: Image(
            //     image: NetworkImage(imagePath!),
            //   ),
            // ),
            const SizedBox(height: 8),
            Text(
              name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text('${price}', style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                icon: const Icon(Icons.add_circle, color: Color(0xFF5BE15F)),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
