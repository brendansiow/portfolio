import 'package:flutter/material.dart';
import '../utils/responsive_helper.dart';
import '../utils/app_theme.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveHelper.getHorizontalPadding(context),
        vertical: ResponsiveHelper.getVerticalPadding(context),
      ),
      decoration: AppTheme.sectionDecoration(isDark),
      child: ResponsiveHelper.isMobile(context)
          ? _buildMobileLayout(context, isDark)
          : _buildDesktopLayout(context, isDark),
    );
  }

  Widget _buildDesktopLayout(BuildContext context, bool isDark) {
    return Row(
      children: [
        // Left side - Text content
        Expanded(
          flex: 3,
          child: _buildContent(context, isDark),
        ),
        const SizedBox(width: 50),
        // Right side - Profile image placeholder
        Expanded(
          flex: 2,
          child: _buildProfileImage(context, isDark),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context, bool isDark) {
    return Column(
      children: [
        _buildProfileImage(context, isDark),
        const SizedBox(height: 40),
        _buildContent(context, isDark),
      ],
    );
  }

  Widget _buildContent(BuildContext context, bool isDark) {
    return Column(
      crossAxisAlignment: ResponsiveHelper.getCrossAxisAlignment(context),
      children: [
        Text(
          'Hello, I\'m',
          style: TextStyle(
            fontSize: ResponsiveHelper.getFontSize(context, 24),
            color: Colors.white70,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'John Doe',
          style: TextStyle(
            fontSize: ResponsiveHelper.getFontSize(context, 56),
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 15),
        Text(
          'Full Stack Developer',
          style: TextStyle(
            fontSize: ResponsiveHelper.getFontSize(context, 32),
            color: Colors.white,
            fontWeight: FontWeight.w300,
          ),
        ),
        const SizedBox(height: 30),
        Text(
          'I\'m a passionate software developer with 5+ years of experience '
          'creating amazing digital experiences. I specialize in building '
          'modern web applications using cutting-edge technologies.',
          style: TextStyle(
            fontSize: ResponsiveHelper.getFontSize(context, 18),
            color: Colors.white,
            height: 1.6,
          ),
          textAlign: ResponsiveHelper.isMobile(context) ? TextAlign.center : TextAlign.left,
        ),
        const SizedBox(height: 40),
        ResponsiveHelper.isMobile(context)
            ? _buildMobileButtons(context, isDark)
            : _buildDesktopButtons(context, isDark),
      ],
    );
  }

  Widget _buildDesktopButtons(BuildContext context, bool isDark) {
    return Row(
      children: [
        _buildActionButton(
          context,
          'Download CV',
          Icons.download,
          Colors.white,
          const Color(0xFF2E3BA2),
          isDark,
        ),
        const SizedBox(width: 20),
        _buildActionButton(
          context,
          'View Projects',
          Icons.arrow_forward,
          Colors.transparent,
          Colors.white,
          isDark,
          borderColor: Colors.white,
        ),
      ],
    );
  }

  Widget _buildMobileButtons(BuildContext context, bool isDark) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: _buildActionButton(
            context,
            'Download CV',
            Icons.download,
            Colors.white,
            const Color(0xFF2E3BA2),
            isDark,
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          width: double.infinity,
          child: _buildActionButton(
            context,
            'View Projects',
            Icons.arrow_forward,
            Colors.transparent,
            Colors.white,
            isDark,
            borderColor: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildProfileImage(BuildContext context, bool isDark) {
    final imageSize = ResponsiveHelper.isMobile(context) ? 250.0 : 400.0;
    
    return Container(
      height: imageSize,
      width: ResponsiveHelper.isMobile(context) ? imageSize : null,
      decoration: AppTheme.glassDecoration(isDark, borderRadius: 20),
      child: Icon(
        Icons.person,
        size: imageSize * 0.4,
        color: Colors.white54,
      ),
    );
  }

  Widget _buildActionButton(
    BuildContext context,
    String text,
    IconData icon,
    Color backgroundColor,
    Color textColor,
    bool isDark, {
    Color? borderColor,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveHelper.isMobile(context) ? 20 : 30,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(30),
        border: borderColor != null 
            ? Border.all(color: borderColor, width: 2) 
            : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: ResponsiveHelper.getFontSize(context, 16),
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