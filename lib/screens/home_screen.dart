import 'package:flutter/material.dart';
import 'package:mini_e/models/prooduct.dart';
import '../data/products.dart';
import '../widgets/product_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  late List<Product> _filteredProducts;
  @override
  void initState() {
    super.initState();
    _filteredProducts = products; // show all products initially
    _searchController.addListener(_filterProducts);
  }
  void _filterProducts() {
    final query = _searchController.text.toLowerCase().trim();
    setState(() {
      if (query.isEmpty) {
        _filteredProducts = products;
      } else {
        _filteredProducts = products
            .where((product) => product.name.toLowerCase().contains(query))
            .toList();
      }
    });
  }
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xfff5f5f7),

      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Mini-E",
          style: TextStyle(color: Colors.black,fontSize: 23, fontWeight: FontWeight.bold),
        ),
        actions:  [
          Padding(
            padding: EdgeInsets.only(right: 15.w),
            child: Icon(Icons.shopping_cart_outlined, color: Colors.black),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 22.w,vertical: 16.h),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text.rich(
                TextSpan(
                  text: "Discover",
                  style: TextStyle(fontSize: 42.sp, fontWeight: FontWeight.bold),

                  children: <TextSpan>[
                    TextSpan(
                      text: " your perfect product",
                      style: TextStyle(color: Colors.grey, fontSize: 26.sp),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20.h),


              Container(
                height: 70.h,

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.r),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(.15),
                      blurRadius: 12.r,
                      offset: Offset(0, 5.h),
                    ),
                  ],
                ),

                child:  TextField(
                  controller: _searchController,
                  style: TextStyle(fontSize: 25.sp),
                  decoration: InputDecoration(
                    hintText: "Search products by name",
                    hintStyle: TextStyle(fontSize: 25.sp),
                    prefixIcon: Icon(Icons.search),
                     suffixIcon: _searchController.text.isNotEmpty
                        ? IconButton(
                            icon: Icon(Icons.close, size: 20.sp),
                            onPressed: () {
                              _searchController.clear();
                            },
                          )
                        : null,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 35.w), 

                  ),

                ),
              ),

           SizedBox(height: 20.h),

               if (_searchController.text.isEmpty) ...[
              Container(
                height: 260.h,
                width: double.infinity,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),

                  gradient: const LinearGradient(
                    colors: [Color(0xff6C63FF), Color(0xff8E7CFF)],
                  ),
                ),

                child: Padding(
                  padding:EdgeInsets.all(20.r),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,

                    children:  [
                      Text(
                        "Summer Sale",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 46.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 10.h),

                      Text(
                        "Up to 50% OFF",
                        style: TextStyle(color: Colors.white70, fontSize: 26.sp),
                      ),
                    ],
                  ),
                ),
              ),

         SizedBox(height: 25.h),],

  Text(
                _searchController.text.isEmpty
                    ? "Popular Products"
                    : "Search Results (${_filteredProducts.length})",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.sp,
                  color: Colors.black,
                ),
              ),

    SizedBox(height: 20.h),
// Empty state when no products match
              if (_filteredProducts.isEmpty)
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 60.h),
                  child: Center(
                    child: Column(
                      
                      children: [
                        Icon(
                          Icons.search_off,
                          size: 100.sp,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 22.h),
                        Text(
                          "No products found",
                          style: TextStyle(
                            fontSize: 26.sp,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              else
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),

                itemCount: _filteredProducts.length,

                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:1.sw> 700 ? 4 : 2,
                  crossAxisSpacing: 15.r,
                  mainAxisSpacing: 15.r,
                  childAspectRatio: 0.70,
                ),

                itemBuilder: (context, index) {
                  return ProductCard(product: _filteredProducts[index]);
               },
                ),
            ],
          ),
        ),
      ),
    );
  }
}