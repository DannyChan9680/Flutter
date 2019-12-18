import 'package:flutter/material.dart';
import 'package:mystocks/view/ImagesPage.dart';
import 'view/WyNewsPage.dart';
import 'view/MilitaryPage.dart';
import 'view/VideoPage.dart';
import 'view/ImagesPage.dart';
import 'view/EducationPage.dart';
import 'view/FinancePage.dart';
import 'view/SciencePage.dart';
import 'view/SportsPage.dart';
/**
 * 主页
 */
class HomePage extends StatefulWidget { 
  @override
  NewsPageState createState() => NewsPageState();
}


class NewsPageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    //返回一个默认的tab控制器，用于tabBar和tabBarView的联动控制
    return new DefaultTabController(
      //length表示一个有几个标签栏
      length:8,
      //返回一个包含了appBar和body内容区域的脚手架
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text('网易新闻'),
          //标签栏位置存于appBar的底部，tabs是一个widget数组，就是每个标签栏的内容
          bottom: new TabBar(
            tabs: <Widget>[
              new Tab(text: '新闻',),
              new Tab(text: '军事',),
              new Tab(text: '财经',),
              new Tab(text: '科技',),
              new Tab(text: '体育',),
              new Tab(text: '时尚',),
              new Tab(text: '教育',),
              new Tab(text: '视频',),
            ],
            //标签颜色
            labelColor: Colors.black,
            //未被选中的标签的颜色
            isScrollable: true,
            unselectedLabelColor: Colors.white,
            labelStyle: new TextStyle(fontSize: 20.0),
          ),
        ),
     body: new TabBarView(
       children: <Widget>[
        new Center(child: new WyNewsPage()),
        new Center(child: new MilitaryPage()),
        new Center(child: new FinancePage()),
        new Center(child: new SciencePage()),
        new Center(child: new SportsPage()),
        new Center(child: new ImagesPage()),
        new Center(child: new EducationPage()),
        new Center(child: new VideoPage()),
       ],
     )
      ),
    );
  }
}