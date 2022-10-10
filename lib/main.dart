import 'package:assest_audio_project/screen/program_detailes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screen/episode_detailes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ProgramDetails(),
      getPages: [
        GetPage(name: '/', page: () => const ProgramDetails()),
        GetPage(name: '/episode', page: () => const EpisodeDetails()),
      ],
    );
  }
}
