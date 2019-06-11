import 'package:flutter/widgets.dart';

import 'gesture_item.dart';

// A class containing all gesture functions for the Division widget
class G {
  static GestureItem onTap(void Function() function) => GestureItem(property: 'onTap', function: function ?? () => null);

  static GestureItem onTapUp(void Function(TapUpDetails) function) => GestureItem(property: 'onTapUp', function: function ?? () => null);

  static GestureItem onTapDown(void Function(TapDownDetails)  function) => GestureItem(property: 'onTapDown', function: function ?? () => null);

  static GestureItem onTapCancel(void Function() function) => GestureItem(property: 'onTapCancel', function: function ?? () => null);

  static GestureItem onDoubleTap(void Function() function) => GestureItem(property: 'onDoubleTap', function: function ?? () => null);


  static GestureItem onLongPress(void Function() function) => GestureItem(property: 'onLongPress', function: function ?? () => null);

  static GestureItem onLongPressStart(void Function(LongPressStartDetails) function) => GestureItem(property: 'onLongPressStart', function: function ?? () => null);

  static GestureItem onLongPressEnd(void Function(LongPressEndDetails) function) => GestureItem(property: 'onLongPressEnd', function: function ?? () => null);

  static GestureItem onLongPressMoveUpdate(void Function(LongPressMoveUpdateDetails) function) => GestureItem(property: 'onLongPressMoveUpdate', function: function ?? () => null);

  static GestureItem onLongPressUp(void Function() function) => GestureItem(property: 'onLongPressUp', function: function ?? () => null);

  
  static GestureItem onVerticalDragStart(void Function(DragStartDetails) function) => GestureItem(property: 'onVerticalDragStart', function: function ?? () => null);

  static GestureItem onVerticalDragEnd(void Function(DragEndDetails) function) => GestureItem(property: 'onVerticalDragEnd', function: function ?? () => null);

  static GestureItem onVerticalDragDown(void Function(DragDownDetails) function) => GestureItem(property: 'onVerticalDragDown', function: function ?? () => null);

  static GestureItem onVerticalDragCancel(void Function() function) => GestureItem(property: 'onVerticalDragCancel', function: function ?? () => null);

  static GestureItem onVerticalDragUpdate(void Function(DragUpdateDetails) function) => GestureItem(property: 'onVerticalDragUpdate', function: function ?? () => null);


  static GestureItem onHorizontalDragStart(void Function(DragStartDetails) function) => GestureItem(property: 'onHorizontalDragStart', function: function ?? () => null);

  static GestureItem onHorizontalDragEnd(void Function(DragEndDetails) function) => GestureItem(property: 'onHorizontalDragEnd', function: function ?? () => null);

  static GestureItem onHorizontalDragDown(void Function(DragDownDetails) function) => GestureItem(property: 'onHorizontalDragDown', function: function ?? () => null);

  static GestureItem onHorizontalDragCancel(void Function() function) => GestureItem(property: 'onHorizontalDragCancel', function: function ?? () => null);

  static GestureItem onHorizontalDragUpdate(void Function(DragUpdateDetails) function) => GestureItem(property: 'onHorizontalDragUpdate', function: function ?? () => null);


  static GestureItem onPanStart(void Function(DragStartDetails) function) => GestureItem(property: 'onPanStart', function: function ?? () => null);

  static GestureItem onPanEnd(void Function(DragEndDetails) function) => GestureItem(property: 'onPanEnd', function: function ?? () => null);

  static GestureItem onPanCancel(void Function() function) => GestureItem(property: 'onPanCancel', function: function ?? () => null);

  static GestureItem onPanDown(void Function(DragDownDetails) function) => GestureItem(property: 'onPanDown', function: function ?? () => null);

  static GestureItem onPanUpdate(void Function(DragUpdateDetails) function) => GestureItem(property: 'onPanUpdate', function: function ?? () => null);


  static GestureItem onScaleStart(void Function(ScaleStartDetails) function) => GestureItem(property: 'onScaleStart', function: function ?? () => null);

  static GestureItem onScaleEnd(void Function(ScaleEndDetails) function) => GestureItem(property: 'onScaleEnd', function: function ?? () => null);

  static GestureItem onScaleUpdate(void Function(ScaleUpdateDetails) function) => GestureItem(property: 'onScaleUpdate', function: function ?? () => null);
}