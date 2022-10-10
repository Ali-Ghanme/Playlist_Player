import 'package:assets_audio_player/assets_audio_player.dart';

class EpisodeData {
  late String episodeId;
  late String episodeImage;
  late String episodeName;
  late String episodeDate;
  late String episodeGustIn;
  late String episodeGustOut;

  EpisodeData({
    required this.episodeId,
    required this.episodeImage,
    required this.episodeName,
    required this.episodeDate,
    required this.episodeGustIn,
    required this.episodeGustOut,
  });

  static List<EpisodeData> episodes = [
    EpisodeData(
        episodeId: '1',
        episodeImage: 'episodeImage',
        episodeName: 'episodeName',
        episodeDate: 'episodeDate',
        episodeGustIn: 'episodeGustIn',
        episodeGustOut: 'episodeGustOut')
  ];
}
// Hi