import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarek_mohammed_portfolio/features/home/presentation/view_model/profile_provider.dart';

class SocialLinks extends StatelessWidget {
  final bool vertical;

  const SocialLinks({super.key, this.vertical = false});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<PortfolioViewModel>();

    final buttons = [
      _SocialButton(
        icon: Icons.code,
        label: 'GitHub',
        url: vm.github,
        isPrimary: true,
        onTap: () => vm.openUrl(vm.github),
      ),
      _SocialButton(
        icon: Icons.person,
        label: 'LinkedIn',
        url: vm.linkedin,
        isPrimary: false,
        onTap: () => vm.openUrl(vm.linkedin),
      ),
      _SocialButton(
        icon: Icons.email_outlined,
        label: 'Email',
        url: vm.email,
        isPrimary: false,
        onTap: () => vm.openUrl(vm.email),
      ),
    ];

    if (vertical) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: buttons
            .map(
              (btn) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: btn,
              ),
            )
            .toList(),
      );
    }

    return Wrap(
      spacing: 12,
      runSpacing: 12,
      alignment: WrapAlignment.center,
      children: buttons,
    );
  }
}

class _SocialButton extends StatefulWidget {
  final IconData icon;
  final String label;
  final String url;
  final bool isPrimary;
  final VoidCallback onTap;

  const _SocialButton({
    required this.icon,
    required this.label,
    required this.url,
    required this.isPrimary,
    required this.onTap,
  });

  @override
  State<_SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<_SocialButton> {
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
        transform: Matrix4.identity()..scale(_isHovered ? 1.05 : 1.0),
        child: widget.isPrimary
            ? ElevatedButton.icon(
                onPressed: widget.onTap,
                icon: Icon(widget.icon),
                label: Text(widget.label),
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isHovered
                      ? theme.colorScheme.primary.withOpacity(0.9)
                      : theme.colorScheme.primary,
                  foregroundColor: theme.colorScheme.onPrimary,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: _isHovered ? 8 : 4,
                  shadowColor: theme.colorScheme.primary.withOpacity(0.5),
                ),
              )
            : OutlinedButton.icon(
                onPressed: widget.onTap,
                icon: Icon(widget.icon),
                label: Text(widget.label),
                style: OutlinedButton.styleFrom(
                  foregroundColor: _isHovered
                      ? theme.colorScheme.primary
                      : theme.colorScheme.onSurface.withOpacity(0.7),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  side: BorderSide(
                    color: _isHovered
                        ? theme.colorScheme.primary
                        : theme.colorScheme.onSurface.withOpacity(0.2),
                    width: _isHovered ? 2 : 1,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
      ),
    );
  }
}
