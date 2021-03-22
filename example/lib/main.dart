import 'package:flutter/material.dart';
import 'package:flutter_go_map/apple_util.dart';
import 'package:flutter_go_map/baidu_util.dart';
import 'package:flutter_go_map/gaode_util.dart';
import 'package:flutter_go_map/tengxun_util.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RaisedButton(
              onPressed: () async {
                var ret = await baidumapDirection(
                  // originName: '西二旗',
                  // originLongitude: 116.43234,
                  // originLatitude: 39.98871,
                  destName: '上地',
                  // destLongitude: 116.346983,
                  // destLatitude: 39.945136,
                  viaPoints: [
                    {'name': '北京西'}
                  ],
                );
                print('$ret');
              },
              child: Text('跳转百度地图'),
            ),
            RaisedButton(
              onPressed: () async {
                var ret = await gaodeDirection(
                  originName: '西二旗',
                  originLongitude: 116.43234,
                  originLatitude: 39.98871,
                  destName: '上地',
                  destLongitude: 116.346983,
                  destLatitude: 39.945136,
                );
                print('$ret');
              },
              child: Text('跳转高德地图'),
            ),
            RaisedButton(
              onPressed: () async {
                var ret = await tengxunDirection(
                  originName: '西二旗',
                  originLongitude: 116.43234,
                  originLatitude: 39.98871,
                  destName: '上地',
                  destLongitude: 116.346983,
                  destLatitude: 39.945136,
                );
                print('$ret');
              },
              child: Text('跳转腾讯地图'),
            ),
            RaisedButton(
              onPressed: () async {
                var ret = await appleDirection(
                  originLongitude: 116.43234,
                  originLatitude: 39.98871,
                  destLongitude: 116.346983,
                  destLatitude: 39.945136,
                );
                print('$ret');
              },
              child: Text('跳转Apple地图'),
            ),
          ],
        ),
      ),
    );
  }
}
