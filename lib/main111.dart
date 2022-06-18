
import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:flutter_tv/auto_focus.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'dart:io';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class TVUrl {
  final String name;
  final String url;

  TVUrl(this.name, this.url);

  TVUrl.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        url = json['url'];

  Map<String, dynamic> toJson() =>
      {
        'name': name,
        'url': url,
      };
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  VlcPlayerController _videoPlayerController;
  bool _menuVisible = true; //是否显示 频道列表
  var _addressMap = <String, String>{}; //名称 地址集合
  var _curAddress = "http://ivi.bupt.edu.cn/hls/cctv1hd.m3u8"; //当前地址

  Future<void> initializePlayer() async {}

  void getAddressList() async {
    var url = 'http://xxxxxxx:8000/tvlist';
    Dio _dio = Dio();
    String result;
    try {
      Response response = await _dio.get(url); //2
      if (response.statusCode == HttpStatus.ok) {
        var data = jsonDecode(response.toString()); //3
        var listData = data["list"];
        List urlList = listData.map((m) => new TVUrl.fromJson(m)).toList();
        _addressMap.clear();
        for (int i = 0; i < urlList.length; i++) {
          TVUrl tvUrl = urlList[i];
          _addressMap[tvUrl.name] = tvUrl.url;
        }
        setState(() {});
      } else {
        result =
        'Error getAddressList status ${response.statusCode}';
        print(result);
      }
    } catch (exception) {
      result = exception.toString();
      print(result);
    }
  }

  List<String> getDataList() {
    return _addressMap.keys.toList();
  }

  List<Widget> getWidgetList() {
    return getDataList().map((item) => getItemContainer(item)).toList();
  }

  Widget getItemContainer(String item) {
    return AutoFocus(
      child: Card(
        color: Color.fromARGB(0, 0, 0, 0),
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () async {
            _curAddress = _addressMap[item];
            setState(() {});
            await _videoPlayerController.setMediaFromNetwork(
              _curAddress,
              hwAcc: HwAcc.FULL,
            );


            print('Card tapped.' + _curAddress);
          },
          child: Container(
            color: Color.fromARGB(10, 0, 0, 0),
            //width: 100,
            //height: 50,
            child: Center(
                child: Text(item,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25))),
          ),
        ),
      ),
      //列表显示 按下确定 换台
      onEnter: () async {
        if (_menuVisible) {
          print('Card enter.' + _addressMap[item]);
          _curAddress = _addressMap[item];
          await _videoPlayerController.setMediaFromNetwork(
            _curAddress,
            hwAcc: HwAcc.FULL,
          );
        }
      },
      //按下菜单
      onMenu: () {
        print('Card menu');
        _menuVisible = !_menuVisible;
        setState(() {});
      },
      //列表隐藏时 选中当前频道 自动换台
      onFocused: () async {
        if (!_menuVisible) {
          print('Card focused.' + _addressMap[item]);
          _curAddress = _addressMap[item];
          await _videoPlayerController.setMediaFromNetwork(
            _curAddress,
            hwAcc: HwAcc.FULL,
          );
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VlcPlayerController.network(
      _curAddress,
      hwAcc: HwAcc.FULL,
      autoPlay: true,
      options: VlcPlayerOptions(),
    );

    _addressMap["CCTV-1"] = 'http://ivi.bupt.edu.cn/hls/cctv1hd.m3u8';
    _addressMap["CCTV-2"] = "http://ivi.bupt.edu.cn/hls/cctv2hd.m3u8";
    _addressMap["湖南卫视"] = "http://ivi.bupt.edu.cn/hls/hunanhd.m3u8";

    //获取地址
    getAddressList();
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
      // appBar: AppBar(),
        body: Center(
          child: Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: <Widget>[
              VlcPlayer(
                controller: _videoPlayerController,
                aspectRatio: 16 / 9,
                placeholder: Center(child: CircularProgressIndicator()),
              ),
              AnimatedOpacity(
                duration: Duration(milliseconds: 300),
                opacity: _menuVisible ? 1.0 : 0.0,
                child: AutoFocusContainer(
                  child: Container(
                    decoration: BoxDecoration(color: Color(0x90000033)),
                    margin: EdgeInsets.only(top: 0),
                    child: GridView.count(
                      //水平子Widget之间间距
                      crossAxisSpacing: 15.0,
                      //垂直子Widget之间间距
                      mainAxisSpacing: 20.0,
                      //GridView内边距
                      padding: EdgeInsets.all(10.0),
                      //一行的Widget数量
                      crossAxisCount: 6,
                      //子Widget宽高比例
                      childAspectRatio: 2.0,
                      //子Widget列表
                      children: getWidgetList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}