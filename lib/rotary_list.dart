import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rotary_list/rotary_list_method_channel.dart';

class RotaryList extends ListView {
  final int scrollFactor;
  final Duration scrollAnimationDuration;
  final Curve scrollCurve;
  final bool reverseScroll;

  RotaryList({
    this.scrollFactor = 100,
    this.scrollAnimationDuration = const Duration(milliseconds: 200),
    this.scrollCurve = Curves.fastOutSlowIn,
    this.reverseScroll = false,

    // ListView params and default values
    Key? key,
    Axis scrollDirection = Axis.vertical,
    bool reverse = false,
    ScrollController? controller,
    bool? primary,
    ScrollPhysics? physics,
    bool shrinkWrap = false,
    EdgeInsetsGeometry? padding,
    double? itemExtent,
    Widget? prototypeItem,
    bool addAutomaticKeepAlives = true,
    bool addRepaintBoundaries = true,
    bool addSemanticIndexes = true,
    double? cacheExtent,
    List<Widget> children = const <Widget>[],
    int? semanticChildCount,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
    ScrollViewKeyboardDismissBehavior keyboardDismissBehavior =
        ScrollViewKeyboardDismissBehavior.manual,
    String? restorationId,
    Clip clipBehavior = Clip.hardEdge,
  }) : super(
          key: key,
          scrollDirection: scrollDirection,
          reverse: reverse,
          controller: controller ?? ScrollController(),
          primary: primary,
          physics: physics,
          shrinkWrap: shrinkWrap,
          padding: padding,
          itemExtent: itemExtent,
          prototypeItem: prototypeItem,
          addAutomaticKeepAlives: addAutomaticKeepAlives,
          addRepaintBoundaries: addRepaintBoundaries,
          addSemanticIndexes: addSemanticIndexes,
          cacheExtent: cacheExtent,
          children: children,
          semanticChildCount: semanticChildCount,
          dragStartBehavior: dragStartBehavior,
          keyboardDismissBehavior: keyboardDismissBehavior,
          restorationId: restorationId,
          clipBehavior: clipBehavior,
        ) {
    MethodChannelRotaryList(onRotaryEvent);
  }

  RotaryList.builder({
    this.scrollFactor = 100,
    this.scrollAnimationDuration = const Duration(milliseconds: 200),
    this.scrollCurve = Curves.fastOutSlowIn,
    this.reverseScroll = false,

    // ListView.builder params and default values
    Key? key,
    Axis scrollDirection = Axis.vertical,
    bool reverse = false,
    ScrollController? controller,
    bool? primary,
    ScrollPhysics? physics,
    bool shrinkWrap = false,
    EdgeInsetsGeometry? padding,
    double? itemExtent,
    Widget? prototypeItem,
    required IndexedWidgetBuilder itemBuilder,
    ChildIndexGetter? findChildIndexCallback,
    int? itemCount,
    bool addAutomaticKeepAlives = true,
    bool addRepaintBoundaries = true,
    bool addSemanticIndexes = true,
    double? cacheExtent,
    int? semanticChildCount,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
    ScrollViewKeyboardDismissBehavior keyboardDismissBehavior =
        ScrollViewKeyboardDismissBehavior.manual,
    String? restorationId,
    Clip clipBehavior = Clip.hardEdge,
  }) : super.builder(
          key: key,
          scrollDirection: scrollDirection,
          reverse: reverse,
          controller: controller ?? ScrollController(),
          primary: primary,
          physics: physics,
          shrinkWrap: shrinkWrap,
          padding: padding,
          itemExtent: itemExtent,
          prototypeItem: prototypeItem,
          itemBuilder: itemBuilder,
          findChildIndexCallback: findChildIndexCallback,
          itemCount: itemCount,
          addAutomaticKeepAlives: addAutomaticKeepAlives,
          addRepaintBoundaries: addRepaintBoundaries,
          addSemanticIndexes: addSemanticIndexes,
          cacheExtent: cacheExtent,
          semanticChildCount: semanticChildCount,
          dragStartBehavior: dragStartBehavior,
          keyboardDismissBehavior: keyboardDismissBehavior,
          restorationId: restorationId,
          clipBehavior: clipBehavior,
        ) {
    MethodChannelRotaryList(onRotaryEvent);
  }

  void onRotaryEvent(int value) {
    if (controller == null) return;
    int direction = reverseScroll ? -1 : 1;
    controller!.animateTo(
      controller!.offset + scrollFactor * value * direction,
      duration: scrollAnimationDuration,
      curve: scrollCurve,
    );
  }
}
