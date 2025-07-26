import 'package:flutter/material.dart';
import '../utils/responsive_helper.dart';
import '../utils/app_theme.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveHelper.getHorizontalPadding(context),
        vertical: ResponsiveHelper.getVerticalPadding(context),
      ),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        children: [
          // Section Title
          Text(
            'Featured Projects',
            style: TextStyle(
              fontSize: ResponsiveHelper.getFontSize(context, 42),
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Text(
            'Some of my recent work and personal projects',
            style: TextStyle(
              fontSize: ResponsiveHelper.getFontSize(context, 18),
              color: AppTheme.getTextColor(context).withOpacity(0.7),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 60),
          // Projects Grid
          ResponsiveHelper.isMobile(context)
              ? _buildMobileProjectsList(context, isDark)
              : _buildDesktopProjectsGrid(context, isDark),
        ],
      ),
    );
  }

  Widget _buildDesktopProjectsGrid(BuildContext context, bool isDark) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: ResponsiveHelper.isTablet(context) ? 2 : 2,
      crossAxisSpacing: 30,
      mainAxisSpacing: 30,
      childAspectRatio: ResponsiveHelper.isTablet(context) ? 1.1 : 1.2,
      children: [
        _buildProjectCard(
          context,
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
          isDark,
        ),
        _buildProjectCard(
          context,
          'Task Management App',
          'A collaborative task management application with real-time updates. '
          'Built using Flutter for mobile and React for web dashboard.',
          [
            'Flutter',
            'React.js',
            'Firebase',
            'Socket.io',
            'Material UI',
          ],
          isDark,
        ),
        _buildProjectCard(
          context,
          'Social Media Analytics',
          'A dashboard for social media analytics with data visualization. '
          'Processes large datasets and provides insights through interactive charts.',
          [
            'Vue.js',
            'Python',
            'D3.js',
            'PostgreSQL',
            'Docker',
          ],
          isDark,
        ),
        _buildProjectCard(
          context,
          'Weather App',
          'A beautiful weather application with location-based forecasts. '
          'Features include hourly/daily forecasts, weather maps, and alerts.',
          [
            'Flutter',
            'OpenWeather API',
            'Google Maps',
            'SQLite',
            'Bloc Pattern',
          ],
          isDark,
        ),
      ],
    );
  }

  Widget _buildMobileProjectsList(BuildContext context, bool isDark) {
    final projects = [
      {
        'title': 'E-Commerce Platform',
        'description': 'A full-stack e-commerce solution built with React, Node.js, and MongoDB. Features include user authentication, payment integration, and admin dashboard.',
        'technologies': ['React.js', 'Node.js', 'MongoDB', 'Stripe API', 'AWS'],
      },
      {
        'title': 'Task Management App',
        'description': 'A collaborative task management application with real-time updates. Built using Flutter for mobile and React for web dashboard.',
        'technologies': ['Flutter', 'React.js', 'Firebase', 'Socket.io', 'Material UI'],
      },
      {
        'title': 'Social Media Analytics',
        'description': 'A dashboard for social media analytics with data visualization. Processes large datasets and provides insights through interactive charts.',
        'technologies': ['Vue.js', 'Python', 'D3.js', 'PostgreSQL', 'Docker'],
      },
      {
        'title': 'Weather App',
        'description': 'A beautiful weather application with location-based forecasts. Features include hourly/daily forecasts, weather maps, and alerts.',
        'technologies': ['Flutter', 'OpenWeather API', 'Google Maps', 'SQLite', 'Bloc Pattern'],
      },
    ];

    return Column(
      children: projects.map((project) => 
        Container(
          margin: const EdgeInsets.only(bottom: 30),
          child: _buildProjectCard(
            context,
            project['title']!,
            project['description']!,
            project['technologies']! as List<String>,
            isDark,
          ),
        )
      ).toList(),
    );
  }

  Widget _buildProjectCard(
    BuildContext context,
    String title,
    String description,
    List<String> technologies,
    bool isDark,
  ) {
    return Container(
      decoration: AppTheme.glassDecoration(isDark),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Project Image Placeholder
          Container(
            height: ResponsiveHelper.isMobile(context) ? 120 : 150,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: isDark
                  ? [const Color(0xFF1C1C1E), const Color(0xFF2C2C2E)]
                  : [const Color(0xFF667eea), const Color(0xFF764ba2)],
              ),
            ),
            child: Icon(
              Icons.web,
              size: ResponsiveHelper.isMobile(context) ? 40 : 60,
              color: Colors.white,
            ),
          ),
          // Project Content
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(ResponsiveHelper.isMobile(context) ? 15 : 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: ResponsiveHelper.getFontSize(context, 20),
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: ResponsiveHelper.getFontSize(context, 14),
                      color: AppTheme.getTextColor(context).withOpacity(0.8),
                      height: 1.4,
                    ),
                    maxLines: ResponsiveHelper.isMobile(context) ? 3 : 4,
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
                                color: Theme.of(context).primaryColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                tech,
                                style: TextStyle(
                                  fontSize: ResponsiveHelper.getFontSize(context, 12),
                                  color: Theme.of(context).primaryColor,
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
                        context,
                        'GitHub',
                        Icons.code,
                        isDark,
                      ),
                      const SizedBox(width: 10),
                      _buildActionButton(
                        context,
                        'Live Demo',
                        Icons.launch,
                        isDark,
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

  Widget _buildActionButton(BuildContext context, String text, IconData icon, bool isDark) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).primaryColor,
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
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(width: 5),
            Text(
              text,
              style: TextStyle(
                fontSize: ResponsiveHelper.getFontSize(context, 12),
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}