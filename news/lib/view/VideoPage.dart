import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'package:mystocks/Util/Constants.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_refresh/flutter_refresh.dart';
import 'package:mystocks/model/ListEnity.dart';
import 'package:mystocks/model/video_enity.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:http/http.dart' as http;

/**
 * 视频页面
 */
class VideoPage extends StatefulWidget {
  VideoPage({Key key}) : super(key: key);

  @override
  VideoPageState createState() => new VideoPageState();
}

class VideoPageState extends State<VideoPage> {
  VideoPlayerController _controller;
  Future _initializeVideoPlayerFuture;
  ChewieController chewieController;
  List<ListEnity> listData = [];
  int start_index = 0;
  int end_index = 10;
  bool _isPlaying = false;
  bool issuccessful = true;
  int lastone_id;
  int lastone_id_start = 0;
  int lastone_id_end = 0;
  bool has_next_page = true;

  VideoList data;
  @override
  void initState() {
    super.initState();
    getDatas(START_REQUEST);
  }

  getBody() {
    if (issuccessful == true) {
      if (listData.isEmpty) {
        // 加载菊花
        return CircularProgressIndicator();
      } else {
        return new Refresh(
            onFooterRefresh: onFooterRefresh,
            onHeaderRefresh: pullToRefresh,
            child: ListView.builder(
              itemCount: (listData == null) ? 0 : listData.length,
              itemBuilder: (BuildContext context, int position) {
                return new Container(
                  child: new Column(
                    children: <Widget>[getItem(position)],
                  ),
                );
              },
              physics: new AlwaysScrollableScrollPhysics(),
              shrinkWrap: true,
            ));
      }
    } else {
      return new Refresh(
          onFooterRefresh: onFooterRefresh,
          onHeaderRefresh: pullToRefresh,
          child: ListView.builder(
            itemCount: 1,
            itemBuilder: (BuildContext context, int position) {
              return Center(
                child: new Text("异常",
                    style: new TextStyle(fontSize: 40.0, color: Colors.black)),
              );
            },
            physics: new AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: getBody(),
    );
  }

  /**
   * 列表item
   */
  Widget getItem(int i) {
    VideoList data = listData[i].data;
    String type = listData[i].type;
    if ("main" == type) {
      return new GestureDetector(
        child: Padding(
          padding: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
          child: new Column(
            children: <Widget>[
              new Row(
                crossAxisAlignment: CrossAxisAlignment.start, //纵向对齐方式：起始边对齐
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  new Expanded(
                    child: Container(
                      height: 260.0,
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Container(
                            child: getController(data.m3u8url),
                            alignment: FractionalOffset.topCenter,
                          ),
                          new Expanded(
                            child: new Container(
                              height: 10,
                              child: new Stack(
                                children: <Widget>[
                                  new Container(
                                    child: new Text("播放量${data.replyCount}",
                                        style: new TextStyle(fontSize: 10.0)),
                                    alignment: FractionalOffset.bottomCenter,
                                  ),
                                  new Container(
                                    child: new Text('${data.ptime}',
                                        style: new TextStyle(fontSize: 10.0)),
                                    alignment: FractionalOffset.bottomRight,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              new Divider(), //分割线
            ],
          ),
        ),
        onTap: () {},
      );
    } else {
      print("加载底线");
      return new Container(
        height: 50.0,
        child: new Text(
          "——   我也是有底线的   ——",
          style: new TextStyle(fontSize: 16.0, color: Colors.black),
        ),
        alignment: FractionalOffset.center,
      );
    }
  }

  /**
   * 请求数据
   * isLoadMore 是否为加载更多
   */
  void getDatas(int request_type) async {
    if (request_type == REFRESH_REQIEST) {
      start_index = 0;
      end_index = 10;
    }
    String url = "http://c.m.163.com/nc/video/home/" +
        // String url="https://3g.163.com/touch/nc/api/video/recommend/Video_Recom/"+
        start_index.toString() +
        "-" +
        end_index.toString() +
        ".html";
    // ".do";
    print("请求的url===》" + url);
    try {
      /*1.原生请求*/
      // var client = http.Client();
      // http.Response response = await client.get(url);
      // String  response_str = response.body;

      /*2.dio请求*/
      // Dio dio = new Dio();
      // Response response = await dio.get(url);
      // String response_str = response.toString();

      /*3.HttpClient请求*/
      // 实例化一个HttpCLient对象
      // HttpClient httpClient = new HttpClient();
      // // 发起请求
      // HttpClientRequest request = await httpClient.getUrl(Uri.parse(url));
      // // 等待服务器返回数据
      // HttpClientResponse response = await request.close();
      // // 使用utf-8.decoder从response解析数据
      // String response_str = await response.transform(utf8.decoder).join();
      // // 关闭
      // httpClient.close();

      /*4.http请求*/
      var client = http.Client();
      http.Response response = await client.get(url);
      String response_str = response.body;
      if (mounted) {
        setState(() {
          if (response_str.isNotEmpty) {
            var jsonString = response_str.substring(''.length);
            print("请��后的jsonString===》" + jsonString);
            Map<String, dynamic> responseJson = json.decode(jsonString);
            DealDatas(responseJson, request_type);
            start_index = end_index + 1;
            end_index = start_index + 9;
          } else {
            Fluttertoast.showToast(
                msg: "已经没有新数据了",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIos: 1,
                backgroundColor: Colors.black,
                textColor: Colors.white);
          }
        });
      }
    } catch (e) {
      print(e);
    }
  }

  /**
   * 列表中播放视频加载
   */
  getController(String url) {
    //配置视频地址
    _controller = VideoPlayerController.network(url);
    return new Chewie(
      controller: chewieController = ChewieController(
        videoPlayerController: _controller,
        aspectRatio: 16 / 9, //宽高比
        autoPlay: true, //自动播放
        showControls: true,
        looping: true,
        autoInitialize: false, //在构建UI时不加载视频
      ),
    );
  }

  /**
   *下拉刷新
   */
  Future<Null> pullToRefresh() async {
    getDatas(REFRESH_REQIEST);
    return null;
  }

  Future<Null> onFooterRefresh() async {
    getDatas(LOADMORE_REQIEST);
  }

  /**
   * 处理请求到的数据
   */
  void DealDatas(jsonString, int request_type) {
    try {
      var news = new video_enity.fromJson(jsonString);
      if (mounted) {
        setState(() {
          if (request_type == REFRESH_REQIEST) {
            listData.clear();
            for (VideoList data in news.videolist) {
              ListEnity listEnity = new ListEnity("main", data);
              listData.add(listEnity);
            }
            Fluttertoast.showToast(
                msg: "刷新成功",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIos: 1,
                backgroundColor: Colors.black,
                textColor: Colors.white);
          } else {
            List<ListEnity> list1 = new List<ListEnity>();
            list1.addAll(listData);
            for (VideoList data in news.videolist) {
              ListEnity listEnity = new ListEnity("main", data);
              list1.add(listEnity);
            }
            listData = list1;
          }
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          issuccessful = false;
        });
        print("异常==》" + e.toString());
      }
    }
  }

  /*销毁*/
  // @override
  // void dispose() {
  //   print('dispose');
  //   _controller.dispose();
  //   chewieController.dispose();
  //   super.dispose();
  // }
}
