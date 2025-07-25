import 'package:flutter/material.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({Key? key}) : super(key: key);

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
            'Working Experience',
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2E3BA2),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'My professional journey and key achievements',
            style: TextStyle(
              fontSize: 18,
              color: Color(0xFF666666),
            ),
          ),
          const SizedBox(height: 60),
          // Experience Timeline
          Column(
            children: [
              _buildExperienceItem(
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
              ),
              _buildExperienceItem(
                'Full Stack Developer',
                'StartupXYZ',
                '2020 - 2022',
                'Developed and maintained multiple client projects using modern web technologies. '
                'Built responsive web applications and RESTful APIs.',
                [
                  'Built 10+ responsive web applications using React and Vue.js',
                  'Developed RESTful APIs using Node.js and Express',
                  'Implemented real-time features using Socket.io',
                  'Optimized database queries improving performance by 30%',
                ],
                false,
              ),
              _buildExperienceItem(
                'Junior Web Developer',
                'WebStudio Inc',
                '2019 - 2020',
                'Started my professional journey building websites and learning modern development practices. '
                'Gained experience in front-end and back-end technologies.',
                [
                  'Created responsive websites using HTML, CSS, and JavaScript',
                  'Learned React.js and contributed to team projects',
                  'Participated in daily standups and agile development',
                  'Assisted in bug fixes and feature implementations',
                ],
                false,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceItem(
    String title,
    String company,
    String duration,
    String description,
    List<String> achievements,
    bool isLatest,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 50),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline
          Column(
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: isLatest ? const Color(0xFF2E3BA2) : const Color(0xFF888888),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 3,
                  ),
                ),
              ),
              Container(
                width: 2,
                height: 150,
                color: const Color(0xFFE0E0E0),
              ),
            ],
          ),
          const SizedBox(width: 30),
          // Content
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(30),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2E3BA2),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            company,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF333333),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF2E3BA2).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          duration,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF2E3BA2),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFF666666),
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
                                  const Icon(
                                    Icons.check_circle,
                                    color: Color(0xFF4CAF50),
                                    size: 18,
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      achievement,
                                      style: const TextStyle(
                                        fontSize: 15,
                                        color: Color(0xFF555555),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}