# division

A flutter widget with the goal of simplifying styling and to reduce nesting, inspired by CSS

<img src="https://raw.githubusercontent.com/ReinBentdal/division/master/example/assets/framed/demo_app_framed.png" width="250">

## Getting Started

The `Division` widget has 3 properties. A `style` property, a `gesture` property and a `child` property. As simple as that!

`Division(style: StyleClass, gesture: GestureClass, child, Widget);`

### Simple example

#### Import
```dart
import 'package:division/division.dart';
```

#### Simple usage

```dart
Division(
  style: StyleClass()
    ..width(200)
    ..height(100)
    ..backgroundColor(hex: 'eeeeee')
    ..borderRadius(all: 30.0)
    ..elevation(30)
    ..align('center')
    ..alignChild('center'),
  gesture: GestureClass()
    ..onTap(() => print('Widget pressed')),
  child: Text('Some text'),
);
```

#### The result

<img src="https://raw.githubusercontent.com/ReinBentdal/division/master/example/assets/simple_example.png" width="300">

## Style property

**The style property expects a `StyleClass` which is a class holding all the styling for the widget.**

### StyleClass

To add a style to the `StyleClass`, use the ..[style] syntax. The two dots is used to not return [style], but the `StyleClass`

#### Align
```dart
..align(String alignment)
```
Aligns the widget itself. Valid alignments: `'center'`, `'top'`, `'bottom'`, `'left'`, `'right'`, `'topLeft'`, `'topRight'`, `'bottomLeft'` and `'bottomRight'`.

#### Align child
```dart
..alignChild(String alignment)
```
Aligns the child  widget. Valid alignments: `'center'`, `'top'`, `'bottom'`, `'left'`, `'right'`, `'topLeft'`, `'topRight'`, `'bottomLeft'` and `'bottomRight'`.

#### Padding
```dart
..padding({double all, double horizontal, double vertical, double top, double bottom, double left, double right})
```
If `all` is defined, non of the other properties will have an effect.
If `horizontal` and `vertical` is defined, `top`, `bottom`, `left`, and `right` will have no effect.

#### Margin
```dart
..margin({double all,
      double horizontal,
      double vertical,
      double top,
      double bottom,
      double left,
      double right})
```
If `all` is defined, non of the other properties will have an effect.
If `horizontal` and `vertical` is defined, `top`, `bottom`, `left`, and `right` will have no effect.

#### Background color
```dart
..backgroundColor({String hex, List rgba, Color color})
```
Choose between the `hex`, `rgba` and `color` format to give a background color to your widget.

#### Border radius
```dart
..borderRadius(
      {double all,
      double topLeft,
      double topRight,
      double bottomLeft,
      double bottomRight})
```
Eigther use the `all` property to apply to all corners, or user `topLeft`, `topRight`, `bottomLeft` and `bottomRight`.
If the `all` property is defined, the other properties will have no effect.

#### Box shadow
```dart
..boxShadow(
      {String hex,
      List rgba,
      Color color,
      double blur,
      List<double> offset,
      double spread})
```
Choose between the `hex`, `rgba` and `color` format to give a boxShadow color to your widget.
If defined while the elevation property is defined, the last one defined will be the style applied.

#### Elevation
```dart
..elevation(double elevation,
      {bool angled,
      String hex,
      List rgba,
      Color color,
      bool bgColor})
```
Elevates the widget with a boxShadow.
If the elevation property is used at the same time as the boxShadow property, the last one
defined will be the applied style.
For the shadow color, you can choose between the `hex`, `rgba`, `color` and `bgColor` format.
`bgColor` makes the shadow the same color as the background color of the widget with a 0.5 opacity. Elevation then has to be defined after `backgroundColor`
If the `angled` property is true, the shadow will be att 45 degrees.

#### Scale
```dart
..scale(double scale)
```
Scale the widget

#### Offset
```dart
..offset([double dx, double dy])
```
Offsets the widget

#### Rotate
```dart
..rotate(double rotate)
```
Rotates the widget. 1 equals one full turn.

#### Animate
```dart
..animate([int duration, Curve curve = Curves.linear])
```
Animates the widget when one of its style properties changes.
`duration` is given in milliseconds.
I am considering to implement a `only` parameter to choose to only animate certain properties.

#### Add
```dart
..add(StyleClass styleClass)
```
Adds a `StyleClass` to a `StyleClass`.
The add property does not override already defined properties, just adds new ones. 

#### Width, minWidth, maxWidth, Height, minHeight, maxHeight
```dart
..[type](double length)
```

## Gesture property

**The gesture property expects a `GestureClass` which is a class holding all the gestures for the widget.**

### GestureClass

To add a style to the `GestureClass`, use the ..[gesture] syntax. The two dots is used to not return the [gesture], but the `GestureClass`

The `GestureClass` takes all the same parameters as the `GestureDetector` widget.

```dart
..[gesture](function)
```

## Child property

Widget child