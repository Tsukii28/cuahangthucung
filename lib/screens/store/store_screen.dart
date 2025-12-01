import 'package:flutter/material.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Cửa hàng', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildSearchField(),
              const SizedBox(height: 24),
              _buildSectionHeader(context, 'Danh mục', () {}),
              const SizedBox(height: 16),
              _buildCategories(),
              const SizedBox(height: 24),
              _buildSectionHeader(context, 'Sản phẩm nổi bật', () {}),
              const SizedBox(height: 16),
              _buildFeaturedProducts(),
              const SizedBox(height: 16), // Thêm khoảng đệm để sửa lỗi overflow
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Tìm kiếm tại đây',
        prefixIcon: const Icon(Icons.search),
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title, VoidCallback onViewAll) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: onViewAll,
          child: const Text('Xem tất cả', style: TextStyle(color: Colors.purple)),
        ),
      ],
    );
  }

  Widget _buildCategories() {
    // Dữ liệu giữ chỗ cho các danh mục
    final categories = [
      {'icon': Icons.fastfood_outlined, 'label': 'Thức ăn & Đồ uống'},
      {'icon': Icons.pets, 'label': 'Dog & Cat Sup...'},
      {'icon': Icons.set_meal_outlined, 'label': 'Ind Fish Small An...'},
      {'icon': Icons.bug_report_outlined, 'label': 'Reptile Supplies'},
      {'icon': Icons.star_border_outlined, 'label': 'Vòng cổ sành điệu'},
      {'icon': Icons.loyalty_outlined, 'label': 'Collars'},
    ];

    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1.2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.purple[50],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(category['icon'] as IconData, color: Colors.purple, size: 30),
            ),
            const SizedBox(height: 8),
            Text(
              category['label'] as String,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              maxLines: 2,
            ),
          ],
        );
      },
    );
  }

  Widget _buildFeaturedProducts() {
    // Dữ liệu giữ chỗ cho các sản phẩm
    final products = [
      {'name': 'Lvylo Adjustable Pet C...', 'price': '50,000đ'},
      {'name': 'Pet Heating Lamp Hol...', 'price': '100,000đ'},
    ];

    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey[200]!)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                     // Trình giữ chỗ cho hình ảnh
                    Container(
                      margin: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                         color: Colors.yellow[100],
                         borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.favorite_border, color: Colors.grey),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  product['name']!,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  product['price']!,
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.purple, fontSize: 16),
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        );
      },
    );
  }
}
