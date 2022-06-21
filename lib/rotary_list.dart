
import 'rotary_list_platform_interface.dart';

class RotaryList {
  Future<String?> getPlatformVersion() {
    return RotaryListPlatform.instance.getPlatformVersion();
  }
}
