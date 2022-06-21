import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'rotary_list_platform_interface.dart';

/// An implementation of [RotaryListPlatform] that uses method channels.
class MethodChannelRotaryList extends RotaryListPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('rotary_list');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
