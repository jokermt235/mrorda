import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F0FF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const Icon(Icons.menu_book, size: 60, color: Colors.deepPurple),
              const SizedBox(height: 10),
              const Text(
                "GoRouter Navigator",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 40),
              _buildNavButton(
                context,
                label: "Go to Profile",
                icon: Icons.person,
                color: Colors.indigo,
                route: '/profile/Madina',
              ),
              _buildNavButton(
                context,
                label: "Go to Details",
                icon: Icons.info_outline,
                color: Colors.teal,
                route: '/details/42',
              ),
              _buildNavButton(
                context,
                label: "Go to Settings",
                icon: Icons.settings,
                color: Colors.orange,
                route: '/settings/theme/dark',
              ),
              _buildNavButton(
                context,
                label: "Go to Result",
                icon: Icons.assessment,
                color: Colors.redAccent,
                route: '/result/Flutter/95',
              ),
              _buildNavButton(
                context,
                label: "Go to Username Input",
                icon: Icons.edit_note,
                color: Colors.blueAccent,
                route: '/username',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavButton(
    BuildContext context, {
    required String label,
    required IconData icon,
    required Color color,
    required String route,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: () => context.go(route),
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.15),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Icon(icon, color: color),
              const SizedBox(width: 12),
              Text(
                label,
                style: TextStyle(
                  fontSize: 18,
                  color: color,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}
