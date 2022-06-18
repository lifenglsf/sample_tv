import 'dart:io';
import 'dart:ui';

import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return //RawKeyboardListener(
        //key:_key,
        //focusNode: FocusNode(),
        // onKey: (event) {
        //   if (event is RawKeyDownEvent &&
        //       event.data is RawKeyEventDataAndroid &&
        //       event.runtimeType.toString() == "RawKeyDownEvent") {
        //     RawKeyDownEvent rawKeyDownEvent = event;
        //     RawKeyEventData rawKey = rawKeyDownEvent.data;
        //     //print("keyCode: ${rawKey.logicalKey.keyId}");
        //     //exit(0);
        //     switch (rawKey.logicalKey.keyId) {
        //       case 19: //KEY_UP
        //       //                DefaultFocusTraversal.of(context).inDirection(
        //       //                    FocusScope.of(context).focusedChild, TraversalDirection.up);
        //         FocusScope.of(context).focusInDirection(TraversalDirection.up);
        //         break;
        //       case 20: //KEY_DOWN
        //         FocusScope.of(context)
        //             .focusInDirection(TraversalDirection.down);
        //         break;
        //       case 21: //KEY_LEFT
        //       //                            FocusScope.of(context).requestFocus(focusNodeB0);
        //         FocusScope.of(context)
        //             .focusInDirection(TraversalDirection.left);
        //         // 手动指定下一个焦点
        //         // FocusScope.of(context).requestFocus(focusNode);
        //         break;
        //       case 22: //KEY_RIGHT
        //       //                            FocusScope.of(context).requestFocus(focusNodeB1);
        //         FocusScope.of(context)
        //             .focusInDirection(TraversalDirection.right);
        //         //                DefaultFocusTraversal.of(context)
        //         //                    .inDirection(_focusNode, TraversalDirection.right);
        //         //                if(_focusNode.nextFocus()){
        //         //                  FocusScope.of(context)
        //         //                      .focusInDirection(TraversalDirection.right);
        //         //                }
        //         break;
        //       case 23: //KEY_CENTER
        //       case 32:
        //         //print(_key.currentState);
        //         _key.currentState?.openDrawer();
        //         break;
        //       case 66: //KEY_ENTER
        //       //widget.onclick();
        //         break;
        //       default:
        //         break;
        //     }
        //   }
        // },
        //child:
        Shortcuts(
            shortcuts: <LogicalKeySet, Intent>{
          LogicalKeySet(LogicalKeyboardKey.select): ActivateIntent(),
        },
            child: MaterialApp(
                // shortcuts: <LogicalKeySet, Intent>{
                //   LogicalKeySet(LogicalKeyboardKey.select): const ActivateIntent(),
                // },
                title: 'Flutter App Learning',
                theme: ThemeData(
                  primarySwatch: Colors.green,
                ),
                home: MyHomePage()));

    //);
    // return MaterialApp(
    //     shortcuts: <LogicalKeySet, Intent>{
    //       LogicalKeySet(LogicalKeyboardKey.select): const ActivateIntent(),
    //     },
    //     title: 'Flutter App Learning',
    //     theme: ThemeData(
    //       primarySwatch: Colors.green,
    //     ),
    //     home: MyHomePage());
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
  final String keys;

  VideoData({required this.name, required this.path, required this.keys});
}

class _MyHomePageState extends State<MyHomePage> {
  late FijkPlayer _videoPlayerController = FijkPlayer();
  _MyHomePageState();
  late int selectIndex;
  final _key = GlobalKey<ScaffoldState>();
  Map<String, List<VideoData>> listVideos = {
    "cctv": [
      VideoData(
          name: "cctv1",
          path:
          "http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221226231/index.m3u8",
          keys: 'cctv'),
      VideoData(
          name: "cctv2",
          path:
          "http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221226195/index.m3u8",
          keys: "cctv"),
      VideoData(
          name: "cctv3",
          path:
          "http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221226397/index.m3u8",
          keys: "cctv"),
      VideoData(
          name: "cctv4",
          path:
          "http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221226191/index.m3u8",
          keys: "cctv"),
      VideoData(
          name: "cctv5",
          path:
          "http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221226395/index.m3u8",
          keys: "cctv"),
      VideoData(
          name: "cctv5+",
          path:
          "http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221225761/index.m3u8",
          keys: "cctv"),
      VideoData(
          name: "cctv6",
          path:
          "http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221226393/index.m3u8",
          keys: "cctv"),
      VideoData(
          name: "cctv7",
          path:
          "http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221226192/index.m3u8",
          keys: "cctv"),
      VideoData(
          name: "cctv8",
          path:
          "http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221226391/index.m3u8",
          keys: "cctv"),
      VideoData(
          name: "cctv9",
          path:
          "http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221226197/index.m3u8",
          keys: "cctv"),
      VideoData(
          name: "cctv10",
          path:
          "http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221226189/index.m3u8",
          keys: "cctv"),
      VideoData(
          name: "cctv11",
          path:
          "http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221226240/index.m3u8",
          keys: "cctv"),
      VideoData(
          name: "cctv12",
          path:
          "http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221226190/index.m3u8",
          keys: "cctv"),
      VideoData(
          name: "cctv13",
          path:
          "http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221226233/index.m3u8",
          keys: "cctv"),
      VideoData(
          name: "cctv13+",
          path:
          "http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221226341/index.m3u8",
          keys: "cctv"),
      VideoData(
          name: "cctv14",
          path:
          "http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221226193/index.m3u8",
          keys: "cctv"),
      VideoData(
          name: "cctv15",
          path:
          "http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221225785/index.m3u8",
          keys: "cctv"),
      VideoData(
          name: "cctv15+",
          path:
          "http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221226342/index.m3u8",
          keys: "cctv"),
      VideoData(
          name: "cctv16",
          path:
          "http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221226921/index.m3u8",
          keys: "cctv"),
      VideoData(
          name: "cctv16+",
          path:
          "http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221226343/index.m3u8",
          keys: "cctv"),
      VideoData(
          name: "cctv17",
          path:
          "http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221226198/index.m3u8",
          keys: "cctv"),
      VideoData(
          name: "cctv18+",
          path:
          "http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221226344/index.m3u8",
          keys: "cctv"),
    ],
    "ws": [
      VideoData(
          name: "浙江卫视",
          path:
          "http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221225798/index.m3u8",
          keys: "ws"),
      VideoData(
          name: "天津卫视",
          path:
          "http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221226204/index.m3u8",
          keys: "ws"),
      VideoData(
          name: "湖南卫视",
          path:
          "http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221225799/index.m3u8",
          keys: "ws"),
      VideoData(
          name: "东方卫视",
          path:
          "http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221226261/index.m3u8",
          keys: "ws"),
      VideoData(
          name: "江苏卫视",
          path:
          "http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221225800/index.m3u8",
          keys: "ws"),
      VideoData(
          name: "辽宁卫视",
          path:
          "http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221226201/index.m3u8",
          keys: "ws"),
      VideoData(
          name: "北京卫视",
          path:
          "http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221225796/index.m3u8",
          keys: "ws"),
      VideoData(
          name: "广东卫视",
          path:
          "http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221225803/index.m3u8",
          keys: "ws"),
      VideoData(
          name: "湖北卫视",
          path:
          "http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221226194/index.m3u8",
          keys: "ws"),
      VideoData(
          name: "山东卫视",
          path:
          "http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221226209/index.m3u8",
          keys: "ws"),
      VideoData(
          name: "深圳卫视",
          path:
          "http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221225801/index.m3u8",
          keys: "ws"),
      VideoData(
          name: "重庆卫视",
          path:
          "http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221226202/index.m3u8",
          keys: "ws"),
      VideoData(
          name: "安徽卫视",
          path:
          "http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221226196/index.m3u8",
          keys: "ws"),
      VideoData(
          name: "黑龙江卫视",
          path:
          "http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221225802/index.m3u8",
          keys: "ws"),
      VideoData(
          name: "凤凰中文",
          path:
          "http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221226547/index.m3u8",
          keys: "ws"),
      VideoData(
          name: "凤凰资讯",
          path:
          "http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221226546/index.m3u8",
          keys: "ws"),
      VideoData(
          name: "东南卫视",
          path:
          "http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221225766/index.m3u8",
          keys: "ws"),
      VideoData(
          name: "云南卫视",
          path:
          "http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221225751/index.m3u8",
          keys: "ws"),
      VideoData(
          name: "兵团卫视",
          path:
          "http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221226214/index.m3u8",
          keys: "ws"),
      VideoData(
          name: "内蒙古卫视",
          path:
          "http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221225786/index.m3u8",
          keys: "ws"),
      VideoData(
          name: "厦门卫视",
          path:
          "http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221226219/index.m3u8",
          keys: "ws"),
      VideoData(
          name: "吉林卫视",
          path:
          "http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221225792/index.m3u8",
          keys: "ws"),
      VideoData(
          name: "四川卫视",
          path:
          "http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221225768/index.m3u8",
          keys: "ws"),
      VideoData(
          name: "宁夏卫视",
          path:
          "http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221225748/index.m3u8",
          keys: "ws"),
      VideoData(
          name: "山西卫视",
          path:
          "http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221225763/index.m3u8",
          keys: "ws"),
      VideoData(
          name: "广西卫视",
          path:
          "http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221225770/index.m3u8",
          keys: "ws"),
      VideoData(
          name: "新疆卫视",
          path:
          "http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221225747/index.m3u8",
          keys: "ws"),
      VideoData(
          name: "江西卫视",
          path:
          "http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221225764/index.m3u8",
          keys: "ws"),
      VideoData(
          name: "河北卫视",
          path:
          "http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221225750/index.m3u8",
          keys: "ws"),
      VideoData(
          name: "河南卫视",
          path:
          "http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221225767/index.m3u8",
          keys: "ws"),
      VideoData(
          name: "海南卫视",
          path:
          "http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221225769/index.m3u8",
          keys: "ws"),
      VideoData(
          name: "甘肃卫视",
          path:
          "http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221225754/index.m3u8",
          keys: "ws"),
      VideoData(
          name: "西藏卫视",
          path:
          "http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221226212/index.m3u8",
          keys: "ws"),
      VideoData(
          name: "贵州卫视",
          path:
          "http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221225793/index.m3u8",
          keys: "ws"),
      VideoData(
          name: "陕西卫视",
          path:
          "http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221226246/index.m3u8",
          keys: "ws"),
      VideoData(
          name: "青海卫视",
          path:
          "http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221225794/index.m3u8",
          keys: "ws"),
      VideoData(
          name: "四川康巴卫视",
          path:
          "http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221226234/index.m3u8",
          keys: "ws"),
      VideoData(
          name: "山东教育卫视",
          path:
          "http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221226238/index.m3u8",
          keys: "ws"),
      VideoData(
          name: "吉林延边卫视",
          path:
          "http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221226220/index.m3u8",
          keys: "ws"),
      VideoData(
          name: "陕西农林卫视",
          path:
          "http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221226229/index.m3u8",
          keys: "ws"),
      VideoData(
          name: "青海安多卫视",
          path:
          "http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221226228/index.m3u8",
          keys: "ws"),
    ],
  };

  // List<VideoData> listVideos = [
  //   VideoData(
  //       name: "cctv1",
  //       path:
  //           "http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221226457/index.m3u8"),
  //   VideoData(
  //       name: "cctv2",
  //       path:
  //           "http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221226195/index.m3u8")
  // ];
  @override
  void initState() {
    super.initState();
    selectIndex = 0;
    VideoData initVideo;
    initVideo = listVideos["cctv"]![selectIndex];
    super.initState();
    _videoPlayerController.setDataSource(initVideo.path, autoPlay: true);
    // _videoPlayerController.setOption(FijkOption.playerCategory, "reconnect" , 5);
    // _videoPlayerController.setOption(FijkOption.playerCategory, "framedrop" , 5);
    // _videoPlayerController.setOption(FijkOption.playerCategory, "enable-accurate-seek" , 1);
    // _videoPlayerController.setOption(FijkOption.playerCategory, "mediacodec" , 1);
    // _videoPlayerController.setOption(FijkOption.playerCategory, "packet-buffering" , 1);
    // _videoPlayerController.setOption(FijkOption.playerCategory, "soundtouch" , 1);
    // _videoPlayerController.setOption(FijkOption.playerCategory, "start-on-prepared" , 1);
    // _videoPlayerController.setOption(FijkOption.formatCategory, "fflags" , "fastseek");
   // _videoPlayerController.enterFullScreen();
    // _videoPlayerController = VlcPlayerController.network(
    //   'http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221226457/index.m3u8',
    //   hwAcc: HwAcc.full,
    //   autoPlay: true,
    //   options: VlcPlayerOptions(),
    // );
    //print(_videoPlayerController);
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.release();
  }

  @override
  Widget build(BuildContext context) {
    //显示底部栏(隐藏顶部状态栏)
    //SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    //显示顶部栏(隐藏底部栏)
    //SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top]);
    //隐藏底部栏和顶部状态栏
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    final size =MediaQuery.of(context).size;
    final width =size.width;
    final height =size.height;
    return RawKeyboardListener(
        //key: _key,
        autofocus: true,
        focusNode: FocusNode(),
        onKey: (event) {
          if (event is RawKeyDownEvent &&
              event.data is RawKeyEventDataAndroid &&
              event.runtimeType.toString() == "RawKeyDownEvent") {
            RawKeyDownEvent rawKeyDownEvent = event;
            RawKeyEventData rawKey = rawKeyDownEvent.data;
            print("keyCode: ${rawKey.logicalKey.keyId}");
            //exit(0);
            switch (rawKey.logicalKey.keyId) {
              case 19: //上键
              case 4294968068:
                break;
              case 20: //下键
              case 4294968065:
                break;
              case 21: //左键
              case 4294968066:
                break;
              case 22: //右键
              case 4294968067:
                //_videoPlayerController.exitFullScreen();
                _key.currentState?.openDrawer();
                break;
              case 4294967309:
              case 4294968588:
              case 23: //enter
              case 66: //enter
                //_videoPlayerController.enterFullScreen();
                print(_key.currentState);
              //Scaffold.of(context).openDrawer();
            }
          }
          // dprint("event ${event}");
        },
        child: Scaffold(
          key: _key,
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () => _key.currentState!.openDrawer(), // <-- Opens drawer
          // ),
          body: ListView(
            children: <Widget>[
              Container(
                  child: FijkView(
                    player: _videoPlayerController,
                    height: height,
                    fsFit: FijkFit.fill,
                ),
              )
            ],
          ),
          //  ListView(children: <Widget>[
          //   Container(
          //       child: VlcPlayer(
          //         controller: _videoPlayerController,
          //         aspectRatio: 16 / 9,
          //         placeholder: Center(child: CircularProgressIndicator()),
          //       ),
          //     ),
          //
          // ]),
          drawer: Drawer(
            child: ListView(
              // physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: _buildList(),
            ),
          ),
        ));
  }

  /// 创建列表 , 每个元素都是一个 ExpansionTile 组件
  List<Widget> _buildList() {
    List<Widget> widgets = [];
    for (var key in listVideos.keys) {
      widgets.add(_generateExpansionTileWidget(key, listVideos[key]));
    }
    return widgets;
  }

  /// 生成 ExpansionTile 组件 , children 是 List<Widget> 组件
  Widget _generateExpansionTileWidget(tittle, List<VideoData>? names) {
    final ScrollController _scrollController = ScrollController();
    final GlobalKey expansionTileKey = GlobalKey();
    double previousOffset;
    return ExpansionTile(
      key: expansionTileKey,
      title: Text(
        tittle,
        style: TextStyle(
            //color: Colors.black54,
            fontSize: 20),
      ),
      children: names!.map((name) => _generateWidget(tittle, name)).toList(),
    );
  }

  void _scrollToSelectedContent(GlobalKey expansionTileKey) {
    final keyContext = expansionTileKey.currentContext;
    if (keyContext != null) {
      Future.delayed(Duration(milliseconds: 200)).then((value) {
        Scrollable.ensureVisible(keyContext,
            duration: Duration(milliseconds: 200));
      });
    }
  }

  /// 生成 ExpansionTile 下的 ListView 的单个组件
  Widget _generateWidget(String key, VideoData name) {
    int? index;
    index = listVideos[key]?.indexOf(name);
    // print(name.name);
    // print(index);
    // exit(0);
    IconData iconData;
    iconData = Icons.cloud;
    var keys = "cctv";

    /// 使用该组件可以使宽度撑满
    return FractionallySizedBox(
      child: Container(
          //height: 1800,
          //width: 80,
          margin: EdgeInsets.only(bottom: 5),
          //margin: EdgeInsets.only(right: 5),
          alignment: Alignment.center,
          //decoration: BoxDecoration(color: Colors.black),
          child: ListTile(
            dense: true,
            selected: selectIndex == index && key == keys,
            selectedTileColor: Colors.black54,
            leading: Icon(
              iconData,
              color: selectIndex == index && key == keys
                  ? Colors.white
                  : Colors.black,
              textDirection: TextDirection.ltr,
            ),
            title: Text(
              name.name,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: selectIndex == index && key == keys
                    ? Colors.white
                    : Colors.black,
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
              await _videoPlayerController.reset();
              //  _videoPlayerController=FijkPlayer();
              await _videoPlayerController.setDataSource(name.path,
                  autoPlay: true);
              //_videoPlayerController.enterFullScreen();
              // await _videoPlayerController.start();
              setState(() {
                selectIndex = index!;
                keys = key;
              });
              Navigator.of(context).pop();
            },
          )),
    );
  }
}

// import 'package:fijkplayer/fijkplayer.dart';
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: VideoScreen(url: 'http://dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221226457/index.m3u8',),
//     );
//   }
// }
// class VideoScreen extends StatefulWidget {
//   final String url;
//
//   VideoScreen({required this.url});
//
//   @override
//   _VideoScreenState createState() => _VideoScreenState();
// }

// class _VideoScreenState extends State<VideoScreen> {
//   final FijkPlayer player = FijkPlayer();
//
//   _VideoScreenState();
//
//   @override
//   void initState() {
//     super.initState();
//     player.setDataSource(widget.url, autoPlay: true);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(title: Text("Fijkplayer Example")),
//         body: Container(
//           alignment: Alignment.center,
//           child:
//           FractionallySizedBox(
//             child: FijkView(
//               //height: 8000,
//               player: player,
//             ),
//           )
//         ));
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     player.release();
//   }
// }
