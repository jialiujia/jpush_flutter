import 'package:flutter_test/flutter_test.dart';
import 'package:jpush_flutter/jpush_flutter.dart';
import 'package:jpush_flutter/jpush_flutter_platform_interface.dart';
import 'package:jpush_flutter/jpush_flutter_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockJpushFlutterPlatform 
    with MockPlatformInterfaceMixin
    implements JpushFlutterPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final JpushFlutterPlatform initialPlatform = JpushFlutterPlatform.instance;

  test('$MethodChannelJpushFlutter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelJpushFlutter>());
  });

  test('getPlatformVersion', () async {
    JpushFlutter jpushFlutterPlugin = JpushFlutter();
    MockJpushFlutterPlatform fakePlatform = MockJpushFlutterPlatform();
    JpushFlutterPlatform.instance = fakePlatform;
  
    expect(await jpushFlutterPlugin.getPlatformVersion(), '42');
  });
}
