import 'package:assets_audio_player/assets_audio_player.dart';

import 'episod_details.dart';

class Episode {
  final String title;
  final String description;
  final String url;
  final String coverUrl;
  final List<EpisodeData> list;

  Episode({
    required this.list,
    required this.title,
    required this.description,
    required this.url,
    required this.coverUrl,
  });


  // Example List of Data From Internet
  static List<Episode> episods = [
    Episode(
      title:
          'اطلاق المرحلة الثانية لورشة الأطراف الذكية واختتام فوج زراعة القوقعة العاشرة',
      description: '01/10/2022',
      url: 'http://qudsradio.ps/admin-assets/uploads/episodes//18/2022/09/29/9ebfb0c9902db29e3d42cc151c3af06f.mp3',
      coverUrl: 'images/image.jpg',
      list: EpisodeData.episodes,
    ),
    Episode(
      title: 'تسهيل المنح الدراسية لطلاب فلسطين في الجزائر',
      description: '01/10/2022',
      url:
          'http://qudsradio.ps/admin-assets/uploads/episodes//18/2022/10/01/f5733bcaf8da2673610caadacc405db5.mp3',
      coverUrl: 'images/image.jpg',
      list: EpisodeData.episodes,
    ),
    Episode(
      title: 'حملة من التسهيلات والإجراءات للسائقين',
      description: '01/10/2022',
      url:
          'http://qudsradio.ps/admin-assets/uploads/episodes//18/2022/09/27/37fab53d5668d6650882f34f171b8987.mp3',
      coverUrl: 'images/image2.jpg',
      list: EpisodeData.episodes,
    ),
    // Episode(
    //   title: 'اقتحامات واسعة للأقصى وسط حماية من شرطة الاحتلال',
    //   description: '01/10/2022',
    //   url:
    //       'assest/audio/one.mp3',
    //   coverUrl: 'images/image.jpg',
    //   list: EpisodeData.episodes,
    // ),
  ];
  // List<Audio> audioList = [
  //   Audio('http://qudsradio.ps/admin-assets/uploads/episodes//18/2022/09/29/9ebfb0c9902db29e3d42cc151c3af06f.mp3',
  //       metas: Metas(
  //           title: 'تسهيل المنح الدراسية لطلاب فلسطين في الجزائر',
  //           artist: 'Benjamin Tissot',
  //           image: const MetasImage.asset('images/one.png'))),
  //   Audio('http://qudsradio.ps/admin-assets/uploads/episodes//18/2022/10/01/f5733bcaf8da2673610caadacc405db5.mp3',
  //       metas: Metas(
  //           title: 'حملة من التسهيلات والإجراءات للسائقين',
  //           artist: 'Benjamin Tissot',
  //           image: const MetasImage.asset('images/one.png'))),
  //   Audio('http://qudsradio.ps/admin-assets/uploads/episodes//18/2022/09/27/37fab53d5668d6650882f34f171b8987.mp3',
  //       metas: Metas(
  //           title: 'The Jazz Piano',
  //           artist: 'Benjamin Tissot',
  //           image: const MetasImage.asset('images/one.png'))),
  // ];
}
