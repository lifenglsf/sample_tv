// // import 'package:flutter/material.dart';
// // import 'package:flutter/services.dart';
// // import 'package:yoyo_player/yoyo_player.dart';

// // void main() {
// //   runApp(const MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   const MyApp({Key? key}) : super(key: key);

// //   // This widget is the root of your application.
// //   @override
// //   Widget build(BuildContext context) {
// //     return Shortcuts(
// //       shortcuts: <LogicalKeySet, Intent>{
// //         LogicalKeySet(LogicalKeyboardKey.select): const ActivateIntent(),
// //       },
// //       child: MaterialApp(
// //         theme: ThemeData(
// //           primarySwatch: Colors.blue,
// //           visualDensity: VisualDensity.adaptivePlatformDensity,
// //         ),
// //         home: const MyHomePage(title: "tv sample"),
// //       ),
// //     );
// //   }
// // }

// // class MyHomePage extends StatefulWidget {
// //   const MyHomePage({Key? key, required this.title}) : super(key: key);

// //   // This widget is the home page of your application. It is stateful, meaning
// //   // that it has a State object (defined below) that contains fields that affect
// //   // how it looks.

// //   // This class is the configuration for the state. It holds the values (in this
// //   // case the title) provided by the parent (in this case the App widget) and
// //   // used by the build method of the State. Fields in a Widget subclass are
// //   // always marked "final".

// //   final String title;

// //   @override
// //   State<MyHomePage> createState() => _MyHomePageState();
// // }

// // class Tv {
// //   final String name;
// //   final String url;
// //   Tv(this.name, this.url);
// // }

// // class _MyHomePageState extends State<MyHomePage> {
// //   // ignore: non_constant_identifier_names
// //   List<Tv> tv = [
// //     Tv("cctv1",
// //         "http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221226457/index.m3u8"),
// //     Tv("cctv2",
// //         "http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221226195/index.m3u8")
// //   ];

// //   @override
// //   Widget build(BuildContext context) {
// //     // This method is rerun every time setState is called, for instance as done
// //     // by the _incrementCounter method above.
// //     //
// //     // The Flutter framework has been optimized to make rerunning build methods
// //     // fast, so that you can just rebuild anything that needs updating rather
// //     // than having to individually change instances of widgets.
// //     return Scaffold(
// //         appBar: AppBar(
// //           // Here we take the value from the MyHomePage object that was created by
// //           // the App.build method, and use it to set our appbar title.
// //           title: Text(widget.title),
// //         ),
// //         body: GridView.builder(
// //             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
// //               crossAxisCount: 4,
// //               childAspectRatio: 1.0,
// //               crossAxisSpacing: 10,
// //               mainAxisSpacing: 10,
// //             ),
// //             itemCount: tv.length,
// //             itemBuilder: (context, index) {
// //               return GestureDetector(
// //                   onTap: () {
// //                     Navigator.push(
// //                         context,
// //                         MaterialPageRoute(
// //                           builder: (context) => RouteTwo(
// //                             tv[index],
// //                           ),
// //                         ));
// //                   },
// //                   child: Text(tv[index].name));
// //             }));
// //   }
// // }

// // class RouteTwo extends StatelessWidget {
// //   final Tv tv;
// //   // ignore: use_key_in_widget_constructors
// //   const RouteTwo(this.tv);
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text("Detail"),
// //       ),
// //       body: Text(tv.url),
// //       // body: YoYoPlayer(
// //       //   aspectRatio: 16 / 9,
// //       //   //url ( .m3u8 video streaming link )
// //       //   //example ( url :"https://sfux-ext.sfux.info/hls/chapter/105/1588724110/1588724110.m3u8" )
// //       //   //example ( url :"https://player.vimeo.com/external/440218055.m3u8?s=7ec886b4db9c3a52e0e7f5f917ba7287685ef67f&oauth2_token_id=1360367101" )
// //       //   url: tv.url,
// //       //   videoStyle: VideoStyle(),
// //       //   videoLoadingStyle: VideoLoadingStyle(
// //       //     loading: const Center(
// //       //       child: Text("Loading video"),
// //       //     ),
// //       //   ),
// //       // ),
// //     );
// //   }
// // }

// // class DetailScreen extends StatelessWidget {
// //   final String url;
// //   // ignore: use_key_in_widget_constructors
// //   const DetailScreen(this.url);
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text("Detail"),
// //       ),
// //       body: SizedBox(
// //         height: MediaQuery.of(context).size.height,
// //         width: MediaQuery.of(context).size.width,
// //         child: Image.network(url),
// //       ),
// //     );
// //   }
// // }

// import 'package:chewie/chewie.dart'; //??????chewie??????
// // ignore: implementation_imports
// import 'package:chewie/src/chewie_player.dart'; //??????chewie???????????????
// import 'package:flutter/cupertino.dart'; //??????iOS????????????
// import 'package:flutter/material.dart'; //flutter???????????????UI
// import 'package:video_player/video_player.dart'; //??????video?????????
// //????????????????????????????????????????????? ?????????????????????

// ////????????????????????????homepage??????app????????????ChewieDemo???????????????????????????flutter?????????demo?????????????????????????????????????????????
// void main() {
//   runApp(
//     ChewieDemo(),
//   );
// }

// //???????????????????????? class xxxx extends StatefulWidget ChewieDemo ?????????statefulwidget ???????????????????????????StatelessWidget ?????????????????????????????????????????????????????????????????????
// class ChewieDemo extends StatefulWidget {
//   ChewieDemo({this.title = '??????????????????-??????chewie'});
//   final String title; //flutter??? final??????????????????csdn??? FreeAndWake???????????????

//   @override //?????? ??????????????????????????????????????????
//   State<StatefulWidget> createState() {
//     return _ChewieDemoState(); //?????? _ChewieDemoState()
//   }
// }

// //???????????????????????????????????????????????????
// class _ChewieDemoState extends State<ChewieDemo> {
//   late TargetPlatform _platform; ////???????????????emmmm??????
//   late VideoPlayerController _videoPlayerController1; //???????????? //?????????????????????
//   late VideoPlayerController _videoPlayerController2; //CCTV13
//   late VideoPlayerController _videoPlayerController3; //CCTV1
//   late VideoPlayerController _videoPlayerController4; //CCTV6
//   late VideoPlayerController _videoPlayerController5; //CCTV5
//   late VideoPlayerController _videoPlayerController6; //????????????
//   late ChewieController _chewieController;

//   @override
//   void initState() {
//     super.initState(); //??????network???????????????????????????
//     _videoPlayerController1 = VideoPlayerController.network(
//         'http://61.241.131.18/tx.rtmp.huya.com/1423787831-1423787831-6115122170587774976-2847699118-10057-A-0-1.m3u8'); //????????????http://pl.live.weibo.com/alicdn/459a245fed4473430925dc5189427df6_6M.m3u8
//     _videoPlayerController2 = VideoPlayerController.network(
//         'http://39.135.55.105:6610/PLTV/88888888/224/3221225800/index.m3u8?servicetype=1'); //CCTV13http://liveali.ifeng.com/live/CCTV.m3u8
//     _videoPlayerController3 = VideoPlayerController.network(
//         'http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221226397/index.m3u8'); //CCTV1http://cctvalih5ca.v.myalicdn.com/live/cctv1_2/index.m3u8
//     _videoPlayerController4 = VideoPlayerController.network(
//         'http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221226223/index.m3u8'); //CCTV6http://cctvalih5ca.v.myalicdn.com/live/cctv6_2/index.m3u8
//     _videoPlayerController5 = VideoPlayerController.network(
//         'http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221226395/index.m3u8'); //CCTV5+http://ivi.bupt.edu.cn/hls/cctv5phd.m3u8
//     _videoPlayerController6 = VideoPlayerController.network(
//         'http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221226393/index.m3u8'); //??????
//     _chewieController = ChewieController(
//       videoPlayerController: _videoPlayerController1,
//       aspectRatio: 3 / 2, //?????????
//       autoPlay: false, //????????????
//       looping: true, //?????? ???????????????
//       // // Try playing around with some of these other options:

//       showControls: false, //???????????? ?????????colors?????????x???
//       materialProgressColors: ChewieProgressColors(
//         playedColor: Colors.red,
//         handleColor: Colors.blue,
//         backgroundColor: Colors.grey,
//         bufferedColor: Colors.lightGreen,
//       ),
//       placeholder: Container(
//         color: Colors.grey,
//       ),
//       autoInitialize: true, //??????????????? emmmmmmm
//     );
//   }

//   @override //??????????????????????????????
//   void dispose() {
//     _videoPlayerController1.dispose();
//     _videoPlayerController2.dispose();
//     _videoPlayerController3.dispose();
//     _videoPlayerController4.dispose();
//     _videoPlayerController5.dispose();
//     _videoPlayerController6.dispose();
//     _chewieController.dispose();
//     super.dispose();
//   }

//   @override //??????
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: widget.title, //??????
//       theme: ThemeData.light().copyWith(
//         platform: Theme.of(context).platform,
//       ), //?????? ?????????????????? ??????bibi
//       home: Scaffold(
//         appBar: AppBar(
//           actions: <Widget>[
//             IconButton(
//                 icon: const Icon(Icons.group_add), //?????????????????????
//                 onPressed: () {}),
//           ],
//           title: Text(widget.title),
//         ),
//         body: Column(
//           children: <Widget>[
//             Expanded(
//               child: Center(
//                 child: Chewie(
//                   controller: _chewieController,
//                 ),
//               ),
//             ),
//             FlatButton(
//               //?????????flat??????
//               onPressed: () {
//                 _chewieController.enterFullScreen();
//               },
//               child: const Text('Fullscreen'),
//             ),
//             Row(
//               //Row flutter?????????????????????????????????Column
//               children: <Widget>[
//                 //children child ???????????????????????????children???????????????child
//                 Expanded(
//                   child: FlatButton(
//                     onPressed: () {
//                       setState(() {
//                         //??????
//                         _chewieController.dispose();
//                         _videoPlayerController2.pause(); //???2?????????????????????
//                         _videoPlayerController2
//                             .seekTo(const Duration(seconds: 0)); //????????????0
//                         _videoPlayerController3.pause();
//                         _videoPlayerController3
//                             .seekTo(const Duration(seconds: 0));
//                         _videoPlayerController4.pause();
//                         _videoPlayerController4
//                             .seekTo(const Duration(seconds: 0));
//                         _videoPlayerController5.pause();
//                         _videoPlayerController5
//                             .seekTo(const Duration(seconds: 0));
//                         _videoPlayerController6.pause();
//                         _videoPlayerController6
//                             .seekTo(const Duration(seconds: 0));
//                         _chewieController = ChewieController(
//                           videoPlayerController:
//                               _videoPlayerController1, //?????????1???????????????
//                           aspectRatio: 3 / 2,
//                           autoPlay: true,
//                           looping: true,
//                         );
//                       });
//                     },
//                     child: const Padding(
//                       child: Text("cctv1"),
//                       padding: EdgeInsets.symmetric(vertical: 16.0),
//                     ),
//                   ),
//                 ),

//                 Expanded(
//                   child: FlatButton(
//                     onPressed: () {
//                       setState(() {
//                         _chewieController.dispose();
//                         _videoPlayerController1.pause();
//                         _videoPlayerController1
//                             .seekTo(const Duration(seconds: 0));
//                         _videoPlayerController3.pause();
//                         _videoPlayerController3
//                             .seekTo(const Duration(seconds: 0));
//                         _videoPlayerController4.pause();
//                         _videoPlayerController4
//                             .seekTo(const Duration(seconds: 0));
//                         _videoPlayerController5.pause();
//                         _videoPlayerController5
//                             .seekTo(const Duration(seconds: 0));
//                         _videoPlayerController6.pause();
//                         _videoPlayerController6
//                             .seekTo(const Duration(seconds: 0));
//                         _chewieController = ChewieController(
//                           videoPlayerController: _videoPlayerController2,
//                           aspectRatio: 3 / 2,
//                           autoPlay: true,
//                           looping: true,
//                         );
//                       });
//                     },
//                     child: const Padding(
//                       padding: EdgeInsets.symmetric(vertical: 16.0),
//                       child: Text("cctv2"),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: FlatButton(
//                     onPressed: () {
//                       setState(() {
//                         _chewieController.dispose();
//                         _videoPlayerController1.pause();
//                         _videoPlayerController1
//                             .seekTo(const Duration(seconds: 0));
//                         _videoPlayerController2.pause();
//                         _videoPlayerController2
//                             .seekTo(const Duration(seconds: 0));
//                         _videoPlayerController4.pause();
//                         _videoPlayerController4.seekTo(Duration(seconds: 0));
//                         _videoPlayerController5.pause();
//                         _videoPlayerController5.seekTo(Duration(seconds: 0));
//                         _videoPlayerController6.pause();
//                         _videoPlayerController6.seekTo(Duration(seconds: 0));
//                         _chewieController = ChewieController(
//                           videoPlayerController: _videoPlayerController3,
//                           aspectRatio: 3 / 2,
//                           autoPlay: true,
//                           looping: true,
//                         );
//                       });
//                     },
//                     child: const Padding(
//                       padding: EdgeInsets.symmetric(vertical: 16.0),
//                       child: Text("cctv3"),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//             Row(
//               children: <Widget>[
//                 // Expanded(
//                 //   child: FlatButton(
//                 //     onPressed: () {
//                 //       setState(() {
//                 //         _platform = TargetPlatform.android;
//                 //       });
//                 //     },
//                 //     child: Padding(
//                 //       child: Text("Android controls"),
//                 //       padding: EdgeInsets.symmetric(vertical: 16.0),
//                 //     ),
//                 //   ),
//                 // ),
//                 Expanded(
//                   child: FlatButton(
//                     onPressed: () {
//                       setState(() {
//                         _chewieController.dispose();
//                         _videoPlayerController1.pause();
//                         _videoPlayerController1.seekTo(Duration(seconds: 0));
//                         _videoPlayerController2.pause();
//                         _videoPlayerController2.seekTo(Duration(seconds: 0));
//                         _videoPlayerController3.pause();
//                         _videoPlayerController3.seekTo(Duration(seconds: 0));
//                         _videoPlayerController5.pause();
//                         _videoPlayerController5.seekTo(Duration(seconds: 0));
//                         _videoPlayerController6.pause();
//                         _videoPlayerController6.seekTo(Duration(seconds: 0));
//                         _chewieController = ChewieController(
//                           videoPlayerController: _videoPlayerController4,
//                           aspectRatio: 3 / 2,
//                           autoPlay: true,
//                           looping: true,
//                         );
//                       });
//                     },
//                     child: const Padding(
//                       padding: EdgeInsets.symmetric(vertical: 16.0),
//                       child: Text("cctv4"),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: FlatButton(
//                     onPressed: () {
//                       setState(() {
//                         _chewieController.dispose();
//                         _videoPlayerController1.pause();
//                         _videoPlayerController1.seekTo(Duration(seconds: 0));
//                         _videoPlayerController2.pause();
//                         _videoPlayerController2.seekTo(Duration(seconds: 0));
//                         _videoPlayerController3.pause();
//                         _videoPlayerController3.seekTo(Duration(seconds: 0));
//                         _videoPlayerController4.pause();
//                         _videoPlayerController4.seekTo(Duration(seconds: 0));
//                         _videoPlayerController6.pause();
//                         _videoPlayerController6.seekTo(Duration(seconds: 0));
//                         _chewieController = ChewieController(
//                           videoPlayerController: _videoPlayerController5,
//                           aspectRatio: 3 / 2,
//                           autoPlay: true,
//                           looping: true,
//                         );
//                       });
//                     },
//                     child: const Padding(
//                       padding: EdgeInsets.symmetric(vertical: 16.0),
//                       child: Text("cctv5"),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: FlatButton(
//                     onPressed: () {
//                       setState(() {
//                         _chewieController.dispose();
//                         _videoPlayerController1.pause();
//                         _videoPlayerController1.seekTo(Duration(seconds: 0));
//                         _videoPlayerController2.pause();
//                         _videoPlayerController2.seekTo(Duration(seconds: 0));
//                         _videoPlayerController3.pause();
//                         _videoPlayerController3.seekTo(Duration(seconds: 0));
//                         _videoPlayerController4.pause();
//                         _videoPlayerController4.seekTo(Duration(seconds: 0));
//                         _videoPlayerController5.pause();
//                         _videoPlayerController5.seekTo(Duration(seconds: 0));
//                         _chewieController = ChewieController(
//                           videoPlayerController: _videoPlayerController6,
//                           aspectRatio: 16 / 9,
//                           autoPlay: true,
//                           looping: true,
//                         );
//                       });
//                     },
//                     child: const Padding(
//                       padding: EdgeInsets.symmetric(vertical: 16.0),
//                       child: Text("cctv6"),
//                     ),
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_vlc_player/flutter_vlc_player.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter App Learning',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage() : super();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class VideoData {
  final String name;
  final String path;

  VideoData({
    required this.name,
    required this.path,
  });
}

class _MyHomePageState extends State<MyHomePage> {
  late VlcPlayerController _videoPlayerController;
  late int selectIndex;
  List<VideoData> listVideos = [
    VideoData(
        name: "cctv1",
        path:
            "http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221226457/index.m3u8"),
    VideoData(
        name: "cctv2",
        path:
            "http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221226195/index.m3u8")
  ];
  @override
  void initState() {
    super.initState();
    selectIndex = 0;
    VideoData initVideo = listVideos[selectIndex];
    print("init State");
    _videoPlayerController = VlcPlayerController.network(
      initVideo.path,
      hwAcc: HwAcc.full,
      autoPlay: true,
      options: VlcPlayerOptions(
          // advanced: VlcAdvancedOptions([
          //   VlcAdvancedOptions.networkCaching(2000),
          // ]),
          // subtitle: VlcSubtitleOptions([
          //   VlcSubtitleOptions.boldStyle(true),
          //   VlcSubtitleOptions.fontSize(30),
          //   VlcSubtitleOptions.outlineColor(VlcSubtitleColor.yellow),
          //   VlcSubtitleOptions.outlineThickness(VlcSubtitleThickness.normal),
          //   // works only on externally added subtitles
          //   VlcSubtitleOptions.color(VlcSubtitleColor.navy),
          // ]),
          // http: VlcHttpOptions([
          //   VlcHttpOptions.httpReconnect(true),
          // ]),
          // rtp: VlcRtpOptions([
          //   VlcRtpOptions.rtpOverRtsp(true),
          // ]),
          ),
    );
    // _videoPlayerController = VlcPlayerController.network(
    //   'http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221226457/index.m3u8',
    //   hwAcc: HwAcc.full,
    //   autoPlay: true,
    //   options: VlcPlayerOptions(),
    // );
    print(_videoPlayerController);
  }

  @override
  void dispose() async {
    super.dispose();
    await _videoPlayerController.stopRendererScanning();
    await _videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Flutter GridView"),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              child: Center(
                child: VlcPlayer(
                  controller: _videoPlayerController,
                  aspectRatio: 16 / 9,
                  placeholder: Center(child: CircularProgressIndicator()),
                ),
              ),
            ),

            // SizedBox(
            //   height: 400,
            //   child: VlcPlayerWithControls(
            //     key: _key,
            //     controller: _videoPlayerController,
            //     onStopRecording: (recordPath) {
            //       setState(() {
            //         listVideos.add(VideoData(
            //           name: 'Recorded Video',
            //           path: recordPath,
            //         ));
            //       });
            //       ScaffoldMessenger.of(context).showSnackBar(
            //         SnackBar(
            //           content: Text(
            //               'The recorded video file has been added to the end of list.'),
            //         ),
            //       );
            //     },
            //   ),
            // ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: listVideos.length,
              // physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                var video = listVideos[index];
                IconData iconData;
                iconData = Icons.cloud;
                return ListTile(
                  dense: true,
                  selected: selectIndex == index,
                  selectedTileColor: Colors.black54,
                  leading: Icon(
                    iconData,
                    color: selectIndex == index ? Colors.white : Colors.black,
                    textDirection: TextDirection.ltr,
                  ),
                  title: Text(
                    video.name,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: selectIndex == index ? Colors.white : Colors.black,
                    ),
                    textDirection: TextDirection.ltr,
                  ),
                  // subtitle: Text(
                  //   video.path,
                  //   overflow: TextOverflow.ellipsis,
                  //   style: TextStyle(
                  //     color:
                  //     selectIndex == index ? Colors.white : Colors.black,
                  //   ),
                  // ),
                  onTap: () async {
                    await _videoPlayerController.stopRecording();
                    await _videoPlayerController.setMediaFromNetwork(
                      video.path,
                      hwAcc: HwAcc.full,
                    );

                    setState(() {
                      selectIndex = index;
                    });
                  },
                );
              },
            ),
          ],
        ));
  }
}
