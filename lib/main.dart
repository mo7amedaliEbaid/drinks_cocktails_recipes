import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes/core/core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: ref.read(goRouterProvider),
      debugShowCheckedModeBanner: false,
      title: 'Recipes',
      theme: ThemeData(
       //   scaffoldBackgroundColor: AppColors.lemonadaColor,
          fontFamily: FontFamilies.raleway,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
  //      color: Colors.white
      )

      ),
    );
  }
}
