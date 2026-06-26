import 'package:flutter/material.dart';
import 'package:mini_e/data/products.dart';
import 'package:mini_e/providers/favourites_provider.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<FavoritesProvider>().loadFavorites();
    });
  }

  @override
  Widget build(BuildContext context) {
    final favorites = context.watch<FavoritesProvider>();

    final favProducts =
        products.where((product) {
          return favorites.favoriteIds.contains(product.id);
        }).toList();

    return Scaffold(
      appBar: AppBar(title: const Text("Favorites")),

      body:
          favProducts.isEmpty
              ? const Center(child: Text("No favorite products"))
              : GridView.builder(
                padding: const EdgeInsets.all(16),

                itemCount: favProducts.length,

                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: .7,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),

                itemBuilder: (context, index) {
                  final product = favProducts[index];

                 return Card(
  elevation: 4,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20),
  ),

  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

      // IMAGE SECTION
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
                child: Image.asset(
                  product.image,
                  fit: BoxFit.cover,
                ),
              ),

              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.5),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),

              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.favorite_border,
                    size: 18,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),


      Expanded(
        flex: 4,
        child: Padding(
          padding: const EdgeInsets.all(10),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                product.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 6),

              Text(
                "Rs. ${product.price}",
                style: const TextStyle(
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  ),
);
                },
              ),
    );
  }
}
