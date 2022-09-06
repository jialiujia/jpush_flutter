import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jpush_flutter/jpush_flutter_method_channel.dart';

void main() {
  MethodChannelJpushFlutter platform = MethodChannelJpushFlutter();
  const MethodChannel channel = MethodChannel('jpush_flutter');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
