# Division
<a href="https://pub.dev/packages/division"><img src="https://img.shields.io/pub/v/division?color=blue&label=division" /></a><br />
<a href="https://www.buymeacoffee.com/tOTWBs7"><img src="https://camo.githubusercontent.com/be06971baed9105260e0ed5c03746108c30b527f/68747470733a2f2f63646e2e6275796d6561636f666665652e636f6d2f627574746f6e732f64656661756c742d6f72616e67652e706e67" alt="Buy Me A Coffee" data-canonical-src="https://cdn.buymeacoffee.com/buttons/default-orange.png" width="150px" /></a>
> Simple to use yet powerfull style widgets with syntax inspired by CSS.

### Please check out [styled_widget](https://github.com/ReinBentdal/styled_widget) which is a replacement of Division!

The true power of this package is a combination of its features. Flutter widgets are designed to combine both the styling widgets and the structural widgets together when building apps. This package tries to decouple style from structure. This results in much more readable code. Another strong point of this package is the ease of animations. 

- **[Getting started](#getting-started)**
- **[Basic example](#basic-example)**
- **[Documentation](#documentation)**
  - [Core style methods](#core-style-methods)
  - [Parent](#parent)
  - [Txt](#txt)
  - [Gestures](#gestures)
- **[Examples and best practices](#examples-and-best-practices)**

⚠️ **If you encounter an issue or have any feedback which you think could improve Division, please open an issue [here](https://github.com/ReinBentdal/division/issues)**

### Built with Division
| [App designer](https://dribbble.com/shots/6459693-Creative-layout-design),  [Code](https://github.com/ReinBentdal/division/blob/master/example/example/example_1.dart) | [Code](https://github.com/ReinBentdal/division/blob/master/example/example/example_form.dart) |
|-|-|
| <img src="https://raw.githubusercontent.com/ReinBentdal/division/master/example/assets/demo_app.gif" width="250"> | <img src="https://raw.githubusercontent.com/ReinBentdal/division/master/example/assets/form_demo.gif" width="250"> |

## Getting Started
This is the two main widgets included in Division
```dart
Parent(
  child: Widget,
  style: ParentStyle, 
  gesture: Gestures,
);
```
```dart
Txt(
  String,
  style: TxtStyle,
  gesture: Gestures,
);
```

### Basic example
#### Import
```dart
import 'package:division/division.dart';
```
#### Code
```dart
bool pressed = false;

final buttonStyle = (pressed) => TxtStyle()
  ..alignment.center()
  ..background.color(pressed ? Colors.orange : Colors.white)
  ..textColor(pressed ? Colors.white : Colors.orange)
  ..borderRadius(all: 5)
  ..border(all: 3, color: Colors.orange)
  ..padding(vertical: 10, horizontal: 15)
  ..ripple(true)
  ..animate(150, Curves.easeOut);

Gestures buttonGestures() =>
    Gestures()..isTap((isPressed) => setState(() => pressed = isPressed));

@override
Widget build(BuildContext context) {
  return Txt(
    'Styled button!',
    style: buttonStyle(pressed),
    gesture: buttonGestures(),
  );
}
```
#### Result
<img src="https://raw.githubusercontent.com/ReinBentdal/division/master/example/assets/basic_example.gif" width="300">

## Documentation
All current and future Division widgets share a common style base.
### Core style methods

<details>
  <summary>Animate</summary>

  ```dart
  ..animate([int duration, Curve curve = Curves.linear])
  ```
  A powerful style method. Whenever a style property changes, the widget will animate between the two states (given the style property is compatibel with animations).
  `duration` in ms
</details>

<details>
  <summary>Alignment</summary>

```dart
..alignment.[alignment] // alignment.topCenter()
```
The widget alignment
</details>

<details>
  <summary>Content alignment</summary>

  ```dart
  ..alignmentContent.[alignment] // alignment.topCenter()
  ```
  Alignment of the child.
</details>

<details>
  <summary>Padding</summary>

  ```dart
  ..padding({double all, 
        double horizontal, 
        double vertical, 
        double top, 
        double bottom, 
        double left, 
        double right})
  ```
  All properties work together. `padding(all: 10, top: 30)` is equivilent to `padding(top: 30, bottom: 10, left: 10, right: 10)`
</details>

<details>
  <summary>Margin</summary>

  ```dart
  ..margin({double all,
        double horizontal,
        double vertical,
        double top,
        double bottom,
        double left,
        double right})
  ```
  All properties work together. `margin(all: 10, top: 30)` is equivilent to `margin(top: 30, bottom: 10, left: 10, right: 10)`
</details>

<details>
  <summary>Background color</summary>

  ```dart
  ..background.color(Color)
  ..background.hex(xxxxxx)
  ..background.rgba(int, int, int, [double])
  ```
  `color` format options: hex('#xxxxxx'), rgba(int, int, int, double) or [Color].
</details>

<details>
  <summary>Background image</summary>

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
</details>

<details>
  <summary>Background blur</summary>

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
</details>

<details>
  <summary>Background blend mode</summary>

  ```dart
  ..background.blendMode(BlendMode blendMode)
  ```
  Algorithms for blending background
</details>

<details>
  <summary>Linear gradient</summary>

  ```dart
  ..linearGradient({AlignmentGeometry begin = Alignment.left,
        AlignmentGeometry end = Alignment.right,
        @required List<Color> colors,
        TileMode tileMode = TileMode.clamp,
        List<double> stops})
  ```

</details>

<details>
  <summary>Radial gradient</summary>

  ```dart
  ..radialGradient(
      {AlignmentGeometry center = Alignment.center,
      @required double radius,
      @required List<Color> colors,
      TileMode tileMode = TileMode.clamp,
      List<double> stops})
  ```
</details>

<details>
  <summary>Sweep gradient</summary>

  ```dart
  ..sweepGradient(
      {AlignmentGeometry center = Alignment.center,
      double startAngle = 0.0,
      @required double endAngle,
      @required List<Color> colors,
      TileMode tileMode = TileMode.clamp,
      List<double> stops})
  ```
  In the style widget constructor, specify what angle calculation format you want to use.
</details>

<details>
  <summary>Opacity</summary>

  ```dart
  ..opacity(double opacity)
  ```
  Opacity applied on the whole widget.

  Value must not be negative.
</details>

<details>
  <summary>Border</summary>

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
</details>

<details>
  <summary>Border radius</summary>

  ```dart
  ..borderRadius(
        {double all,
        double topLeft,
        double topRight,
        double bottomLeft,
        double bottomRight})
  ```
  It is valid to use `all` together with single sided properties. Single sided properties will trump over the `all` property.

  See also [circle] for creating circular widgets.
</details>

<details>
  <summary>Circle</summary>

  ```dart
  ..circle([bool enable = true])
  ```
  Makes the widget circular
</details>

<details>
  <summary>Box shadow</summary>

  ```dart
  ..boxShadow(
        {Color color = const Color(0x33000000),
        double blur = 0.0,
        Offset offset = Offset.zero,
        double spread = 0.0})
  ```
  See [elevation] for a different way of defining a box shadow.
</details>

<details>
  <summary>Elevation</summary>

  ```dart
  ..elevation(
        double elevation,
        {double angle = 0.0,
        Color color = const Color(0x33000000),
        double opacity = 1.0})
  ```
  Elevates the widget with a boxShadow.
  [opacity] is a relative constant
</details>

<details>
  <summary>Scale</summary>

  ```dart
  ..scale(double ratio)
  ```
  Scale the widget
</details>

<details>
  <summary>Offset</summary>

  ```dart
  ..offset([double dx, double dy])
  ```
  Offsets the widget
</details>

<details>
  <summary>Rotate</summary>

  ```dart
  ..rotate(double angle)
  ```
  Rotates the widget.
  By default one turn equals the value 1.0. To change to radians: `StyleClass(useRadians: true)`.
</details>

<details>
  <summary>Ripple</summary>

  ```dart
  ..ripple(bool enable, {dynamic splashColor, dynamic highlightColor})
  ```
  Material ripple effect applied on tap.
</details>

<details>
  <summary>Overflow</summary>

  ```dart
  ..overflow.visible({Axis direction = Axis.vertical})
  ..overflow.scrollable({Axis direction = Axis.vertical})
  ..overflow.hidden()
  ```
  Change child overflow behaviour.
  Choose the overflow direction with the [direction] parameter.
</details>

<details>
  <summary>Width, minWidth, maxWidth, Height, minHeight, maxHeight</summary>

  ```dart
  ..[type](double dimension)
  ```
</details>

### Parent
```dart
Parent(
  style: ParentStyle,
  gesture: Gestures,
  child: Widget
)
```
As the name suggests this widget is a simple styled widget which takes a child.

### ParentStyle
```dart
// format
ParentStyle()
  ..[style method]

// example
ParentStyle()
  ..width(100)
  ..padding(all: 10)
  ..elevation(5)
```
<details>
  <summary>Add</summary>

  ```dart
  ..add(ParentStyle parentStyle, {bool override = false})
  ```
  Combines style from two styled widgets.
</details>

<details>
  <summary>Clone</summary>

  ```dart
  ..ParentStyle().clone()
  ```
  This will clone the `ParentStyle` widget. This is usefull if you for example want to add more style to a widget without modifying the initial style.
</details>

### Txt
```dart
Txt(
  String,
  style: TxtStyle,
  gesture: Gestures,
)
```
As the name suggests this widget is a simple styled widget which takes a `String` as its child.
This widget enables text styling with the `TxtStyle` widget. This also has the possibility to make the widget editable.

### TxtStyle
```dart
// format
TxtStyle()
  ..[style method]

// example
TxtStyle()
  ..width(100)
  ..padding(all: 10)
  ..textColor(Colors.blue)
  ..bold()
```
<details>
  <summary>Editable</summary>

  ```dart
  ..editable(bool enable,
        {TextInputType keyboardType,
        String placeholder,
        bool obscureText = false,
        int maxLines,
        void Function(String) onChange,
        void Function(bool focus) onFocusChange,
        void Function(TextSelection, SelectionChangedCause) onSelectionChanged,
        void Function() onEditingComplete,
        FocusNode focusNode})
  ```
  This makes the widget editable, just like a `TextField`, its just much easier to style
</details>

<details>
  <summary>Text align</summary>

  ```dart
  ..textAlign.center()
  ```
</details>

<details>
  <summary>Font weight</summary>

  ```dart
  ..fontWeight(FontWeight fontWeight)
  ```
  A shorthand to make the text bold:
  ```dart
  ..bold([bool enable])
  ```
</details>

<details>
  <summary>Italic</summary>

  ```dart
  ..italic([bool enable])
  ```
</details>

<details>
  <summary>Font family</summary>

  ```dart
  ..fontFamily(String font, {List<String> fontFamilyFallback})
  ```
</details>

<details>
  <summary>Text color</summary>

  ```dart
  ..textColor(Color textColor)
  ```
</details>

<details>
  <summary>Max lines</summary>

  ```dart
  ..maxLines(int maxLines)
  ```
</details>

<details>
  <summary>Letter spacing</summary>

  ```dart
  ..letterSpacing(double space)
  ```
</details>

<details>
  <summary>Word spacing</summary>

  ```dart
  ..wordSpacing(double space)
  ```
</details>

<details>
  <summary>Text decoration</summary>

  ```dart
  ..textDecoration(TextDecoration decoration)
  ```
</details>

<details>
  <summary>Text shadow</summary>

  ```dart
  ..textShadow({Color color = const Color(0x33000000),
      double blur = 0.0,
      Offset offset = Offset.zero})
  ```
</details>

<details>
  <summary>Text elevation</summary>

  ```dart
  ..textElevation(double elevation,
      {double angle = 0.0,
      Color color = const Color(0x33000000),
      double opacity = 1.0})
  ```
</details>

<details>
  <summary>Add</summary>

  ```dart
  ..add(TxtStyle txtStyle, {bool override = false})
  ```
  This adds together two `TxtStyle`s. The `override` property specifies if already defined properties should be overrided.
</details>

<details>
  <summary>Clone</summary>

  ```dart
  ..TxtStyle().clone()
  ```
  This will clone the `TxtStyle` widget. This is usefull if you for example want to add more style to a widget without modifying the initial style.
</details>

### Gestures
<details>
  <summary>isTap</summary>

  ```dart
  ..isTap((isTapped) => setState(() => pressed = isTapped))
  ```
  Called whenever the tap state on the widget changes.
  This replaces the use of `onTapDown`, `onTapUp` and `onTapCancel` together.
</details>

<details>
  <summary>Other</summary>

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
</details>

## Examples and best practices

#### Decoupling style from structure
```dart
final ParentStyle cardStyle = ParentStyle()
  ..height(175)
  ..padding(horizontal: 20.0, vertical: 10)
  ..alignment.center()
  ..background.hex('#3977FF')
  ..borderRadius(all: 20.0)
  ..elevation(10, color: hex('#3977FF'));

Widget build(BuildContext context) {
  return Parent(
    style: cardStyle,
    child: Widget,
  );
}
```

#### Variable dependent style
```dart
final Color color = Colors.blue;

final cardStyle = (color) => ParentStyle()
  ..height(175)
  ..padding(horizontal: 20.0, vertical: 10)
  ..alignment.center()
  ..background.color(color)
  ..borderRadius(all: 20.0)
  ..elevation(10, color: color);

Widget build(BuildContext context) {
  return Parent(
    style: cardStyle(color),
    child: Widget,
  );
}
```

#### Animated widgets
```dart
bool pressed = false;

final cardStyle = (pressed) => ParentStyle()
  ..height(175)
  ..padding(horizontal: 20.0, vertical: 10)
  ..alignment.center()
  ..borderRadius(all: 20.0)
  ..animate(200, Curves.easeOut)
  ..background.color(pressed ? Colors.white : Colors.black)
  ..elevation(pressed ? 10 : 20);

Widget build(BuildContext context) {
  return Parent(
    style: cardStyle(pressed),
    gesture: Gestures()
      ..isTap((isPressed) => setState(() => pressed = isPressed)),
    child: Widget,
  );
}
```
or
```dart
bool pressed = false;

final cardStyle = (pressed) => ParentStyle()
  ..height(175)
  ..padding(horizontal: 20.0, vertical: 10)
  ..alignment.center()
  ..borderRadius(all: 20.0)
  ..animate(200, Curves.easeOut)
  ..background.color(pressed ? Colors.white : Colors.black)
  ..elevation(pressed ? 10 : 20);

Gestures cardGesture() => Gestures()
  ..isTap((isPressed) => setState(() => pressed = isPressed));

Widget build(BuildContext context) {
  return Parent(
    style: cardStyle(pressed),
    gesture: cardGesture(),
    child: Widget,
  );
}
```
