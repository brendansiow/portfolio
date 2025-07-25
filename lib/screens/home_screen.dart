import 'package:flutter/material.dart';
import '../widgets/navigation_bar.dart';
import '../widgets/about_section.dart';
import '../widgets/experience_section.dart';
import '../widgets/projects_section.dart';
import '../widgets/footer_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          CustomNavigationBar(
            onAboutPressed: () => _scrollToSection(_aboutKey),
            onExperiencePressed: () => _scrollToSection(_experienceKey),
            onProjectsPressed: () => _scrollToSection(_projectsKey),
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  AboutSection(key: _aboutKey),
                  ExperienceSection(key: _experienceKey),
                  ProjectsSection(key: _projectsKey),
                  const FooterSection(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}