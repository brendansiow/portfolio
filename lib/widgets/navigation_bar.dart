import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  final VoidCallback onAboutPressed;
  final VoidCallback onExperiencePressed;
  final VoidCallback onProjectsPressed;
  final VoidCallback onAcademicPressed;
  final VoidCallback onSkillsPressed;

  const CustomNavigationBar({
    Key? key,
    required this.onAboutPressed,
    required this.onExperiencePressed,
    required this.onProjectsPressed,
    required this.onAcademicPressed,
    required this.onSkillsPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo/Name
          const Text(
            'PORTFOLIO',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2E3BA2),
            ),
          ),
          // Navigation Items
          Row(
            children: [
              _buildNavItem('About', onAboutPressed),
              const SizedBox(width: 30),
              _buildNavItem('Experience', onExperiencePressed),
              const SizedBox(width: 30),
              _buildNavItem('Projects', onProjectsPressed),
              const SizedBox(width: 30),
              _buildNavItem('Education', onAcademicPressed),
              const SizedBox(width: 30),
              _buildNavItem('Skills', onSkillsPressed),
              const SizedBox(width: 30),
              _buildContactButton(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(String title, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xFF333333),
          ),
        ),
      ),
    );
  }

  Widget _buildContactButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF2E3BA2),
        borderRadius: BorderRadius.circular(25),
      ),
      child: const Text(
        'Contact',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    );
  }
}