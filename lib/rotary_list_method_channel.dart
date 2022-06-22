import 'package:flutter/services.dart';

class MethodChannelRotaryList {
  late final void Function(int i) _callback;

  MethodChannelRotaryList(void Function(int i) callback) {
    _callback = callback;
    MethodChannel methodChannel = const MethodChannel('rotary_list');
    methodChannel.setMethodCallHandler(callHandler);
  }

  Future<void> callHandler(MethodCall call) async {
    int? value = int.tryParse(call.arguments);
    if (call.method == "rotaryEvent" && value != null) {
      _callback(value);
    }
  }
}
