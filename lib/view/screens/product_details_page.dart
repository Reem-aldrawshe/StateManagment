import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:water_delivery/model/offer_model.dart';

final cartProvider = StateProvider<List<OfferModel>>((ref) => []);

class ProductDetailsPage extends ConsumerStatefulWidget {
  final OfferModel offer;

  const ProductDetailsPage({super.key, required this.offer});

  @override
  ConsumerState<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends ConsumerState<ProductDetailsPage> {
  int quantity = 1;
  String selectedSize = '50ml';

  @override
  Widget build(BuildContext context) {
    final offer = widget.offer;

    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   leading: IconButton(
      //     icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
      //     onPressed: () => Navigator.pop(context),
      //   ),
      //   actions: [
      //     IconButton(
      //       icon: const Icon(Icons.favorite_border, color: Colors.black),
      //       onPressed: () {},
      //     ),
      //   ],
      // ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Stack(
  children: [
    ClipRRect(
      child: Image.asset(
        'assets/images/test.png',
        width: 375.w,
        height: 346.h,
        fit: BoxFit.cover,
      ),
    ),
    Positioned(
      top: 57.r,
      left: 13.r,
       child: CircleAvatar(
      //  backgroundColor: Colors.white,
        child: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
    ),
    Positioned(
      top: 53.r,
      right: 10.r,
      child: Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: Color(0xff212121),
        ),
        child:  IconButton(
          icon: const Icon(Icons.favorite_border, color: Colors.white),
          onPressed: () {},
        ),
      ),
    ),
    Positioned(
      bottom: 12,
      right: 12,
      child: Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: const Icon(Icons.lock_outline, size: 45, color: Color(0xff3FBDF1)),
      ),
    ),
  ],
),

          
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  offer.name,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                const Text(
                  "(Available In Stock)",
                  style: TextStyle(fontSize: 12, color: Color(0xff7D7D7D), fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "\$${offer.price.toStringAsFixed(0)}",
              style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
            ),
          ),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam",
              style: TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.w400 ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: const [
                Icon(Icons.star, color: Color(0xffFEC54B), size: 20),
                SizedBox(width: 6),
                Text("4.5", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
                SizedBox(width: 8),
                Text("(238 reviews)", style: TextStyle(color: Color(0xffAAAAAA),fontSize: 12 , fontWeight: FontWeight.w400)),
              ],
            ),
          ),
           SizedBox(height: 20.h),
          Padding(
  padding: const EdgeInsets.symmetric(horizontal: 14),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:  [
          Text("Bottle size", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 11)),
          Padding(
            padding: EdgeInsets.only(right: 83.r),
            child: Text("Quantity", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 11)),
          ),
        ],
      ),
      const SizedBox(height: 8),
      Row(
        children: [
          Container(
            width: 127.w,
            height: 38.h,
           // padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xff625D5D)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: selectedSize,
                isExpanded: true,
                items: ['50ml', '100ml', '200ml'].map((size) {
                  return DropdownMenuItem(value: size, child: Text(size));
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() => selectedSize = value);
                  }
                },
              ),
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xff625D5D)),
              borderRadius: BorderRadius.circular(2),
            ),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove_circle_outline),
                  onPressed: quantity > 1 ? () => setState(() => quantity--) : null,
                ),
                Text(quantity.toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
                IconButton(
                  icon: const Icon(Icons.add_circle_outline),
                  onPressed: () => setState(() => quantity++),
                ),
              ],
            ),
          ),
        ],
      ),
    ],
  ),
),

          const Spacer(),
          Center(
            child: SizedBox(
              width: 299.w,
              height: 51.h,
              child: ElevatedButton(
                onPressed: () {
                  ref.read(cartProvider.notifier).update((state) => [...state, offer]);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('تمت الإضافة إلى السلة')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff3FBDF1),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1)),
                ),
                child: const Text("BUY", style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500)),
              ),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
