import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:phones/core/navigation_service.dart';
import 'package:phones/core/providers.dart';
import 'package:phones/core/theme_data.dart';
import 'package:phones/features/phones/presentation/views/phones_view.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Phones',
        theme: buildTheme(),
        debugShowCheckedModeBanner: false,
        navigatorKey: NavigationService.navigatorKey,
        home: const PhonesView(),
      ),
    );
  }
}
