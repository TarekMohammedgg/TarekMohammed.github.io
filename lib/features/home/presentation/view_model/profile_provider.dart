import 'package:flutter/material.dart';
import 'package:tarek_mohammed_portfolio/features/home/data/models/project_model.dart';
import 'package:tarek_mohammed_portfolio/features/home/data/models/skill_model.dart';
import 'package:url_launcher/url_launcher.dart';

class PortfolioViewModel extends ChangeNotifier {
  // Theme state
  bool _isDarkMode = true;
  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  // Data extracted directly from your CV
  final List<Skill> _skills = [
    Skill('Flutter'),
    Skill('Dart'),
    Skill('Python'),
    Skill('Java'),
    Skill('Firebase'),
    Skill('Supabase'),
    Skill('REST APIs'),
    Skill('Dio'),
    Skill('Cubit'),
    Skill('Provider'),
    Skill('Riverpod'),
    Skill('GetX'),
    Skill('SQFlite'),
    Skill('Hive'),
    Skill('Stripe'),
    Skill('Git'),
    Skill('Figma'),
    Skill('Clean Architecture'),
  ];

  final List<Project> _projects = [
    Project(
      title: 'Skintelligent App',
      description:
          'A comprehensive healthcare application integrating AI for differential diagnosis.',
      tags: ['Flutter', 'AI Integration', 'Cubit', 'Healthcare'],
      githubUrl: 'https://github.com/ISLAM2ADEL/skintelligent',
      imagePath: 'assets/images/skintelligent_project.png',
    ),
    Project(
      title: 'Stock App',
      description:
          'A complete stock management application for inventory tracking and sales.',
      tags: ['Flutter', 'Firebase', 'Provider', 'Inventory'],
      githubUrl: 'https://github.com/TarekMohammedgg/Stock-App',
      imagePath: 'assets/images/stock_project.png',
    ),
    Project(
      title: 'Artifex AI',
      description:
          'Multi-platform AI application combining conversational AI, image generation, and advanced image editing features.',
      tags: ['Flutter', 'Google Gemini', 'Stability AI', 'OCR'],
      githubUrl: null, // Add GitHub URL if available
      imagePath: 'assets/images/artifex-ai.png',
    ),
    Project(
      title: 'Restaurant App',
      description:
          'A fully responsive restaurant management solution with Firebase Auth.',
      tags: ['Flutter', 'Firebase Auth', 'go_router', 'Responsive'],
      githubUrl: 'https://github.com/TarekMohammedgg/resturant_app',
      imagePath: 'assets/images/restaurant_project.png',
    ),
  ];

  // Getters
  List<Skill> get skills => _skills;
  List<Project> get projects => _projects;

  // Stats
  int get projectCount => _projects.length;
  int get yearsOfExperience => 2; // Update this as needed
  int get skillCount => _skills.length;

  // Profile Info
  final String name = "Tarek Mohammed";
  final String title = "Junior Flutter Developer";
  final String bio =
      "Crafting production-ready Flutter applications with a focus on AI integration, Clean Architecture, and optimized performance.";
  final String profileImagePath =
      "assets/images/tarek_linkedin_profile_picture.png";

  // Social Links
  final String email = "mailto:tarekmohammedgg@gmail.com";
  final String linkedin = "https://linkedin.com/in/tarekmohammed";
  final String github = "https://github.com/TarekMohammedgg";

  // CV Download Link

  final String cvDownloadUrl =
      "https://drive.google.com/file/d/1cmCz4SY4DwjBUoCtN1zd7NS_5PeI8-r3/view?usp=drive_link";

  // About Me - Journey Data
  final String aboutMeIntro =
      "My journey in software development started with a passion for creating impactful solutions.";

  final String education = "Bachelor's degree in Computer Science";
  final String university = "Helwan University";
  final String graduationYear = "2021 - 2025";
  final String gpa = "3.41 (Excellent)";
  final String graduationProject =
      "Differential Diagnosis (Skintelligent App) — Grade: Excellent";

  final String experienceTitle =
      "Flutter Developer & AI Integration Specialist";
  final String experienceCompany = "Skintelligent";
  final String experiencePeriod = "02/2025 - 06/2025";
  final String experienceLocation = "Cairo, Egypt";
  final List<String> experienceHighlights = [
    "Developed the Skintelligent healthcare app from concept to deployment",
    "Integrated AI-powered differential diagnosis with 95% accuracy",
    "Collaborated in an Agile team of 6 developers",
  ];

  final String aboutMeDetail =
      "Proficient in Cubit/BLoC and Provider, with solid knowledge of MVVM and Clean Architecture. Skilled in RESTful APIs and FastAPI. Passionate about responsive UIs and AI integration.";
  final String location = "Cairo, Egypt";

  // Actions
  Future<void> openUrl(String urlString) async {
    final Uri url = Uri.parse(
      urlString.startsWith('http') || urlString.startsWith('mailto')
          ? urlString
          : 'https://$urlString',
    );
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }
}
