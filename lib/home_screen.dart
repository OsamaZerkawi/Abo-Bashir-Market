import 'package:flutter/material.dart';

// void main() {
//   runApp(const ShoeStoreApp());
// }

class ShoeStoreApp extends StatelessWidget {
  const ShoeStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      locale: Locale('ar', 'AE'),
      localizationsDelegates: [
        // Add localization delegates if needed
      ],
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('أبو بشير ماركت'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_bag_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'ابحث عن المنتجات',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _BrandButton(label: 'نايك', isSelected: true),
                _BrandButton(label: 'بوما'),
                _BrandButton(label: 'أندر آرمور'),
                _BrandButton(label: 'أديداس'),
              ],
            ),
            const SizedBox(height: 16),
            _SectionTitle(title: 'المنتجات'),
            _ShoeCard(name: 'نايك جوردان', price: '493.00'),
            _ShoeCard(name: 'نايك آير ماكس', price: '897.99'),
            const SizedBox(height: 16),
            _SectionTitle(title: 'الوافدون الجدد'),
            _ShoeCard(name: 'نايك آير جوردان', price: '849.69'),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                icon: const Icon(Icons.home),
                onPressed: () {},
                tooltip: 'الرئيسية'),
            IconButton(
                icon: const Icon(Icons.favorite_border),
                onPressed: () {},
                tooltip: 'المفضلة'),
            const SizedBox(width: 40),
            IconButton(
                icon: const Icon(Icons.shopping_bag_outlined),
                onPressed: () {},
                tooltip: 'سلة التسوق'),
            IconButton(
                icon: const Icon(Icons.person_outline),
                onPressed: () {},
                tooltip: 'الحساب'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // await BlocProvider.of<AuthCubit>(context).delete();
          // await CacheHelper().clearData(key: ApiKey.token);

          // await BlocProvider.of<ProductCubit>(context).getProductById(id: 19);

          // await BlocProvider.of<ProductCubit>(context).getAllProducts(
          //   pageNumber: 1,
          //   items: 10,
          //   column: 'name',
          //   direction: 'desc',
          // );

          // await BlocProvider.of<ProductCubit>(context).createProduct(
          //   'osama',
          //   25,
          //   21,
          //   '',
          // );

          // await BlocProvider.of<ProductCubit>(context).deleteProduct(productId: 21);

          // await BlocProvider.of<ProductCubit>(context).updateProduct(
          //   productId: 22,
          //   name: 'osama updataed',
          //   price: 22,
          //   categoryID: 40,
          //   image: '',
          // );

          // context.pop();
        },
        backgroundColor: Color(0xFF5BE15F),
        tooltip: 'إضافة',
        child: const Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
  final String price;

  const _ShoeCard({required this.name, required this.price});

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
            const SizedBox(height: 8),
            Text(
              name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(price, style: const TextStyle(color: Colors.grey)),
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

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// void main() {
//   runApp(const ShoeStoreApp());
// }

// // BLoC State Management
// class ShoeCubit extends Cubit<List<String>> {
//   ShoeCubit() : super([]);

//   void addShoe(String shoe) {
//     emit([...state, shoe]);
//   }
// }

// class ShoeStoreApp extends StatelessWidget {
//   const ShoeStoreApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => ShoeCubit(),
//       child: const MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: HomeScreen(),
//         locale: Locale('ar', 'AE'),
//       ),
//     );
//   }
// }

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         bool isWide = constraints.maxWidth > 600;

//         return Scaffold(
//           appBar: AppBar(
//             title: const Text('الرئيسية'),
//             actions: [
//               IconButton(
//                 icon: const Icon(Icons.shopping_bag_outlined),
//                 onPressed: () {},
//               ),
//             ],
//           ),
//           body: SingleChildScrollView(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text('موقع المتجر', style: TextStyle(color: Colors.grey)),
//                 const Row(
//                   children: [
//                     Icon(Icons.location_on, color: Colors.red),
//                     Text('مونديلي بوج، سيلهيت'),
//                   ],
//                 ),
//                 const SizedBox(height: 16),
//                 const TextField(
//                   decoration: InputDecoration(
//                     prefixIcon: Icon(Icons.search),
//                     hintText: 'ابحث عن الأحذية',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(12)),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     _BrandButton(label: 'نايك', isSelected: true),
//                     _BrandButton(label: 'بوما'),
//                     _BrandButton(label: 'أندر آرمور'),
//                     _BrandButton(label: 'أديداس'),
//                   ],
//                 ),
//                 const SizedBox(height: 16),
//                 _SectionTitle(title: 'الأحذية الرائجة'),
//                 GridView.count(
//                   shrinkWrap: true,
//                   physics: const NeverScrollableScrollPhysics(),
//                   crossAxisCount: isWide ? 3 : 2,
//                   crossAxisSpacing: 8,
//                   mainAxisSpacing: 8,
//                   childAspectRatio: 0.7,
//                   children: const [
//                     _ShoeCard(name: 'نايك جوردان', price: '٤٩٣.٠٠'),
//                     _ShoeCard(name: 'نايك آير ماكس', price: '٨٩٧.٩٩'),
//                     _ShoeCard(name: 'نايك آير جوردان', price: '٨٤٩.٦٩'),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           bottomNavigationBar: BottomAppBar(
//             shape: const CircularNotchedRectangle(),
//             notchMargin: 8.0,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 IconButton(icon: const Icon(Icons.home), onPressed: () {}),
//                 IconButton(
//                     icon: const Icon(Icons.favorite_border), onPressed: () {}),
//                 const SizedBox(width: 40),
//                 IconButton(
//                     icon: const Icon(Icons.shopping_bag_outlined),
//                     onPressed: () {}),
//                 IconButton(
//                     icon: const Icon(Icons.person_outline), onPressed: () {}),
//               ],
//             ),
//           ),
//           floatingActionButton: FloatingActionButton(
//             onPressed: () => context.read<ShoeCubit>().addShoe('New Shoe'),
//             backgroundColor: Colors.blue,
//             child: const Icon(Icons.add, color: Colors.white),
//           ),
//           floatingActionButtonLocation:
//               FloatingActionButtonLocation.centerDocked,
//         );
//       },
//     );
//   }
// }

// class _BrandButton extends StatelessWidget {
//   final String label;
//   final bool isSelected;

//   const _BrandButton({required this.label, this.isSelected = false, super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//       decoration: BoxDecoration(
//         color: isSelected ? Colors.blue : Colors.grey[200],
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Text(
//         label,
//         style: TextStyle(
//           color: isSelected ? Colors.white : Colors.black,
//         ),
//       ),
//     );
//   }
// }

// class _SectionTitle extends StatelessWidget {
//   final String title;

//   const _SectionTitle({required this.title, super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           title,
//           style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//         TextButton(onPressed: () {}, child: const Text('عرض الكل')),
//       ],
//     );
//   }
// }

// class _ShoeCard extends StatelessWidget {
//   final String name;
//   final String price;

//   const _ShoeCard({required this.name, required this.price, super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Placeholder(fallbackHeight: 100),
//             const SizedBox(height: 8),
//             Text(
//               name,
//               style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             Text(price, style: const TextStyle(color: Colors.grey)),
//             const SizedBox(height: 8),
//             Align(
//               alignment: Alignment.bottomRight,
//               child: IconButton(
//                 icon: const Icon(Icons.add_circle, color: Colors.blue),
//                 onPressed: () {},
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
