
import 'package:url_launcher/url_launcher.dart';

/// 创建日期: 2021/3/19
/// 作者: lijianbin
/// 描述:

///腾讯地图路径规划,支持途经点
///名称和经纬度,至少有一种
///起点不配置的话,默认取当前位置
///
/// 官方文档: https://lbs.qq.com/webApi/uriV1/uriGuide/uriMobileRoute
Future<bool> tengxunDirection({
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

  ///坐标类型
  String coordType = 'bd09ll',

  ///导航模式
  String type = 'drive',

  ///途经点,最多支持3个途经点
  ///参数格式为: [{"name":"北京西","lat":39.902463,"lng":116.327737}]
  ///name和经纬度必须至少有一个,同时存在时,坐标按照经纬度显示,名称按照name显示
  List<Map> viaPoints,
}) async {
  var url = 'qqmap://map/routeplan?';
  //起点
  url += "from=$originName&fromcoord=$originLatitude,$originLongitude";
  //终点
  url += "&to=$destName&tocoord=$destLatitude,$destLongitude";
  //导航模式
  url += '&type=$type';
  //途经点
  if (viaPoints != null && viaPoints.isNotEmpty) {
    url += '&viaPoints={viaPoints:$viaPoints}';
  }
  url += '&referer=OB4BZ-D4W3U-B7VVO-4PJWW-6TKDJ-WPB77';
  //编码,不编的话ios会有问题
  url = Uri.encodeFull(url);
  print('url = $url');
  var ret = await canLaunch(url);
  return ret ? launch(url) : false;
}
