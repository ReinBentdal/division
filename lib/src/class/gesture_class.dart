import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';

/// Responsible for all the gestures for the `Division` widget
///
/// ```dart
/// Division(
///   style: StyleClass()
///     ..width(100)
///     ..height(150)
///     ..borderRadius(all: 30.0)
///     ..backgroundColor('#eeeeee'),
///   gesture: GestureClass()
///     ..onTap(() => print('Widget pressed!'))
///     ..onLongPress(() => print('Widget longpress)),
///   child: Text('Some text),
/// )
/// ```
class GestureClass {
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

  void Function() _onTap;
  void Function(TapUpDetails) _onTapUp;
  void Function(TapDownDetails) _onTapDown;
  void Function() _onTapCancel;
  void Function() _onDoubleTap;

  void Function() _onLongPress;
  void Function(LongPressStartDetails) _onLongPressStart;
  void Function(LongPressEndDetails) _onLongPressEnd;
  void Function(LongPressMoveUpdateDetails) _onLongPressMoveUpdate;
  void Function() _onLongPressUp;

  void Function(ForcePressDetails) _onForcePressStart;
  void Function(ForcePressDetails) _onForcePressEnd;
  void Function(ForcePressDetails) _onForcePressPeak;
  void Function(ForcePressDetails) _onForcePressUpdate;

  void Function(DragStartDetails) _onVerticalDragStart;
  void Function(DragEndDetails) _onVerticalDragEnd;
  void Function(DragDownDetails) _onVerticalDragDown;
  void Function() _onVerticalDragCancel;
  void Function(DragUpdateDetails) _onVerticalDragUpdate;

  void Function(DragStartDetails) _onHorizontalDragStart;
  void Function(DragEndDetails) _onHorizontalDragEnd;
  void Function(DragDownDetails) _onHorizontalDragDown;
  void Function() _onHorizontalDragCancel;
  void Function(DragUpdateDetails) _onHorizontalDragUpdate;

  void Function(DragStartDetails) _onPanStart;
  void Function(DragEndDetails) _onPanEnd;
  void Function() _onPanCancel;
  void Function(DragDownDetails) _onPanDown;
  void Function(DragUpdateDetails) _onPanUpdate;

  void Function(ScaleStartDetails) _onScaleStart;
  void Function(ScaleEndDetails) _onScaleEnd;
  void Function(ScaleUpdateDetails) _onScaleUpdate;

  void Function() get getOnTap => _onTap;
  void Function(TapUpDetails) get getOnTapUp => _onTapUp;
  void Function(TapDownDetails) get getOnTapDown => _onTapDown;
  void Function() get getOnTapCancel => _onTapCancel;
  void Function() get getOnDoubleTap => _onDoubleTap;

  void Function() get getOnLongPress => _onLongPress;
  void Function(LongPressStartDetails) get getOnLongPressStart =>
      _onLongPressStart;
  void Function(LongPressEndDetails) get getOnLongPressEnd => _onLongPressEnd;
  void Function(LongPressMoveUpdateDetails) get getOnLongPressMoveUpdate =>
      _onLongPressMoveUpdate;
  void Function() get getOnLongPressUp => _onLongPressUp;

  void Function(ForcePressDetails) get getOnForcePressStart =>
      _onForcePressStart;
  void Function(ForcePressDetails) get getOnForcePressEnd => _onForcePressEnd;
  void Function(ForcePressDetails) get getOnForcePressPeak => _onForcePressPeak;
  void Function(ForcePressDetails) get getOnForcePressUpdate =>
      _onForcePressUpdate;

  void Function(DragStartDetails) get getOnVerticalDragStart =>
      _onVerticalDragStart;
  void Function(DragEndDetails) get getOnVerticalDragEnd => _onVerticalDragEnd;
  void Function(DragDownDetails) get getOnVerticalDragDown =>
      _onVerticalDragDown;
  void Function() get getOnVerticalDragCancel => _onVerticalDragCancel;
  void Function(DragUpdateDetails) get getOnVerticalDragUpdate =>
      _onVerticalDragUpdate;

  void Function(DragStartDetails) get getOnHorizontalDragStart =>
      _onHorizontalDragStart;
  void Function(DragEndDetails) get getOnHorizontalDragEnd =>
      _onHorizontalDragEnd;
  void Function(DragDownDetails) get getOnHorizontalDragDown =>
      _onHorizontalDragDown;
  void Function() get getOnHorizontalDragCancel => _onHorizontalDragCancel;
  void Function(DragUpdateDetails) get getOnHorizontalDragUpdate =>
      _onHorizontalDragUpdate;

  void Function(DragStartDetails) get getOnPanStart => _onPanStart;
  void Function(DragEndDetails) get getOnPanEnd => _onPanEnd;
  void Function() get getOnPanCancel => _onPanCancel;
  void Function(DragDownDetails) get getOnPanDown => _onPanDown;
  void Function(DragUpdateDetails) get getOnPanUpdate => _onPanUpdate;

  void Function(ScaleStartDetails) get getOnScaleStart => _onScaleStart;
  void Function(ScaleEndDetails) get getOnScaleEnd => _onScaleEnd;
  void Function(ScaleUpdateDetails) get getOnScaleUpdate => _onScaleUpdate;

  void onTap(void Function() function) => _onTap = function;

  void onTapUp(void Function(TapUpDetails) function) => _onTapUp = function;

  void onTapDown(void Function(TapDownDetails) function) =>
      _onTapDown = function;

  void onTapCancel(void Function() function) => _onTapCancel = function;

  void onDoubleTap(void Function() function) => _onDoubleTap = function;

  void onLongPress(void Function() function) => _onLongPress = function;

  void onLongPressStart(void Function(LongPressStartDetails) function) =>
      _onLongPressStart = function;

  void onLongPressEnd(void Function(LongPressEndDetails) function) =>
      _onLongPressEnd = function;

  void onLongPressMoveUpdate(
          void Function(LongPressMoveUpdateDetails) function) =>
      _onLongPressMoveUpdate = function;

  void onLongPressUp(void Function() function) => _onLongPressUp = function;

  void onVerticalDragStart(void Function(DragStartDetails) function) =>
      _onVerticalDragStart = function;

  void onVerticalDragEnd(void Function(DragEndDetails) function) =>
      _onVerticalDragEnd = function;

  void onVerticalDragDown(void Function(DragDownDetails) function) =>
      _onVerticalDragDown = function;

  void onVerticalDragCancel(void Function() function) =>
      _onVerticalDragCancel = function;

  void onVerticalDragUpdate(void Function(DragUpdateDetails) function) =>
      _onVerticalDragUpdate = function;

  void onHorizontalDragStart(void Function(DragStartDetails) function) =>
      _onHorizontalDragStart = function;

  void onHorizontalDragEnd(void Function(DragEndDetails) function) =>
      _onHorizontalDragEnd = function;

  void onHorizontalDragDown(void Function(DragDownDetails) function) =>
      _onHorizontalDragDown = function;

  void onHorizontalDragCancel(void Function() function) =>
      _onHorizontalDragCancel = function;

  void onHorizontalDragUpdate(void Function(DragUpdateDetails) function) =>
      _onHorizontalDragUpdate = function;

  void onForcePressStart(void Function(ForcePressDetails) function) =>
      _onForcePressStart = function;

  void onForcePressEnd(void Function(ForcePressDetails) function) =>
      _onForcePressEnd = function;

  void onForcePressPeak(void Function(ForcePressDetails) function) =>
      _onForcePressPeak = function;

  void onForcePressUpdate(void Function(ForcePressDetails) function) =>
      _onForcePressUpdate = function;

  void onPanStart(void Function(DragStartDetails) function) =>
      _onPanStart = function;

  void onPanEnd(void Function(DragEndDetails) function) => _onPanEnd = function;

  void onPanCancel(void Function() function) => _onPanCancel = function;

  void onPanDown(void Function(DragDownDetails) function) =>
      _onPanDown = function;

  void onPanUpdate(void Function(DragUpdateDetails) function) =>
      _onPanUpdate = function;

  void onScaleStart(void Function(ScaleStartDetails) function) =>
      _onScaleStart = function;

  void onScaleEnd(void Function(ScaleEndDetails) function) =>
      _onScaleEnd = function;

  void onScaleUpdate(void Function(ScaleUpdateDetails) function) =>
      _onScaleUpdate = function;
}
