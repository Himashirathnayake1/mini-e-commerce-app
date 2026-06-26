import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f7),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            children: [
              // Profile Header
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(.15),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),

                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                        "https://cdn-icons-png.flaticon.com/128/4829/4829575.png",
                      ),
                    ),
                    SizedBox(height: 16.h),

                    const Text(
                      "Himashi",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 6.h),

                    Text(
                      "h@gmail.com",
                      style: TextStyle(color: Colors.grey.shade600),
                    ),

                    SizedBox(height: 16.h),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 8,
                      ),

                      decoration: BoxDecoration(
                        color: const Color(0xff6C63FF).withOpacity(.1),

                        borderRadius: BorderRadius.circular(20),
                      ),

                      child: const Text(
                        "Premium Member",
                        style: TextStyle(
                          color: Color(0xff6C63FF),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 25.h),

              // Statistics
              Row(
                children: [
                  Expanded(
                    child: _buildStatCard(
                      "24",
                      "Orders",
                      Icons.shopping_bag_outlined,
                    ),
                  ),

                  SizedBox(width: 18.w),

                  Expanded(
                    child: _buildStatCard(
                      "8",
                      "Wishlist",
                      Icons.favorite_outline,
                    ),
                  ),

                  SizedBox(width: 18.w),

                  Expanded(
                    child: _buildStatCard("4.9", "Rating", Icons.star_outline),
                  ),
                ],
              ),

              SizedBox(height: 25.h),

              // Menu Items
              _buildMenuTile(
                icon: Icons.shopping_bag_outlined,
                title: "My Orders",
              ),

              _buildMenuTile(
                icon: Icons.location_on_outlined,
                title: "Shipping Address",
              ),

              _buildMenuTile(
                icon: Icons.payment_outlined,
                title: "Payment Methods",
              ),

              _buildMenuTile(icon: Icons.favorite_outline, title: "Wishlist"),

              _buildMenuTile(icon: Icons.settings_outlined, title: "Settings"),

              _buildMenuTile(icon: Icons.help_outline, title: "Help & Support"),

              SizedBox(height: 30.h),

              SizedBox(
                width: double.infinity,
                height: 100.h,

                child: ElevatedButton.icon(
                  onPressed: () {},

                  icon: const Icon(Icons.logout, color: Colors.white),

                  label: Text(
                    "Logout",
                    style: TextStyle(fontSize: 28.sp, color: Colors.white),
                  ),

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildStatCard(String value, String title, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),

        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(.12), blurRadius: 10),
        ],
      ),

      child: Column(
        children: [
          Icon(icon, color: const Color(0xff6C63FF)),

          SizedBox(height: 16.h),

          Text(
            value,
            style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold),
          ),

          Text(title, style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  static Widget _buildMenuTile({
    required IconData icon,
    required String title,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),

        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(.1), blurRadius: 8),
        ],
      ),

      child: ListTile(
        leading: Icon(icon, color: const Color(0xff6C63FF)),

        title: Text(title),

        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
}
