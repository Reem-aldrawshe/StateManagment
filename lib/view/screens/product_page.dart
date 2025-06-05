import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:water_delivery/bloc/product/product_bloc.dart';
import 'package:water_delivery/bloc/product/product_event.dart';
import 'package:water_delivery/bloc/product/product_state.dart';
import 'package:water_delivery/view/screens/product_details_page.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ProductLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 375.w,
                  height: 188.h,
                  color: Color(0xff3FBDF1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 21.r , top: 68.r),
                        child: const Text('Welcome Back!',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white)),
                      ),
                     // const SizedBox(height: 2),
                      Padding(
                        padding: EdgeInsets.only(left: 21.r),
                        child: const Text('Mr Product!',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white)),
                      ),
                    //  const SizedBox(height: 8),
                      Padding(
                        padding: EdgeInsets.only(left: 10.r, right: 10.r),
                        child: TextField(
                          decoration: InputDecoration(
                            fillColor: Color(0xff0000001A),
                            hintText: 'Search Something...',
                            hintStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w400 , color: Colors.white),
                            prefixIcon: const Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 18.h,
                ),
                SizedBox(
                  width: 355.w,
                  height: 141.h,
                  child: PageView.builder(
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.asset('assets/images/download.jpeg',
                                  fit: BoxFit.cover),
                            ),
                            Positioned(
                              left: 16,
                              top: 16,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Drips Springs',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w800)),
                                  Text('Bottle water delivery',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400)),
                                  SizedBox(height: 20.h),
                                  Container(
                                    width: 91.w,
                                    height: 25.h,
                                    padding: EdgeInsets.only(
                                        right: 8.r, bottom: 10.r),
                                    decoration: BoxDecoration(
                                      color: Color(0xffFFC33A),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Center(
                                      child: const Text('Quick Shop',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 8)),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 16.h),
                Padding(
                  padding:  EdgeInsets.only(left: 12.r),
                  child: Text(
                    "Water type",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 40,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    children: [
                      _buildChip(
                          context, 'all', 'All', state.selectedCompanyId),
                      ...state.companies.map((company) {
                        return _buildChip(context, company.id, company.name,
                            state.selectedCompanyId);
                      }).toList(),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: GridView.builder(
                      itemCount: state.filteredOffers.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        childAspectRatio: 0.75,
                      ),
                      itemBuilder: (context, index) {
                        final offer = state.filteredOffers[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ProductDetailsPage(offer: offer),
                              ),
                            );
                          },
                          child: Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: 172.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        image: const DecorationImage(
                                          image: AssetImage(
                                              'assets/images/test.png'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                            
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(offer.name,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14,
                                          color: Colors.black)),
                                  Text('\$${offer.price}',
                                      style: const TextStyle(
                                          color: Color(0xff484848),
                                          fontSize: 11,
                                          fontWeight: FontWeight.w400)),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          }

          return const Center(child: Text("حدث خطأ في تحميل البيانات"));
        },
      ),
    );
  }

  Widget _buildChip(
      BuildContext context, String id, String label, String selectedId) {
    final isSelected = id == selectedId;
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: ChoiceChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (_) {
          context.read<ProductBloc>().add(FilterProductsByCompany(id));
        },
        selectedColor: Color(0xff212121),
        backgroundColor: Colors.grey.shade300,
        labelStyle:
            TextStyle(color: isSelected ? Colors.white : Colors.black)),
      
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class ProductPage extends StatefulWidget {
//   const ProductPage({super.key});

//   @override
//   State<ProductPage> createState() => _ProductPageState();
// }

// class _ProductPageState extends State<ProductPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Container(
//             width: 375.w,
//             height: 188.h,
//             decoration: BoxDecoration(
//               color: Color(0xff3FBDF1),
//               // borderRadius: BorderRadius.vertical(bottom: Radius.circular(20),),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.only(bottom: 16),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.only(left: 21.r),
//                     child: Text(
//                       'Welcome Back!',
//                       style:
//                           TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(left: 21.r),
//                     child: Text(
//                       'Mr Product!',
//                       style:
//                           TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(left: 10.r, right: 10.r),
//                     child: TextField(
//                       decoration: InputDecoration(
//                         hintText: 'Search Something...',
//                         prefixIcon: const Icon(Icons.search),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//                 itemCount: 2,
//                 itemBuilder: (context, index) {
//                   return Container(
//                     width: 355.w,
//                     height: 141,
//                     margin: const EdgeInsets.symmetric(horizontal: 8),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(16),
//                       image: const DecorationImage(
//                         image: AssetImage('assets/images/test.png'),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   );
//                 }),
//           ),
//         ],
//       ),
//     );
//   }
// }
