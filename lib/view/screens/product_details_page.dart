// import 'package:flutter/material.dart';
// import 'package:water_delivery/model/product_model.dart';

// class ProductDetailsPage extends StatelessWidget {
//   const ProductDetailsPage({super.key, required ProductModel product});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: 0,
//         selectedItemColor: Colors.black,
//         unselectedItemColor: Colors.grey,
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
//           BottomNavigationBarItem(icon: Icon(Icons.lock_outline), label: ''),
//           BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ''),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
//         ],
//       ),
//       body: Stack(
//         children: [
//           Column(
//             children: [
//               // صورة المنتج
//               SizedBox(
//                 height: 346,
//                 width: double.infinity,
//                 child: Image.asset(
//                   'assets/images/test.png', // بدّلها لاحقًا بصورة من النت أو API
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               // باقي التفاصيل
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: ListView(
//                     children: [
//                       const Text(
//                         'Drips Spring water',
//                         style: TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(height: 5),
                      
//                       const Text(
//                         '\$100',
//                         style: TextStyle(
//                           fontSize: 22,
//                           color: Colors.blue,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(height: 5),
//                       const Text(
//                         'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, '
//                         'sed diam nonumy eirmod tempor invidunt ut labore et dolore '
//                         'magna aliquyam erat, sed diam',
//                         style: TextStyle(fontSize: 14, color: Colors.grey),
//                       ),
//                       const SizedBox(height: 10),
//                       Row(
//                         children: const [
//                           Icon(Icons.star, color: Colors.amber, size: 20),
//                           SizedBox(width: 5),
//                           Text('4.5'),
//                           SizedBox(width: 10),
//                           Text('(128 reviews)', style: TextStyle(color: Colors.grey)),
//                         ],
//                       ),
//                       const SizedBox(height: 10),

//                       // زائد وناقص
//                       Row(
//                         children: [
//                           Container(
//                             decoration: BoxDecoration(
//                               color: Colors.grey[200],
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             child: IconButton(
//                               icon: const Icon(Icons.remove),
//                               onPressed: () {},
//                             ),
//                           ),
//                           const SizedBox(width: 20),
//                           const Text('1', style: TextStyle(fontSize: 18)),
//                           const SizedBox(width: 20),
//                           Container(
//                             decoration: BoxDecoration(
//                               color: Colors.blue,
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             child: IconButton(
//                               icon: const Icon(Icons.add, color: Colors.white),
//                               onPressed: () {},
//                             ),
//                           ),
//                         ],
//                       ),

//                       const SizedBox(height: 30),

//                       // زر BUY
//                       SizedBox(
//                         width: 299,
//                         height: 51,
//                         child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.blue,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                           ),
//                           onPressed: () {},
//                           child: const Text(
//                             'Buy',
//                             style: TextStyle(fontSize: 18, color: Colors.white),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),

//           // App bar فوق الصورة
//           Positioned(
//             top: 40,
//             left: 10,
//             child: IconButton(
//               icon: const Icon(Icons.arrow_back, color: Colors.white),
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:water_delivery/model/auth_model.dart';

class ProductDetailsPage extends StatelessWidget {
  final ProductModel product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.lock_outline), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              // صورة المنتج من الـ API
              SizedBox(
                height: 346,
                width: double.infinity,
                child: Image.network(
                  product.image,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(child: Icon(Icons.broken_image));
                  },
                ),
              ),
              // باقي التفاصيل
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ListView(
                    children: [
                      Text(
                        product.name,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),

                      Text(
                        '\$${product.price}',
                        style: const TextStyle(
                          fontSize: 22,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),

                      Text(
                        product.description ?? 'No description available.',
                        style: const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      const SizedBox(height: 10),

                      Row(
                        children: const [
                          Icon(Icons.star, color: Colors.amber, size: 20),
                          SizedBox(width: 5),
                          Text('4.5'),
                          SizedBox(width: 10),
                          Text('(128 reviews)', style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                      const SizedBox(height: 10),

                      // زائد وناقص
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () {},
                            ),
                          ),
                          const SizedBox(width: 20),
                          const Text('1', style: TextStyle(fontSize: 18)),
                          const SizedBox(width: 20),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.add, color: Colors.white),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 30),

                      // زر BUY
                      SizedBox(
                        width: 299,
                        height: 51,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            // TODO: تنفيذ عملية الشراء
                          },
                          child: const Text(
                            'Buy',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // App bar فوق الصورة
          Positioned(
            top: 40,
            left: 10,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
