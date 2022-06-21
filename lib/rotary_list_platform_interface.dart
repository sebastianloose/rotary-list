import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'rotary_list_method_channel.dart';

abstract class RotaryListPlatform extends PlatformInterface {
  /// Constructs a RotaryListPlatform.
  RotaryListPlatform() : super(token: _token);

  static final Object _token = Object();

  static RotaryListPlatform _instance = MethodChannelRotaryList();

  /// The default instance of [RotaryListPlatform] to use.
  ///
  /// Defaults to [MethodChannelRotaryList].
  static RotaryListPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [RotaryListPlatform] when
  /// they register themselves.
  static set instance(RotaryListPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
