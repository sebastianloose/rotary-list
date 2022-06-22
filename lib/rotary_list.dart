import 'package:flutter/material.dart';
import 'package:rotary_list/rotary_list_method_channel.dart';

class RotaryList extends StatelessWidget {
  final int scrollFactor;
  final Duration duration;
  final Curve curve;
  final List<Widget> children;

  RotaryList({
    Key? key,
    this.scrollFactor = 100,
    this.duration = const Duration(milliseconds: 500),
    this.curve = Curves.fastOutSlowIn,
    required this.children,
  }) : super(key: key);

  final ScrollController _controller = ScrollController();

  void onRotaryEvent(int value) {
    _controller.animateTo(
      _controller.offset + (100 * value),
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    MethodChannelRotaryList(
      ((i) => _controller.animateTo(
            _controller.offset + (scrollFactor * i),
            duration: duration,
            curve: curve,
          )),
    );
    return ListView(
      controller: _controller,
      children: children,
    );
  }
}
