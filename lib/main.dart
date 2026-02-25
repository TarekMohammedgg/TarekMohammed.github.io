import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarek_mohammed_portfolio/features/home/presentation/view_model/profile_provider.dart';
import 'package:tarek_mohammed_portfolio/features/home/presentation/views/profile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => PortfolioViewModel())],
      child: const MyPortfolioApp(),
    ),
  );
}
