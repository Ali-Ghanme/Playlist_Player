import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../model/program_details.dart';

class PlayListInfo extends StatelessWidget {
  const PlayListInfo({Key? key, required this.data}) : super(key: key);

  final ProgramPlaylist data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.network(
                data.imageUrl,
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.height * 0.2,
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                'المقدم : ${data.actor}',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontFamily: 'Cairo'),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                data.desc,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontFamily: 'Cairo'),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                'الشريحة: ${data.filed}',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontFamily: 'Cairo'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
// Hi