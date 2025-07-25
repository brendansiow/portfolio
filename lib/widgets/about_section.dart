import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 100),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF667eea),
            Color(0xFF764ba2),
          ],
        ),
      ),
      child: Row(
        children: [
          // Left side - Text content
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Hello, I\'m',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'John Doe',
                  style: TextStyle(
                    fontSize: 56,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  'Full Stack Developer',
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  'I\'m a passionate software developer with 5+ years of experience '
                  'creating amazing digital experiences. I specialize in building '
                  'modern web applications using cutting-edge technologies.',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  children: [
                    _buildActionButton(
                      'Download CV',
                      Icons.download,
                      Colors.white,
                      const Color(0xFF2E3BA2),
                    ),
                    const SizedBox(width: 20),
                    _buildActionButton(
                      'View Projects',
                      Icons.arrow_forward,
                      Colors.transparent,
                      Colors.white,
                      borderColor: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 50),
          // Right side - Profile image placeholder
          Expanded(
            flex: 2,
            child: Container(
              height: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white.withOpacity(0.1),
                border: Border.all(
                  color: Colors.white.withOpacity(0.3),
                  width: 2,
                ),
              ),
              child: const Icon(
                Icons.person,
                size: 150,
                color: Colors.white54,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(
    String text,
    IconData icon,
    Color backgroundColor,
    Color textColor, {
    Color? borderColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(30),
        border: borderColor != null 
            ? Border.all(color: borderColor, width: 2) 
            : null,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
          const SizedBox(width: 10),
          Icon(
            icon,
            color: textColor,
            size: 20,
          ),
        ],
      ),
    );
  }
}