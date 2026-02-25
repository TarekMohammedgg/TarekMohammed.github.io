import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarek_mohammed_portfolio/features/home/presentation/view_model/profile_provider.dart';
import 'package:tarek_mohammed_portfolio/features/home/presentation/views/widgets/intro_section.dart';
import 'package:tarek_mohammed_portfolio/features/home/presentation/views/widgets/project_card.dart';
import 'package:tarek_mohammed_portfolio/features/home/presentation/views/widgets/skill_chip.dart';
import 'package:tarek_mohammed_portfolio/features/home/presentation/views/widgets/stats_section.dart';
import 'package:tarek_mohammed_portfolio/features/home/presentation/views/widgets/about_me_section.dart';

class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<PortfolioViewModel>();

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Intro Section
            const IntroSection(isDesktop: false),
            const SizedBox(height: 40),

            // Stats Section
            const StatsSection(isDesktop: false),
            const SizedBox(height: 50),

            // Projects Section
            _buildSectionHeader(
              context,
              "Main Projects",
              Icons.work_outline,
            ),
            const SizedBox(height: 24),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: vm.projects.length,
              separatorBuilder: (_, __) => const SizedBox(height: 20),
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 300,
                  child: ProjectCard(project: vm.projects[index]),
                );
              },
            ),
            const SizedBox(height: 50),

            // Skills Section
            _buildSectionHeader(context, "Technical Skills", Icons.code),
            const SizedBox(height: 24),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              alignment: WrapAlignment.center,
              children: vm.skills
                  .map((skill) => SkillChip(skill: skill))
                  .toList(),
            ),
            const SizedBox(height: 50),

            // About Me Section
            const AboutMeSection(isDesktop: false),
            const SizedBox(height: 50),

            // Footer
            _buildFooter(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(
    BuildContext context,
    String title,
    IconData icon,
  ) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                theme.colorScheme.primary.withOpacity(0.3),
                theme.colorScheme.secondary.withOpacity(0.2),
              ],
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(icon, color: theme.colorScheme.primary, size: 28),
        ),
        const SizedBox(height: 12),
        Text(
          title,
          style: theme.textTheme.headlineSmall?.copyWith(
            color: theme.colorScheme.onSurface,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: 60,
          height: 3,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [theme.colorScheme.primary, theme.colorScheme.secondary],
            ),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }

  Widget _buildFooter(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        children: [
          Divider(color: theme.colorScheme.onSurface.withOpacity(0.1)),
          const SizedBox(height: 16),
          Text(
            "© 2026 Tarek Mohammed",
            style: TextStyle(
              color: theme.colorScheme.onSurface.withOpacity(0.5),
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            "Built with Flutter ❤️",
            style: TextStyle(
              color: theme.colorScheme.onSurface.withOpacity(0.4),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
