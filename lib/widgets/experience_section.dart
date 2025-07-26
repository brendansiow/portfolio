import 'package:flutter/material.dart';
import '../utils/responsive_helper.dart';
import '../utils/app_theme.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveHelper.getHorizontalPadding(context),
        vertical: ResponsiveHelper.getVerticalPadding(context),
      ),
      color: AppTheme.getSurfaceColor(context),
      child: Column(
        children: [
          // Section Title
          Text(
            'Working Experience',
            style: TextStyle(
              fontSize: ResponsiveHelper.getFontSize(context, 42),
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Text(
            'My professional journey and key achievements',
            style: TextStyle(
              fontSize: ResponsiveHelper.getFontSize(context, 18),
              color: AppTheme.getTextColor(context).withOpacity(0.7),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 60),
          // Experience Timeline
          Column(
            children: [
              _buildExperienceItem(
                context,
                'Senior Full Stack Developer',
                'TechCorp Solutions',
                '2022 - Present',
                'Leading development of enterprise web applications using React, Node.js, and AWS. '
                'Managed a team of 5 developers and improved system performance by 40%.',
                [
                  'Led migration from monolithic to microservices architecture',
                  'Implemented CI/CD pipelines reducing deployment time by 60%',
                  'Mentored junior developers and conducted code reviews',
                  'Collaborated with product teams to define technical requirements',
                ],
                true,
                isDark,
              ),
              _buildExperienceItem(
                context,
                'Full Stack Developer',
                'StartupTech Inc.',
                '2020 - 2022',
                'Developed and maintained multiple web applications using modern technologies. '
                'Worked closely with design team to implement pixel-perfect UIs.',
                [
                  'Built responsive web applications using React and Vue.js',
                  'Developed RESTful APIs with Node.js and Express',
                  'Integrated third-party services and payment gateways',
                  'Optimized database queries improving response time by 30%',
                ],
                false,
                isDark,
              ),
              _buildExperienceItem(
                context,
                'Frontend Developer',
                'WebSolutions Ltd.',
                '2019 - 2020',
                'Focused on creating interactive and user-friendly web interfaces. '
                'Collaborated with UX designers to implement modern design patterns.',
                [
                  'Developed responsive websites using HTML5, CSS3, and JavaScript',
                  'Implemented modern frontend frameworks and libraries',
                  'Ensured cross-browser compatibility and performance optimization',
                  'Participated in agile development processes',
                ],
                false,
                isDark,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceItem(
    BuildContext context,
    String title,
    String company,
    String duration,
    String description,
    List<String> achievements,
    bool isLatest,
    bool isDark,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 50),
      child: ResponsiveHelper.isMobile(context)
          ? _buildMobileExperienceItem(context, title, company, duration, description, achievements, isLatest, isDark)
          : _buildDesktopExperienceItem(context, title, company, duration, description, achievements, isLatest, isDark),
    );
  }

  Widget _buildDesktopExperienceItem(
    BuildContext context,
    String title,
    String company,
    String duration,
    String description,
    List<String> achievements,
    bool isLatest,
    bool isDark,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Timeline
        Column(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: isLatest ? Theme.of(context).primaryColor : Colors.grey,
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppTheme.getSurfaceColor(context),
                  width: 3,
                ),
              ),
            ),
            Container(
              width: 2,
              height: 150,
              color: AppTheme.getTextColor(context).withOpacity(0.2),
            ),
          ],
        ),
        const SizedBox(width: 30),
        // Content
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(30),
            decoration: AppTheme.glassDecoration(isDark),
            child: _buildExperienceContent(context, title, company, duration, description, achievements, isDark),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileExperienceItem(
    BuildContext context,
    String title,
    String company,
    String duration,
    String description,
    List<String> achievements,
    bool isLatest,
    bool isDark,
  ) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: AppTheme.glassDecoration(isDark),
      child: Column(
        children: [
          // Timeline indicator
          Container(
            width: 15,
            height: 15,
            decoration: BoxDecoration(
              color: isLatest ? Theme.of(context).primaryColor : Colors.grey,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(height: 20),
          _buildExperienceContent(context, title, company, duration, description, achievements, isDark),
        ],
      ),
    );
  }

  Widget _buildExperienceContent(
    BuildContext context,
    String title,
    String company,
    String duration,
    String description,
    List<String> achievements,
    bool isDark,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ResponsiveHelper.isMobile(context)
            ? _buildMobileHeader(context, title, company, duration)
            : _buildDesktopHeader(context, title, company, duration),
        const SizedBox(height: 15),
        Text(
          description,
          style: TextStyle(
            fontSize: ResponsiveHelper.getFontSize(context, 16),
            color: AppTheme.getTextColor(context).withOpacity(0.8),
            height: 1.5,
          ),
        ),
        const SizedBox(height: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: achievements
              .map((achievement) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      children: [
                        Icon(
                          Icons.check_circle,
                          color: const Color(0xFF4CAF50),
                          size: ResponsiveHelper.getFontSize(context, 18),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            achievement,
                            style: TextStyle(
                              fontSize: ResponsiveHelper.getFontSize(context, 15),
                              color: AppTheme.getTextColor(context).withOpacity(0.8),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))
              .toList(),
        ),
      ],
    );
  }

  Widget _buildDesktopHeader(BuildContext context, String title, String company, String duration) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: ResponsiveHelper.getFontSize(context, 22),
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              company,
              style: TextStyle(
                fontSize: ResponsiveHelper.getFontSize(context, 18),
                fontWeight: FontWeight.w600,
                color: AppTheme.getTextColor(context),
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            duration,
            style: TextStyle(
              fontSize: ResponsiveHelper.getFontSize(context, 14),
              fontWeight: FontWeight.w600,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileHeader(BuildContext context, String title, String company, String duration) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: ResponsiveHelper.getFontSize(context, 22),
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 5),
        Text(
          company,
          style: TextStyle(
            fontSize: ResponsiveHelper.getFontSize(context, 18),
            fontWeight: FontWeight.w600,
            color: AppTheme.getTextColor(context),
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            duration,
            style: TextStyle(
              fontSize: ResponsiveHelper.getFontSize(context, 14),
              fontWeight: FontWeight.w600,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}