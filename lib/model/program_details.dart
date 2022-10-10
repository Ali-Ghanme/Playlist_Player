import 'package:assest_audio_project/model/episod.dart';

class ProgramPlaylist {
  final String title;
  final String desc;
  final String actor;
  final String filed;
  final List<Episode> episods;
  final String imageUrl;

  ProgramPlaylist({
    required this.desc,
    required this.actor,
    required this.filed,
    required this.title,
    required this.episods,
    required this.imageUrl,
  });

  static List<ProgramPlaylist> episodsPlaylist = [
    ProgramPlaylist(
        title: 'بانوراما القدس',
        episods: Episode.episods,
        imageUrl:
            'http://qudsradio.ps/thumb.php?src=./admin-assets/uploads/imgCourses/2019/10/30/c450a45c604defef64319579afba18bb.png&size=200x264',
        desc:
            'برنامج منوع يهتم بقضايا صحية ورياضية وقضايا المرأة والرجل ويعالج قضايا اجتماعية يبث في فترة الصباح',
        actor: 'محمد قنيطة',
        filed: 'كافة شرائح المجتمع'),
    ProgramPlaylist(
        title: 'بانوراما القدس',
        episods: Episode.episods,
        imageUrl:
            'http://qudsradio.ps/thumb.php?src=./admin-assets/uploads/imgCourses/2019/10/30/c450a45c604defef64319579afba18bb.png&size=200x264',
        desc:
            'برنامج منوع يهتم بقضايا صحية ورياضية وقضايا المرأة والرجل ويعالج قضايا اجتماعية يبث في فترة الصباح',
        actor: 'محمد قنيطة',
        filed: 'كافة شرائح المجتمع'),
    ProgramPlaylist(
        title: 'بانوراما القدس',
        episods: Episode.episods,
        imageUrl:
            'http://qudsradio.ps/thumb.php?src=./admin-assets/uploads/imgCourses/2019/10/30/c450a45c604defef64319579afba18bb.png&size=200x264',
        desc:
            'برنامج منوع يهتم بقضايا صحية ورياضية وقضايا المرأة والرجل ويعالج قضايا اجتماعية يبث في فترة الصباح',
        actor: 'محمد قنيطة',
        filed: 'كافة شرائح المجتمع'),
  ];
}
