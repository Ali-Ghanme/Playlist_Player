import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/episod.dart';

class EpisodeDetails extends StatefulWidget {
  const EpisodeDetails({Key? key}) : super(key: key);

  @override
  State<EpisodeDetails> createState() => _EpisodeDetailsState();
}

class _EpisodeDetailsState extends State<EpisodeDetails> {
  late Episode episode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: const [
            Text('Hallow')
          ],
        ),
      ),
    );
  }
}
