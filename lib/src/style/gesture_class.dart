import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';

class GestureClass {
  /// Responsible for all the gestures for the `Division` widget
  ///
  /// ```dart
  /// Division(
  ///   style: StyleClass()
  ///     ..width(100)
  ///     ..height(150)
  ///     ..borderRadius(all: 30.0)
  ///     ..backgroundColor(hex('#eeeeee')),
  ///   gesture: GestureClass()
  ///     ..onTap(() => print('Widget pressed!'))
  ///     ..onLongPress(() => print('Widget longpress)),
  ///   child: Text('Some text),
  /// )
  /// ```
  GestureClass(
      {this.behavior,
      this.excludeFromSemantics = false,
      this.dragStartBehavior = DragStartBehavior.start});

  /// How this gesture detector should behave during hit testing.
  ///
  /// This defaults to [HitTestBehavior.deferToChild] if [child] is not null and
  /// [HitTestBehavior.translucent] if child is null.
  final HitTestBehavior behavior;

  /// Whether to exclude these gestures from the semantics tree. For
  /// example, the long-press gesture for showing a tooltip is
  /// excluded because the tooltip itself is included in the semantics
  /// tree directly and so having a gesture to show it would result in
  /// duplication of information.
  final bool excludeFromSemantics;

  /// Determines the way that drag start behavior is handled.
  ///
  /// If set to [DragStartBehavior.start], gesture drag behavior will
  /// begin upon the detection of a drag gesture. If set to
  /// [DragStartBehavior.down] it will begin when a down event is first detected.
  ///
  /// In general, setting this to [DragStartBehavior.start] will make drag
  /// animation smoother and setting it to [DragStartBehavior.down] will make
  /// drag behavior feel slightly more reactive.
  ///
  /// By default, the drag start behavior is [DragStartBehavior.start].
  ///
  /// Only the [onStart] callbacks for the [VerticalDragGestureRecognizer],
  /// [HorizontalDragGestureRecognizer] and [PanGestureRecognizer] are affected
  /// by this setting.
  ///
  /// See also:
  ///
  ///  * [DragGestureRecognizer.dragStartBehavior], which gives an example for the different behaviors.
  final DragStartBehavior dragStartBehavior;

  void Function() $onTap;
  void Function(TapUpDetails) $onTapUp;
  void Function(TapDownDetails) $onTapDown;
  void Function() $onTapCancel;
  void Function() $onDoubleTap;

  void Function() $onLongPress;
  void Function(LongPressStartDetails) $onLongPressStart;
  void Function(LongPressEndDetails) $onLongPressEnd;
  void Function(LongPressMoveUpdateDetails) $onLongPressMoveUpdate;
  void Function() $onLongPressUp;

  void Function(ForcePressDetails) $onForcePressStart;
  void Function(ForcePressDetails) $onForcePressEnd;
  void Function(ForcePressDetails) $onForcePressPeak;
  void Function(ForcePressDetails) $onForcePressUpdate;

  void Function(DragStartDetails) $onVerticalDragStart;
  void Function(DragEndDetails) $onVerticalDragEnd;
  void Function(DragDownDetails) $onVerticalDragDown;
  void Function() $onVerticalDragCancel;
  void Function(DragUpdateDetails) $onVerticalDragUpdate;

  void Function(DragStartDetails) $onHorizontalDragStart;
  void Function(DragEndDetails) $onHorizontalDragEnd;
  void Function(DragDownDetails) $onHorizontalDragDown;
  void Function() $onHorizontalDragCancel;
  void Function(DragUpdateDetails) $onHorizontalDragUpdate;

  void Function(DragStartDetails) $onPanStart;
  void Function(DragEndDetails) $onPanEnd;
  void Function() $onPanCancel;
  void Function(DragDownDetails) $onPanDown;
  void Function(DragUpdateDetails) $onPanUpdate;

  void Function(ScaleStartDetails) $onScaleStart;
  void Function(ScaleEndDetails) $onScaleEnd;
  void Function(ScaleUpdateDetails) $onScaleUpdate;

  void onTap(void Function() function) => $onTap = function;

  void onTapUp(void Function(TapUpDetails) function) => $onTapUp = function;

  void onTapDown(void Function(TapDownDetails) function) =>
      $onTapDown = function;

  void onTapCancel(void Function() function) => $onTapCancel = function;

  void onDoubleTap(void Function() function) => $onDoubleTap = function;

  void onLongPress(void Function() function) => $onLongPress = function;

  void onLongPressStart(void Function(LongPressStartDetails) function) =>
      $onLongPressStart = function;

  void onLongPressEnd(void Function(LongPressEndDetails) function) =>
      $onLongPressEnd = function;

  void onLongPressMoveUpdate(
          void Function(LongPressMoveUpdateDetails) function) =>
      $onLongPressMoveUpdate = function;

  void onLongPressUp(void Function() function) => $onLongPressUp = function;

  void onVerticalDragStart(void Function(DragStartDetails) function) =>
      $onVerticalDragStart = function;

  void onVerticalDragEnd(void Function(DragEndDetails) function) =>
      $onVerticalDragEnd = function;

  void onVerticalDragDown(void Function(DragDownDetails) function) =>
      $onVerticalDragDown = function;

  void onVerticalDragCancel(void Function() function) =>
      $onVerticalDragCancel = function;

  void onVerticalDragUpdate(void Function(DragUpdateDetails) function) =>
      $onVerticalDragUpdate = function;

  void onHorizontalDragStart(void Function(DragStartDetails) function) =>
      $onHorizontalDragStart = function;

  void onHorizontalDragEnd(void Function(DragEndDetails) function) =>
      $onHorizontalDragEnd = function;

  void onHorizontalDragDown(void Function(DragDownDetails) function) =>
      $onHorizontalDragDown = function;

  void onHorizontalDragCancel(void Function() function) =>
      $onHorizontalDragCancel = function;

  void onHorizontalDragUpdate(void Function(DragUpdateDetails) function) =>
      $onHorizontalDragUpdate = function;

  void onForcePressStart(void Function(ForcePressDetails) function) =>
      $onForcePressStart = function;

  void onForcePressEnd(void Function(ForcePressDetails) function) =>
      $onForcePressEnd = function;

  void onForcePressPeak(void Function(ForcePressDetails) function) =>
      $onForcePressPeak = function;

  void onForcePressUpdate(void Function(ForcePressDetails) function) =>
      $onForcePressUpdate = function;

  void onPanStart(void Function(DragStartDetails) function) =>
      $onPanStart = function;

  void onPanEnd(void Function(DragEndDetails) function) => $onPanEnd = function;

  void onPanCancel(void Function() function) => $onPanCancel = function;

  void onPanDown(void Function(DragDownDetails) function) =>
      $onPanDown = function;

  void onPanUpdate(void Function(DragUpdateDetails) function) =>
      $onPanUpdate = function;

  void onScaleStart(void Function(ScaleStartDetails) function) =>
      $onScaleStart = function;

  void onScaleEnd(void Function(ScaleEndDetails) function) =>
      $onScaleEnd = function;

  void onScaleUpdate(void Function(ScaleUpdateDetails) function) =>
      $onScaleUpdate = function;
}

class G extends GestureClass {
  /// Responsible for all the gestures for the `Division` widget
  ///
  /// ```dart
  /// Division(
  ///   style: S()
  ///     ..width(100)
  ///     ..height(150)
  ///     ..borderRadius(all: 30.0)
  ///     ..backgroundColor(hex('#eeeeee')),
  ///   gesture: G()
  ///     ..onTap(() => print('Widget pressed!'))
  ///     ..onLongPress(() => print('Widget longpress)),
  ///   child: Text('Some text),
  /// )
  /// ```
  G(
      {this.behavior,
      this.excludeFromSemantics = false,
      this.dragStartBehavior = DragStartBehavior.start})
      : super(
            behavior: behavior,
            excludeFromSemantics: excludeFromSemantics,
            dragStartBehavior: dragStartBehavior);

  /// How this gesture detector should behave during hit testing.
  ///
  /// This defaults to [HitTestBehavior.deferToChild] if [child] is not null and
  /// [HitTestBehavior.translucent] if child is null.
  final HitTestBehavior behavior;

  /// Whether to exclude these gestures from the semantics tree. For
  /// example, the long-press gesture for showing a tooltip is
  /// excluded because the tooltip itself is included in the semantics
  /// tree directly and so having a gesture to show it would result in
  /// duplication of information.
  final bool excludeFromSemantics;

  /// Determines the way that drag start behavior is handled.
  ///
  /// If set to [DragStartBehavior.start], gesture drag behavior will
  /// begin upon the detection of a drag gesture. If set to
  /// [DragStartBehavior.down] it will begin when a down event is first detected.
  ///
  /// In general, setting this to [DragStartBehavior.start] will make drag
  /// animation smoother and setting it to [DragStartBehavior.down] will make
  /// drag behavior feel slightly more reactive.
  ///
  /// By default, the drag start behavior is [DragStartBehavior.start].
  ///
  /// Only the [onStart] callbacks for the [VerticalDragGestureRecognizer],
  /// [HorizontalDragGestureRecognizer] and [PanGestureRecognizer] are affected
  /// by this setting.
  ///
  /// See also:
  ///
  ///  * [DragGestureRecognizer.dragStartBehavior], which gives an example for the different behaviors.
  final DragStartBehavior dragStartBehavior;
}
