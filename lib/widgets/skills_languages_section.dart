import 'package:flutter/material.dart';

class SkillsLanguagesSection extends StatelessWidget {
  const SkillsLanguagesSection({Key? key}) : super(key: key);

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
            'Skills & Languages',
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2E3BA2),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Technical expertise and language proficiencies',
            style: TextStyle(
              fontSize: 18,
              color: Color(0xFF666666),
            ),
          ),
          const SizedBox(height: 60),
          // Content
          Column(
            children: [
              // Technical Skills
              _buildSkillsSection(),
              const SizedBox(height: 80),
              // Languages
              _buildLanguagesSection(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSkillsSection() {
    return Column(
      children: [
        // Skills Header
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFF2E3BA2).withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.code,
                size: 28,
                color: Color(0xFF2E3BA2),
              ),
            ),
            const SizedBox(width: 20),
            const Text(
              'Technical Skills',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2E3BA2),
              ),
            ),
          ],
        ),
        const SizedBox(height: 40),
        // Skills Grid
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 3,
          crossAxisSpacing: 30,
          mainAxisSpacing: 30,
          childAspectRatio: 1.0,
          children: [
            _buildSkillCategory(
              'Frontend Development',
              Icons.web,
              [
                SkillItem('React.js', 0.9),
                SkillItem('Vue.js', 0.85),
                SkillItem('Angular', 0.8),
                SkillItem('Flutter', 0.9),
                SkillItem('TypeScript', 0.85),
                SkillItem('HTML/CSS', 0.95),
              ],
            ),
            _buildSkillCategory(
              'Backend Development',
              Icons.storage,
              [
                SkillItem('Node.js', 0.9),
                SkillItem('Python', 0.85),
                SkillItem('Java', 0.8),
                SkillItem('Express.js', 0.9),
                SkillItem('Django', 0.75),
                SkillItem('GraphQL', 0.8),
              ],
            ),
            _buildSkillCategory(
              'Database & Cloud',
              Icons.cloud,
              [
                SkillItem('MongoDB', 0.9),
                SkillItem('PostgreSQL', 0.85),
                SkillItem('AWS', 0.9),
                SkillItem('Google Cloud', 0.8),
                SkillItem('Docker', 0.85),
                SkillItem('Kubernetes', 0.75),
              ],
            ),
            _buildSkillCategory(
              'Mobile Development',
              Icons.phone_android,
              [
                SkillItem('Flutter', 0.9),
                SkillItem('React Native', 0.8),
                SkillItem('Dart', 0.9),
                SkillItem('Swift', 0.7),
                SkillItem('Kotlin', 0.75),
                SkillItem('iOS/Android', 0.85),
              ],
            ),
            _buildSkillCategory(
              'DevOps & Tools',
              Icons.build,
              [
                SkillItem('Git', 0.95),
                SkillItem('CI/CD', 0.85),
                SkillItem('Jenkins', 0.8),
                SkillItem('Terraform', 0.75),
                SkillItem('Monitoring', 0.8),
                SkillItem('Testing', 0.9),
              ],
            ),
            _buildSkillCategory(
              'Design & UX',
              Icons.design_services,
              [
                SkillItem('UI/UX Design', 0.8),
                SkillItem('Figma', 0.85),
                SkillItem('Adobe XD', 0.75),
                SkillItem('Prototyping', 0.8),
                SkillItem('Responsive Design', 0.9),
                SkillItem('Material Design', 0.85),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildLanguagesSection() {
    return Column(
      children: [
        // Languages Header
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFF2E3BA2).withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.language,
                size: 28,
                color: Color(0xFF2E3BA2),
              ),
            ),
            const SizedBox(width: 20),
            const Text(
              'Languages',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2E3BA2),
              ),
            ),
          ],
        ),
        const SizedBox(height: 40),
        // Languages Row
        Row(
          children: [
            Expanded(
              child: _buildLanguageItem(
                'English',
                'Native',
                0.95,
                '🇺🇸',
              ),
            ),
            const SizedBox(width: 30),
            Expanded(
              child: _buildLanguageItem(
                'Spanish',
                'Fluent',
                0.85,
                '🇪🇸',
              ),
            ),
            const SizedBox(width: 30),
            Expanded(
              child: _buildLanguageItem(
                'French',
                'Intermediate',
                0.65,
                '🇫🇷',
              ),
            ),
            const SizedBox(width: 30),
            Expanded(
              child: _buildLanguageItem(
                'Mandarin',
                'Basic',
                0.4,
                '🇨🇳',
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSkillCategory(String title, IconData icon, List<SkillItem> skills) {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: const Color(0xFF2E3BA2).withOpacity(0.1),
          width: 1,
        ),
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
          // Category Header
          Row(
            children: [
              Icon(
                icon,
                size: 24,
                color: const Color(0xFF2E3BA2),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF333333),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Skills List
          Expanded(
            child: Column(
              children: skills
                  .map((skill) => Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: _buildSkillBar(skill.name, skill.proficiency),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillBar(String skillName, double proficiency) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              skillName,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xFF333333),
              ),
            ),
            Text(
              '${(proficiency * 100).toInt()}%',
              style: const TextStyle(
                fontSize: 11,
                color: Color(0xFF666666),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Container(
          height: 6,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(3),
          ),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: proficiency,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFF2E3BA2),
                    const Color(0xFF667eea),
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

  Widget _buildLanguageItem(String language, String level, double proficiency, String flag) {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: const Color(0xFF2E3BA2).withOpacity(0.1),
          width: 1,
        ),
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
        children: [
          // Flag and Language Name
          Text(
            flag,
            style: const TextStyle(fontSize: 40),
          ),
          const SizedBox(height: 15),
          Text(
            language,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            level,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF666666),
            ),
          ),
          const SizedBox(height: 15),
          // Proficiency Bar
          Container(
            height: 8,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(4),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: proficiency,
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF2E3BA2),
                      Color(0xFF667eea),
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
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xFF2E3BA2),
            ),
          ),
        ],
      ),
    );
  }
}

class SkillItem {
  final String name;
  final double proficiency;

  SkillItem(this.name, this.proficiency);
}