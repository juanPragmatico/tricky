import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictaetoc/src/viewModel/game_logic.dart';
import 'package:tictaetoc/src/presentation/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider<BaseLogic>(
        create: (_) => BaseLogic(),
        child: const HomeView(),
      ),
    );
  }
}
