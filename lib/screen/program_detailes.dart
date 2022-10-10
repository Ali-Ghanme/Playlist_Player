import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import '../model/program_details.dart';
import '../widget/widgets/PositionSeekWidget.dart';
import '../widget/widgets/info.dart';

class ProgramDetails extends StatefulWidget {
  const ProgramDetails({Key? key}) : super(key: key);

  @override
  State<ProgramDetails> createState() => _ProgramDetailsState();
}

class _ProgramDetailsState extends State<ProgramDetails> {
  final AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
  final ProgramPlaylist playlist = ProgramPlaylist.episodsPlaylist[0];
  double screenHeight = 0;
  double screenWidth = 0;
  bool showBottom = false;

  static List<Audio> audioList = [
    Audio('assest/audio/one.mp3',
        metas: Metas(
            title: 'حملة من التسهيلات والإجراءات للسائقين',
            artist: 'Benjamin Tissot',
            image: const MetasImage.asset('assest/images/one.png'))),
    Audio.network(
        'http://qudsradio.ps/admin-assets/uploads/episodes//18/2022/09/29/9ebfb0c9902db29e3d42cc151c3af06f.mp3',
        metas: Metas(
            title: 'تسهيل المنح الدراسية لطلاب فلسطين في الجزائر',
            artist: 'Benjamin Tissot',
            image: const MetasImage.asset('assest/images/one.png'))),
    Audio.network(
        'http://qudsradio.ps/admin-assets/uploads/episodes//18/2022/09/27/37fab53d5668d6650882f34f171b8987.mp3',
        metas: Metas(
            title: 'The Jazz Piano',
            artist: 'Benjamin Tissot',
            image: const MetasImage.asset('assest/images/one.png'))),
    Audio.network(
        'http://qudsradio.ps/admin-assets/uploads/episodes//18/2022/09/27/37fab53d5668d6650882f34f171b8987.mp3',
        metas: Metas(
            title: 'The Jazz Piano',
            artist: 'Benjamin Tissot',
            onImageLoadFail: const MetasImage.asset('assest/images/one.png'))),
    Audio.network(
        'http://qudsradio.ps/admin-assets/uploads/episodes//18/2022/09/27/37fab53d5668d6650882f34f171b8987.mp3',
        metas: Metas(
            title: 'The Jazz Piano',
            artist: 'Benjamin Tissot',
            image: const MetasImage.asset('assest/images/one.png'))),
  ];

  @override
  void initState() {
    super.initState();
    setupPlaylist();
    setState(() {
      if(audioPlayer.isPlaying.value == true){
        showBottom = true;
      }else{
        showBottom = !showBottom;
      }
    });
  }

  void setupPlaylist() async {
    audioPlayer.open(Playlist(audios: audioList),
        autoStart: false, showNotification: true);
  }

  Widget bottomPlayContainer(RealtimePlayingInfos realtimePlayingInfos) {
    return SizedBox(
      height: 100,
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0))),
        child: Stack(
          children: [
            SizedBox(
              height: 70,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  realtimePlayingInfos.current?.audio.audio.metas.image!.path ??
                      '',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            AudioWidget.network(
              url: '${audioList.length}',
              child: Column(
                children: [
                  // =================Seek Bar======================================
                  audioPlayer.builderRealtimePlayingInfos(
                      builder: (context, RealtimePlayingInfos? infos) {
                    if (infos == null) {
                      return SizedBox();
                    }
                    return Column(
                      children: [
                        PositionSeekWidget(
                          currentPosition: infos.currentPosition,
                          duration: infos.duration,
                          seekTo: (to) {
                            audioPlayer.seek(to);
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            SizedBox(
                              width: 12,
                            ),
                          ],
                        ),
                      ],
                    );
                  }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          audioPlayer.seekBy(Duration(seconds: -10));
                        }, icon: Icon(Icons.forward_10_rounded,color: Colors.white70,size: 25,),
                      ),
                      IconButton(
                          iconSize: 30,
                          onPressed: () => {
                                audioPlayer.previous(keepLoopMode: true),
                              },
                          icon: const Icon(
                            Icons.skip_previous,
                            color: Colors.white70,
                          )),
                      IconButton(
                          icon: Icon(realtimePlayingInfos.isPlaying
                              ? Icons.pause_circle_filled_rounded
                              : Icons.play_circle_fill_rounded),
                          iconSize: 35,
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          color: Colors.white70,
                          onPressed: () => audioPlayer.playOrPause()),
                      IconButton(
                          iconSize: 30,
                          onPressed: () =>
                              {audioPlayer.next(keepLoopMode: true)},
                          icon: const Icon(
                            Icons.skip_next,
                            color: Colors.white70,
                          )),
                      IconButton(
                        onPressed: () {
                          audioPlayer.seekBy(Duration(seconds: 10));
                        },
                        icon: Icon(Icons.replay_10_rounded,color: Colors.white70,size: 25,),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget playlist2(RealtimePlayingInfos realtimePlayingInfos) {
    return Container(
        color: Colors.white,
      alignment: Alignment.bottomLeft,
      child: ListView.builder(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemCount: audioList.length,
          itemBuilder: (context, index) {
            return playlistW(index);
          }),
    );
  }

  Widget playlistW(int index) {
          return InkWell(
            onTap: () {
              Get.toNamed('/episode');
              audioPlayer.playlistPlayAtIndex(index);
            },
            child: Card(
              borderOnForeground: true,
              color: Colors.white.withOpacity(0.8),
              child: ListTile(
                leading: const Icon(
                  Icons.headphones_outlined,
                  color: Colors.blue,
                ),
                title: Text(
                  maxLines: 1,
                  textDirection: TextDirection.rtl,
                  audioList[index].metas.title!,
                  style: TextStyle(fontFamily: 'Cairo', fontSize: 12),
                ),
                subtitle: Text(
                  textDirection: TextDirection.rtl,
                  '${audioList[index].metas.title!}',
                  style: const TextStyle(fontFamily: 'Cairo', fontSize: 10),
                ),
                // this time of the song
                trailing: IconButton(
                  icon: Icon(Icons.play_circle),
                  color: Colors.blue,
                  onPressed: () {
                    audioPlayer.playlistPlayAtIndex(index);
                  },
                ),
              ),
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            playlist.title,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontFamily: 'Cairo'),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                PlayListInfo(data: playlist),
                const SizedBox(height: 20),
                // Create A Tap Contain Play and Shuffled
                const _PlayOrShuffleSwitch(),
                SizedBox(height: 5),
                audioPlayer.builderRealtimePlayingInfos(
                    builder: (context, realtimePlayingInfos) {
                  if (realtimePlayingInfos != null) {
                    return playlist2(realtimePlayingInfos);
                  } else {
                    return Column();
                  }
                }),
              ],
            ),
          ),
        ),
        bottomNavigationBar:
        Visibility(
          visible: showBottom,
          child: audioPlayer.builderRealtimePlayingInfos(builder: (context, realtimePlayingInfos) {
            return bottomPlayContainer(realtimePlayingInfos);
          }),
        ),
      ),
    );
  }
}

class _PlayOrShuffleSwitch extends StatefulWidget {
  const _PlayOrShuffleSwitch({Key? key}) : super(key: key);

  @override
  State<_PlayOrShuffleSwitch> createState() => _PlayOrShuffleSwitchState();
}

class _PlayOrShuffleSwitchState extends State<_PlayOrShuffleSwitch> {
  bool isPlay = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        setState(() {
          isPlay = !isPlay;
        });
      },
      child: Container(
        height: 50,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          children: [
            // to Move the container using AnimatedPosition
            AnimatedPositioned(
              duration: const Duration(milliseconds: 100),
              left: isPlay ? 0 : width * 0.47,
              child: Container(
                height: 50,
                width: width * 0.45,
                decoration: BoxDecoration(
                  color: Colors.lightBlue.shade400,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text('حلقات البرنامج',
                            style: TextStyle(
                                color: isPlay ? Colors.white : Colors.lightBlue,
                                fontSize: 17,
                                fontFamily: 'Cairo')),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text('جدول البرنامج',
                            style: TextStyle(
                                color: isPlay ? Colors.lightBlue : Colors.white,
                                fontSize: 17,
                                fontFamily: 'Cairo')),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
// Hi