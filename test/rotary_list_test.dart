import 'package:flutter_test/flutter_test.dart';
import 'package:rotary_list/rotary_list.dart';
import 'package:rotary_list/rotary_list_platform_interface.dart';
import 'package:rotary_list/rotary_list_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockRotaryListPlatform 
    with MockPlatformInterfaceMixin
    implements RotaryListPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final RotaryListPlatform initialPlatform = RotaryListPlatform.instance;

  test('$MethodChannelRotaryList is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelRotaryList>());
  });

  test('getPlatformVersion', () async {
    RotaryList rotaryListPlugin = RotaryList();
    MockRotaryListPlatform fakePlatform = MockRotaryListPlatform();
    RotaryListPlatform.instance = fakePlatform;
  
    expect(await rotaryListPlugin.getPlatformVersion(), '42');
  });
}
