import 'package:flutter/material.dart';
import 'package:tarek_mohammed_portfolio/features/home/data/models/skill_model.dart';

class SkillChip extends StatefulWidget {
  final Skill skill;

  const SkillChip({super.key, required this.skill});

  @override
  State<SkillChip> createState() => _SkillChipState();
}

class _SkillChipState extends State<SkillChip> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOutCubic,
        transform: Matrix4.identity()..scale(_isHovered ? 1.08 : 1.0),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: _isHovered
                ? [theme.colorScheme.primary, theme.colorScheme.secondary]
                : [
                    theme.colorScheme.primary.withOpacity(0.1),
                    theme.colorScheme.surface,
                  ],
          ),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: _isHovered
                ? theme.colorScheme.primary
                : theme.colorScheme.primary.withOpacity(0.4),
            width: _isHovered ? 2 : 1,
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: theme.colorScheme.primary.withOpacity(0.3),
                    blurRadius: 12,
                    spreadRadius: 1,
                  ),
                ]
              : [],
        ),
        child: Text(
          widget.skill.name,
          style: TextStyle(
            color: _isHovered
                ? theme.colorScheme.onPrimary
                : theme.colorScheme.onSurface,
            fontWeight: _isHovered ? FontWeight.w600 : FontWeight.w500,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
