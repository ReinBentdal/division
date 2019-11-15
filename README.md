# Division

A simple to use yet powerfull styling widget with syntax inspired by CSS.

### Built with Division
| [App designer](https://dribbble.com/shots/6459693-Creative-layout-design),  [Code](https://github.com/ReinBentdal/division/blob/master/example/example/example_1.dart) | [Code](https://github.com/ReinBentdal/division/blob/master/example/example/example_form.dart) |
|-|-|
| <img src="https://raw.githubusercontent.com/ReinBentdal/division/master/example/assets/demo_app.gif" width="250"> | <img src="https://raw.githubusercontent.com/ReinBentdal/division/master/example/assets/form_demo.gif" width="250"> |

## Getting Started

This package includes at the moment a `Parent` widget and a `Txt` widget.

As the name suggests the `Parent` widget takes a `child` along its `Division` properties.

```dart
Parent(
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


# Table of contents
| Widget       | Description                  |
|--------------|------------------------------|
| <a name="styleclass">StyleClass</p>   | abstract general style class |
| <a name="parentstyle">ParentStyle</p>  | style the Parent widget      |
| <a name="txtstyle">TxtStyle</p>     | style the Txt widget         |
| <a name="gestureclass">GestureStyle</p> | adds gestures to the widget  |

### <span name="styleclass">StyleClass</span>

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


#### Align content
```dart
..alignmentContent.[alignment] // alignment.topCenter()
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
All properties work together. `padding(all: 10, top: 30)` is equivilent to `padding(top: 30, bottom: 10, left: 10, right: 10)`

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
All properties work together. `margin(all: 10, top: 30)` is equivilent to `margin(top: 30, bottom: 10, left: 10, right: 10)`

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

### <span name="parentstyle">ParentStyle</span>
`ParentStyle` extends `StyleClass`

#### Add
```dart
..add(ParentStyle parentStyle, {bool override = false})
```
This adds together two `ParentStyle`s. The `override` property specifies if already defined properties should be overrided.

#### Clone
```dart
..ParentStyle().clone()
```
This will clone the `ParentStyle` widget. This is usefull if you for example want to add more style to a widget without modifying the initial style.

### <span name="txtstyle">TxtStyle</span>
`TxtStyle` extends `StyleClass`

#### Editable
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
**NB: This is still a beta feature**

#### Text align
```dart
..textAlign.center()
```

#### Font weight
```dart
..fontWeight(FontWeight fontWeight)
```
A shorthand to make the text bold:
```dart
..bold([bool enable])
```

#### Italic text
```dart
..italic([bool enable])
```

#### Font family
```dart
..fontFamily(String font, {List<String> fontFamilyFallback})
```

#### Text color
```dart
..textColor(Color textColor)
```

#### Max lines
```dart
..maxLines(int maxLines)
```

#### Letter spacing
```dart
..letterSpacing(double space)
```

#### Word spacing
```dart
..wordSpacing(double space)
```

#### Text decoration
```dart
..textDecoration(TextDecoration decoration)
```

#### Add
```dart
..add(TxtStyle txtStyle, {bool override = false})
```
This adds together two `TxtStyle`s. The `override` property specifies if already defined properties should be overrided.

#### Clone
```dart
..TxtStyle().clone()
```
This will clone the `TxtStyle` widget. This is usefull if you for example want to add more style to a widget without modifying the initial style.

### <span name="gestureclass">GestureClass</span>
There is also the option to use the class `G` as a shorthand.

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