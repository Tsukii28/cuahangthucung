import 'package:flutter/material.dart';

// Implementation of the Profile Screen based on the image
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // Light grey background
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Hồ sơ',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 24),
                Center(
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          const CircleAvatar(
                            radius: 50,
                            backgroundColor: Color(0xFFE1BEE7), // Light purple
                            child: Text(
                              'U',
                              style: TextStyle(fontSize: 40, color: Colors.white),
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              color: Color(0xFF9C27B0), // Purple
                              shape: BoxShape.circle,
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Icon(Icons.edit, color: Colors.white, size: 16),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'User',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'user123@gmail.com',
                        style: TextStyle(fontSize: 15, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                _buildProfileMenu(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileMenu(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          _buildProfileMenuItem(
            icon: Icons.pets_outlined,
            title: 'Thú cưng của tôi',
            subtitle: 'Chi tiết hồ sơ thú cưng',
            onTap: () {},
          ),
          const Divider(height: 1, indent: 68),
          _buildProfileMenuItem(
            icon: Icons.add_circle_outline,
            title: 'Thêm thú cưng',
            subtitle: 'Thêm thông tin thú cưng của bạn',
            onTap: () {},
          ),
          const Divider(height: 1, indent: 68),
          _buildProfileMenuItem(
            icon: Icons.receipt_long_outlined,
            title: 'Đơn hàng',
            subtitle: 'Xem đơn hàng của bạn',
            onTap: () {},
          ),
          const Divider(height: 1, indent: 68),
          _buildProfileMenuItem(
            icon: Icons.favorite_border,
            title: 'Danh sách yêu thích',
            subtitle: 'Sản phẩm trong danh sách yêu thích',
            onTap: () {},
          ),
           const Divider(height: 1, indent: 68),
          _buildProfileMenuItem(
            icon: Icons.location_on_outlined,
            title: 'Địa chỉ của tôi',
            subtitle: 'Quản lý địa chỉ của bạn',
            onTap: () {},
          ),
           const Divider(height: 1, indent: 68),
          _buildProfileMenuItem(
            icon: Icons.settings_outlined,
            title: 'Cài đặt',
            subtitle: 'Đổi mật khẩu, Giao diện và hơn thế nữa',
            onTap: () {},
          ),
           const Divider(height: 1, indent: 68),
          _buildProfileMenuItem(
            icon: Icons.star_border,
            title: 'Đánh giá ứng dụng',
            subtitle: 'Hãy thể hiện tình yêu, chia sẻ',
            showTrailing: false,
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildProfileMenuItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    bool showTrailing = true,
  }) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF9C27B0)), // Purple
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
      subtitle: Text(subtitle, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
      trailing: showTrailing ? const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey) : null,
      onTap: onTap,
    );
  }
}
