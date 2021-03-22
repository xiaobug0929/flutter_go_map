import 'dart:io';

import 'package:url_launcher/url_launcher.dart';

/// 创建日期: 2021/3/22
/// 作者: lijianbin
/// 描述:

///高德地图路径规划
///名称和经纬度,至少有一种
///起点不配置的话,默认取当前位置
///需要注意,iOS9之后app想调起高德地图，必须在自己app设置中配置白名单
///配置方法：
/// 1、找到您的Info.plist文件
/// 2、在文件中添加key：LSApplicationQueriesSchemes，类型是Array，如果曾经添加过，无需再次添加。
/// 3、Array中添加一个item，类型为String，值为iosamap。
///
/// 官方文档 https://developer.amap.com/api/amap-mobile/guide/android/route
Future<bool> gaodeDirection({
  ///起始点名称
  String originName = '',

  ///起始点经度
  double originLongitude,

  ///起始点维度
  double originLatitude,

  ///终点名称
  String destName = '',

  ///终点经度
  double destLongitude,

  ///终点维度
  double destLatitude,

  ///是否偏移(0:lat 和 lon 是已经加密后的,不需要国测加密; 1:需要国测加密)
  int dev = 0,

  ///导航模式
  int t = 0,
}) async {
  var url = Platform.isAndroid ? 'amapuri://route/plan/?' : 'iosamap://path?';
  //起点
  url += "sname=$originName&slat=$originLatitude&slon=$originLongitude";
  //终点
  url += "&dname=$destName&dlat=$destLatitude&dlon=$destLongitude";
  //导航模式
  url += '&t=$t';
  //是否需要加密
  url += '&dev=$dev';
  //编码,不编的话ios会有问题
  url = Uri.encodeFull(url);
  var ret = await canLaunch(url);
  return ret ? launch(url) : false;
}
