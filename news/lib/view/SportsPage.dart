import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:mystocks/Util/Constants.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_refresh/flutter_refresh.dart';
import 'package:mystocks/model/ListEnity.dart';
import 'package:mystocks/model/sports_enity.dart';
import 'detail/NewsWebPage.dart';
import 'package:http/http.dart' as http;

/**
 * 网易新闻页面
 */
class SportsPage extends StatefulWidget {
  SportsPage({Key key}) : super(key: key);

  @override
  SportsPageState createState() => new SportsPageState();
}

class SportsPageState extends State<SportsPage> {
  List<ListEnity> listData = [];
  int lastone_id;
  int lastone_id_start = 0;
  int lastone_id_end = 0;
  bool has_next_page = true;

  bool issuccessful = true;
  var start_index = 0;
  var end_index = 10;

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
                return getItem(position);
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
    BA8E6OEOwangning data = listData[i].data;
    String type = listData[i].type;
    if ("main" == type) {
      String articleTitle = data.title;
      String time_str = data.ptime;
      return new GestureDetector(
        child: Padding(
          padding: new EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          child: new Column(
            children: <Widget>[
              new Row(
                crossAxisAlignment: CrossAxisAlignment.start, //纵向对齐方式：起始边对齐
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  new Expanded(
                    child: Container(
                      height: 100.0,
                      child: getImage(data.imgsrc),
                      alignment: FractionalOffset.center,
                    ),
                    flex: 1,
                  ),
                  new Expanded(
                    child: Container(
                      height: 100.0,
                      margin: new EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Container(
                            child: new Text(
                              articleTitle,
                              style: new TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.w700),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            alignment: FractionalOffset.topLeft,
                          ),
                          new Container(
                            child: new Text("${data.digest}",
                                style: new TextStyle(fontSize: 16.0),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis),
                            alignment: Alignment.topLeft,
                          ),
                          new Expanded(
                            child: new Container(
                              margin:
                                  new EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                              child: new Stack(
                                children: <Widget>[
                                  new Container(
                                    child: new Text("${data.source}",
                                        style: new TextStyle(fontSize: 10.0)),
                                    alignment: FractionalOffset.bottomLeft,
                                  ),
                                  new Container(
                                    child: new Text(time_str,
                                        style: new TextStyle(fontSize: 10.0)),
                                    alignment: FractionalOffset.bottomRight,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    flex: 3,
                  ),
                ],
              ),
              new Divider(), //分割线
            ],
          ),
        ),
        onTap: () {
          onItemClick(i, articleTitle);
        },
      );
    } else {
      print("加载底线");
      return new Container(
        height: 50.0,
        child: new Text(
          "——   我也是有底线的   ——",
          style: new TextStyle(fontSize: 16.0, color: Colors.black38),
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
    String url =
        "https://3g.163.com/touch/reconstruct/article/list/BA8E6OEOwangning/" +
            start_index.toString() +
            "-" +
            end_index.toString() +
            ".html";
    print("请求的url===》" + url);
    try {
      var client = http.Client();
      http.Response response = await client.get(url);
      String response_str = response.body;
      if (response_str.isNotEmpty) {
        var jsonString =
            response_str.substring("artiList(".length, response_str.length - 1);
        print("请求后的jsonString===》" + jsonString);
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
    } catch (e) {
      print(e);
    }
  }

  /**
   * 列表中图片加载
   */
  getImage(String img_url) {
    return new CachedNetworkImage(
      imageUrl: img_url,
      placeholder: (context, url) => new Center(
        child: CircularProgressIndicator(),
      ),
      errorWidget: (context, url, error) => new Icon(Icons.error),
    );
  }

  /**
   * 列表点击
   */
   void onItemClick(int i, String articleTitle) {
    String h5_url;
    if ((listData[i].data as BA8E6OEOwangning).url == null) {
        h5_url = (listData[i].data as BA8E6OEOwangning).skipURL;
    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => new NewsWebPage(h5_url, '新闻详情')));
    }else{
       h5_url = (listData[i].data as BA8E6OEOwangning).url;
    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => new NewsWebPage(h5_url, '新闻详情')));
    }
  }

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

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
      var news = new sports_enity.fromJson(jsonString);
      if (mounted) {
        setState(() {
          if (request_type == REFRESH_REQIEST) {
            listData.clear();
            for (BA8E6OEOwangning data in news.bA8E6OEOwangning) {
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
            for (BA8E6OEOwangning data in news.bA8E6OEOwangning) {
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
}
