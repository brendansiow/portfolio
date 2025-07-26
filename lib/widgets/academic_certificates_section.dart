import 'package:flutter/material.dart';
import '../utils/responsive_helper.dart';
import '../utils/app_theme.dart';

class AcademicCertificatesSection extends StatelessWidget {
  const AcademicCertificatesSection({Key? key}) : super(key: key);

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
            'Education & Certifications',
            style: TextStyle(
              fontSize: ResponsiveHelper.getFontSize(context, 42),
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Text(
            'My academic background and professional certifications',
            style: TextStyle(
              fontSize: ResponsiveHelper.getFontSize(context, 18),
              color: AppTheme.getTextColor(context).withOpacity(0.7),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 60),
          // Content
          ResponsiveHelper.isMobile(context)
              ? _buildMobileLayout(context, isDark)
              : _buildDesktopLayout(context, isDark),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context, bool isDark) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left side - Education
        Expanded(
          flex: 1,
          child: _buildEducationSection(context, isDark),
        ),
        const SizedBox(width: 50),
        // Right side - Certifications
        Expanded(
          flex: 1,
          child: _buildCertificationsSection(context, isDark),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context, bool isDark) {
    return Column(
      children: [
        _buildEducationSection(context, isDark),
        const SizedBox(height: 50),
        _buildCertificationsSection(context, isDark),
      ],
    );
  }

  Widget _buildEducationSection(BuildContext context, bool isDark) {
    return Column(
      crossAxisAlignment: ResponsiveHelper.getCrossAxisAlignment(context),
      children: [
        _buildSectionHeader(context, 'Education'),
        const SizedBox(height: 30),
        _buildEducationItem(
          context,
          'Bachelor of Computer Science',
          'University of Technology',
          '2015 - 2019',
          'Graduated Magna Cum Laude with a focus on Software Engineering and Data Structures. '
          'Relevant coursework: Algorithms, Database Systems, Web Development, Machine Learning.',
          'GPA: 3.8/4.0',
          isDark,
        ),
        const SizedBox(height: 30),
        _buildEducationItem(
          context,
          'High School Diploma',
          'St. Thomas High School',
          '2011 - 2015',
          'Graduated with honors, President of Computer Club, and participated in various programming competitions.',
          'Valedictorian',
          isDark,
        ),
      ],
    );
  }

  Widget _buildCertificationsSection(BuildContext context, bool isDark) {
    return Column(
      crossAxisAlignment: ResponsiveHelper.getCrossAxisAlignment(context),
      children: [
        _buildSectionHeader(context, 'Certifications'),
        const SizedBox(height: 30),
        _buildCertificationItem(
          context,
          'AWS Certified Solutions Architect',
          'Amazon Web Services',
          '2023',
          'Professional level certification demonstrating expertise in designing distributed systems on AWS.',
          isDark,
        ),
        const SizedBox(height: 20),
        _buildCertificationItem(
          context,
          'Google Cloud Professional Developer',
          'Google Cloud',
          '2022',
          'Professional certification for building scalable and reliable applications on Google Cloud Platform.',
          isDark,
        ),
        const SizedBox(height: 20),
        _buildCertificationItem(
          context,
          'Flutter Developer Certification',
          'Google',
          '2022',
          'Advanced certification in Flutter development for cross-platform mobile applications.',
          isDark,
        ),
        const SizedBox(height: 20),
        _buildCertificationItem(
          context,
          'MongoDB Developer Certification',
          'MongoDB University',
          '2021',
          'Comprehensive certification covering MongoDB development and administration.',
          isDark,
        ),
      ],
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: ResponsiveHelper.getFontSize(context, 28),
        fontWeight: FontWeight.bold,
        color: Theme.of(context).primaryColor,
      ),
      textAlign: ResponsiveHelper.isMobile(context) ? TextAlign.center : TextAlign.left,
    );
  }

  Widget _buildEducationItem(
    BuildContext context,
    String degree,
    String institution,
    String period,
    String description,
    String gpa,
    bool isDark,
  ) {
    return Container(
      padding: EdgeInsets.all(ResponsiveHelper.isMobile(context) ? 20 : 25),
      decoration: AppTheme.glassDecoration(isDark),
      child: Column(
        crossAxisAlignment: ResponsiveHelper.getCrossAxisAlignment(context),
        children: [
          Text(
            degree,
            style: TextStyle(
              fontSize: ResponsiveHelper.getFontSize(context, 20),
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
            textAlign: ResponsiveHelper.isMobile(context) ? TextAlign.center : TextAlign.left,
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: ResponsiveHelper.getMainAxisAlignment(context),
            children: [
              Icon(
                Icons.school,
                size: 16,
                color: AppTheme.getTextColor(context).withOpacity(0.7),
              ),
              const SizedBox(width: 8),
              Text(
                institution,
                style: TextStyle(
                  fontSize: ResponsiveHelper.getFontSize(context, 16),
                  fontWeight: FontWeight.w600,
                  color: AppTheme.getTextColor(context).withOpacity(0.7),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: ResponsiveHelper.getMainAxisAlignment(context),
            children: [
              Icon(
                Icons.calendar_today,
                size: 16,
                color: AppTheme.getTextColor(context).withOpacity(0.7),
              ),
              const SizedBox(width: 8),
              Text(
                period,
                style: TextStyle(
                  fontSize: ResponsiveHelper.getFontSize(context, 14),
                  color: AppTheme.getTextColor(context).withOpacity(0.7),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Text(
            description,
            style: TextStyle(
              fontSize: ResponsiveHelper.getFontSize(context, 14),
              color: AppTheme.getTextColor(context).withOpacity(0.7),
              height: 1.5,
            ),
            textAlign: ResponsiveHelper.isMobile(context) ? TextAlign.center : TextAlign.left,
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              gpa,
              style: TextStyle(
                fontSize: ResponsiveHelper.getFontSize(context, 12),
                fontWeight: FontWeight.w600,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCertificationItem(
    BuildContext context,
    String certification,
    String issuer,
    String year,
    String description,
    bool isDark,
  ) {
    return Container(
      padding: EdgeInsets.all(ResponsiveHelper.isMobile(context) ? 15 : 20),
      decoration: BoxDecoration(
        color: AppTheme.getSurfaceColor(context),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).primaryColor.withOpacity(0.2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isDark ? 0.3 : 0.05),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: ResponsiveHelper.getCrossAxisAlignment(context),
        children: [
          ResponsiveHelper.isMobile(context)
              ? _buildMobileCertificationHeader(context, certification, issuer, year, isDark)
              : _buildDesktopCertificationHeader(context, certification, issuer, year, isDark),
          const SizedBox(height: 12),
          Text(
            description,
            style: TextStyle(
              fontSize: ResponsiveHelper.getFontSize(context, 13),
              color: AppTheme.getTextColor(context).withOpacity(0.7),
              height: 1.4,
            ),
            textAlign: ResponsiveHelper.isMobile(context) ? TextAlign.center : TextAlign.left,
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopCertificationHeader(BuildContext context, String certification, String issuer, String year, bool isDark) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            Icons.verified,
            size: 20,
            color: Theme.of(context).primaryColor,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                certification,
                style: TextStyle(
                  fontSize: ResponsiveHelper.getFontSize(context, 16),
                  fontWeight: FontWeight.bold,
                  color: AppTheme.getTextColor(context),
                ),
              ),
              Text(
                '$issuer • $year',
                style: TextStyle(
                  fontSize: ResponsiveHelper.getFontSize(context, 12),
                  color: AppTheme.getTextColor(context).withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMobileCertificationHeader(BuildContext context, String certification, String issuer, String year, bool isDark) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            Icons.verified,
            size: 20,
            color: Theme.of(context).primaryColor,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          certification,
          style: TextStyle(
            fontSize: ResponsiveHelper.getFontSize(context, 16),
            fontWeight: FontWeight.bold,
            color: AppTheme.getTextColor(context),
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          '$issuer • $year',
          style: TextStyle(
            fontSize: ResponsiveHelper.getFontSize(context, 12),
            color: AppTheme.getTextColor(context).withOpacity(0.7),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}