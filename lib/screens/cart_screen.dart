import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final cart =
        Provider.of<CartProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xfff5f5f7),

      appBar: AppBar(
        title: const Text("My Cart"),
      ),

      body: cart.items.isEmpty
          ? const Center(
              child: Text(
                "Cart is Empty",
              ),
            )
          : Column(
              children: [

                Expanded(
                  child: ListView.builder(
                    itemCount:
                        cart.items.length,

                    itemBuilder:
                        (context, index) {

                      final item =
                          cart.items[index];

                      return Container(
                        margin:
                            const EdgeInsets.all(
                                10),

                        padding:
                            const EdgeInsets.all(
                                12),

                        decoration:
                            BoxDecoration(
                          color: Colors.white,

                          borderRadius:
                              BorderRadius
                                  .circular(
                                      15),
                        ),

                        child: Row(
                          children: [

                            Container(
                              width: 70,
                              height: 70,

                              decoration:
                                  BoxDecoration(
                                color: Colors
                                    .grey
                                    .shade100,

                                borderRadius:
                                    BorderRadius
                                        .circular(
                                            10),
                              ),

                              child:
                                  Image.asset(
                                item.product
                                    .image,
                              ),
                            ),

                            const SizedBox(
                              width: 15,
                            ),

                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment
                                        .start,

                                children: [

                                  Text(
                                    item.product
                                        .name,

                                    style:
                                        const TextStyle(
                                      fontWeight:
                                          FontWeight
                                              .bold,
                                    ),
                                  ),

                                  const SizedBox(
                                      height:
                                          5),

                                  Text(
                                    "Rs.${item.product.price}",
                                  ),
                                ],
                              ),
                            ),

                            Row(
                              children: [

                                IconButton(
                                  onPressed: () {
                                    cart.decreaseQty(
                                        index);
                                  },
                                  icon:
                                      const Icon(
                                    Icons
                                        .remove_circle_outline,
                                  ),
                                ),

                                Text(
                                  item.quantity
                                      .toString(),
                                ),

                                IconButton(
                                  onPressed: () {
                                    cart.increaseQty(
                                        index);
                                  },
                                  icon:
                                      const Icon(
                                    Icons
                                        .add_circle_outline,
                                  ),
                                ),
                              ],
                            ),

                            IconButton(
                              onPressed: () {
                                cart.removeItem(
                                    index);
                              },
                              icon: const Icon(
                                Icons.delete,
                                color:
                                    Colors.red,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                Container(
                  padding:
                      const EdgeInsets.all(20),

                  decoration:
                      const BoxDecoration(
                    color: Colors.white,
                  ),

                  child: Column(
                    children: [

                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment
                                .spaceBetween,

                        children: [

                          const Text(
                            "Total",
                            style:
                                TextStyle(
                              fontSize: 20,
                              fontWeight:
                                  FontWeight
                                      .bold,
                            ),
                          ),

                          Text(
                            "Rs.${cart.totalPrice.toStringAsFixed(2)}",

                            style:
                                const TextStyle(
                              fontSize: 20,
                              fontWeight:
                                  FontWeight
                                      .bold,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 15,
                      ),

                      SizedBox(
                        width:
                            double.infinity,
                        height: 55,

                        child:
                            ElevatedButton(
                          onPressed: () {},

                          style:
                              ElevatedButton
                                  .styleFrom(
                            backgroundColor:
                                const Color(
                                    0xff6C63FF),
                          ),

                          child:  Text(
                            "Checkout",
                            style: TextStyle(
                              fontSize: 30.sp,
                              fontWeight:
                                  FontWeight
                                      .bold,
                                      color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}