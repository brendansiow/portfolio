import 'package:flutter/material.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 100),
      color: Colors.white,
      child: Column(
        children: [
          // Section Title
          const Text(
            'Featured Projects',
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2E3BA2),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Some of my recent work and personal projects',
            style: TextStyle(
              fontSize: 18,
              color: Color(0xFF666666),
            ),
          ),
          const SizedBox(height: 60),
          // Projects Grid
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 30,
            mainAxisSpacing: 30,
            childAspectRatio: 1.2,
            children: [
              _buildProjectCard(
                'E-Commerce Platform',
                'A full-stack e-commerce solution built with React, Node.js, and MongoDB. '
                'Features include user authentication, payment integration, and admin dashboard.',
                [
                  'React.js',
                  'Node.js',
                  'MongoDB',
                  'Stripe API',
                  'AWS',
                ],
                'https://github.com/johndoe/ecommerce',
                'https://ecommerce-demo.com',
              ),
              _buildProjectCard(
                'Task Management App',
                'A collaborative task management application with real-time updates. '
                'Built using Flutter for mobile and React for web interface.',
                [
                  'Flutter',
                  'React',
                  'Firebase',
                  'Socket.io',
                  'Material-UI',
                ],
                'https://github.com/johndoe/taskmanager',
                'https://taskmanager-demo.com',
              ),
              _buildProjectCard(
                'Weather Dashboard',
                'A responsive weather application displaying current conditions and forecasts. '
                'Integrates with multiple weather APIs and features location-based services.',
                [
                  'Vue.js',
                  'OpenWeather API',
                  'Chart.js',
                  'Geolocation',
                  'PWA',
                ],
                'https://github.com/johndoe/weather',
                'https://weather-dashboard-demo.com',
              ),
              _buildProjectCard(
                'Portfolio Website',
                'A responsive portfolio website built with Flutter web. '
                'Features smooth animations, responsive design, and optimized performance.',
                [
                  'Flutter',
                  'Dart',
                  'Web',
                  'Responsive',
                  'Animations',
                ],
                'https://github.com/johndoe/portfolio',
                'https://johndoe-portfolio.com',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard(
    String title,
    String description,
    List<String> technologies,
    String githubUrl,
    String liveUrl,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Project Image Placeholder
          Container(
            height: 150,
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF667eea),
                  Color(0xFF764ba2),
                ],
              ),
            ),
            child: const Icon(
              Icons.web,
              size: 60,
              color: Colors.white,
            ),
          ),
          // Project Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2E3BA2),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF666666),
                      height: 1.4,
                    ),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 15),
                  // Technologies
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: technologies
                        .map((tech) => Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFF2E3BA2).withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                tech,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF2E3BA2),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                  const Spacer(),
                  // Action Buttons
                  Row(
                    children: [
                      _buildActionButton(
                        'GitHub',
                        Icons.code,
                        githubUrl,
                      ),
                      const SizedBox(width: 10),
                      _buildActionButton(
                        'Live Demo',
                        Icons.launch,
                        liveUrl,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(String text, IconData icon, String url) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFF2E3BA2),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 16,
              color: const Color(0xFF2E3BA2),
            ),
            const SizedBox(width: 5),
            Text(
              text,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF2E3BA2),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}