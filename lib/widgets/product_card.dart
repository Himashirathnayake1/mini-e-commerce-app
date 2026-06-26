import 'package:flutter/material.dart';
import 'package:mini_e/models/prooduct.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      
      child: Container(
        
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
      
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.15),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
      
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
      
          children: [
            Expanded(
              flex: 6,
      
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Hero(
                      tag: product.id,
      
                      child: Image.asset(product.image, fit: BoxFit.cover),
                    ),
                    Positioned(
                      right: 10,
                      top: 10,
      
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
      
                        child: const Padding(
                          padding: EdgeInsets.all(6),
                          child: Icon(Icons.favorite_border, size: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
      
              child: Padding(
                padding: const EdgeInsets.all(10),
      
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
      
                      children: [
                        Text(
                          product.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 26.sp,
                          ),
                        ),
      
                        const SizedBox(height: 3),
      
                        Row(
                          children: [
                            const Icon(Icons.star, color: Colors.amber, size: 18),
      
                            const SizedBox(width: 4),
      
                            Text(product.rating.toString()),
                          ],
                        ),
      
                        const Spacer(),
      
                        Text(
                          "\$${product.price}",
                          style:  TextStyle(
                            fontSize: 26.sp,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff6C63FF),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
