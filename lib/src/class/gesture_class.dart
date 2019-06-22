import 'package:flutter/widgets.dart';

/// Responsible for all the gestures for the `Division` widget
///
/// ```dart
/// Division(
///   style: StyleClass()
///     .width(100)
///     .height(150)
///     .borderRadius(all: 30.0)
///     .backgroundColor('#eeeeee'),
///   gesture: GestureClass()
///     .onTap(() => print('Widget pressed!'))
///     .onLongPress(() => print('Widget longpress)),
///   child: Text('Some text),
/// )
/// ```
class GestureClass {
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

  GestureClass onTap(void Function() function) {
    _onTap = function;
    return this;
  }

  GestureClass onTapUp(void Function(TapUpDetails) function) {
    _onTapUp = function;
    return this;
  }

  GestureClass onTapDown(void Function(TapDownDetails) function) {
    _onTapDown = function;
    return this;
  }

  GestureClass onTapCancel(void Function() function) {
    _onTapCancel = function;
    return this;
  }

  GestureClass onDoubleTap(void Function() function) {
    _onDoubleTap = function;
    return this;
  }

  GestureClass onLongPress(void Function() function) {
    _onLongPress = function;
    return this;
  }

  GestureClass onLongPressStart(void Function(LongPressStartDetails) function) {
    _onLongPressStart = function;
    return this;
  }

  GestureClass onLongPressEnd(void Function(LongPressEndDetails) function) {
    _onLongPressEnd = function;
    return this;
  }

  GestureClass onLongPressMoveUpdate(
      void Function(LongPressMoveUpdateDetails) function) {
    _onLongPressMoveUpdate = function;
    return this;
  }

  GestureClass onLongPressUp(void Function() function) {
    _onLongPressUp = function;
    return this;
  }

  GestureClass onVerticalDragStart(void Function(DragStartDetails) function) {
    _onVerticalDragStart = function;
    return this;
  }

  GestureClass onVerticalDragEnd(void Function(DragEndDetails) function) {
    _onVerticalDragEnd = function;
    return this;
  }

  GestureClass onVerticalDragDown(void Function(DragDownDetails) function) {
    _onVerticalDragDown = function;
    return this;
  }

  GestureClass onVerticalDragCancel(void Function() function) {
    _onVerticalDragCancel = function;
    return this;
  }

  GestureClass onVerticalDragUpdate(void Function(DragUpdateDetails) function) {
    _onVerticalDragUpdate = function;
    return this;
  }

  GestureClass onHorizontalDragStart(void Function(DragStartDetails) function) {
    _onHorizontalDragStart = function;
    return this;
  }

  GestureClass onHorizontalDragEnd(void Function(DragEndDetails) function) {
    _onHorizontalDragEnd = function;
    return this;
  }

  GestureClass onHorizontalDragDown(void Function(DragDownDetails) function) {
    _onHorizontalDragDown = function;
    return this;
  }

  GestureClass onHorizontalDragCancel(void Function() function) {
    _onHorizontalDragCancel = function;
    return this;
  }

  GestureClass onHorizontalDragUpdate(
      void Function(DragUpdateDetails) function) {
    _onHorizontalDragUpdate = function;
    return this;
  }

  GestureClass onForcePressStart(void Function(ForcePressDetails) function) {
    _onForcePressStart = function;
    return this;
  }

  GestureClass onForcePressEnd(void Function(ForcePressDetails) function) {
    _onForcePressEnd = function;
    return this;
  }

  GestureClass onForcePressPeak(void Function(ForcePressDetails) function) {
    _onForcePressPeak = function;
    return this;
  }

  GestureClass onForcePressUpdate(void Function(ForcePressDetails) function) {
    _onForcePressUpdate = function;
    return this;
  }

  GestureClass onPanStart(void Function(DragStartDetails) function) {
    _onPanStart = function;
    return this;
  }

  GestureClass onPanEnd(void Function(DragEndDetails) function) {
    _onPanEnd = function;
    return this;
  }

  GestureClass onPanCancel(void Function() function) {
    _onPanCancel = function;
    return this;
  }

  GestureClass onPanDown(void Function(DragDownDetails) function) {
    _onPanDown = function;
    return this;
  }

  GestureClass onPanUpdate(void Function(DragUpdateDetails) function) {
    _onPanUpdate = function;
    return this;
  }

  GestureClass onScaleStart(void Function(ScaleStartDetails) function) {
    _onScaleStart = function;
    return this;
  }

  GestureClass onScaleEnd(void Function(ScaleEndDetails) function) {
    _onScaleEnd = function;
    return this;
  }

  GestureClass onScaleUpdate(void Function(ScaleUpdateDetails) function) {
    _onScaleUpdate = function;
    return this;
  }
}
