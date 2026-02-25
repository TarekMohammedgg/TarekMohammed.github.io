import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarek_mohammed_portfolio/features/home/presentation/view_model/profile_provider.dart';
import 'package:tarek_mohammed_portfolio/features/home/presentation/views/widgets/social_links.dart';

class IntroSection extends StatelessWidget {
  final bool isDesktop;

  const IntroSection({super.key, this.isDesktop = false});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<PortfolioViewModel>();
    final theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.all(isDesktop ? 40 : 24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            theme.colorScheme.primary.withOpacity(0.1),
            theme.colorScheme.surface.withOpacity(0.5),
          ],
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: theme.colorScheme.primary.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: isDesktop
          ? _buildDesktopLayout(context, vm, theme)
          : _buildMobileLayout(context, vm, theme),
    );
  }

  Widget _buildDesktopLayout(
    BuildContext context,
    PortfolioViewModel vm,
    ThemeData theme,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildProfileImage(vm, theme, 180),
        const SizedBox(width: 40),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildGreeting(theme),
              const SizedBox(height: 8),
              _buildName(vm, theme),
              const SizedBox(height: 8),
              _buildTitle(vm, theme),
              const SizedBox(height: 16),
              _buildBio(vm, theme),
              const SizedBox(height: 24),
              Row(
                children: [
                  const Expanded(child: SocialLinks()),
                  const SizedBox(width: 16),
                  _buildDownloadCVButton(context, vm, theme),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(
    BuildContext context,
    PortfolioViewModel vm,
    ThemeData theme,
  ) {
    return Column(
      children: [
        _buildProfileImage(vm, theme, 150),
        const SizedBox(height: 24),
        _buildGreeting(theme),
        const SizedBox(height: 8),
        _buildName(vm, theme),
        const SizedBox(height: 8),
        _buildTitle(vm, theme),
        const SizedBox(height: 16),
        _buildBio(vm, theme),
        const SizedBox(height: 24),
        const SocialLinks(),
        const SizedBox(height: 16),
        _buildDownloadCVButton(context, vm, theme),
      ],
    );
  }

  Widget _buildProfileImage(
    PortfolioViewModel vm,
    ThemeData theme,
    double size,
  ) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [theme.colorScheme.primary, theme.colorScheme.secondary],
        ),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.primary.withOpacity(0.4),
            blurRadius: 20,
            spreadRadius: 2,
          ),
        ],
      ),
      padding: const EdgeInsets.all(4),
      child: ClipOval(
        child: Image.asset(
          vm.profileImagePath,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: theme.colorScheme.surfaceContainerHighest,
              child: Icon(
                Icons.person,
                size: 60,
                color: theme.colorScheme.primary,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildGreeting(ThemeData theme) {
    return Text(
      "Hi, I am",
      style: theme.textTheme.titleLarge?.copyWith(
        color: theme.colorScheme.onSurface.withOpacity(0.7),
        fontWeight: FontWeight.w300,
      ),
    );
  }

  Widget _buildName(PortfolioViewModel vm, ThemeData theme) {
    return Text(
      vm.name,
      style: theme.textTheme.displaySmall?.copyWith(
        fontWeight: FontWeight.bold,
        color: theme.colorScheme.onSurface,
        letterSpacing: -0.5,
      ),
    );
  }

  Widget _buildTitle(PortfolioViewModel vm, ThemeData theme) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            theme.colorScheme.primary.withOpacity(0.3),
            theme.colorScheme.secondary.withOpacity(0.2),
          ],
        ),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: theme.colorScheme.primary.withOpacity(0.5)),
      ),
      child: Text(
        vm.title,
        style: theme.textTheme.titleMedium?.copyWith(
          color: theme.colorScheme.primary,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildBio(PortfolioViewModel vm, ThemeData theme) {
    return Text(
      vm.bio,
      textAlign: isDesktop ? TextAlign.left : TextAlign.center,
      style: theme.textTheme.bodyLarge?.copyWith(
        color: theme.colorScheme.onSurface.withOpacity(0.8),
        height: 1.6,
      ),
    );
  }

  Widget _buildDownloadCVButton(
    BuildContext context,
    PortfolioViewModel vm,
    ThemeData theme,
  ) {
    return ElevatedButton.icon(
      onPressed: () => vm.openUrl(vm.cvDownloadUrl),
      icon: const Icon(Icons.download_rounded),
      label: const Text("Download CV"),
      style: ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: theme.colorScheme.onPrimary,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
      ),
    );
  }
}
