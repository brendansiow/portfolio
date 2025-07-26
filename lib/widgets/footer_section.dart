import 'package:flutter/material.dart';
import '../utils/responsive_helper.dart';
import '../utils/app_theme.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveHelper.getHorizontalPadding(context),
        vertical: ResponsiveHelper.getVerticalPadding(context),
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isDark
            ? [const Color(0xFF1C1C1E), const Color(0xFF2C2C2E)]
            : [const Color(0xFF2E3BA2), const Color(0xFF1a2568)],
        ),
      ),
      child: Column(
        children: [
          // Contact Section
          ResponsiveHelper.isMobile(context)
              ? _buildMobileContactSection(context, isDark)
              : _buildDesktopContactSection(context, isDark),
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
            child: Text(
              '© 2024 John Doe. All rights reserved.',
              style: TextStyle(
                fontSize: ResponsiveHelper.getFontSize(context, 14),
                color: Colors.white70,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopContactSection(BuildContext context, bool isDark) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left side - Contact Info
        Expanded(
          flex: 2,
          child: _buildContactInfo(context, isDark),
        ),
        const SizedBox(width: 50),
        // Right side - Social Links
        Expanded(
          flex: 2,
          child: _buildSocialSection(context, isDark),
        ),
      ],
    );
  }

  Widget _buildMobileContactSection(BuildContext context, bool isDark) {
    return Column(
      children: [
        _buildContactInfo(context, isDark),
        const SizedBox(height: 40),
        _buildSocialSection(context, isDark),
      ],
    );
  }

  Widget _buildContactInfo(BuildContext context, bool isDark) {
    return Column(
      crossAxisAlignment: ResponsiveHelper.getCrossAxisAlignment(context),
      children: [
        Text(
          'Get In Touch',
          style: TextStyle(
            fontSize: ResponsiveHelper.getFontSize(context, 32),
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: ResponsiveHelper.isMobile(context) ? TextAlign.center : TextAlign.left,
        ),
        const SizedBox(height: 20),
        Text(
          'I\'m always interested in new opportunities and collaborations. '
          'Let\'s connect and discuss how we can work together.',
          style: TextStyle(
            fontSize: ResponsiveHelper.getFontSize(context, 16),
            color: Colors.white70,
            height: 1.6,
          ),
          textAlign: ResponsiveHelper.isMobile(context) ? TextAlign.center : TextAlign.left,
        ),
        const SizedBox(height: 30),
        _buildContactItem(
          context,
          Icons.email,
          'john.doe@email.com',
          isDark,
        ),
        const SizedBox(height: 15),
        _buildContactItem(
          context,
          Icons.phone,
          '+1 (555) 123-4567',
          isDark,
        ),
        const SizedBox(height: 15),
        _buildContactItem(
          context,
          Icons.location_on,
          'San Francisco, CA',
          isDark,
        ),
      ],
    );
  }

  Widget _buildSocialSection(BuildContext context, bool isDark) {
    return Column(
      crossAxisAlignment: ResponsiveHelper.getCrossAxisAlignment(context),
      children: [
        Text(
          'Follow Me',
          style: TextStyle(
            fontSize: ResponsiveHelper.getFontSize(context, 24),
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: ResponsiveHelper.isMobile(context) ? TextAlign.center : TextAlign.left,
        ),
        const SizedBox(height: 20),
        ResponsiveHelper.isMobile(context)
            ? _buildMobileSocialButtons(context, isDark)
            : _buildDesktopSocialButtons(context, isDark),
      ],
    );
  }

  Widget _buildDesktopSocialButtons(BuildContext context, bool isDark) {
    return Row(
      children: [
        _buildSocialButton(context, Icons.link, 'LinkedIn', isDark),
        const SizedBox(width: 15),
        _buildSocialButton(context, Icons.code, 'GitHub', isDark),
        const SizedBox(width: 15),
        _buildSocialButton(context, Icons.alternate_email, 'Twitter', isDark),
        const SizedBox(width: 15),
        _buildSocialButton(context, Icons.article, 'Medium', isDark),
      ],
    );
  }

  Widget _buildMobileSocialButtons(BuildContext context, bool isDark) {
    return Wrap(
      spacing: 15,
      runSpacing: 15,
      alignment: WrapAlignment.center,
      children: [
        _buildSocialButton(context, Icons.link, 'LinkedIn', isDark),
        _buildSocialButton(context, Icons.code, 'GitHub', isDark),
        _buildSocialButton(context, Icons.alternate_email, 'Twitter', isDark),
        _buildSocialButton(context, Icons.article, 'Medium', isDark),
      ],
    );
  }

  Widget _buildContactItem(BuildContext context, IconData icon, String text, bool isDark) {
    return Row(
      mainAxisAlignment: ResponsiveHelper.isMobile(context) 
          ? MainAxisAlignment.center 
          : MainAxisAlignment.start,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: AppTheme.glassDecoration(isDark, borderRadius: 20),
          child: Icon(
            icon,
            color: Colors.white,
            size: 20,
          ),
        ),
        const SizedBox(width: 15),
        Text(
          text,
          style: TextStyle(
            fontSize: ResponsiveHelper.getFontSize(context, 16),
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildSocialButton(BuildContext context, IconData icon, String platform, bool isDark) {
    return Container(
      width: 45,
      height: 45,
      decoration: AppTheme.glassDecoration(isDark, borderRadius: 8),
      child: IconButton(
        onPressed: () {
          // Handle social link
        },
        icon: Icon(
          icon,
          color: Colors.white,
          size: 20,
        ),
        tooltip: platform,
      ),
    );
  }
}