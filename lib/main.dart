import 'package:brandie_sample/screen/main_screen.dart';
import 'package:brandie_sample/viewmodel/smart_post_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SmartPostViewmodel()),
      ],
      child: const BrandieSample(),
    ),
  );
}

class BrandieSample extends StatelessWidget {
  const BrandieSample({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Brandie Sample',
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
