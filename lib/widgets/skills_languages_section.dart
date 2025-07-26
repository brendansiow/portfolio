import 'package:flutter/material.dart';
import '../utils/responsive_helper.dart';
import '../utils/app_theme.dart';

class SkillsLanguagesSection extends StatelessWidget {
  const SkillsLanguagesSection({Key? key}) : super(key: key);

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
            'Skills & Languages',
            style: TextStyle(
              fontSize: ResponsiveHelper.getFontSize(context, 42),
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Text(
            'Technical expertise and language proficiencies',
            style: TextStyle(
              fontSize: ResponsiveHelper.getFontSize(context, 18),
              color: AppTheme.getTextColor(context).withOpacity(0.7),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 60),
          // Content
          Column(
            children: [
              // Technical Skills
              _buildSkillsSection(context, isDark),
              const SizedBox(height: 80),
              // Languages
              _buildLanguagesSection(context, isDark),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSkillsSection(BuildContext context, bool isDark) {
    return Column(
      children: [
        // Skills Header
        Text(
          'Technical Skills',
          style: TextStyle(
            fontSize: ResponsiveHelper.getFontSize(context, 28),
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 40),
        // Skills Grid
        ResponsiveHelper.isMobile(context)
            ? _buildMobileSkillsGrid(context, isDark)
            : _buildDesktopSkillsGrid(context, isDark),
      ],
    );
  }

  Widget _buildDesktopSkillsGrid(BuildContext context, bool isDark) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Frontend Skills
        Expanded(
          child: _buildSkillCategory(
            context,
            'Frontend Development',
            [
              {'name': 'React.js', 'level': 0.9},
              {'name': 'Vue.js', 'level': 0.85},
              {'name': 'Flutter', 'level': 0.95},
              {'name': 'TypeScript', 'level': 0.8},
              {'name': 'HTML5/CSS3', 'level': 0.9},
            ],
            isDark,
          ),
        ),
        const SizedBox(width: 30),
        // Backend Skills
        Expanded(
          child: _buildSkillCategory(
            context,
            'Backend Development',
            [
              {'name': 'Node.js', 'level': 0.9},
              {'name': 'Python', 'level': 0.85},
              {'name': 'Java', 'level': 0.8},
              {'name': 'MongoDB', 'level': 0.85},
              {'name': 'PostgreSQL', 'level': 0.8},
            ],
            isDark,
          ),
        ),
        const SizedBox(width: 30),
        // Tools & Others
        Expanded(
          child: _buildSkillCategory(
            context,
            'Tools & Platforms',
            [
              {'name': 'AWS', 'level': 0.85},
              {'name': 'Docker', 'level': 0.8},
              {'name': 'Git', 'level': 0.95},
              {'name': 'Firebase', 'level': 0.9},
              {'name': 'Linux', 'level': 0.8},
            ],
            isDark,
          ),
        ),
      ],
    );
  }

  Widget _buildMobileSkillsGrid(BuildContext context, bool isDark) {
    return Column(
      children: [
        _buildSkillCategory(
          context,
          'Frontend Development',
          [
            {'name': 'React.js', 'level': 0.9},
            {'name': 'Vue.js', 'level': 0.85},
            {'name': 'Flutter', 'level': 0.95},
            {'name': 'TypeScript', 'level': 0.8},
            {'name': 'HTML5/CSS3', 'level': 0.9},
          ],
          isDark,
        ),
        const SizedBox(height: 40),
        _buildSkillCategory(
          context,
          'Backend Development',
          [
            {'name': 'Node.js', 'level': 0.9},
            {'name': 'Python', 'level': 0.85},
            {'name': 'Java', 'level': 0.8},
            {'name': 'MongoDB', 'level': 0.85},
            {'name': 'PostgreSQL', 'level': 0.8},
          ],
          isDark,
        ),
        const SizedBox(height: 40),
        _buildSkillCategory(
          context,
          'Tools & Platforms',
          [
            {'name': 'AWS', 'level': 0.85},
            {'name': 'Docker', 'level': 0.8},
            {'name': 'Git', 'level': 0.95},
            {'name': 'Firebase', 'level': 0.9},
            {'name': 'Linux', 'level': 0.8},
          ],
          isDark,
        ),
  Widget _buildSkillCategory(
    BuildContext context,
    String title,
    List<Map<String, dynamic>> skills,
    bool isDark,
  ) {
    return Container(
      padding: EdgeInsets.all(ResponsiveHelper.isMobile(context) ? 20 : 25),
      decoration: AppTheme.glassDecoration(isDark),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Category Header
          Text(
            title,
            style: TextStyle(
              fontSize: ResponsiveHelper.getFontSize(context, 18),
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
            textAlign: ResponsiveHelper.isMobile(context) ? TextAlign.center : TextAlign.left,
          ),
          const SizedBox(height: 20),
          // Skills List
          Column(
            children: skills
                .map((skill) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: _buildSkillBar(context, skill['name']!, skill['level']!, isDark),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillBar(BuildContext context, String skillName, double proficiency, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              skillName,
              style: TextStyle(
                fontSize: ResponsiveHelper.getFontSize(context, 12),
                fontWeight: FontWeight.w500,
                color: AppTheme.getTextColor(context),
              ),
            ),
            Text(
              '${(proficiency * 100).toInt()}%',
              style: TextStyle(
                fontSize: ResponsiveHelper.getFontSize(context, 11),
                color: AppTheme.getTextColor(context).withOpacity(0.7),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Container(
          height: 6,
          decoration: BoxDecoration(
            color: AppTheme.getTextColor(context).withOpacity(0.2),
            borderRadius: BorderRadius.circular(3),
          ),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: proficiency,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).primaryColor,
                    Theme.of(context).primaryColor.withOpacity(0.7),
                  ],
                ),
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLanguagesSection(BuildContext context, bool isDark) {
    return Column(
      children: [
        // Languages Header
        Text(
          'Languages',
          style: TextStyle(
            fontSize: ResponsiveHelper.getFontSize(context, 28),
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 40),
        // Languages
        ResponsiveHelper.isMobile(context)
            ? _buildMobileLanguages(context, isDark)
            : _buildDesktopLanguages(context, isDark),
      ],
    );
  }

  Widget _buildDesktopLanguages(BuildContext context, bool isDark) {
    return Row(
      children: [
        Expanded(
          child: _buildLanguageItem(context, 'English', 'Native', 0.95, '🇺🇸', isDark),
        ),
        const SizedBox(width: 30),
        Expanded(
          child: _buildLanguageItem(context, 'Spanish', 'Fluent', 0.85, '🇪🇸', isDark),
        ),
        const SizedBox(width: 30),
        Expanded(
          child: _buildLanguageItem(context, 'French', 'Intermediate', 0.65, '🇫🇷', isDark),
        ),
        const SizedBox(width: 30),
        Expanded(
          child: _buildLanguageItem(context, 'Mandarin', 'Basic', 0.4, '🇨🇳', isDark),
        ),
      ],
    );
  }

  Widget _buildMobileLanguages(BuildContext context, bool isDark) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildLanguageItem(context, 'English', 'Native', 0.95, '🇺🇸', isDark),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: _buildLanguageItem(context, 'Spanish', 'Fluent', 0.85, '🇪🇸', isDark),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: _buildLanguageItem(context, 'French', 'Intermediate', 0.65, '🇫🇷', isDark),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: _buildLanguageItem(context, 'Mandarin', 'Basic', 0.4, '🇨🇳', isDark),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildLanguageItem(
    BuildContext context,
    String language,
    String level,
    double proficiency,
    String flag,
    bool isDark,
  ) {
    return Container(
      padding: EdgeInsets.all(ResponsiveHelper.isMobile(context) ? 20 : 25),
      decoration: AppTheme.glassDecoration(isDark),
      child: Column(
        children: [
          // Flag and Language Name
          Text(
            flag,
            style: TextStyle(fontSize: ResponsiveHelper.getFontSize(context, 40)),
          ),
          const SizedBox(height: 15),
          Text(
            language,
            style: TextStyle(
              fontSize: ResponsiveHelper.getFontSize(context, 20),
              fontWeight: FontWeight.bold,
              color: AppTheme.getTextColor(context),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            level,
            style: TextStyle(
              fontSize: ResponsiveHelper.getFontSize(context, 14),
              color: AppTheme.getTextColor(context).withOpacity(0.7),
            ),
          ),
          const SizedBox(height: 15),
          // Proficiency Bar
          Container(
            height: 8,
            decoration: BoxDecoration(
              color: AppTheme.getTextColor(context).withOpacity(0.2),
              borderRadius: BorderRadius.circular(4),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: proficiency,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).primaryColor,
                      Theme.of(context).primaryColor.withOpacity(0.7),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '${(proficiency * 100).toInt()}%',
            style: TextStyle(
              fontSize: ResponsiveHelper.getFontSize(context, 12),
              fontWeight: FontWeight.w600,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}