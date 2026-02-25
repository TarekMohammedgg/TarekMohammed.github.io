import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarek_mohammed_portfolio/features/home/presentation/view_model/profile_provider.dart';
import 'package:tarek_mohammed_portfolio/features/home/presentation/views/widgets/intro_section.dart';
import 'package:tarek_mohammed_portfolio/features/home/presentation/views/widgets/project_card.dart';
import 'package:tarek_mohammed_portfolio/features/home/presentation/views/widgets/skill_chip.dart';
import 'package:tarek_mohammed_portfolio/features/home/presentation/views/widgets/stats_section.dart';
import 'package:tarek_mohammed_portfolio/features/home/presentation/views/widgets/about_me_section.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<PortfolioViewModel>();
    final screenWidth = MediaQuery.of(context).size.width;
    final isWideDesktop = screenWidth > 1200;

    return SingleChildScrollView(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1400),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isWideDesktop ? 80 : 40,
              vertical: 60,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Intro Section
                const IntroSection(isDesktop: true),
                const SizedBox(height: 60),

                // Stats Section
                const StatsSection(isDesktop: true),
                const SizedBox(height: 80),

                // Projects Section
                _buildSectionHeader(
                  context,
                  "Main Projects",
                  Icons.work_outline,
                ),
                const SizedBox(height: 32),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: isWideDesktop ? 3 : 2,
                    childAspectRatio: 0.85,
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 24,
                  ),
                  itemCount: vm.projects.length,
                  itemBuilder: (context, index) {
                    return ProjectCard(project: vm.projects[index]);
                  },
                ),
                const SizedBox(height: 80),

                // Skills Section
                _buildSectionHeader(context, "Technical Skills", Icons.code),
                const SizedBox(height: 32),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: vm.skills
                      .map((skill) => SkillChip(skill: skill))
                      .toList(),
                ),
                const SizedBox(height: 80),

                // About Me Section
                const AboutMeSection(isDesktop: true),
                const SizedBox(height: 80),

                // Footer
                _buildFooter(context),
              ],
            ),
          ),
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
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                theme.colorScheme.primary.withOpacity(0.3),
                theme.colorScheme.secondary.withOpacity(0.2),
              ],
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: theme.colorScheme.primary, size: 24),
        ),
        const SizedBox(width: 16),
        Text(
          title,
          style: theme.textTheme.headlineMedium?.copyWith(
            color: theme.colorScheme.onSurface,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(width: 24),
        Expanded(
          child: Container(
            height: 2,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  theme.colorScheme.primary.withOpacity(0.5),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFooter(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Column(
        children: [
          Divider(color: theme.colorScheme.onSurface.withOpacity(0.1)),
          const SizedBox(height: 24),
          Text(
            "© 2026 Tarek Mohammed. Built with Flutter ❤️",
            style: TextStyle(
              color: theme.colorScheme.onSurface.withOpacity(0.5),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
