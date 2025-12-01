import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedCategory = 'Chó';

  // Đã sửa lỗi đường dẫn và tên tệp
  final List<Map<String, String>> _pets = [
    {'name': 'Poodle', 'image': 'assets/images/poodle.png'},
    {'name': 'Chihuahua', 'image': 'assets/images/chihuahua.png'},
    {'name': 'Husky Siberia', 'image': 'assets/images/husky.png'},
    {'name': 'Alaska Malamute', 'image': ''}, // <-- Hình ảnh bị thiếu
    {'name': 'Corgi', 'image': 'assets/images/corgi.png'},
    {'name': 'Golden Retriever', 'image': 'assets/images/golden retriever.png'}, // <-- Đã sửa tên tệp
    {'name': 'Labrador Retriever', 'image': ''}, // <-- Hình ảnh bị thiếu
    {'name': 'Shiba Inu', 'image': ''}, // <-- Hình ảnh bị thiếu
    {'name': 'Chó ta', 'image': ''}, // <-- Hình ảnh bị thiếu
  ];

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = const Color(0xFFFEF6E8);
    final Color selectedChipColor = const Color(0xFF4FC3F7); // Light blue
    final Color unselectedChipColor = Colors.white;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Thú cưng bạn quan tâm',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Chọn thú cưng mà bạn quan tâm nhất và chúng tôi sẽ đề xuất cho bạn những video phù hợp nhất với bạn.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 24),
              _buildCategoryChips(selectedChipColor, unselectedChipColor),
              const SizedBox(height: 32),
              _buildPetGrid(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryChips(Color selectedChipColor, Color unselectedChipColor) {
    final categories = ['Chó', 'Mèo', 'Chim', 'Cá', 'Thỏ'];
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 12.0,
      runSpacing: 12.0,
      children: categories.map((category) {
        final isSelected = _selectedCategory == category;
        return ChoiceChip(
          label: Text(
            category,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          selected: isSelected,
          onSelected: (bool selected) {
            if (selected) {
              setState(() {
                _selectedCategory = category;
              });
            }
          },
          backgroundColor: unselectedChipColor,
          selectedColor: selectedChipColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: isSelected ? selectedChipColor : Colors.grey[300]!),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        );
      }).toList(),
    );
  }

  Widget _buildPetGrid() {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 3 / 4,
      ),
      itemCount: _pets.length,
      itemBuilder: (context, index) {
        final pet = _pets[index];
        final imagePath = pet['image']!;
        return Column(
          children: [
            Expanded(
              child: ClipOval(
                child: imagePath.isNotEmpty
                    ? Image.asset(
                        imagePath,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      )
                    : Container(
                        color: Colors.grey[300],
                        child: const Center(child: Icon(Icons.pets, color: Colors.white, size: 40)),
                      ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              pet['name']!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            )
          ],
        );
      },
    );
  }
}
