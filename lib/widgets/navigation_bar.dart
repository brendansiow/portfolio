import 'package:flutter/material.dart';
import '../utils/responsive_helper.dart';
import '../utils/app_theme.dart';

class CustomNavigationBar extends StatelessWidget {
  final VoidCallback onAboutPressed;
  final VoidCallback onExperiencePressed;
  final VoidCallback onProjectsPressed;
  final VoidCallback onAcademicPressed;
  final VoidCallback onSkillsPressed;
  final VoidCallback onThemeToggle;

  const CustomNavigationBar({
    Key? key,
    required this.onAboutPressed,
    required this.onExperiencePressed,
    required this.onProjectsPressed,
    required this.onAcademicPressed,
    required this.onSkillsPressed,
    required this.onThemeToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Container(
      height: ResponsiveHelper.isMobile(context) ? 60 : 80,
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveHelper.getHorizontalPadding(context),
        vertical: 15,
      ),
      decoration: AppTheme.navBarGlassDecoration(isDark),
      child: ResponsiveHelper.isMobile(context)
          ? _buildMobileNavigation(context, isDark)
          : _buildDesktopNavigation(context, isDark),
    );
  }

  Widget _buildDesktopNavigation(BuildContext context, bool isDark) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Logo/Name
        Text(
          'PORTFOLIO',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        // Navigation Items
        Row(
          children: [
            _buildNavItem('About', onAboutPressed, context),
            const SizedBox(width: 30),
            _buildNavItem('Experience', onExperiencePressed, context),
            const SizedBox(width: 30),
            _buildNavItem('Projects', onProjectsPressed, context),
            const SizedBox(width: 30),
            _buildNavItem('Education', onAcademicPressed, context),
            const SizedBox(width: 30),
            _buildNavItem('Skills', onSkillsPressed, context),
            const SizedBox(width: 30),
            _buildThemeToggle(context, isDark),
            const SizedBox(width: 15),
            _buildContactButton(context, isDark),
          ],
        ),
      ],
    );
  }

  Widget _buildMobileNavigation(BuildContext context, bool isDark) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Logo/Name
        Text(
          'PORTFOLIO',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        Row(
          children: [
            _buildThemeToggle(context, isDark),
            const SizedBox(width: 10),
            _buildMobileMenuButton(context, isDark),
          ],
        ),
      ],
    );
  }

  Widget _buildNavItem(String title, VoidCallback onPressed, BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppTheme.getTextColor(context),
          ),
        ),
      ),
    );
  }

  Widget _buildContactButton(BuildContext context, bool isDark) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: AppTheme.buttonGlassDecoration(isDark, isPrimary: true),
      child: Text(
        'Contact',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: isDark ? Colors.white : Colors.white,
        ),
      ),
    );
  }

  Widget _buildThemeToggle(BuildContext context, bool isDark) {
    return InkWell(
      onTap: onThemeToggle,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 40,
        height: 40,
        decoration: AppTheme.glassDecoration(isDark, borderRadius: 20),
        child: Icon(
          isDark ? Icons.light_mode : Icons.dark_mode,
          color: AppTheme.getTextColor(context),
          size: 20,
        ),
      ),
    );
  }

  Widget _buildMobileMenuButton(BuildContext context, bool isDark) {
    return InkWell(
      onTap: () => _showMobileMenu(context, isDark),
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 40,
        height: 40,
        decoration: AppTheme.glassDecoration(isDark, borderRadius: 20),
        child: Icon(
          Icons.menu,
          color: AppTheme.getTextColor(context),
          size: 20,
        ),
      ),
    );
  }

  void _showMobileMenu(BuildContext context, bool isDark) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: AppTheme.getSurfaceColor(context),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 20),
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppTheme.getTextColor(context).withOpacity(0.3),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 30),
              _buildMobileMenuItem('About', onAboutPressed, context, Icons.person),
              _buildMobileMenuItem('Experience', onExperiencePressed, context, Icons.work),
              _buildMobileMenuItem('Projects', onProjectsPressed, context, Icons.code),
              _buildMobileMenuItem('Education', onAcademicPressed, context, Icons.school),
              _buildMobileMenuItem('Skills', onSkillsPressed, context, Icons.star),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    // Handle contact action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text(
                    'Contact',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMobileMenuItem(String title, VoidCallback onPressed, BuildContext context, IconData icon) {
    return ListTile(
      leading: Icon(
        icon,
        color: Theme.of(context).primaryColor,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppTheme.getTextColor(context),
        ),
      ),
      onTap: () {
        Navigator.pop(context);
        onPressed();
      },
    );
  }
}