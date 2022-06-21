import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rotary_list/rotary_list_method_channel.dart';

void main() {
  MethodChannelRotaryList platform = MethodChannelRotaryList();
  const MethodChannel channel = MethodChannel('rotary_list');

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
