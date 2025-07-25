import 'package:flutter/material.dart';

class AcademicCertificatesSection extends StatelessWidget {
  const AcademicCertificatesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 100),
      color: const Color(0xFFF8F9FA),
      child: Column(
        children: [
          // Section Title
          const Text(
            'Education & Certifications',
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2E3BA2),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'My academic background and professional certifications',
            style: TextStyle(
              fontSize: 18,
              color: Color(0xFF666666),
            ),
          ),
          const SizedBox(height: 60),
          // Content Row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left side - Education
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSectionHeader('Education'),
                    const SizedBox(height: 30),
                    _buildEducationItem(
                      'Bachelor of Computer Science',
                      'University of Technology',
                      '2015 - 2019',
                      'Graduated Magna Cum Laude with a focus on Software Engineering and Data Structures. '
                      'Relevant coursework: Algorithms, Database Systems, Web Development, Machine Learning.',
                      'GPA: 3.8/4.0',
                    ),
                    const SizedBox(height: 30),
                    _buildEducationItem(
                      'Master of Software Engineering',
                      'Tech Institute',
                      '2019 - 2021',
                      'Advanced studies in enterprise software architecture, cloud computing, and project management. '
                      'Thesis: "Microservices Architecture in Large-Scale Applications".',
                      'GPA: 3.9/4.0',
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 50),
              // Right side - Certifications
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSectionHeader('Certifications'),
                    const SizedBox(height: 30),
                    _buildCertificationItem(
                      'AWS Certified Solutions Architect',
                      'Amazon Web Services',
                      '2023',
                      'Professional level certification demonstrating expertise in designing distributed systems on AWS.',
                    ),
                    const SizedBox(height: 20),
                    _buildCertificationItem(
                      'Google Cloud Professional Developer',
                      'Google Cloud Platform',
                      '2022',
                      'Validates ability to design, build, analyze, and maintain cloud-native applications.',
                    ),
                    const SizedBox(height: 20),
                    _buildCertificationItem(
                      'Certified ScrumMaster (CSM)',
                      'Scrum Alliance',
                      '2021',
                      'Demonstrates understanding of Scrum framework and ability to lead agile teams.',
                    ),
                    const SizedBox(height: 20),
                    _buildCertificationItem(
                      'MongoDB Developer Associate',
                      'MongoDB University',
                      '2020',
                      'Proficiency in MongoDB database design, development, and administration.',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Color(0xFF2E3BA2),
      ),
    );
  }

  Widget _buildEducationItem(
    String degree,
    String institution,
    String period,
    String description,
    String gpa,
  ) {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            degree,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2E3BA2),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(
                Icons.school,
                size: 16,
                color: Color(0xFF666666),
              ),
              const SizedBox(width: 8),
              Text(
                institution,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF666666),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              const Icon(
                Icons.calendar_today,
                size: 16,
                color: Color(0xFF666666),
              ),
              const SizedBox(width: 8),
              Text(
                period,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF666666),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Text(
            description,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF666666),
              height: 1.5,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFF2E3BA2).withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              gpa,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Color(0xFF2E3BA2),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCertificationItem(
    String certification,
    String issuer,
    String year,
    String description,
  ) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFF2E3BA2).withOpacity(0.2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFF2E3BA2).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.verified,
                  size: 20,
                  color: Color(0xFF2E3BA2),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      certification,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF333333),
                      ),
                    ),
                    Text(
                      '$issuer • $year',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF666666),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xFF666666),
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}