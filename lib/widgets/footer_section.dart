import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 60),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF2E3BA2),
            Color(0xFF1a2568),
          ],
        ),
      ),
      child: Column(
        children: [
          // Contact Section
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left side - Contact Info
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Get In Touch',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'I\'m always interested in new opportunities and collaborations. '
                      'Let\'s connect and discuss how we can work together.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 30),
                    _buildContactItem(
                      Icons.email,
                      'john.doe@email.com',
                    ),
                    const SizedBox(height: 15),
                    _buildContactItem(
                      Icons.phone,
                      '+1 (555) 123-4567',
                    ),
                    const SizedBox(height: 15),
                    _buildContactItem(
                      Icons.location_on,
                      'San Francisco, CA',
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 50),
              // Right side - Social Links & Contact Form
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Follow Me',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        _buildSocialButton(Icons.link, 'LinkedIn'),
                        const SizedBox(width: 15),
                        _buildSocialButton(Icons.code, 'GitHub'),
                        const SizedBox(width: 15),
                        _buildSocialButton(Icons.alternate_email, 'Twitter'),
                        const SizedBox(width: 15),
                        _buildSocialButton(Icons.article, 'Medium'),
                      ],
                    ),

                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 50),
          // Footer Bottom
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.white.withOpacity(0.2),
                  width: 1,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  '© 2024 John Doe. All rights reserved.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 20,
        ),
        const SizedBox(width: 15),
        Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildSocialButton(IconData icon, String platform) {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.white.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: IconButton(
        onPressed: () {
          // Handle social link
        },
        icon: Icon(
          icon,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }
}