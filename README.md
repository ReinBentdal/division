# Division

A simple to use yet powerfull styling widget with syntax inspired by CSS.

### Built with Division
#### [App designer](https://dribbble.com/shots/6459693-Creative-layout-design) | [Code](https://github.com/ReinBentdal/division/blob/master/example/example/example_1.dart)

<img src="https://raw.githubusercontent.com/ReinBentdal/division/master/example/assets/demo_app.gif" width="250">

## Getting Started

This package includes at the moment a `Parent` widget and a `Txt` widget.

As the name suggests the `Parent` widget takes a `child` along its `Division` properties.

```dart
Division(
  child: Widget,
  style: ParentStyle, 
  gesture: GestureClass,
);
```

The `Txt` widget is a styled widget just like the `Parent` widget but it is specialized with styling text.

```dart
Txt(
  'Some text',
  style: TxtStyle,
  gesture: GestureClass,
);
```

### Simple example

#### Import
```dart
import 'package:division/division.dart';
```

#### Code

```dart
Txt(
  'Klick me'
  style: TxtStyle()
    ..textColor(Colors.white)
    ..bold()
    ..padding(horizontal: 30, vertical: 15)
    ..background.hex('77A6F7')
    ..borderRadius(all: 30)
    ..alignment.center()
    ..elevation(10, color: rgb(150,150,150)),

  gesture: GestureClass()
    ..onTap(() => print('Button pressed')),
)
```

#### The result

<img src="https://raw.githubusercontent.com/ReinBentdal/division/master/example/assets/simple_example.jpg" width="300">


# Style property

### StyleClass

The `StyleClass` is the super class of `ParentStyle` and `TxtStyle` and contains most of the style properties.

To add a style to the `StyleClass`, call the style methods: `..[style]`

On construction, choose how you want angles to be calculated
 ```dart
 Styleclass({AngleFormat angleFormat = AngleFormat.cycle})
 ```

#### Alignment
```dart
..alignment.[alignment] // alignment.topCenter()
```
Alignment of the widget itself, not the child.


#### Align child
```dart
..alignmentChild.[alignment] // alignment.topCenter()
```
Alignment of the child.

#### Padding
```dart
..padding({double all, 
      double horizontal, 
      double vertical, 
      double top, 
      double bottom, 
      double left, 
      double right})
```
All properties work together. `padding(all: 10, top: 30)` is valid

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
All properties work together. `margin(all: 10, top: 30)` is valid

#### Background color
```dart
..background.color(Color)
..background.hex(xxxxxx)
..background.rgba(int, int, int, [double])
```
`color` format options: hex('#xxxxxx'), rgba(int, int, int, double) or [Color].

#### Background image
```dart
..background.image(
      {String url, 
      String path, 
      ColorFilter colorFilter, 
      ImageProvider<dynamic> imageProveder,
      BoxFit fit, 
      AlignmentGeometry alignment = Alignment.center, 
      ImageRepeat repeat = ImageRepeat.noRepeat})
```
Eighter the [url] or the [path] has to be specified.
[url] is for network images and [path] is for local images.

#### Background blur
```dart
..background.blur(double blur)
```
Blurs the background. Can be used for example to achieve a "frosted glass" effect:

```dart
StyleClass()
  ..background.blur(10)
  ..background.rgba(255,255,255,0.15)
```
Does not work together with `rotate()`.

#### Gradient
```dart
..linearGradient({AlignmentGeometry begin = Alignment.left,
      AlignmentGeometry end = Alignment.right,
      @required List<Color> colors,
      TileMode tileMode = TileMode.clamp,
      List<double> stops})

..radialGradient(
      {AlignmentGeometry center = Alignment.center,
      double radius = 0.5,
      @required List<Color> colors,
      TileMode tileMode = TileMode.clamp,
      List<double> stops})

..sweepGradient(
      {AlignmentGeometry center = Alignment.center,
      double startAngle = 0.0,
      double endAngle,
      @required List<Color> colors,
      TileMode tileMode = TileMode.clamp,
      List<double> stops})
```
Choose between 3 gradient variants. 
`sweepGradient()` by default does not use radians for the `startAngle` and the `endAngle`. By default 0.25 equals 45 degrees, 1 equals one full turn etc.
To change to use radians do: `StyleClass(useRadians: true)..`.

`color` format options: hex('#xxxxxx'), rgb(int, int, int), rgba(int, int, int, double) or [Color].

#### Opacity
```dart
..opacity(double opacity)
```
Opacity applied on the whole widget.

Value must not be negative.

#### Border
```dart
..border(
      {double all,
      double left,
      double right,
      double top,
      double bottom,
      Color color = const Color(0xFF000000),
      BorderStyle style = BorderStyle.solid})
```
Choose between `all`, `left`, `right`, `top` and `bottom`. `all` works together with the other properties.
`color` format options: hex('#xxxxxx'), rgb(int, int, int), rgba(int, int, int, double) or [Color].

#### Border radius
```dart
..borderRadius(
      {double all,
      double topLeft,
      double topRight,
      double bottomLeft,
      double bottomRight})
```
It is valid to use `all` together with single sided properties. Single sided properties will trump over the `all` property.

#### Box shadow
```dart
..boxShadow(
      {Color color = const Color(0x33000000),
      double blur,
      List<double> offset,
      double spread})
```
`color` format options: hex('#xxxxxx'), rgb(int, int, int), rgba(int, int, int, double) or [Color].
If defined while the elevation property is defined, the last one defined will be the style applied.
`offset` is given in the format `[double dx, double dy]`

#### Elevation
```dart
..elevation(
      double elevation,
      {double angle = 0.0,
      Color color = const Color(0x33000000),
      double opacity = 1.0})
```
Elevates the widget with a boxShadow.
If the elevation property is used at the same time as the boxShadow property, the last one
defined will be the applied style.

`color` format options: hex('#xxxxxx'), rgb(int, int, int), rgba(int, int, int, double) or [Color].

`angle` parameter takes a circular value. Eighter radians or not, depending on what is specified in the `StyleClass` constructor. 0.0 is down.
If `angle` equals [null] the shadow will be directly under the widget.

`opacity` is a relative opacity constant. A value of 0.5 bisects the opacity value with a given elevation.


#### Scale
```dart
..scale(double ratio)
```
Scale the widget

#### Offset
```dart
..offset([double dx, double dy])
```
Offsets the widget

#### Rotate
```dart
..rotate(double angle)
```
Rotates the widget.
By default one turn equals the value 1.0. To change to radians: `StyleClass(useRadians: true)`.

#### Ripple
```dart
..ripple(bool enable, {dynamic splashColor, dynamic highlightColor})
```
Material ripple effect.

#### Overflow
```dart
..overflow.visible({Axis direction = Axis.vertical})
..overflow.scrollable({Axis direction = Axis.vertical})
..overflow.hidden()
```
Change child overflow behaviour.
Choose the overflow direction with the [direction] parameter.

#### Animate
```dart
..animate([int duration, Curve curve = Curves.linear])
```
Animates the widget when one of its style properties changes.
`duration` is given in milliseconds.

#### Add
```dart
..add(StyleClass styleClass, {bool override = false})
```
Adds a `StyleClass` to a `StyleClass`.
By default the added `StyleClass` does not override already set style. Change override to true, to override already set style.

#### Width, minWidth, maxWidth, Height, minHeight, maxHeight
```dart
..[type](double dimension)
```

# Gesture property

**The gesture property expects a `GestureClass` which is a class containing all the gestures for the widget.**

There is also the option to use the class `G` as a shorthand.

### GestureClass

To add a style to the `GestureClass`, use the ..[gesture] syntax. The two dots is used to not return the [gesture], but the `GestureClass`

```dart
..onTap()
..onTapUp()
..onTapCancel()
..onDoubleTap()
..onTapDown()
..onLongPress()
..onLongPressStart()
..onLongPressEnd()
..onLongPressMoveUpdate()
..onLongPressUp()
..onVerticalDragStart()
..onVerticalDragEnd()
..onVerticalDragDown()
..onVerticalDragCancel()
..onVerticalDragUpdate()
..onHorizontalDragStart()
..onHorizontalDragEnd()
..onHorizontalDragCancel()
..onHorizontalDragUpdate()
..onHorizontalDragDown()
..onForcePressStart()
..onForcePressEnd()
..onForcePressPeak()
..onForcePressUpdate()
..onPanStart()
..onPanEnd()
..onPanCancel()
..onPanDown()
..onPanUpdate()
..onScaleStart()
..onScaleEnd()
..onScaleUpdate()
```

# Txt Style

[] TODO: Improve documentation