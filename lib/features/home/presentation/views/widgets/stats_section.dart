import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarek_mohammed_portfolio/features/home/presentation/view_model/profile_provider.dart';

class StatsSection extends StatelessWidget {
  final bool isDesktop;

  const StatsSection({super.key, this.isDesktop = false});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<PortfolioViewModel>();

    final stats = [
      _StatItem(
        value: '${vm.projectCount}+',
        label: 'Main Projects',
        icon: Icons.folder_copy_outlined,
      ),
      _StatItem(
        value: '${vm.yearsOfExperience}+',
        label: 'Years Exp',
        icon: Icons.calendar_today_outlined,
      ),
      _StatItem(value: '${vm.skillCount}+', label: 'Skills', icon: Icons.code),
    ];

    if (isDesktop) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: stats
            .map((stat) => Expanded(child: _buildStatCard(context, stat)))
            .toList(),
      );
    }

    return Row(
      children: stats
          .map((stat) => Expanded(child: _buildStatCard(context, stat)))
          .toList(),
    );
  }

  Widget _buildStatCard(BuildContext context, _StatItem stat) {
    final theme = Theme.of(context);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: isDesktop ? 12 : 6),
      padding: EdgeInsets.symmetric(
        vertical: isDesktop ? 28 : 20,
        horizontal: isDesktop ? 20 : 12,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            theme.colorScheme.primary.withOpacity(0.15),
            theme.colorScheme.surface.withOpacity(0.8),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: theme.colorScheme.primary.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              stat.icon,
              color: theme.colorScheme.primary,
              size: isDesktop ? 26 : 22,
            ),
          ),
          SizedBox(height: isDesktop ? 16 : 12),
          Text(
            stat.value,
            style: TextStyle(
              fontSize: isDesktop ? 32 : 24,
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            stat.label,
            style: TextStyle(
              fontSize: isDesktop ? 14 : 12,
              color: theme.colorScheme.onSurface.withOpacity(0.6),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _StatItem {
  final String value;
  final String label;
  final IconData icon;

  _StatItem({required this.value, required this.label, required this.icon});
}
